#!/bin/bash

set -e

cp loader.mac options.mac

zxcc ../Tools/cpm/pre280 --O loader.180 loader
zxcc ../Tools/cpm/slr180 -loader/ruf
zxcc ../Tools/cpm/pre280 --O lkernel.180 kernel
zxcc ../Tools/cpm/slr180 -lkernel/ruf
zxcc ../Tools/cpm/pre280 --O lintrpt.180 intrpt
zxcc ../Tools/cpm/slr180 -lintrpt/ruf
zxcc ../Tools/cpm/pre280 --O ldiskio.180 diskio
zxcc ../Tools/cpm/slr180 -ldiskio/ruf
zxcc ../Tools/cpm/pre280 --O lhalbl.180 halbl
zxcc ../Tools/cpm/slr180 -lhalbl/ruf
zxcc ../Tools/cpm/pre280 --O lhard.180 hard
zxcc ../Tools/cpm/slr180 -lhard/ruf
zxcc ../Tools/cpm/pre280 --O lchario.180 chario
zxcc ../Tools/cpm/slr180 -lchario/ruf
zxcc ../Tools/cpm/pre280 --O setup.180 setup
zxcc ../Tools/cpm/slr180 -setup/ruf

# WRS: SRLNK exits with code 1 on success?
zxcc ../Tools/cpm/slrnk -/v,/a:0,loader/n/y,loader,lkernel,lintrpt,ldiskio,lhalbl,lhard,lchario,setup,ldos,/e || retcode=$?
if [ $retcode -ne 1 ]; then
    echo "slrnk exited with code $retcode"
    exit 1
fi

cp system.mac options.mac
zxcc ../Tools/cpm/pre280 --O kernel.180 kernel
zxcc ../Tools/cpm/slr180 -kernel/muf
zxcc ../Tools/cpm/pre280 --O intrpt.180 intrpt
zxcc ../Tools/cpm/slr180 -intrpt/muf
zxcc ../Tools/cpm/pre280 --O boot.180 boot
zxcc ../Tools/cpm/slr180 -boot/muf
zxcc ../Tools/cpm/pre280 --O clock.180 clock
zxcc ../Tools/cpm/slr180 -clock/muf
zxcc ../Tools/cpm/pre280 --O chario.180 chario
zxcc ../Tools/cpm/slr180 -chario/muf
zxcc ../Tools/cpm/pre280 --O diskio.180 diskio
zxcc ../Tools/cpm/slr180 -diskio/muf
zxcc ../Tools/cpm/pre280 --O halbl.180 halbl
zxcc ../Tools/cpm/slr180 -halbl/muf
zxcc ../Tools/cpm/pre280 --O hard.180 hard
zxcc ../Tools/cpm/slr180 -hard/muf
zxcc ../Tools/cpm/pre280 --O form.180 form
zxcc ../Tools/cpm/slr180 -form/muf
zxcc ../Tools/cpm/pre280 --O scb.180 scb
zxcc ../Tools/cpm/slr180 -scb/muf
zxcc ../Tools/cpm/link -bnkbios3[b]=kernel,intrpt,boot,clock,chario,diskio,halbl,hard,form,scb

zxcc ../Tools/cpm/gencpm -auto -display
zxcc ../Tools/cpm/genepr
zxcc ../Tools/cpm/split16 system.epr
