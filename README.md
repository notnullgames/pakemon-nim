Very light & simple game-menu for loading ROMs and minigames, on a pi with a controller, from a simple menu. Eventually this will probly replace [pakemon](https://github.com/notnullgames/pakemon).

![demo](./demo.gif)

This uses the awesome automated [Raylib-Forever](https://github.com/Guevara-chan/Raylib-Forever)! bindings for nim.

It's meant to load early on pakemon hardware, and list the other things you can run (roms, pakemon minigames, etc).


```
Usage: make [target] ...

Targets:

help             Show this help message.
run              Run pakemon
linux-arm        Build release for Linux arm32 (old pi)
linux-arm64      Build release for Linux arm64 (recent pi)
linux-x86        Build release for Linux x86_64
windows          Build release for Windows x86_64
mac-arm64        Build release for Mac M1
mac-x86          Build release for x86_64
```

## roms

The idea is to use convention/code over config, like things just need to be in the right shape and it will work, and you configure by overriding things or add new dirs.

File Structure:

```
games/
  NES/
    icon.png
    roms/
      mario.nes
    ...
  SNES/
    icon.png
    roms/
      mario.smc
    ...
  Pakémon
    icon.png
    roms/
      Scanner RPG/
        icon.png
        start
````

There are some nice system icons [here](https://github.com/baxysquare/baxy-retroarch-themes/tree/master/bytheme/FlatUX/src/png/128) if you want to match the example ones I am using.

You can modify `games/list` and `games/run` to customize how it works.

## TODO

- [use direct libretro bindings](https://github.com/RobLoach/raylib-libretro/blob/master/example/raylib-libretro-basic.c)
- down't choose core by extension (in run) use smarter libretro kind of solution to make it more automtic
- make a kind of homebrew store that can download pakemon minigames, homebrew, and other stuff.

