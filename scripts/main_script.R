library(tidyverse)
library(readxl)
library(janitor)
library(rnaturalearth)
library(rnaturalearthdata)
library(rgeos)

wolrd <- ne_countries(scale="medium", returnclass = "sf")

'#Step 1

read Excel file'

records <- read_excel('./data/Appendix 1.1 Thesis.xlsx', sheet=1) %>% mutate(type="charcoal_record") %>% select(-1,-2) %>% clean_names()
bands <- read_excel('./data/Appendix 1.1 Thesis.xlsx', sheet=2) %>% mutate(type ="charcoal_band") %>% select(-1) %>% clean_names()

dataset <- rbind(records,bands) %>% select(-2,-5,-7) %>% pivot_longer(cols=5:8, names_to= "interval", values_to = "charcoal")
str(dataset)


'Step 4
Build the map with GGplot
and do facet wrap :)'

ggplot(data = wolrd) +
  geom_sf() +
  geom_point(data = dataset, aes(x = long, y = lat), size = 4, 
             shape = 23, fill = "darkred") +
  coord_sf(xlim = c(-12, 5), ylim = c(49, 62), expand = FALSE) +
  facet_wrap(~interval)
