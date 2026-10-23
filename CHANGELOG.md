# Changelog

All notable changes to the Midnight Seven theme will be documented in this file.

## [1.0.63] - 2026-10-22

### Fixed
- **Credit links corrected in LICENSE and README**: Ward Hale's DeviantArt attribution now points to the correct profile (madhale) and RetroBar Dark Modes gallery page; trailing newlines added.

### Added
- **Release packaging script** `tools/Build-Release.ps1`: zips the six release files (CHANGELOG, CONTRIBUTING, INSTALL, LICENSE, README, theme flattened from `Themes/`) into `Midnight-Seven-v{ver}.zip`, validating the theme first.
- **Git tags resumed**: annotated tags backfilled for every version with a corresponding commit (v1.0.7–v1.0.15, v1.0.31, v1.0.35, v1.0.38, v1.0.60–v1.0.62); v1.0.16–v1.0.30, v1.0.32–v1.0.34, v1.0.36–v1.0.37 and v1.0.39–v1.0.59 predate git and remain changelog-only.

### Changed
- **Repository history rewritten** to attribute all commits and tags to `r3tr0g4m3r <r3tr0g4m3r@users.noreply.github.com>` (was `Retrogamer <retro>`); commit dates and messages unchanged.

## [1.0.62] - 2026-10-12

### Changed
- **Flashing button shine reworked as an inverted (concave) deep-button dome**: the diagonal streak removed; a frame-hugging rounded-square panel (1px margin, 4px corner radius, matching the button border) now carries vertical inverted lighting — dark rim under the near top lip (#55000000), clear center, bright far bottom inner slope (#70FFFFFF). Brush renamed GlassIconStreakGradient → GlassDeepButtonConcave. Orientation DataTriggers no longer set IconStreak Data/Fill (rounded shapes have no Data property).

## [1.0.61] - 2026-10-12

### Fixed
- **Tray expand chevron now reverses in vertical mode**: rebuilt TrayToggleButton triggers on RetroBar's stock pattern (one MultiDataTrigger per orientation/checked state with RelativeSource Self). Replaces fragile trigger-ordering that let the horizontal ScaleX flip win over the vertical flip. Collapsed points up, expanded points down.
- **Vertical-mode chevron perfectly centered, button stays circular**: vertical mode now reuses the same HArrow geometry as horizontal, rotated ±90° via LayoutTransform (layout box becomes the rotated bounds). New TrayToggleArrowPaddingVertical resource mirrors the horizontal padding (5,6,4,4 → 4,5,4,6). Replaces VArrow geometry swaps and pixel-nudge hacks that caused stretch/off-center rendering.

## [1.0.60] - 2026-10-12

### Changed
- **Flashing button streak now runs corner-to-corner across the full icon** in both orientations (`M 0,0.3 L 0.3,0 L 1,0.7 L 0.7,1 Z`); vertical-mode horizontal band + rotated gradient removed (unused brush dropped).

## [1.0.59] - 2026-10-12

### Added
- **Diagonal light streak over flashing task button icon**: sliver-style facet sheen (GlassIconStreakGradient) layered above the icon as a diagonal band, orientation-swapped (horizontal: top-left to bottom-right; vertical: left-to-right rotated gradient). 

### Fixed
- **Missing GlassFlashCenterHighlight resource** caused template load failure (validation FAIL, line 1325). Radial white glow brush added.
- **Duplicate Content ContentPresenter removed** from flashing button template (x:Name collision crashed template load).

## [1.0.58] - 2026-10-12

### Changed
- **Flashing task button adopts active button style with red background**: structure now matches active button (corner sheens, rounded corners, single border). Background changed to bright red radial gradient. Corner sheens (top-left and bottom-right) added with GlassActiveCornerSheen. BlurBehind with 12px blur preserved. Dark gradient sheen over icon preserved. Central pulse highlight with pulsing animation preserved. Orientation-specific corner radii (horizontal: top-rounded; vertical: fully rounded).

## [1.0.57] - 2026-10-12

### Changed
- **Flashing task button glass sheen replaced with full-face dark gradient**: isosceles triangle replaced with full-face rectangle covering entire icon. Dark gradient from top (#80000000) to transparent bottom (#00000000) creates subtle "icon behind dark glass" effect. Central pulse highlight and red radial background preserved.

## [1.0.56] - 2026-10-12

### Changed
- **Flashing task button glass sheen replaced with dark gradient layer**: white isosceles triangle replaced with dark gradient layer (top to bottom) over the icon. Dark at top (#80000000), fading to transparent at bottom. Creates subtle "icon behind dark glass" effect. Central pulse highlight and red radial background preserved.

## [1.0.54] - 2026-10-12

### Changed
- **Flashing task button glass sheen replaced with sharp white isosceles triangle**: gradient reflection replaced with a hard-edged white isosceles triangle (80% opacity, #CCFFFFFF) pointing down over the icon. Covers entire icon area (100% height) with sharp edges, no gradient. Removes gradient reflection and edge highlights. Central pulse highlight and red radial background preserved.

## [1.0.53] - 2026-10-12

### Changed
- **Flashing task button glass reflection now covers 100% of icon with sharp 80% peak intensity**: glass reflection expanded to full icon coverage (100% height), peak intensity increased to 80% white (#CCFFFFFF), dark band strengthened to 12.5% black (#20000000), edge highlights thickened to 2px. Creates sharp, bright glass prison effect over entire icon while preserving central pulse highlight and red radial background.

## [1.0.52] - 2026-10-12

### Changed
- **Flashing task button gains glass reflection over icon**: white isosceles triangle replaced with glass-like reflection covering top 60% of icon. Features multi-stop gradient with subtle dark band, 1px top/bottom edge highlights (GlassEdgeLight), and 60% vertical coverage for "icon behind glass" effect. Hard edges maintained for sharp glass look. Central pulse highlight and red radial background preserved.

## [1.0.51] - 2026-10-12

### Changed
- **Flashing task button glass sheen replaced with white isosceles triangle**: rectangular glass sheen replaced with a hard-edged white isosceles triangle (50% opacity) pointing down over the icon. Creates a sharp "glass prison" effect over the icon. Gradient GlassFlashIconSheen removed.

## [1.0.50] - 2026-10-12

### Changed
- **Flashing task button glass sheen now covers only icon area**: glass sheen overlay (GlassFlashIconSheen) now binds to ContentPresenter size/position, covering only the icon area for true "icon prison" effect. Debug test letter removed. Entire button face no longer covered.

## [1.0.49] - 2026-10-12

### Changed
- **Flashing task button debug test**: added white "X" test letter over icon area to verify Z-order of glass sheen overlay. Helps debug glass sheen visibility over icon.

## [1.0.48] - 2026-10-12

### Changed
- **Flashing task button: border removed, glass sheen added over icon**: outer 3px border removed, inner borders simplified to match normal button (single 1px outer border). Added glass sheen overlay over entire button face (icon prison effect) with subtle 20-30% opacity gradient. Central pulse highlight preserved with pulsing animation. Background gradient unchanged (center-bright red radial).

## [1.0.47] - 2026-10-12

### Added
- **Flashing task button gains central red highlight**: beveled shine effect with bright red radial gradient from center outward. Background gradient shifted to center-bright radial (center #cc3a3a → edges #3a1010). Added pulsing center highlight (55% size, 20% peak opacity, 1.5s pulse animation). Border colors updated to red (#cc4a4a, #cc6666).

## [1.0.38] - 2026-10-12

### Changed
- **Flashing task button border harmonized with normal button**: flashing button border color changed from bright red (#cc4a4a) to dark red-purple blend (#4a2a3a) to harmonize with normal button's dark purple border (#332c59) while keeping 3px thickness and red urgency. All three border colors unified to #4a2a3a. Structure unchanged (3px outer border, inner borders removed).

## [1.0.37] - 2026-10-12

### Changed
- **Flashing task button: brighter red tint, simplified borders**: background gradient shifted to bright red (#aa2a2a → #cc3a3a), borders updated to bright red (#cc4a4a, #cc6666). Border2 and Border3 removed (0px), leaving only Border1 at 3px with bright red color (#cc4a4a) for a clean, urgent look. Matches normal button structure (single outer border) with urgent red coloration.

## [1.0.36] - 2026-10-12

### Changed
- **Flashing task button gets subtle red tint**: background gradient and borders shifted from blue-purple to subtle magenta/red to indicate urgency. Background: #332c59→#4a2c4a, #42428a→#5a3a5a. Borders: #6565b5→#7a5a6a, #999999→#aa8888. Structure unchanged.

## [1.0.34] - 2026-10-12

### Changed
- **Active task button sheen lights opposite corners**: horizontal now lights top-left corner (was top-right), vertical lights top-right (was top-left). Both use triangular corner facets (50% legs) with GlassCornerSheen-style gradients. Horizontal uses top-left → bottom-right diagonal; vertical uses top-right → bottom-left diagonal.

## [1.0.33] - 2026-10-12

### Changed
- **Active task button gains corner-based glass sheen**: replaced rectangular strip with triangular corner facets (hard-cut style). Horizontal: top-right corner triangle (top-right to bottom-left diagonal, 50% legs). Vertical: top-left corner triangle (top-left to bottom-right diagonal, 50% legs, matches GlassCornerSheen). Gradients match GlassCornerSheen style (60% peak → transparent → glint). Both use Path with Stretch="Fill" for proper scaling.

## [1.0.32] - 2026-10-12

### Added
- **Active task button gains persistent glass sheen overlay**: active task button now has a persistent glass sheen overlay matching the GlassSheen style (directional highlights, dark band, far glint). Horizontal: sheen covers top 40% of button. Vertical: sheen covers left 40% of button. Gradient matches GlassSheen style (directional highlights, dark band, far glint). Updates automatically with orientation.

## [1.0.31] - 2026-10-12

### Changed
- **Show desktop sliver facets softened**: replaced hard-cut triangular facets with soft glass sheen triangular facets. Smooth gradient transitions (80% → 40% → 10% → 0% → subtle 3% dark band → far glint) replace hard cut. Isosceles triangle geometry preserved (horizontal: top edge, 80% width, 20% height; vertical: left edge, 70% height, 15% width). Both lifted from corners.

## [1.0.30] - 2026-10-12

### Changed
- **Show desktop sliver gains triangular glass facets**: replaced rectangular streaks with isosceles triangular facets (hard-cut, bright at base). Horizontal: isosceles triangle on top edge (80% width, 20% height, apex down). Vertical: isosceles triangle on left edge (70% height, 15% width, apex right). Hard-cut glass facet gradient (`GlassFacetGradient` / `GlassFacetGradientRotated`) with sharp bright-to-dark cut (99% → 3.9% → 0%). Both lifted from corners for slimmer, faceted look.

## [1.0.29] - 2026-10-12

### Changed
- **Show desktop sliver streak made visible**: horizontal streak now fixed 3px height (20% of 15px), vertical streak 15% width (9.6px on 64px). Both retain glass-like multi-stop gradients with dark bands and edge glints. Gradient brightened (60% peak). Horizontal: top edge streak 3px height (fixed), 80% width, 10% side gaps. Vertical: left edge streak 15% width (9.6px on 64px), 70% height (15% top/bottom gaps). 1px edge highlights retained.

## [1.0.28] - 2026-10-12

### Changed
- **Show desktop sliver gains glass-like streaks**: complex multi-stop glass-like gradients (`GlassStreakGradient` / `GlassStreakGradientRotated`) with directional highlights, dark bands, and edge glints. Added 1px edge highlights on streak (top/bottom for horizontal, left/right for vertical) for glass depth. Horizontal: top edge streak (80% width, 10% side gaps, 8% height). Vertical: left edge streak (70% height, 15% top/bottom gaps, 8% width). Both lifted from corners.

## [1.0.27] - 2026-10-12

### Changed
- **Show desktop sliver gains visible corner streaks**: replaced geometric triangle facets with slim rectangular streaks along the edges. Horizontal: horizontal streak along top edge (80% width, 10% side gaps, 8% height). Vertical: vertical streak along left edge (70% height, 15% top/bottom gaps, 8% width). Brighter gradient (`GlassStreakGradient`: 50% → 25% → 10%) for clear visibility. Both orientations lifted from corners for slimmer, disconnected look.

## [1.0.15] - 2026-10-09

### Fixed
- **Horizontal task tiles no longer overlap when the bar is full**: the horizontal triggers of `TaskButton`/`TaskButtonActive`/`TaskButtonFlashing` stopped forcing `Width = TaskButtonWidth` (64px) — RetroBar sizes each button's outer box per row (`TaskButtonWidth` + margin when there's room, shrunk to exactly fit the row when crowded), and a fixed 64px tile plus its 3px margin overflowed that box, painting over every neighboring tile as windows accumulated; the tile now stretches to its box so the `TaskButtonMargin` `1,0,2,0` gap (3px) is preserved at every size. With few windows the bar renders identically (64×60 tiles, 3px gaps); vertical mode is untouched (it keeps the fixed 64px width)

### Added
- **`TaskButtonMinWidth = 45` sizing key**: RetroBar reads it at load to know when to stop shrinking horizontal tiles and switch to its wrapped/scrolling button mode instead of squeezing tiles indefinitely (the theme previously omitted it, so RetroBar's floor resolved to 0 and the fallback never engaged)

## [1.0.14] - 2026-10-09

### Changed
- **Start button sheen lights only the opposite corners**: the full-cover `GlassSheen` (bright top band, dark mid-band, bottom glint) is replaced on the start button with a new diagonal `GlassCornerSheen` brush — top-left at 25% white fading to fully clear through the center, rising again to 20% white at the bottom-right corner — a subtle 3D orb read without the oversized edge glow; identical diagonal in both orientations (the vertical-mode `GlassSheenRotated` swap was removed)
- **Start button edge hairlines back to 1px** (from 3px) on all four edges so the corner light carries the effect; dark chrome, hover/pressed blur, and the show-desktop sliver (keeps its full directional sheen and 1px lines) are unchanged

## [1.0.13] - 2026-10-09

### Fixed
- **Vertical quick launch icons are centered**: the `ToolbarItems` vertical trigger now sets `HorizontalAlignment=Center` — the inlined `SystemTheme.ToolbarItems` default of `Stretch` left-packed the 56px (2×2) icon block against the edge of the 64px bar instead of centering it

### Changed
- **Horizontal task tiles now fill the full 60px bar height** (50 → 60px, `Height = TaskbarHeight`, zero vertical margin): each tile's outline touches the bar's top and bottom edges in every state — vertical tiles stay 64×50 and the bar itself is unchanged in both orientations (60px thick / 64px wide)
- **The dark outer band on task tiles is gone**: the `ButtonBorder1` frame (up to 5px of `#1d1629`) is removed in all states and both orientations — only the thin light `#332c59` line frames the tile against its fill; active windows keep the brighter `#392d6e` line so they stay distinguishable, and flashing tiles keep a bright `#6565b5` border in every state (thickened to 3px; hover/pressed no longer swap it for the dark brush)
- **3px separation between task tiles in both orientations**: `TaskButtonMargin` `0,5,0,5` → `1,0,2,0` gives a 3px strip of bar background between horizontally adjacent tiles; `TaskButtonVerticalMargin` `0,0,0,2` → `0,0,0,3` matches it vertically (the vertical bar grows ~1px per tile in length; its 64px width is untouched)
- **Start button fills the bar height in horizontal mode** (44 → 60px = `TaskbarHeight`, matching the tiles; vertical keeps 44px) and its glass hairlines thicken from 1px to 3px on all four edges — the dark chrome and sheen are unchanged

## [1.0.12] - 2026-10-08

### Changed
- **Horizontal taskbar slimmed 64px → 60px**: `TaskbarHeight` and `TaskbarRowHeight` drop to 60 and `TaskButtonMargin` tightens from `0,7,0,7` to `0,5,0,5` so the 50px tiles stay exactly centered (5+50+5 = 60) — the bar loses 1px of padding above and below every tile; the vertical bar (64px wide) is untouched, and everything that stretches (start button, show-desktop sliver, tray, clock) follows the new height automatically

## [1.0.11] - 2026-10-08

### Changed
- **Show desktop button is now a Win7-style 15px blank sliver** at the end of the bar (was ~40px wide with a 30×10 blue XP glyph): horizontal bar = 15×64px flush at the right edge, vertical bar = 64×15px flush at the bottom — exact Windows 7 proportion (Win7: 15px wide × full taskbar height)
- **Color grading**: midnight purple gradient (`#1d1230` → `#16111f`) with a `#433357` separator line facing the tray (left edge horizontal, top edge vertical), `#303063` hover, `#484896` pressed — replaces the blue XP glyph and the task-button glow treatment
- **Glassy shading**: a persistent Win7-style sheen overlays the sliver — **directional light** with a strong shine at the leading end (top in horizontal mode, left in vertical mode), one **unified rounded 12% black band** below center (5-stop ramp with neutral transparent gaps, so no contour lines), and a faint glint at the far end; crisp 1px `#4DFFFFFF` hairlines sit on both terminal ends (equal brightness); hover/pressed only brighten the base color *underneath* the sheen, so the shading never disappears
- **Start button gets the same glass treatment**: the shared directional sheen is layered over the start button square (above the hover/pressed purple fill, below the icon) — leading shine, unified dark band, faint far-end glint — plus 1px `#4DFFFFFF` hairlines on **all four edges**; shading persists through hover/pressed (the fill brightens underneath) and the sheen axis flips with orientation (top-dominant horizontal, left-dominant vertical)
- **Start button is now the same 64×44 box in both orientations** (was 44×34 in the horizontal bar, where the 36px icon overflowed the 34px face and made the bordered square look cramped): horizontal now uses `TaskbarWidth` × `StartButtonVerticalSize` — identical to vertical, and the 64px width lines up with the 64px-wide task buttons

### Removed
- Dead `XPShowDesktopIcon` drawing brush (only consumer was the old button template; it was XP-blue and clashed with the palette)
- `StartButtonHorizontalHeight` sizing key (superseded — the start button height is `StartButtonVerticalSize` in both orientations)

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