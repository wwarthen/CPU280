@echo off
setlocal

set TOOLS=../Tools

set PATH=%TOOLS%/zx;%PATH%

set ZXBINDIR=%TOOLS%/cpm/
set ZXLIBDIR=%TOOLS%/cpm/
set ZXINCDIR=%TOOLS%/cpm/

copy ..\ZCCP\ccp.com .
copy ..\SYSTEM\gencpm.dat .
copy ..\SYSTEM\bnkbios3.spr .
copy ..\SYSTEM\loader.cim .

echo Generating ZPM3 System "cpm3.sys" ...
echo.
zx gencpm -auto -display

echo Generating composite ROM image "system.epr" ...
echo.
zx genepr

echo Splitting ROM image into "system.evn" and "system.odd" ...
echo.
zx split16 system.epr
