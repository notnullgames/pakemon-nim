.PHONY: help

help: ## Show this help message.
	@echo 'Usage: make [target]'
	@echo
	@echo 'Targets:'
	@echo
	@egrep '^(.+)\:\ ##\ (.+)' ${MAKEFILE_LIST} | column -t -c 2 -s ':#'

run: ## Run pakemon
	nim compile --path=src --run --outdir=/tmp src/pakemon.nim

linux-arm: ## Build release for Linux arm32 (old pi)
	nim compile --path=src --opt=speed -d=release --os=Linux --cpu=arm --outdir=build src/pakemon.nim

linux-arm64: ## Build release for Linux arm64 (recent pi)
	nim compile --path=src --opt=speed -d=release --os=Linux --cpu=arm64 --outdir=build src/pakemon.nim

linux-x86: ## Build release for Linux x86_64
	nim compile --path=src --opt=speed -d=release --os=Linux --cpu=amd64 --outdir=build src/pakemon.nim

windows: ## Build release for Windows x86_64
	nim compile --path=src --opt=speed -d=release --os=Linux --cpu=amd64 --outdir=build src/pakemon.nim

mac-arm64: ## Build release for Mac M1
	nim compile --path=src --opt=speed -d=release --os=MacOSX --cpu=arm64 --outdir=build src/pakemon.nim

mac-x86: ## Build release for x86_64
	nim compile --path=src --opt=speed -d=release --os=MacOSX --cpu=amd64 --outdir=build src/pakemon.nim

# avaliable cpu:
# i386, m68k, alpha, powerpc, powerpc64, powerpc64el, sparc, vm, hppa, ia64, amd64, mips, mipsel, arm, arm64, js, nimvm, avr, msp430, sparc64, mips64, mips64el, riscv32, riscv64, esp, wasm32

# avalable os:
# DOS, Windows, OS2, Linux, MorphOS, SkyOS, Solaris, Irix, NetBSD, FreeBSD, OpenBSD, DragonFly, CROSSOS, AIX, PalmOS, QNX, Amiga, Atari, Netware, MacOS, MacOSX, iOS, Haiku, Android, VxWorks, Genode, JS, NimVM, Standalone, NintendoSwitch, FreeRTOS, Any
