@echo off
REM === Directories ===

set TG_HOME=C:\Work\FlightGear\Tools\TerraGear

set PROJECT_DIR=C:\Work\FlightGear\Scenery\VVNB_Hanoi_Noibai

set DATA_DIR=%PROJECT_DIR%\data
set WORK_DIR=%PROJECT_DIR%\work

set SRTM=SRTM-3

REM === Internals ===

set HTGCHOP=%TG_HOME%\bin\hgtchop.exe
set TERRAFIT=%TG_HOME%\bin\terrafit.exe

set INPUT_DIR=%DATA_DIR%\%SRTM%
set OUTPUT_DIR=%WORK_DIR%\%SRTM%

REM === Execution ===

rmdir /S "%OUTPUT_DIR%"

for %%f in (%INPUT_DIR%\*.hgt) do %HTGCHOP% 3 %%f %OUTPUT_DIR%

%TERRAFIT% %OUTPUT_DIR%

pause;