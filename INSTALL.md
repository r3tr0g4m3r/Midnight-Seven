# Installation Guide

## Quick Install

1. **Download** `Midnight Seven.xaml` from the `Themes/` folder
2. **Copy** to `%LOCALAPPDATA%\RetroBar\Themes\`
   - Press `Win+R`, type `%LOCALAPPDATA%\RetroBar\Themes\`, press Enter
   - Paste the file there
3. **Select theme** in RetroBar:
   - Right-click taskbar → **RetroBar Properties** → **Advanced** tab
   - Theme dropdown → **"Midnight Seven"**
4. **Set vertical layout** (recommended):
   - Properties → **Taskbar** tab → **Location**: Left or Right

## Manual Theme Folder

If the Themes folder doesn't exist:
1. Open RetroBar Properties → Advanced tab
2. Click **"Open Themes Folder"** button
3. Paste `Midnight Seven.xaml` there

## Verify Installation

The theme should appear in the dropdown immediately. If not:
- Restart RetroBar (right-click tray icon → Exit, then relaunch)
- Check file is named exactly `Midnight Seven.xaml`

## Recommended Settings

For the full Windows 7/10 vertical experience:

| Setting | Value |
|---------|-------|
| **Location** | Left or Right |
| **Show window thumbnails** | ✅ Enabled |
| **Taskbar scale** | 100% |
| **Combine taskbar buttons** | ✅ Enabled (default) |
| **Show labels** | ❌ Disabled (theme handles this) |

## Customization

See [README.md](README.md#customization) for:
- Replacing the start button icon
- Adjusting icon sizes
- Color modifications

## Troubleshooting

**Theme not appearing:**
- Ensure file extension is `.xaml` (not `.xaml.txt`)
- Restart RetroBar completely

**Icons too small/large:**
- Edit the theme file, adjust `TaskButtonIconSize` or `ToolbarIcon` values

**Start button icon not showing:**
- Verify `StartButtonIcon` resource points to valid source
- For custom images: check path in `UriSource="../Resources/your-icon.png"`

**Quick launch not showing:**
- Enable in RetroBar Properties → Toolbars → Quick Launch
- Right-click taskbar → Toolbars → Quick Launch

## Uninstall

Delete `Midnight Seven.xaml` from `%LOCALAPPDATA%\RetroBar\Themes\`