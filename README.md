# FlightGear Scenery Project: Hanoi Noibai Intl (VVNB)

Goal of this project is a redesign of the Hanoi Noibai International Airport (ICAO: VVNB).

The original FlightGear scenery has a few issues (e.g. overlapping runways) so I took this airport
as my first FlightGear Scenery project.

## Input

The scenery is based on the following data.

### Airport data

I created the airport data file ```data/apt.dat``` using the World-Editor (WED), which is the standard
X-Plane tool for airport layouting. I don't have any official data about the Noibai airport, so my work
is based on some airport charts and Google Maps images.

The airport data is processed by the TerraGear tool ```aptgen580``` (see script ```1-airport.bat```). 
The result are the following two folders in the work directory:

 - ```work/AirportArea```
 - ```work/AirportObj```
 

### Elevation data

I use SRTM-3 elevation data for the geo-location 21° N 105° E from usgs.gov. The data is located in 
```data/SRTM-3/N21E105.hgt```.

The elevation data needs to be processed once using the TerraGear tools ```hgtchop``` and ```terrafit```
(see script ```2-elevation.bat```). The result is located in ```work/SRTM-3```.

### Land-use data

Getting the land-use shapefiles was the most challenging part. 

I use the free shapefiles for Vietnam which are provided by [Geofabrik.de][geofabrik]. You can download
the shapefiles [here][shapes-vn]. These files are re-packaged for TerraGear and stored in ```data/shapefiles```.
Theses shapefiles are used for defining the different materials for the FlightGear scenery. This is done by 
the TerraGear tool ```ogr-decode``` (see script ```3-landuse.bat```). The result are the different material folders
```work/{material}``` for the materials EvergreenForest, Town, Urban, Road, Lake, Railroad, Stream...

### Landmass shapefiles

Unfortunately the Vietnam shapesfiles don't contain a layer for the default landmass - which results in 
an airport swimming in the middle of an ocean. I fixed it by downloading the global land polygons as shapes from 
[OpenStreetMapData][land-poly]. The problem is, that these shape contain the whole globe and the processing of it 
with ogr-decode takes up to 2 hours, which is too long for my airport development cycle. Therefore I decided to 
process the whole globe once and use only the tile that are required for my airport as input. This tile is now
located in the work directory for the FG material GrassCover (```work/GrassCover```).

## Output

The Flightgear Scenery is constructed from the processed airport data, the processed elevation data and the processed
land-use data. This is done by the TerraGear tool ```tg-construct``` (see the script ```4-scenery.bat```).

The result is located in the folder ```output/Terrain```.

For testing the scenery I use the directory ```output``` as custom scenery folder for FlightGear.



## Tools

I use the following tools:

 - WorldEditor (WED) - the official X-Plane scenery editor
 - TerraGear - the tool suite for creating the FG scenery.
 - QGIS - an editor for OSM data. I use it to view the shapefiles before processing them.
 




[geofabrik]: http://download.geofabrik.de/
[shapes-vn]: http://www.geofabrik.de/data/shapefiles.html
[land-poly]: http://openstreetmapdata.com/data/land-polygons
