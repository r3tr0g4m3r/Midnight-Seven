#!/usr/bin/env pwsh
<#
.SYNOPSIS
    Builds the Midnight Seven release zip archive.

.DESCRIPTION
    Packages the release files into Midnight-Seven-v{Version}.zip at the
    repository root, matching the layout of previous releases:

      CHANGELOG.md
      CONTRIBUTING.md
      INSTALL.md
      LICENSE
      Midnight Seven.xaml   (flattened from Themes/)
      README.md

    The version defaults to the top entry in CHANGELOG.md. The theme is
    validated first with tools/Validate-Xaml.ps1 so a broken theme can
    never ship.

.PARAMETER Version
    Version string without the leading v (e.g. "1.0.63"). Defaults to the
    first "## [x.y.z]" entry found in CHANGELOG.md.

.PARAMETER SkipValidation
    Skip the Validate-Xaml.ps1 pre-flight check.

.EXAMPLE
    pwsh tools/Build-Release.ps1

.EXAMPLE
    pwsh tools/Build-Release.ps1 -Version 1.0.64
#>
[CmdletBinding()]
param(
    [string]$Version,
    [switch]$SkipValidation
)

$ErrorActionPreference = 'Stop'

$repoRoot = Split-Path -Parent $PSScriptRoot
$themeName = 'Midnight Seven.xaml'

if (-not $Version) {
    $changelogPath = Join-Path $repoRoot 'CHANGELOG.md'
    if (-not (Test-Path -LiteralPath $changelogPath)) {
        throw "CHANGELOG.md not found at $changelogPath and no -Version given."
    }
    $first = Select-String -Path $changelogPath -Pattern '^## \[([0-9]+\.[0-9]+\.[0-9]+)\]' | Select-Object -First 1
    if (-not $first) {
        throw "No '## [x.y.z]' version entry found in CHANGELOG.md; pass -Version explicitly."
    }
    $Version = $first.Matches[0].Groups[1].Value
    Write-Host "Version from CHANGELOG: $Version"
}

$files = [ordered]@{
    'CHANGELOG.md'     = Join-Path $repoRoot 'CHANGELOG.md'
    'CONTRIBUTING.md'  = Join-Path $repoRoot 'CONTRIBUTING.md'
    'INSTALL.md'       = Join-Path $repoRoot 'INSTALL.md'
    'LICENSE'          = Join-Path $repoRoot 'LICENSE'
    'Midnight Seven.xaml' = Join-Path $repoRoot "Themes\$themeName"
    'README.md'        = Join-Path $repoRoot 'README.md'
}

foreach ($entry in $files.GetEnumerator()) {
    if (-not (Test-Path -LiteralPath $entry.Value)) {
        throw "Missing release file: $($entry.Key) ($($entry.Value))"
    }
}

if (-not $SkipValidation) {
    $validator = Join-Path $PSScriptRoot 'Validate-Xaml.ps1'
    Write-Host "Validating theme before packaging..."
    & $validator
    if ($LASTEXITCODE -ne 0) {
        throw "Validate-Xaml.ps1 failed (exit $LASTEXITCODE); not building zip."
    }
}

# Stage into a temp folder so the theme can be flattened to the zip root
$stage = Join-Path ([IO.Path]::GetTempPath()) ("ms7-release-" + [guid]::NewGuid().ToString('N'))
New-Item -ItemType Directory -Path $stage | Out-Null
try {
    foreach ($entry in $files.GetEnumerator()) {
        Copy-Item -LiteralPath $entry.Value -Destination (Join-Path $stage $entry.Key)
    }

    $zipPath = Join-Path $repoRoot "Midnight-Seven-v$Version.zip"
    if (Test-Path -LiteralPath $zipPath) {
        Remove-Item -LiteralPath $zipPath -Force
    }
    Compress-Archive -Path (Join-Path $stage '*') -DestinationPath $zipPath -CompressionLevel Optimal
}
finally {
    Remove-Item -LiteralPath $stage -Recurse -Force -ErrorAction SilentlyContinue
}

$item = Get-Item -LiteralPath $zipPath
Write-Host "Built $($item.FullName) ($([math]::Round($item.Length / 1KB, 1)) KB)"
