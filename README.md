This uses the awesome automated [Raylib-Forever](https://github.com/Guevara-chan/Raylib-Forever)! bindings for nim.

It's meant to load early on pakemon hardware, and list the other things you can run (roms, pakemoin minigames, etc).


```sh
# run
nim compile --path=src --run --outdir:/tmp src/pakemon.nim

# compile for release
nim compile --path:src --opt:speed -d:release --outdir:/tmp src/pakemon.nim

# you can also cross-complie:
nim compile --path:src --opt:speed -d:release --os:Linux --cpu:arm --outdir:/tmp src/pakemon.nim
```

avaliable cpu:

i386, m68k, alpha, powerpc, powerpc64, powerpc64el, sparc, vm, hppa, ia64, amd64, mips, mipsel, arm, arm64, js, nimvm, avr, msp430, sparc64, mips64, mips64el, riscv32, riscv64, esp, wasm32

avalable os:

DOS, Windows, OS2, Linux, MorphOS, SkyOS, Solaris, Irix, NetBSD, FreeBSD, OpenBSD, DragonFly, CROSSOS, AIX, PalmOS, QNX, Amiga, Atari, Netware, MacOS, MacOSX, iOS, Haiku, Android, VxWorks, Genode, JS, NimVM, Standalone, NintendoSwitch, FreeRTOS, Any


## ideas

Use convention over config, like things just need to be in the right shape and it will work, and you configure by overiding things or add new dirs, or change scripts or whatever.

Here is the stucture I am thinking for games:

```
games/
  NES/
    run
    list
    icon.png
    roms/
      mario.png
      mario.nes
    ...
  SNES/
    run
    list
    icon.png
    roms/
      mario.png
      mario.smc
    ...
  Pakémon
    run
    list
    icon.png
    minigames/
      scanner_rpg/
        icon.png
        start
        assets/
          logo.png
          ...
````

`list` & `run` are just shell-scripts or programs. Write them in whatever language you want, return a newline-delimited list. An icon for a list goes in `icon.png` in the dir

where `list` looks something like this:

```
#!/bin/sh

ls roms/*.nes | sed 's/.nes//g' | sed 's/roms\///g'

```

and run will receive the thing you returned in list, as a single arg:

```
#!/bin/sh

retroarch -L /path/to/libretro/core.so "roms/$1.nes"
```

I will make some examples, at some point, so it should be easy to arrange your files in the correct order.


There are some nice icons [here](https://github.com/baxysquare/baxy-retroarch-themes/tree/master/bytheme/FlatUX/src/png/128)
