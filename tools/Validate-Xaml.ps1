#!/usr/bin/env pwsh
<#
.SYNOPSIS
    Validates the RetroBar theme XAML files in this repository.

.DESCRIPTION
    Checks every *.xaml theme for problems that would break or silently
    misbehave in RetroBar:

      1. File is well-formed XML (reports line/column on failure).
      2. Root element is a ResourceDictionary in the WPF presentation
         namespace, with the xmlns:x declaration required for x:Key.
      3. The theme actually declares resources: at least one x:Key or one
         merged dictionary (catches empty/truncated files).
      4. No duplicate x:Key values inside a single file (WPF throws on
         duplicate keys when the theme loads). XML comments are ignored.
      5. Every merged dictionary Source= points at a file that exists next
         to the theme (overlay themes depend on their base theme).
      6. Standalone candidate themes (no merged dictionaries and no
         self-referential BasedOn) are also parsed with the WPF
         XamlReader on Windows, proving they resolve every StaticResource
         locally without RetroBar's built-in System theme. Skipped on
         non-Windows hosts (no WPF) and for themes that intentionally
         layer on an outer theme.

.PARAMETER ThemesPath
    Folder to scan. Defaults to the Themes/ folder next to this script.

.PARAMETER AllowMissing
    Exit 0 with a warning when no .xaml files are found instead of failing.
    Only Themes/Midnight Seven.xaml is tracked in git; the other themes are
    gitignored reference material, so use this flag for checkouts that
    contain no theme files at all.

.EXAMPLE
    pwsh tools/Validate-Xaml.ps1
#>
[CmdletBinding()]
param(
    [string]$ThemesPath,
    [switch]$AllowMissing
)

$ErrorActionPreference = 'Stop'

$PresentationNamespace = 'http://schemas.microsoft.com/winfx/2006/xaml/presentation'

if (-not $ThemesPath) {
    $ThemesPath = Join-Path (Split-Path -Parent $PSScriptRoot) 'Themes'
}
$ThemesPath = [System.IO.Path]::GetFullPath($ThemesPath)

$script:ErrorCount = 0
$script:WarningCount = 0

function Write-Check {
    param([string]$Level, [string]$Message)
    $color = switch ($Level) {
        'PASS' { 'Green' }
        'FAIL' { 'Red' }
        'WARN' { 'Yellow' }
        'INFO' { 'Gray' }
        default { 'White' }
    }
    Write-Host ('[{0,-4}] {1}' -f $Level, $Message) -ForegroundColor $color
}

function Add-Failure {
    param([string]$File, [string]$Message)
    $script:ErrorCount++
    Write-Check 'FAIL' ('{0}: {1}' -f $File, $Message)
}

function Add-Warning {
    param([string]$File, [string]$Message)
    $script:WarningCount++
    Write-Check 'WARN' ('{0}: {1}' -f $File, $Message)
}

function Remove-XmlComments {
    param([string]$Text)
    return [regex]::Replace($Text, '(?s)<!--.*?-->', '')
}

function Get-MergeSources {
    # Source= attributes on <ResourceDictionary> elements only
    param([string]$Text)
    $tagPattern = '<(?<tag>[\w.:]+)(?<attrs>[^>]*?)/?>'
    $results = @()
    foreach ($tagMatch in [regex]::Matches($Text, $tagPattern)) {
        if ($tagMatch.Groups['tag'].Value -notmatch '(^|:)ResourceDictionary$') { continue }
        $attrPattern = '(?<![\w.])Source\s*=\s*(?:"(?<dq>[^"]*)"|''(?<sq>[^'']*)'')'
        foreach ($attrMatch in [regex]::Matches($tagMatch.Groups['attrs'].Value, $attrPattern)) {
            if ($attrMatch.Groups['dq'].Success) { $results += $attrMatch.Groups['dq'].Value }
            else { $results += $attrMatch.Groups['sq'].Value }
        }
    }
    return $results
}

function Get-XamlKeys {
    param([string]$Text)
    $pattern = '(?<![\w.])x:Key\s*=\s*(?:"(?<dq>[^"]*)"|''(?<sq>[^'']*)'')'
    $keys = @()
    foreach ($m in [regex]::Matches($Text, $pattern)) {
        if ($m.Groups['dq'].Success) { $keys += $m.Groups['dq'].Value }
        else { $keys += $m.Groups['sq'].Value }
    }
    return $keys
}

function Test-HasXmlnsX {
    param([System.Xml.XmlElement]$Root)
    foreach ($attr in $Root.Attributes) {
        if ($attr.Name -eq 'xmlns:x') { return $true }
        if ($attr.Prefix -eq 'xmlns' -and $attr.LocalName -eq 'x') { return $true }
    }
    return $false
}

Write-Host ''
Write-Host 'Midnight Seven - theme validation' -ForegroundColor Cyan
Write-Host ('Scanning: {0}' -f $ThemesPath)
Write-Host ''

if (-not (Test-Path -LiteralPath $ThemesPath)) {
    Write-Host ''
    if ($AllowMissing) {
        Write-Check 'WARN' 'Themes folder not present - nothing to validate.'
        exit 0
    }
    Write-Check 'FAIL' ('Themes folder not found at {0}' -f $ThemesPath)
    exit 1
}

$themeFiles = @(Get-ChildItem -LiteralPath $ThemesPath -Filter '*.xaml' -File -Recurse | Sort-Object Name)

if ($themeFiles.Count -eq 0) {
    Write-Host ''
    if ($AllowMissing) {
        Write-Check 'WARN' 'No .xaml files found - nothing to validate.'
        Write-Check 'INFO' 'Note: only Themes/Midnight Seven.xaml is tracked in git; the rest are gitignored reference themes.'
        exit 0
    }
    Write-Check 'FAIL' ('No .xaml files found under {0}' -f $ThemesPath)
    Write-Check 'INFO' 'If Themes/*.xaml is gitignored, pass -AllowMissing to skip instead of failing.'
    exit 1
}

$failedFiles = 0

# 6. Standalone parse setup (WPF XamlReader, Windows only)
$script:CanDeepLoad = $false
if ($IsWindows -ne $false) {
    try {
        Add-Type -AssemblyName PresentationFramework -ErrorAction Stop
        $script:CanDeepLoad = $true
    }
    catch {
        Add-Warning '<env>' ('WPF assemblies unavailable - standalone parse check skipped: {0}' -f ($_.Exception.Message -replace '\s+', ' '))
    }
}

foreach ($file in $themeFiles) {
    $relativePath = $file.FullName.Substring($ThemesPath.Length).TrimStart('\', '/')
    $errorsBefore = $script:ErrorCount

    $raw = Get-Content -LiteralPath $file.FullName -Raw -Encoding UTF8

    if ([string]::IsNullOrWhiteSpace($raw)) {
        Add-Failure $relativePath 'file is empty'
        $failedFiles++
        continue
    }

    # 1. Well-formed XML
    $doc = New-Object System.Xml.XmlDocument
    $doc.PreserveWhitespace = $true
    try {
        $settings = New-Object System.Xml.XmlReaderSettings
        $settings.DtdProcessing = [System.Xml.DtdProcessing]::Ignore
        $settings.XmlResolver = $null
        $reader = [System.Xml.XmlReader]::Create($file.FullName, $settings)
        try { $doc.Load($reader) }
        finally { $reader.Close() }
    }
    catch {
        $xmlException = $_.Exception
        while ($xmlException -and -not ($xmlException -is [System.Xml.XmlException])) {
            $xmlException = $xmlException.InnerException
        }
        if ($xmlException) {
            $detail = 'line {0}, position {1} - {2}' -f $xmlException.LineNumber, $xmlException.LinePosition, $xmlException.Message
        }
        else {
            $detail = ($_.Exception.Message -replace '\s+', ' ')
        }
        Add-Failure $relativePath $detail
        $failedFiles++
        continue
    }

    $root = $doc.DocumentElement

    # 2. Root element, namespace, xmlns:x
    if ($root.LocalName -ne 'ResourceDictionary') {
        Add-Failure $relativePath ('root element is <{0}>, expected <ResourceDictionary>' -f $root.LocalName)
    }
    if ($root.NamespaceURI -ne $PresentationNamespace) {
        Add-Failure $relativePath ("root namespace is '{0}', expected '{1}'" -f $root.NamespaceURI, $PresentationNamespace)
    }
    if (-not (Test-HasXmlnsX -Root $root)) {
        Add-Failure $relativePath 'missing xmlns:x declaration (required for x:Key)'
    }

    $withoutComments = Remove-XmlComments $raw

    # 3. The theme declares resources
    $keys = @(Get-XamlKeys $withoutComments)
    $mergeSources = @(Get-MergeSources -Text $withoutComments)
    if ($keys.Count -eq 0 -and $mergeSources.Count -eq 0) {
        Add-Failure $relativePath 'no x:Key resources and no merged dictionaries found'
    }

    # 4. Duplicate / empty x:Key values
    foreach ($g in @($keys | Where-Object { $_ } | Group-Object | Where-Object { $_.Count -gt 1 })) {
        Add-Failure $relativePath ("duplicate x:Key '{0}' ({1} definitions)" -f $g.Name, $g.Count)
    }
    if ($keys | Where-Object { [string]::IsNullOrWhiteSpace($_) }) {
        Add-Failure $relativePath 'empty x:Key value'
    }

    # 5. Merged dictionary files must exist
    foreach ($source in $mergeSources) {
        if ($source -match '^(pack|https?)://') {
            Add-Warning $relativePath ('merged dictionary uses an absolute URI: {0}' -f $source)
            continue
        }
        $resolved = Join-Path $file.DirectoryName $source
        if (-not (Test-Path -LiteralPath $resolved)) {
            Add-Failure $relativePath ('merged dictionary not found: {0}' -f $source)
        }
    }

    # 6. Standalone parse: only themes that declare no merged dictionaries
    #    and never BasedOn themselves can resolve everything locally.
    $selfBasedOn = $false
    foreach ($styleTag in [regex]::Matches($withoutComments, '<Style[^>]*>')) {
        $tag = $styleTag.Value
        if ($tag -notmatch '(?<![\w.])x:Key\s*=\s*"([^"]+)"') { continue }
        $ownKey = $Matches[1]
        if ($tag -match 'BasedOn\s*=\s*"\{StaticResource\s+([^}]+?)\s*\}"' -and
            $Matches[1].Trim() -eq $ownKey) {
            $selfBasedOn = $true
            break
        }
    }
    $standaloneCandidate = ($mergeSources.Count -eq 0) -and -not $selfBasedOn

    if ($standaloneCandidate -and $script:CanDeepLoad) {
        try {
            $deepSettings = New-Object System.Xml.XmlReaderSettings
            $deepSettings.DtdProcessing = [System.Xml.DtdProcessing]::Ignore
            $deepSettings.XmlResolver = $null
            $deepReader = [System.Xml.XmlReader]::Create($file.FullName, $deepSettings)
            try {
                $loaded = [System.Windows.Markup.XamlReader]::Load($deepReader)
            }
            finally {
                $deepReader.Close()
            }
            if ($script:ErrorCount -eq $errorsBefore) {
                Write-Check 'INFO' ('{0}: standalone parse OK ({1} resources loaded)' -f $relativePath, $loaded.Count)
            }
        }
        catch {
            Add-Failure $relativePath ('standalone parse failed: {0}' -f ($_.Exception.Message -replace '\s+', ' '))
        }
    }
    elseif ($standaloneCandidate) {
        Write-Check 'INFO' ('{0}: standalone parse skipped (requires Windows/WPF)' -f $relativePath)
    }

    if ($script:ErrorCount -eq $errorsBefore) {
        Write-Check 'PASS' ('{0} ({1} keys, {2} merged)' -f $relativePath, $keys.Count, $mergeSources.Count)
    }
    else {
        $failedFiles++
    }
}

Write-Host ''
Write-Host ('Checked {0} theme file(s).' -f $themeFiles.Count) -ForegroundColor Cyan
if ($script:WarningCount -gt 0) {
    Write-Check 'WARN' ('{0} warning(s)' -f $script:WarningCount)
}
if ($script:ErrorCount -gt 0) {
    Write-Check 'FAIL' ('{0} error(s) across {1} file(s)' -f $script:ErrorCount, $failedFiles)
    exit 1
}
Write-Check 'PASS' 'All theme files are valid.'
exit 0
