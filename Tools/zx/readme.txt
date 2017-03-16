ZX Command

An adaptation of zxcc-0.5.6 by Wayne Warthen

To build under Open Watcom or Microsoft Visual C++, use the following command:

  cl /Fe"zx.exe" zx.c cpmdrv.c cpmglob.c cpmparse.c cpmredir.c drdos.c util.c xlt.c zxbdos.c zxcbdos.c zxdbdos.c z80.c dirent.c

To build a debug version, use the following command:

  cl /DDEBUG /Fe"zxdbg.exe" zx.c cpmdrv.c cpmglob.c cpmparse.c cpmredir.c drdos.c util.c xlt.c zxbdos.c zxcbdos.c zxdbdos.c z80.c dirent.c

December 5, 2014

This directory contains the source files used to build the "zx" tool.  This tool
is essentially just John Elliott's zxcc package version zxcc-0.5.6 modified to
build under Microsoft Visual C and simplified down to just a single command (zx)
which is essentially just the zxcc command.

After struggling to get the entire zxcc package to build nicely using autoconf,
I finally gave up and took a much more direct approach.  I have extracted just
the source files needed and created a simple batch file to build the tool.  I
realize this could be done much better, but I cheated in the interest of time.

The one "real" change I made in the source code was that I modified the tool
to look for bios.bin in the same directory as the executable is in.  This
just makes it much easier to set up (for me, anyway).

The GPL status of everything remains in place and carries forward.

Wayne Warthen
wwarthen@gmail.com

March 15, 2017

- Updated to compile under Open Watcom.
- Implemented BDOS console status function.
- Set stdin and stdout to binary mode at startup.

Wayne Warthen
wwarthen@gmail.com