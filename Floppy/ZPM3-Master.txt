
*** ZPM3 Master Disk for CPU280 ***

This is a basic ZPM 3 system disk.  It is similar to a CP/M 3
System Disk, but the system files have been replaced with
ZPM and ZCCP.  A few key Z3 utilities have been included.
All of the DRI CP/M 3 files are still included as well.

Notes:

- The "Boot Drive" and "Drive Search Order" settings in the CPU280 ROM
  setup are not honored by ZPM/ZCCP.  The boot drive you specify
  in the CPU280 ROM setup will be used to load ZPM/ZCCP, but they
  will fail to load properly if they are not loaded from drive A.
  It is possible to work around this, but it takes explicit hand tuning
  of your system that is beyond the scope of this document.

- Unlike CP/M, it is conventional with ZCCP to place files into
  distinct user areas based on their function.  Executable programs
  are placed in user area 15.  You do not need to switch to user area 15
  to run programs.  ZCCP uses a search path to find them.  Help files
  are placed in user area 10 and configuration files are placed in
  user area 14.

- The 1.44MB format works much faster with a physical interleave of 2:1.
  FORMAT.COM format #63 will do this automatically if you format the disk
  using the CPU280.  If you format the disk with Windows/DOS, you are
  probably getting 1:1 interleave which is sub-optimal.  Ideally, you 
  should format the disk using the CPU280 using format #63, then write
  the image to it using RawWrite or dd via Windows/Linux.

- The original v1.13 ROM Boot Loader has a bug that prevents booting 
  directly from floppy disks.  The RetroBrew Computers releases 
  correct this bug and should allow booting directly from the disk.
 
Contents:

  - ZPM/ZCCP boot files.  Note that the files are named the same
    as their CP/M 3 coutnerparts, but the contents are completely
    different.  It is necessary to use the same names so that the
    ROM boot loader will load them properly.

	ccp.com		ZCCP Command Processor
	cpm3.sys	ZPM Disk Operating System
	
  - ZPM/ZCCP are distributed with a few tools.  These are:

	autotog.com	Toggle ZPM auto command prompting
	clrhist.com	Clear command history buffer
	setz3.com	Set env address in ZPM SCB for Z3Plus
	loadseg.com	Loader for named directories and termcaps
	zinstal.com	Segment containing environment information
	diskinfo.com	Disk information display utility
	rsxdir.com	Displays RSXes in memory

  - ZPM/ZCCP will run most Z System programs.  Unlike CP/M, Z System
    tools and programs are mostly community developed, so there is
    not really a "standard" suite of programs.  The following
    selected set of Z System programs has been included:

	arunz.com	Extended command processor with command aliases
	zerase.com	Enhanced file erase utility
	mkdir.com	Named directory management tool
	salias.com	Batch command processor
	setpath.com	Search path management tool
	zshow.com	Environment display tool
	verror.com	Error handler allowing command line editting
	vlu.com		Visual library management utility
	if.com		Conditional command processor
	zcnfg.com	Program configurator
	zex.com		Sophisticated batch command language
	zp.com		File patching tool
	zhelp.com	Z3 Help display tool
	zfiler.com	File management shell

    Some of the programs above can be customized using a command like:

        zcnfg root:zfiler

    Some programs have online help available which can be accessed
    by simply typing the command "zhelp".  The command zhelp is used
    to distinguish the Z System help system from the CP/M help system.

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

    Note that the CP/M Plus programs are not aware of the Z System
    enhancements.  So, for example, attempting to specify a file
    with the Z system DU: syntax (i.e.: erase A0:readme.txt)
    will not be recognized

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