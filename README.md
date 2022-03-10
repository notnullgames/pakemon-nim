This uses the awesome automated [Raylib-Forever](https://github.com/Guevara-chan/Raylib-Forever)! bindings for nim.

```sh
# run
nim compile --path=src --path=src/lib --run --outdir:/tmp src/pakemon.nim

# compile for release
nim compile --path:src --path:src/lib --opt:speed -d:release --outdir:/tmp src/pakemon.nim

# you can also cross-complie:
nim compile --path:src --path:src/lib --opt:speed -d:release --os:Linux --cpu:arm --outdir:/tmp src/pakemon.nim
```

avaliable cpu:

i386, m68k, alpha, powerpc, powerpc64, powerpc64el, sparc, vm, hppa, ia64, amd64, mips, mipsel, arm, arm64, js, nimvm, avr, msp430, sparc64, mips64, mips64el, riscv32, riscv64, esp, wasm32

avalable os:

DOS, Windows, OS2, Linux, MorphOS, SkyOS, Solaris, Irix, NetBSD, FreeBSD, OpenBSD, DragonFly, CROSSOS, AIX, PalmOS, QNX, Amiga, Atari, Netware, MacOS, MacOSX, iOS, Haiku, Android, VxWorks, Genode, JS, NimVM, Standalone, NintendoSwitch, FreeRTOS, Any