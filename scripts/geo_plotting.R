library(rnaturalearth)
library(rnaturalearthdata)
library(rgeos)
library(ggrepel)


##########################
##       Map data       ##
#########################

world <- rnaturalearth::ne_countries(scale="medium", returnclass = "sf")


##########################
##      Figure 1       ##
#########################


Figure_1 <- ggplot(data = world) +
  geom_sf() + 
  theme_minimal()+
  geom_point(data = all_charcoal_data,
             aes(x = long, y = lat), 
             size = 2, 
             shape = 19) +
  ggrepel::geom_text_repel(data = all_charcoal_data, 
                           aes(x = long, y = lat, label = site_id), 
                           size = 2, 
                           col = "black",
                           max.overlaps = 40) +
  coord_sf(xlim = c(-11, 3), 
           ylim = c(49.5, 61), 
           expand = FALSE)

#very useful website for labels https://r-spatial.org/r/2018/10/25/ggplot2-sf-2.html



##########################
##      Figure 2       ##
#########################


Figure_2 <- ggplot(data = world) +
  geom_sf() + 
  theme_minimal()+
  geom_point(data = all_charcoal_data, 
             aes(x = long, y = lat, fill = charcoal, shape = method), 
             size = 2) +
  scale_fill_manual(values = c("0" = "green4", 
                               "1" = "red"))+
  scale_shape_manual(values =c("band" = 8, 
                               "pollen-slide" = 21, 
                               "sieving" = 24)) +
  coord_sf(xlim = c(-10, 2.5), 
           ylim = c(49.5, 61),
           expand = FALSE) +
  facet_wrap(~interval) +
  guides(shape = guide_legend(order =1),
         color = guide_legend(order=2))


Figure_2

rm(world, 
   all_charcoal_data)
