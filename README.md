# Midnight Seven - RetroBar Theme

A Windows 7-style theme for [RetroBar](https://github.com/dremin/RetroBar) featuring large centered icons, vertical taskbar optimization, and a dark midnight aesthetic.

## Features

- **Windows 7/10 style icon-only task buttons** - No window titles, just icons
- **Vertical taskbar optimized** - 64px wide bar with centered 36px icons
- **Task buttons match the bar in both orientations** - vertical: 64×50px tiles fill the 64px bar edge-to-edge; horizontal: 64×60px tiles fill the 60px bar edge-to-edge (thin light outline touches top/bottom); 3px separation between tiles, no dark border
- **Large start button** - 36px customizable icon (vector-based, replaceable)
- **Quick launch toolbar** - 24px icons, borderless (fits 64px bar)
- **Instant tooltips** - 150ms delay for window titles (vs default 400ms)
- **Stacked system tray icons** - Horizontal tray always shows exactly 2 balanced rows: the width cap steps with the icon count so the block grows sideways as icons appear (never clipped rows), and toggling `^` never shifts anything
- **Icon hover glow** - Subtle opacity pulse on hover
- **Active window highlight** - Foreground window icon stays at full opacity
- **Dark midnight palette** - Deep purples with cyan/orange/green accents
- **High DPI ready** - Vector icons scale perfectly at any DPI
- **Self-contained** - RetroBar's System theme base styles are inlined (v1.22.122, commit `cff7a787c3`), so the file resolves every resource locally and parses standalone

## Installation

1. Copy `Themes/Midnight Seven.xaml` to `%LOCALAPPDATA%\RetroBar\Themes\`
2. Open **RetroBar Properties** → **Advanced** tab
3. Select **"Midnight Seven"** from the theme dropdown
4. Set **Taskbar Location** to **Left** or **Right** (vertical)
5. Enable **Show window thumbnails** in Properties for live previews

> The working copy's `Themes/` folder also holds 18 upstream Midnight / Dark Mode themes by Ward Hale. They are reference material only — gitignored, not maintained here, and not part of this project.

## Customization

### Start Button Icon

Replace the `StartButtonIcon` resource in the theme file:

**Option 1: Custom PNG/JPG/BMP/TIFF/ICO**
```xaml
<BitmapImage x:Key="StartButtonIcon" 
             UriSource="../Resources/my-start-icon.png" 
             DecodePixelWidth="36" DecodePixelHeight="36" />
```
- Supported formats: PNG (with transparency), JPG, BMP, TIFF, ICO
- Place image in `%LOCALAPPDATA%\RetroBar\Resources\` or alongside theme
- Recommended source size: 36×36 or 48×48

**Option 2: Custom Vector (DrawingImage)**
```xaml
<DrawingImage x:Key="StartButtonIcon">
    <DrawingImage.Drawing>
        <DrawingGroup>
            <!-- Your GeometryDrawing elements here -->
        </DrawingGroup>
    </DrawingImage.Drawing>
</DrawingImage>
```
- Scales perfectly at any DPI

### Sizing Keys

| Key | Default | Description |
|-----|---------|-------------|
| `TaskbarWidth` | 64 | Vertical taskbar width (also the start-button width in both orientations) |
| `TaskbarHeight` | 60 | Horizontal taskbar height |
| `TaskbarRowHeight` | 60 | Horizontal taskbar row height (one row of task buttons) |
| `TaskbarUnlockedSize` | 4 | Size of the drag handle shown when the taskbar is unlocked |
| `TaskButtonWidth` | 64 | Task button width — 64×50px vertical tiles, 64×60px horizontal tiles (horizontal height = `TaskbarHeight`) |
| `TaskButtonMargin` | `1,0,2,0` | Horizontal tile margins — 3px separation between adjacent tiles |
| `TaskButtonVerticalMargin` | `0,0,0,3` | Vertical-mode margins (3px bottom spacing between tiles) |
| `TaskButtonIconSize` | 36 | Task button icon size (set in the `TaskIcon` style) |
| `StartButtonIconSize` | 36 | Start button icon size |
| `StartButtonVerticalSize` | 44 | Start button height (vertical; horizontal = `TaskbarHeight`) |

### Quick Launch Icons

Quick launch icon size is controlled by the `ToolbarIcon` style:
```xaml
<Style x:Key="ToolbarIcon" BasedOn="{StaticResource SystemTheme.ToolbarIcon}" TargetType="Image">
    <Setter Property="Width" Value="24" />
    <Setter Property="Height" Value="24" />
    <Setter Property="Margin" Value="2" />
    <Setter Property="Stretch" Value="Uniform" />
</Style>
```
Current: exactly 24×24, borderless buttons (vertical: 2-column layout centered in the 64px bar; horizontal: 2px side margins)

## Theme Palette

| Element | Color |
|---------|-------|
| Taskbar Background | `#16111f` |
| Taskbar Border | `#433357` |
| Button Background | `#16111f` → `#1d1230` gradient |
| Button Hover | `#303063` blur |
| Active Button | `#968ff7` text / purple glow |
| Start Button Hover | `#484896` |
| Tooltip Delay | 150ms |

## Requirements

- [RetroBar](https://github.com/dremin/RetroBar) 1.22+
- Windows 10/11 (Windows 7/8.1 supported by RetroBar)

## Credits

- Based on **Midnight Test** / **Midnight Windows Longhorn** by Ward Hale
- Original Longhorn theme by [Longhorn Fusion](https://www.deviantart.com/longhornfusion)
- RetroBar by [dremin](https://github.com/dremin/RetroBar)

## License

This theme is provided as-is for personal use. Original Midnight theme assets by Ward Hale.
RetroBar is licensed under MIT.