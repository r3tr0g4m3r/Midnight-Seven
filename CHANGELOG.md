# Changelog

All notable changes to the Midnight Seven theme will be documented in this file.

## [1.0.6] - 2024-10-08

### Fixed
- **Horizontal quick launch overflow hidden**: More than 6 quick-launch icons no longer render half-cut rows colliding with the bar edges — `ToolbarItems` capped to `MaxHeight=56` (exactly 2 rows) with `ClipToBounds=True`; icons 7+ are laid out but not rendered. First 6 icons always show as 2 rows of 3.

## [1.0.5] - 2024-10-08

### Fixed
- **Horizontal quick launch wrapping**: Icons now wrap into rows of 3 (6 icons = 2 rows of 3) instead of a single unbounded row — `ToolbarItems` constrained to `MaxWidth=96` (3 × 32px columns)
- Quick launch block is vertically centered in the 64px bar (56px tall, 4px top/bottom)

## [1.0.4] - 2024-10-08

### Fixed
- **Horizontal taskbar centering**: Task buttons now float centered vertically in the 64px bar (9px padding top and bottom) instead of sitting flush against the top border — matches the centered look of vertical mode
- `TaskButtonMargin` set to `0,9,0,9` (row height 46+18 = 64 = bar height); also applied via Style.Triggers for multi-row mode

## [1.0.3] - 2024-10-08

### Changed
- **Task icons enlarged**: 32×32px → 36×36px (fills the 46×46 tile better, dock-style)
- Task button content margin in horizontal mode set to 0 so the larger icon has full room (42×42 content area)

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