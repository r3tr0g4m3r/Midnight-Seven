# Midnight Seven - RetroBar Theme

A Windows 7-style theme for [RetroBar](https://github.com/dremin/RetroBar) featuring large centered icons, vertical taskbar optimization, and a dark midnight aesthetic.

## Preview

![Midnight Seven](screenshot.png)

*Vertical taskbar with 36px task icons, 36px start button icon, and 24px quick launch icons in 2-column layout*

## Features

- **Windows 7/10 style icon-only task buttons** - No window titles, just icons
- **Vertical taskbar optimized** - 64px wide bar with centered 36px icons
- **Square task buttons in both orientations** - 46×46px rounded squares: horizontal floats vertically in the 64px bar, vertical centers in the 64px-wide bar (macOS dock style)
- **Large start button** - 36px customizable icon (vector-based, replaceable)
- **Quick launch toolbar** - 24px icons, borderless (fits 64px bar)
- **Instant tooltips** - 150ms delay for window titles (vs default 400ms)
- **Icon hover glow** - Subtle opacity pulse on hover
- **Active window highlight** - Foreground window icon stays at full opacity
- **Dark midnight palette** - Deep purples with cyan/orange/green accents
- **High DPI ready** - Vector icons scale perfectly at any DPI

## Installation

1. Copy `Themes/Midnight Seven.xaml` to `%LOCALAPPDATA%\RetroBar\Themes\`
2. Open **RetroBar Properties** → **Advanced** tab
3. Select **"Midnight Seven"** from the theme dropdown
4. Set **Taskbar Location** to **Left** or **Right** (vertical)
5. Enable **Show window thumbnails** in Properties for live previews

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
| `TaskbarWidth` | 64 | Vertical taskbar width |
| `TaskbarHeight` | 64 | Horizontal taskbar height |
| `TaskButtonWidth` | 46 | Task button size — square 46×46 tiles in both orientations |
| `TaskButtonIconSize` | 36 | Task button icon size (set in the `TaskIcon` style) |
| `StartButtonIconSize` | 36 | Start button icon size |
| `StartButtonVerticalSize` | 44 | Start button height (vertical) |
| `StartButtonHorizontalHeight` | 34 | Start button height (horizontal) |

### Quick Launch Icons

Quick launch icon size is controlled by the `ToolbarIcon` style:
```xaml
<Style x:Key="ToolbarIcon" BasedOn="{StaticResource ToolbarIcon}" TargetType="Image">
    <Setter Property="Width" Value="24" />
    <Setter Property="Height" Value="24" />
    <Setter Property="Margin" Value="2" />
    <Setter Property="Stretch" Value="Uniform" />
</Style>
```
Current: exactly 24×24, borderless buttons (vertical: 2-column layout in 64px bar; horizontal: 2px side margins)

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