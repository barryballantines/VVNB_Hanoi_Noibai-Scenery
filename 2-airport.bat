@echo off

REM === Directories ===

set TG_HOME=C:\Work\FlightGear\Tools\TerraGear

set PROJECT_DIR=C:\Work\FlightGear\Scenery\VVNB_Hanoi_Noibai

set WED_PROJECT_DIR=C:\Work\FlightGear\Airports\Custom Scenery\VVNB Hanoi Noibai

set WORK_DIR=%PROJECT_DIR%\work

set DATA_DIR=%PROJECT_DIR%\data

REM === Input ===

set AIRPORT_DAT=%WED_PROJECT_DIR%\Earth nav data\apt.dat

set DEM_PATH=SRTM-3

  
REM === Internals ===

set GENAPTS850=%TG_HOME%\bin\genapts850.exe

REM === Execution ===

rmdir /S "%WORK_DIR%\AirportArea"
rmdir /S "%WORK_DIR%\AirportObj"

copy "%AIRPORT_DAT%" "%DATA_DIR%\airports"

%GENAPTS850% --input=%DATA_DIR%\airports\apt.dat --work=%WORK_DIR% --dem-path=%DEM_PATH%

pause