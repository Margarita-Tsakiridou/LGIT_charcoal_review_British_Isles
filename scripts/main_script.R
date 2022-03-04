'#This code is producing the maps for the journal article

Evidence of wildfire in the British Isles during the Last Glacial-Interglacial Transition: 
Revealing spatiotemporal patterns and controls

https://doi.org/10.1016/j.pgeola.2020.05.001

The code is split in two parts. The first constructs the dataset and the second 
produces the maps figures'


#This script makes the dataset

source("./scripts/dataset.R")

str(dataset)

#This script produces the 2 map figures

source("./scripts/geo_plotting.R")

Figure_1
Figure_2
