library(rnaturalearth)
library(rnaturalearthdata)
library(rgeos)

wolrd <- ne_countries(scale="medium", returnclass = "sf")


ggplot(data = wolrd) +
  geom_sf() + theme_bw()+
  geom_point(data = dataset, aes(x = long, y = lat), size = 1, 
             shape = 23, fill = "darkred") +
  coord_sf(xlim = c(-12, 5), ylim = c(49, 62), expand = FALSE) +
  facet_wrap(~interval)
