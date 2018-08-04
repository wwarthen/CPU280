ZSM=../Tools/cpm/zsm4

cp loader.mac options.mac

echo "Assembling loader..."
zxcc $ZSM -"=loader.280/l/u"

echo "Assembling kernel..."
zxcc $ZSM -"lkernel,lkernel=kernel.280/u"

echo "Assembling intrpt..."
zxcc $ZSM -"lintrpt,lintrpt=intrpt.280/u"

echo "Assembling diskio..."
zxcc $ZSM -"ldiskio,ldiskio=diskio.280/u"

echo "Assembling halbl..."
zxcc $ZSM -"lhalbl,lhalbl=halbl.280/u"

echo "Assembling hard..."
zxcc $ZSM -"lhard,lhard=hard.280/u"

echo "Assembling chario..."
zxcc $ZSM -"lchario,lchario=chario.280/u"

echo "Assembling setup..."
zxcc $ZSM -"=setup.280/l/u"

echo "Generating (linking) loader.cim..."
zxcc drlink "loader.cim=loader,lkernel,lintrpt,ldiskio,lhalbl,lhard,lchario,setup,ldos[OC,L0]"

cp system.mac options.mac

echo "Assembling kernel..."
zxcc $ZSM -"=kernel.280/l/u"

echo "Assembling intrpt..."
zxcc $ZSM -"=intrpt.280/l/u"

echo "Assembling boot..."
zxcc $ZSM -"=boot.280/l/u"

echo "Assembling clock..."
zxcc $ZSM -"=clock.280/l/u"

echo "Assembling chario..."
zxcc $ZSM -"=chario.280/l/u"

echo "Assembling diskio..."
zxcc $ZSM -"=diskio.280/l/u"

echo "Assembling halbl..."
zxcc $ZSM -"=halbl.280/l/u"

echo "Assembling hard..."
zxcc $ZSM -"=hard.280/l/u"

echo "Assembling form..."
zxcc $ZSM -"=form.280/l/u"

echo "Assembling scb..."
zxcc $ZSM -"=scb.280/l/u"

echo "Generating (linking) bnkbios3.spr..."
zxcc drlink -"bnkbios3[b]=kernel,intrpt,boot,clock,chario,diskio,halbl,hard,form,scb"

echo "Generating CP/M System cpm3.sys..."
zxcc ../Tools/cpm/gencpm -auto -display

echo "Generating composite ROM image system.epr..."
zxcc ../Tools/cpm/genepr

echo "Splitting ROM image into system.evn and system.odd..."
zxcc ../Tools/cpm/split16 system.epr
