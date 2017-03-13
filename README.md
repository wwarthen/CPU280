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

There are 4 directories in the respository:

- **SYSTEM:** contains both the ROM firmware and the CP/M Plus OS adaptation
- **FORMAT:** contains a custom floppy disk formatting tool for the CPU280
- **ZPM3:** contains the ZPM OS adaptation
- **ZCCP:** contains the ZCCP Command Processor that pairs with ZPM3

## Additional Information

The best source of information for this project is the RetroBrew Computers Community Forum which can be found
at http://www.retrobrewcomputers.org/forum/
