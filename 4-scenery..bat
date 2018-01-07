@echo off
REM === Directories ===

set TG_HOME=C:/Work/FlightGear/Tools/TerraGear

set PROJECT_DIR=C:/Work/FlightGear/Scenery/VVNB_Hanoi_Noibai

set WORK_DIR=%PROJECT_DIR%/work

set OUTPUT_DIR=%PROJECT_DIR%/output/Terrain

REM === Area ===

set AREA=--min-lat=21.18 --max-lat=21.26 --min-lon=105.72 --max-lon=105.87

REM === Input ===

set INPUT=AirportArea AirportObj SRTM-3 GrassCover EvergreenForest Lake Stream Railroad Road Town Urban

  
  
REM === Internals ===

set TG_CONSTRUCT=%TG_HOME%\bin\tg-construct.exe

set ARGS=--priorities=%TG_HOME%\share\TerraGear\default_priorities.txt
set ARGS=%ARGS% --usgs-map=%TG_HOME%\share\TerraGear\usgsmap.txt
set ARGS=%ARGS% --threads
set ARGS=%ARGS% --work-dir=%WORK_DIR%
set ARGS=%ARGS% --output-dir=%OUTPUT_DIR%
set ARGS=%ARGS% %AREA%
set ARGS=%ARGS% %INPUT%

REM === Execution ===

rmdir /S "%OUTPUT_DIR%"

@echo Constructing scenery from: %INPUT%...

%TG_CONSTRUCT% %ARGS%

@echo Finished!

pause