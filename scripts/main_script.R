'#This code is producing the maps for the journal article

Evidence of wildfire in the British Isles during the Last Glacial-Interglacial Transition: 
Revealing spatiotemporal patterns and controls

https://doi.org/10.1016/j.pgeola.2020.05.001'


# Packages

library(tidyverse)
library(readxl)
library(janitor)
library(rnaturalearth)
library(rnaturalearthdata)
library(rgeos)
library(ggrepel)


#This scripts creates, cleans and formats the data

source("./scripts/dataset.R")

#This script produces Figures 1 and 2 of the article.

source("./scripts/geo_plotting.R")



#Save the figs locally

if (!dir.exists('./figures')) {
  dir.create('./figures')
}

grDevices::tiff("./figures/Figure1_tryII.tif",
     compression = "none")


ggsave("./figures/Figure1.tiff",
       Figure_1,
       bg = "white") # this works but has no background!



ggsave("./figures/Figure2.tiff",
       Figure_2,
       bg = "white")

