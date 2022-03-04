library(rnaturalearth)
library(rnaturalearthdata)
library(rgeos)
library(ggrepel)

world <- ne_countries(scale="medium", returnclass = "sf")


##Figure 1

dataset1 <- distinct(dataset, site_name, .keep_all = TRUE) %>% arrange(desc(lat), desc(long))
dataset1$id <- 1:nrow(dataset1)

Figure_1 <- ggplot(data = world) +
  geom_sf() + theme_minimal()+
  geom_point(data = dataset1, aes(x = long, y = lat), size = 2, 
             shape = 19) +
  geom_text_repel(data = dataset1, aes(x = long, y = lat, label = id), 
                  size = 2, col = "black",  max.overlaps =20) +
  coord_sf(xlim = c(-11, 3), ylim = c(49, 61), expand = FALSE)

#got some advice this site for labels https://r-spatial.org/r/2018/10/25/ggplot2-sf-2.html


##Figure 2

Figure_2 <- ggplot(data = world) +
  geom_sf() + theme_minimal()+
  geom_point(data = dataset, aes(x = long, y = lat, shape = method, color = charcoal), size = 2)+
  coord_sf(xlim = c(-12, 5), ylim = c(49, 62), expand = FALSE) +
  facet_wrap(~interval)

#change shapes and colours

rm(world, dataset1)

