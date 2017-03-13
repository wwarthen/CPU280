@echo off
setlocal

set TOOLS=../Tools

set PATH=%TOOLS%/zx;%PATH%

set ZXBINDIR=%TOOLS%/cpm/
set ZXLIBDIR=%TOOLS%/cpm/
set ZXINCDIR=%TOOLS%/cpm/

copy loader.mac options.mac

echo Assembling "loader" ...
echo.
zx pre280 --O loader.180 loader
zx slr180 -loader/ruf

echo Assembling "kernel" ...
echo.
zx pre280 --O lkernel.180 kernel
zx slr180 -lkernel/ruf

echo Assembling "intrpt" ...
echo.
zx pre280 --O lintrpt.180 intrpt
zx slr180 -lintrpt/ruf

echo Assembling "diskio" ...
echo.
zx pre280 --O ldiskio.180 diskio
zx slr180 -ldiskio/ruf

echo Assembling "halbl" ...
echo.
zx pre280 --O lhalbl.180 halbl
zx slr180 -lhalbl/ruf

echo Assembling "hard" ...
echo.
zx pre280 --O lhard.180 hard
zx slr180 -lhard/ruf

echo Assembling "chario" ...
echo.
zx pre280 --O lchario.180 chario
zx slr180 -lchario/ruf

echo Assembling "setup" ...
echo.
zx pre280 --O setup.180 setup
zx slr180 -setup/ruf

echo Generating (linking) "loader.cim" ...
echo.
zx slrnk -/v,/a:0,loader/n/y,loader,lkernel,lintrpt,ldiskio,lhalbl,lhard,lchario,setup,ldos,/e

copy system.mac options.mac

echo Assembling "kernel" ...
echo.
zx pre280 --O kernel.180 kernel
zx slr180 -kernel/muf

echo Assembling "intrpt" ...
echo.
zx pre280 --O intrpt.180 intrpt
zx slr180 -intrpt/muf

echo Assembling "boot" ...
echo.
zx pre280 --O boot.180 boot
zx slr180 -boot/muf

echo Assembling "clock" ...
echo.
zx pre280 --O clock.180 clock
zx slr180 -clock/muf

echo Assembling "chario" ...
echo.
zx pre280 --O chario.180 chario
zx slr180 -chario/muf

echo Assembling "diskio" ...
echo.
zx pre280 --O diskio.180 diskio
zx slr180 -diskio/muf

echo Assembling "halbl" ...
echo.
zx pre280 --O halbl.180 halbl
zx slr180 -halbl/muf

echo Assembling "hard" ...
echo.
zx pre280 --O hard.180 hard
zx slr180 -hard/muf

echo Assembling "form" ...
echo.
zx pre280 --O form.180 form
zx slr180 -form/muf

echo Assembling "scb" ...
echo.
zx pre280 --O scb.180 scb
zx slr180 -scb/muf

echo Generating (linking) "bnkbios3.spr" ...
echo.
zx link -bnkbios3[b]=kernel,intrpt,boot,clock,chario,diskio,halbl,hard,form,scb

echo Generating CP/M System "cpm3.sys" ...
echo.
zx gencpm -auto -display

echo Generating composite ROM image "system.epr" ...
echo.
zx genepr

echo Splitting ROM image into "system.evn" and "system.odd" ...
echo.
zx split16 system.epr