
*** CP/M Plus Master Disk for CPU280 ***

This is a basic CP/M Plus system disk.  It contains all of the
CP/M Plus files normally provided by Digital Research as well as
a few supplemental files to format disks, edit files, etc.

Notes:

- The 1.44MB format works much faster with a physical interleave of 2:1.
  FORMAT.COM format #63 will do this automatically if you format the disk
  using the CPU280.  If you format the disk with Windows/DOS, you are
  probably getting 1:1 interleave which is sub-optimal.  Ideally, you 
  should format the disk using the CPU280 using format #63, then write
  the image to it using RawWrite or dd via Windows/Linux.

- The original v1.13 ROM Boot Loader has a bug that prevents booting 
  directly from floppy disks.  The RetroBrew Computers releases 
  correct this bug and should allow booting directly from the disk.

- The "Boot Drive" and "Drive Search Order" settings in the CPU280
  ROM setup are propagated to CP/M 3 at boot.
 
Contents:

  - Standard CP/M Plus distribution files.  The HELP command 
    provides usage inforemation for these files.  Refer to CP/M 
    Plus User Manual for more information.

	copysys.com	date.com	device.com	dir.com
	dump.com	ed.com		erase.com	gencom.com
	get.com		help.com	help.hlp	hexcom.com
	initdir.com	lib.com		link.com	mac.com
	patch.com	pip.com		put.com		rename.com
	rmac.com	save.com	set.com		setdef.com
	show.com	sid.com		submit.com	type.com
	xref.com

  - CP/M Plus boot files allow CP/M to be booted off of this disk.

	ccp.com		Console command processor
	cpm3.sys	CP/M Plus system image

  - CPU280 specific utilities.

	dev.com		Device parameter management
	format.com	Format floppy disk in many supported formats
	format.dat	Floppy format definitions file for format.com

  - Third party utilities.

	du34.com	Read/write/modify low-level disk sector contents
	lbrext.com	Extract files from .lbr library archives
	mbasic.com	Microsoft BASIC programming language
	msdir.com	MS-DOS directory lister (German language)
	msdos.com	MS-DOS file copy utility (German language)
	msform.com	MS-DOS disk formatter (German language)
	nulu.com	Manage .lbr library archives
	zde.com		Full screen editor
	zsid.com	Variant of SID w/ support for Z80 mnemonics

2017/02/22 Changes:

- DEV.COM has been added.
- FORMAT.DAT has been updated with format #63 "P112 1.44 MB".  This 
  format allows the disk work on CPU280 and P112.

2017/02/24 Changes:

- Activated date/time stamping.  Added disk label "CPM3".

2017/02/28 Changes:

- Added MS-DOS tools (msdir.com, msdos.com, and msform.com).  These 
  tools are in German.