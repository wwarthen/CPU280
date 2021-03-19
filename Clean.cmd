@echo off
setlocal

setlocal & cd Floppy && call Clean.cmd & endlocal
setlocal & cd ZPM3 && call Clean.cmd & endlocal
setlocal & cd SYSTEM && call Clean.cmd & endlocal
setlocal & cd IDETEST && call Clean.cmd & endlocal
setlocal & cd FORMAT && call Clean.cmd & endlocal
