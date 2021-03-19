@echo off
setlocal

setlocal & cd FORMAT && call Build || exit /b 1 & endlocal
setlocal & cd IDETEST && call Build || exit /b 1 & endlocal
setlocal & cd SYSTEM && call Build || exit /b 1 & endlocal
setlocal & cd ZPM3 && call Build || exit /b 1 & endlocal
setlocal & cd Floppy && call Build || exit /b 1 & endlocal
