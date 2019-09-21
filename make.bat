@echo off
setlocal

set "_ROM_IN=input.gba"
set "_ROM_OUT=output.gba"

for %%f in ("%_ROM_OUT%") do (
	set "_ROM_OUT_BASE=%%~nf"
)

title Building...

mkdir "_rom" 2> nul
armips.exe "src.asm" -sym "_rom\%_ROM_OUT_BASE%.sym" -erroronwarning -strequ ROM_IN "_rom\%_ROM_IN%" -strequ ROM_OUT "_rom\%_ROM_OUT%" || goto :error

:done
echo.
echo %_ROM_OUT% built successfully.
title %comspec%
exit /b 0

:error
echo.
echo An error occurred, ROM could not be built.
title %comspec%
pause
exit /b 1