library(rnaturalearth)
library(rnaturalearthdata)
library(rgeos)

wolrd <- ne_countries(scale="medium", returnclass = "sf")

##MAin ALL

ggplot(data = wolrd) +
  geom_sf() + theme_minimal()+
  geom_point(data = dataset, aes(x = long, y = lat, fill=charcoal), size = 2, 
             shape = 21) +
  coord_sf(xlim = c(-12, 5), ylim = c(49, 62), expand = FALSE) +
  facet_wrap(~interval)



#Testing

str(dataset)

dataset_macro <- dataset %>% filter(method == "sieving")
dataset_micro <- dataset %>% filter(method == "pollen-slide")
dataset_bands <- dataset %>% filter(method == "band")




ggplot(data = wolrd) +
  geom_sf() + theme_minimal()+
  geom_point(data = dataset_macro, aes(x = long, y = lat, fill=charcoal), size = 2, 
             shape = 24) +
  geom_point(data = dataset_micro, aes(x = long, y = lat, fill=charcoal), size = 2, 
             shape = 21) +
  geom_point(data = dataset_bands, aes(x = long, y = lat), size = 1, 
             shape = 8) +
  coord_sf(xlim = c(-12, 5), ylim = c(49, 62), expand = FALSE) +
  facet_wrap(~interval)


##double-factoring
ggplot(data = wolrd) +
  geom_sf() + theme_minimal()+
  geom_point(data = dataset, aes(x = long, y = lat, shape = method, fill = charcoal), size = 2)+
  coord_sf(xlim = c(-12, 5), ylim = c(49, 62), expand = FALSE) +
  facet_wrap(~interval)

