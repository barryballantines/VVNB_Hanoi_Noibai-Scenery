@echo off
REM === Directories ===

set TG_HOME=C:/Work/FlightGear/Tools/TerraGear

set PROJECT_DIR=C:/Work/FlightGear/Scenery/VVNB_Hanoi_Noibai

set DATA_DIR=%PROJECT_DIR%/data
set WORK_DIR=%PROJECT_DIR%/work

REM === Internals ===

set OGR_DECODE=%TG_HOME%/bin/ogr-decode

set DEFAULT_ARGS=--line-width 10 --point-width 10 --continue-on-errors --all-threads

REM === Execution ===
 
REM call :decode GrassCover      osm_landuse_a_free
REM call :decode Urban           osm_buildings_a_free
REM call :decode EvergreenForest osm_natural_a_free
REM call :decode Urban           osm_places_a_free
REM call :decode Urban           osm_places_free
REM call :decode Town            osm_pofw_a_free
REM call :decode Town            osm_pofw_free
REM call :decode Railroad        osm_railways_free
REM call :decode Road            osm_roads_free
REM call :decode Road            osm_traffic_a_free
REM call :decode Road            osm_traffic_free
REM call :decode Road            osm_transport_a_free
REM call :decode Road            osm_transport_free
REM call :decode Lake            osm_water_a_free
REM call :decode Stream          osm_waterways_a_free

call :decode Stream          osm_waterways_a_free
call :decode GrassCover      osm_landuse_a_free

@echo Finished!

pause;

REM === Functions ===

:decode

@echo Decoding shapefile %2 to material %1...

%OGR_DECODE% %DEFAULT_ARGS% --area-type %1 %WORK_DIR%/%1 %DATA_DIR%/shapefiles/%2

@echo Done.

exit /B 0

