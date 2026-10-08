# Changelog

All notable changes to the Midnight Seven theme will be documented in this file.

## [1.0.10] - 2026-10-08

### Fixed
- **Vertical taskbar tray toggle chevron now rotates**: the `^`/`v` button above the tray icons swaps the horizontal `<` geometry for the vertical one — collapsed points **up** (away from the icons below), expanded points **down** — instead of staying a sideways `<` in the vertical bar; horizontal mode unchanged
- **Chevron centered in the toggle circle**: vertical mode now overrides the arrow padding to `4,5,4,5` so the wider 9×6 vertical geometry sits dead-center in a 19×18 round button (the horizontal-tuned `5,6` left/right padding left it shifted in the wider pill shape)

## [1.0.9] - 2026-10-08

### Fixed
- **Horizontal system tray always shows exactly 2 balanced rows**: a count-keyed width ladder (`MaxWidth` steps of 18px x ceil(count/2), tracked live via `Items.Count`) makes the block grow *horizontally* as icons appear instead of stacking rows into the fixed-height bar where they clipped — 6 icons = 3+3 (54px), 7-8 = 4+3/4+4 (72px), 9-10 = 5+5 (90px), 11-12 = 6+6 (108px), stepping up to 23-24 icons (216px); `MaxHeight=40` + `ClipToBounds` guard keeps anything past that from overflowing the bar
- **Tray block never shifts when toggling `^`**: the cap depends only on icon count, never on the toggle state, so expanding only appends/removes icons — block, overflow toggle, clock and existing icon positions stay put (verified: collapsed vs expanded pixel diff = chevron glyph only)

### Notes
- Vertical mode untouched (its content width sits below every ladder step, so no cap binds there)
- Known trade-off: when a new icon arrives at counts 7/9/11..., a few existing icons re-position to rebalance the 2 rows (never happens on `^` toggle)

## [1.0.8] - 2026-10-08

### Changed
- **Task buttons are now 64×50px in both orientations** (were 46×46) — vertical tiles fill the bar edge-to-edge like the start button, horizontal tiles center with 7px top/bottom margins
- The 36px icon gets 4px of breathing room above and below inside the tile (was 2px)
- `TaskButtonWidth` key (previously unused) now drives the width: 46 → 64; `TaskButtonMargin` `0,9,0,9` → `0,7,0,7` so the taller tile still centers in the 64px bar

## [1.0.7] - 2026-10-08

### Changed
- **Self-contained theme file**: The 14 base styles previously inherited from RetroBar's built-in System theme are now inlined directly into the file (copied verbatim from RetroBar v1.22.122, commit `cff7a787c3`) so the theme resolves every `StaticResource` locally and parses standalone — inlined keys are prefixed `SystemTheme.` to avoid clashing with the theme's own overrides, which keep their original names

### Fixed
- **Vertical taskbar background**: Added the missing `TaskbarVerticalBackground` definition (referenced in vertical mode but never defined) — gradient from `#16111f` to `#1a1a36`, matching the horizontal palette

### Removed
- Dead `StartIconImage` / `StartButtonImage` bitmap references (target files were never shipped; the start button uses the vector `StartButtonIcon`)

## [1.0.6] - 2026-10-08

### Fixed
- **Horizontal quick launch overflow hidden**: More than 6 quick-launch icons no longer render half-cut rows colliding with the bar edges — `ToolbarItems` capped to `MaxHeight=56` (exactly 2 rows) with `ClipToBounds=True`; icons 7+ are laid out but not rendered. First 6 icons always show as 2 rows of 3.

## [1.0.5] - 2026-10-08

### Fixed
- **Horizontal quick launch wrapping**: Icons now wrap into rows of 3 (6 icons = 2 rows of 3) instead of a single unbounded row — `ToolbarItems` constrained to `MaxWidth=96` (3 × 32px columns)
- Quick launch block is vertically centered in the 64px bar (56px tall, 4px top/bottom)

## [1.0.4] - 2026-10-08

### Fixed
- **Horizontal taskbar centering**: Task buttons now float centered vertically in the 64px bar (9px padding top and bottom) instead of sitting flush against the top border — matches the centered look of vertical mode
- `TaskButtonMargin` set to `0,9,0,9` (row height 46+18 = 64 = bar height); also applied via Style.Triggers for multi-row mode

## [1.0.3] - 2026-10-08

### Changed
- **Task icons enlarged**: 32×32px → 36×36px (fills the 46×46 tile better, dock-style)
- Task button content margin in horizontal mode set to 0 so the larger icon has full room (42×42 content area)

## [1.0.2] - 2026-10-08

### Fixed
- **Vertical taskbar**: Task buttons are now the same 46×46px square tiles as horizontal mode, centered in the 64px-wide bar (previously 64px wide × ~36px tall rectangles)
- Both orientations now render identical 46×46 rounded squares with a centered 32px icon

## [1.0.1] - 2026-10-08

### Fixed
- **Horizontal taskbar**: Task buttons are now square (46×46px) instead of rectangular (46×64px), centered vertically in the 64px bar — matches macOS dock / Windows 10 taskbar look
- **Quick launch toolbar**: 24px icons with no borders in any state; proper horizontal margins (2px side spacing) for clean fit

### Changed
- TaskButton, TaskButtonActive, TaskButtonFlashing: Added horizontal Style.Triggers (Height=46, VerticalAlignment=Center)
- ToolbarButton: Removed pressed-state borders; ContentPresenter Margin=0; Horizontal Margin="2,0,2,0"
- TaskIcon: Added Stretch=Uniform, VerticalAlignment=Center, HorizontalAlignment=Center

## [1.0.0] - 2026-10-08

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