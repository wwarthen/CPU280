@echo off
setlocal

if exist options.mac del options.mac

if exist *.sys del *.sys
if exist *.prn del *.prn

if exist loader.rel del loader.rel
if exist lkernel.rel del lkernel.rel
if exist lintrpt.rel del lintrpt.rel
if exist ldiskio.rel del ldiskio.rel
if exist lhalbl.rel del lhalbl.rel
if exist lhard.rel del lhard.rel
if exist lchario.rel del lchario.rel
if exist setup.rel del setup.rel

if exist kernel.rel del kernel.rel
if exist intrpt.rel del intrpt.rel
if exist boot.rel del boot.rel
if exist clock.rel del clock.rel
if exist chario.rel del chario.rel
if exist diskio.rel del diskio.rel
if exist halbl.rel del halbl.rel
if exist hard.rel del hard.rel
if exist form.rel del form.rel
if exist scb.rel del scb.rel

if exist loader.cim del loader.cim
if exist loader.sym del loader.sym
if exist bnkbios3.spr del bnkbios3.spr
if exist bnkbios3.sym del bnkbios3.sym
if exist system.epr del system.epr
if exist system.evn del system.evn
if exist system.odd del system.odd
