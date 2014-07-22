# Nexus
A Processing sketch inspired by Android's Nexus Live Wallpaper.

![First screenshot of Nexus](https://github.com/adjl/Nexus/raw/master/img/screenshot0.png)

## Controls
`p` - Pause/resume the sketch  
`q` - Quit

Like with the Wallpaper, "touching" (clicking on) the screen fires four beams from the point of contact.

`left-click` - Fire beams

![Second screenshot of Nexus](https://github.com/adjl/Nexus/raw/master/img/screenshot1.png)

## Settings
Modify the following in [`Nexus.pde`](https://github.com/adjl/Nexus/raw/master/Nexus.pde) to your preferences:
- `WIDTH` (default: 1366)
- `HEIGHT` (default: 768)
- `BEAM_CHANCE_OF_FIRING` (default: 20)
  - 1 in 20
- `COLOURS_COUNT` (default: 4)
  - Number of colours
- `BEAM_MAX_LENGTH` (default: 25.0)
- `COLOURS` (default: red, green, blue, yellow)

## Note
The sketch does not seem to register the cursor location when it first runs.
The cursor is initially thought of to be at (0, 0), so left-clicking, without moving the cursor, fires two beams from the top-left corner of the screen.
This is fixed by just simply moving the cursor before clicking.

## License
[MIT License](https://github.com/adjl/Nexus/raw/master/LICENSE)
