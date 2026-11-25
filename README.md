# Midnight Seven 🌙

A Windows 7-style RetroBar theme with large centered icons, vertical taskbar optimization, and a dark midnight aesthetic.

## ✨ Features

- **Icon-only task buttons** - No window titles, just icons
- **Vertical taskbar** - 64px wide bar with centered 36px icons
- **Large start button** - 36px customizable icon
- **Quick launch toolbar** - 24px icons, borderless with engraved notch; visible when locked, collapses when unlocked
- **Dark midnight palette** - Deep purples with cyan/orange/green accents
- **High DPI ready** - Vector icons scale perfectly at any DPI
- **Self-contained** - All resources inlined, parses standalone

## 📦 Installation

1. Copy `Themes/Midnight Seven.xaml` to `%LOCALAPPDATA%\RetroBar\Themes\`
2. Open **RetroBar Properties** → **Advanced** tab
3. Select `"Midnight Seven"` from the theme dropdown
4. Set **Taskbar Location** to **Left** or **Right** (vertical)
5. Enable **Show window thumbnails** for live previews

> The `Themes/` folder also holds 18 upstream Midnight / Dark Mode themes by Ward Hale. They are reference material only — gitignored, not maintained here, and not part of this project.

## 🛠️ Customization

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
| `TaskButtonWidth` | 64 | Default task button width — 64×50px vertical tiles; horizontal tiles default to 64×60px (height = `TaskbarHeight`) but shrink to RetroBar's per-row slot when the row is full |
| `TaskButtonMinWidth` | 45 | Floor for horizontal tile shrink — RetroBar switches to wrapped/scrolling buttons below this instead of squeezing further |
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

## 📋 Requirements

- [RetroBar](https://github.com/dremin/RetroBar) 1.22+
- Windows 10/11 (Windows 7/8.1 supported by RetroBar)

## 👤 Credits

- Based on **Midnight Windows Longhorn** by Ward Hale
- Original Longhorn theme by [Longhorn Fusion](https://www.deviantart.com/longhornfusion)
- RetroBar by [dremin](https://github.com/dremin/RetroBar)

## 📄 License

This theme is provided as-is for personal use. Original Midnight theme assets by Ward Hale. RetroBar is licensed under MIT.