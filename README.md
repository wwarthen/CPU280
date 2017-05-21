# CPU280 System Software

## Background

In the early 1990's, Tilmann Reh designed and produced a small number of single-board computers based on the Zilog Z280 CPU chip.
The Z280 CPU was a significant successor to the populate Zilog Z80 CPU.  However, the Z280 was never incorporated into any
commercially producted computer.  The CPU280 System represents the only known functional implementation of this CPU.

In 2016, Lamar Owens had a small new run of the CPU280 system PCB's created and is working with the RetroBrew Computers community
(see http://www.retrobrewcomputers.org) to recreate this historically interesting system.  The new PCBs have proven to be fully
functional.  This repository has been created to function as a central, version-controled location for ongoing development of
the system software supporting the CPU280 computer.

The system software is built upon Digital Research CP/M Plus.  Additionally, an adaptation of ZPM/ZCCP is also included.
ZPM/ZCCP is an operating system created by Simeon Cran that provides compatibility with both CP/M Plus and ZCPR3.

## Repository Contents

The contents of the repository are organized into the following directories:

| Directory | Description |
| --- | --- |
| **SYSTEM** | contains both the ROM firmware and the CP/M Plus OS adaptation |
| **FORMAT** | contains a custom floppy disk formatting tool for the CPU280 |
| **ZPM3** | contains the ZPM OS adaptation |
| **ZCCP** | contains the ZCCP Command Processor that pairs with ZPM3 |
| **Tools** | contains assorted programs used to build the software via Windows command line |
| **Floppy** | contains scripts and files to create bootable floppy images |

## Build Process

The build process currently assumes a Microsoft Windows environment (either 32 or 64 bit Windows).  It is entirely
possible to build under Linux (some people have done this), but will require adapting the build scripts.

In general, the software and firmware is built by opening a command prompt and issuing the command "Build"
in each of the following directories.  The build process has depencies, so it is necessary to follow the
specified order.  Some directories also have ReadMe.txt files that provide additional information.

To build the firmware and software, run the "Build" command in these directories in the order listed:

1. **FORMAT:** Creates the format.com program.  This build utilizes Turbo Pascal and requires manual
intervention -- see ReadMe.txt for more information.
2. **SYSTEM:** Creates the ROM firmware for system booting and includes a ROM-based version of CP/M Plus.
The files system.odd and system.evn are produced in this step which are the odd and even portions
of the ROM firmware.  This step also produces the cpm3.sys program for inclusion on floppy boot disks.
3. **ZPM3:** Creates the ZPM/ZCCP variant of the system.  It produces versions of system.odd and system.evn
that can be used as system ROM firmware if you want to boot ZPM/ZCCP from ROM.  This step also produces
a variant of cpm3.sys which contains ZPM for inclusion on boot floppy disks.
4. **Floppy:** Creates boot floppy images.  Two floppy images are created: 1) CP/M Plus, and 2) ZPM/ZCCP.
Both images are bootable and can be written to a standard IBM 1.44MB formatted floppy disk with a tool
such as RawWrite for Windows.

## Additional Information

The best source of information for this project is the RetroBrew Computers Community Forum which can be found
at http://www.retrobrewcomputers.org/forum/
