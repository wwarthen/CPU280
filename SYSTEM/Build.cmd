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
zx zsm4 -=loader.280/u/l

echo Assembling "kernel" ...
echo.
zx zsm4 -lkernel,lkernel=kernel.280/u

echo Assembling "intrpt" ...
echo.
zx zsm4 -lintrpt,lintrpt=intrpt.280/u

echo Assembling "diskio" ...
echo.
zx zsm4 -ldiskio,ldiskio=diskio.280/u

echo Assembling "halbl" ...
echo.
zx zsm4 -lhalbl,lhlbl=halbl.280/u

echo Assembling "hard" ...
echo.
zx zsm4 -lhard,lhard=hard.280/u

echo Assembling "chario" ...
echo.
zx zsm4 -lchario,lchario=chario.280/u

echo Assembling "setup" ...
echo.
zx zsm4 -=setup.280/u/l

echo Assembline "ldos" ...
echo.
zx zsm4 -=ldos.180/u/l

echo Generating (linking) "loader.cim" ...
echo.
zx link -loader.cim[L0,OC]=loader,lkernel,lintrpt,ldiskio,lhalbl,lhard,lchario,setup,ldos

copy system.mac options.mac

echo Assembling "kernel" ...
echo.
zx zsm4 -=kernel.280/u/l

echo Assembling "intrpt" ...
echo.
zx zsm4 -=intrpt.280/u/l

echo Assembling "boot" ...
echo.
zx zsm4 -=boot.280/u/l

echo Assembling "clock" ...
echo.
zx zsm4 -=clock.280/u/l

echo Assembling "chario" ...
echo.
zx zsm4 -=chario.280/u/l

echo Assembling "diskio" ...
echo.
zx zsm4 -=diskio.280/u/l

echo Assembling "halbl" ...
echo.
zx zsm4 -=halbl.280/u/l

echo Assembling "hard" ...
echo.
zx zsm4 -=hard.280/u/l

echo Assembling "form" ...
echo.
zx zsm4 -=form.280/u/l

echo Assembling "scb" ...
echo.
zx zsm4 -=scb.280/u/l

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
