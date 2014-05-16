# Nexus
A Processing sketch inspired by Android's Nexus Live Wallpaper.

![First screenshot of Nexus](https://github.com/adeijosol/Nexus/raw/master/img/screenshot1.png)

## Controls
`p` - Pause/resume the sketch  
`q` - Quit

Like with the Wallpaper, "touching" (clicking on) the screen fires four beams from the point of contact.

`left-click` - Fire beams

![Second screenshot of Nexus](https://github.com/adjl/Nexus/raw/master/img/screenshot2.png)

## Settings
There are a number of settings you can change to your tastes (and to obtain interesting effects):
- [`Nexus.pde`](https://github.com/adjl/Nexus/raw/master/Nexus.pde)
  - `screenWidth` (default: 1366)
  - `screenHeight` (default: 768)
- [`NexusBeams.pde`](https://github.com/adjl/Nexus/raw/master/NexusBeams.pde)
  - `chanceOfFiring` (default: 20)
- [`Beam.pde`](https://github.com/adjl/Nexus/raw/master/Beam.pde)
  - `maxLength` (default: 25)
  - `colours` (default: red, green, blue, yellow)
- [`Distance.java`](https://github.com/adjl/Nexus/raw/master/Distance.java) (defaults vary)
  - `size`
  - `speed`
  - `opacity`

## Note
The sketch does not seem to register the cursor location when it first runs.
The cursor is initially thought of to be at (0, 0), so left-clicking, without moving the cursor, fires two beams from the top-left corner of the screen.
This is fixed by just simply moving the cursor before clicking.

## License
[MIT License](https://github.com/adjl/Nexus/raw/master/LICENSE)
