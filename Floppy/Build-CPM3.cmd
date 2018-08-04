@echo off
setlocal

copy CPM3-Blank.img CPM3-Master.img
copy CPM3-Master.txt CPM3-Files\u0\readme.txt

copy ..\SYSTEM\ccp.com CPM3-Files\u0\
copy ..\SYSTEM\cpm3.sys CPM3-Files\u0\


copy ..\FORMAT\format-e.com ZPM3-Files\u15\format.com
copy ..\FORMAT\format.dat ZPM3-Files\u15\

copy ..\IDETEST\idetest.com ZPM3-Files\u15\idetest.com

for /d %%u in (0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15) do ^
if exist CPM3-Files\u%%u\*.* ^
..\Tools\cpmtools\cpmcp -f p112 CPM3-Master.img CPM3-Files/u%%u/*.* %%u:
