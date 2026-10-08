# Changelog

All notable changes to the Midnight Seven theme will be documented in this file.

## [1.0.2] - 2024-10-08

### Fixed
- **Vertical taskbar**: Task buttons are now the same 46×46px square tiles as horizontal mode, centered in the 64px-wide bar (previously 64px wide × ~36px tall rectangles)
- Both orientations now render identical 46×46 rounded squares with a centered 32px icon

## [1.0.1] - 2024-10-08

### Fixed
- **Horizontal taskbar**: Task buttons are now square (46×46px) instead of rectangular (46×64px), centered vertically in the 64px bar — matches macOS dock / Windows 10 taskbar look
- **Quick launch toolbar**: 24px icons with no borders in any state; proper horizontal margins (2px side spacing) for clean fit

### Changed
- TaskButton, TaskButtonActive, TaskButtonFlashing: Added horizontal Style.Triggers (Height=46, VerticalAlignment=Center)
- ToolbarButton: Removed pressed-state borders; ContentPresenter Margin=0; Horizontal Margin="2,0,2,0"
- TaskIcon: Added Stretch=Uniform, VerticalAlignment=Center, HorizontalAlignment=Center

## [1.0.0] - 2024-10-08

### Added
- Initial release of Midnight Seven theme
- Windows 7-style icon-only task buttons (32px icons)
- Vertical taskbar optimization (64px width, centered icons)
- Large start button with interchangeable icon (36px vector-based)
- Quick launch toolbar with 24px icons in 2-column layout
- Instant tooltips (150ms delay) for window titles
- Icon hover glow effect (opacity pulse)
- Active window icon highlight (full opacity for foreground window)
- Dark midnight color palette
- Comprehensive customization documentation

### Sizing
- Taskbar: 64px wide (vertical) / 64px tall (horizontal)
- Task icons: 32×32px
- Start button icon: 36×36px (vertical: 44px button height)
- Quick launch icons: 24×24px (2 columns in 64px bar)
- Start button vertical: 44px height
- Start button horizontal: 34px height

### Features
- Icon-only task buttons (no labels)
- 150ms tooltip delay (vs 400ms default)
- Hover opacity pulse on task icons (0.85 → 1.0)
- Active window icon at full opacity
- Customizable start button icon (vector or bitmap)
- High DPI support (vector scaling)
- Window thumbnails support