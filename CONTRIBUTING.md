# Contributing

Thank you for your interest in improving Midnight Seven!

## Ways to Contribute

- **Bug reports** - Issues with rendering, sizing, or compatibility
- **Feature requests** - New customization options, color variants
- **Code improvements** - Cleaner XAML, better performance
- **Documentation** - Clarifications, translations, examples
- **Testing** - Verify on different Windows versions, DPI settings

## Development Setup

1. Install [RetroBar](https://github.com/dremin/RetroBar) (latest release)
2. Clone this repository
3. Edit `Themes/Midnight Seven.xaml`
4. Test by copying to `%LOCALAPPDATA%\RetroBar\Themes\`
5. Reload theme in RetroBar Properties

## XAML Guidelines

- Keep styles organized by component (TaskButton, StartButton, Toolbar, etc.)
- Use `BasedOn="{StaticResource ...}"` for inheritance
- Define sizing as resources at top of file for easy tuning
- Comment complex triggers and customization points
- Avoid hardcoded colors where a resource reference works
- Test both vertical and horizontal orientations

## Theme Structure

```
Midnight Seven.xaml
├── Sizing Keys (TaskbarWidth, TaskButtonIconSize, etc.)
├── Color Resources (Brushes, Gradients)
├── StartButtonIcon (interchangeable vector)
├── TaskButton / TaskButtonActive / TaskButtonFlashing
├── StartButton (template with orientation triggers)
├── TaskIcon / ToolbarIcon (sizing + hover effects)
├── StartIcon / StartLabel (always hidden)
├── ToolbarButton / ToolbarItems (compact vertical layout)
├── Clock / NotifyIcon / Tray / ScrollViewer styles
└── Balloon / Tooltip / TrayToggle styles
```

## Testing Checklist

Before submitting a PR, verify:

- [ ] Theme loads without errors in RetroBar
- [ ] Vertical taskbar (Left/Right): 2-column quick launch, centered icons
- [ ] Horizontal taskbar (Top/Bottom): proper layout
- [ ] Hover effects work on task buttons and quick launch
- [ ] Active window icon stays at full opacity
- [ ] Tooltip appears at ~150ms
- [ ] Start button icon scales correctly (36px)
- [ ] Custom start icon replacement works (BitmapImage & DrawingImage)
- [ ] High DPI (125%, 150%, 200%) renders cleanly
- [ ] Window thumbnails show on hover (if enabled)
- [ ] No XAML parse errors

## Submitting Changes

1. Fork the repository
2. Create a feature branch: `git checkout -b feature/your-change`
3. Make changes with clear commit messages
4. Test thoroughly (see checklist above)
5. Submit a Pull Request with:
   - Description of changes
   - Screenshots if visual changes
   - Testing notes

## Code Style

- 4-space indentation
- Self-closing tags where appropriate
- Align attributes for readability
- Group related setters together
- Comment orientation-specific triggers

## Questions?

Open an issue for discussion before major changes.