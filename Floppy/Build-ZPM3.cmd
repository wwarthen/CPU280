@echo off
setlocal

copy ZPM3-Blank.img ZPM3-Master.img
copy ZPM3-Master.txt ZPM3-Files\u0\readme.txt

copy ..\ZCCP\ccp.com ZPM3-Files\u0\
copy ..\ZCCP\loadseg.com ZPM3-Files\u15\
copy ..\ZCCP\zinstal.zpm ZPM3-Files\u0\
copy ..\ZCCP\diskinfo.com ZPM3-Files\u15\
copy ..\ZCCP\rsxdir.com ZPM3-Files\u15\

copy ..\ZPM3\cpm3.sys ZPM3-Files\u0\
copy ..\ZPM3\autotog.com ZPM3-Files\u15\
copy ..\ZPM3\clrhist.com ZPM3-Files\u15\
copy ..\ZPM3\setz3.com ZPM3-Files\u15\

copy ..\FORMAT\format-e.com ZPM3-Files\u15\format.com
copy ..\FORMAT\format.dat ZPM3-Files\u15\

copy ..\IDETEST\idetest.com ZPM3-Files\u15\idetest.com

for /d %%u in (0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15) do ^
if exist ZPM3-Files\u%%u\*.* ^
..\Tools\cpmtools\cpmcp -f p112 ZPM3-Master.img ZPM3-Files/u%%u/*.* %%u:
