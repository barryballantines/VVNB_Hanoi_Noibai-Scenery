# FlightGear data for airports and navaids

The files in this folders contain information that needs to be added
to the FlightGear data files ```apt.dat.gz``` and ```nav.dat.gz```.

## Navaid data

FlightGear reads the data of navaids (NDB, VOR, DME, ILS, Locators, Markers) from 
a single file ```Navaids/nav.dat.gz``` located in the FG data folder. 

In order to update the Navaids of the VVNB airport, you need to replace the entries
for VVNB navaids by the entries in the file ```vvnb.nav.dat```.

Therefore Unzip the original ```nav.dat.gz``` and open the resulting ```nav.dat``` file 
in a text editor and search for entries containing the ICAO airport code ```VVNB```.
 
The following lists tells you what lines need to be updated or added.

Update the lines ending with:

 - ```... NB   VVNB 11L ILS-cat-I ``` 
 - ```... NB   VVNB 11L GS        ```
 - ```... NB   VVNB 11L DME-ILS   ```
 
Add the following lines:
 
 - ```... NBA  VVNB 11R ILS-cat-I ``` 
 - ```... NBA  VVNB 11L GS        ```
 - ```... NBA  VVNB 11L DME-ILS   ```
 
 Leave unchanged:
 
 - ```... ---- VVNB 11L OM```
 - ```... ---- VVNB 11L MM```
 
 Finally zip the updated ```nav.dat```.