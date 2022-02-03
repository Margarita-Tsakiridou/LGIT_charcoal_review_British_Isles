library(tidyverse)
library(readxl)
library(janitor)



records <- read_excel('./data/Appendix 1.1 Thesis.xlsx', sheet=1) %>% mutate(type="charcoal_record") %>% select(-1,-2) %>% clean_names()
bands <- read_excel('./data/Appendix 1.1 Thesis.xlsx', sheet=2) %>% mutate(type ="charcoal_band") %>% select(-1) %>% clean_names()

dataset <- rbind(records,bands) %>% select(-2,-5,-7) %>% pivot_longer(cols=5:8, names_to= "interval", values_to = "charcoal")

dataset$interval <-factor(dataset$interval, levels = c("gs_2", "gi_1", "gs_1", "early_holocene"))


dataset$charcoal= case_when(
  dataset$charcoal == "x" ~ "x",
  dataset$charcoal == "x?"~ "x",
  dataset$charcoal == "0?"~ "0",
  dataset$charcoal == "0" ~ "0",
  dataset$charcoal == "1?" ~ "0",
  dataset$charcoal == "1" ~ "1"
)


dataset$charcoal <- as.numeric(dataset$charcoal)

str(dataset)
