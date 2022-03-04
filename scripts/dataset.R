library(tidyverse)
library(readxl)
library(janitor)



records <- read_excel('./data/Appendix 1.1 Thesis.xlsx', sheet=1) %>% mutate(type="charcoal_record") %>% select(-1,-2) %>% clean_names()
bands <- read_excel('./data/Appendix 1.1 Thesis.xlsx', sheet=2) %>% mutate(type ="charcoal_band") %>% select(-1) %>% clean_names()

dataset <- rbind(records,bands) %>% select(-2,-5,-7) %>% pivot_longer(cols=5:8, names_to= "interval", values_to = "charcoal")

dataset <- dataset %>% mutate(interval = recode(interval, "gs_2" = "GS-2", "gi_1" = "GI-1", "gs_1" = "GS-1", "early_holocene" = "Early Holocene"))
dataset$interval <-factor(dataset$interval, levels = c("GS-2", "GI-1", "GS-1", "Early Holocene"))


#dataset$interval <-factor(dataset$interval, levels = c("GS_2", "GI_1", "GS-1", "Early_Holocene"))

dataset$charcoal= case_when(
  dataset$charcoal == "x" ~ "x",
  dataset$charcoal == "x?"~ "x",
  dataset$charcoal == "0?"~ "0",
  dataset$charcoal == "0" ~ "0",
  dataset$charcoal == "1?" ~ "0",
  dataset$charcoal == "1" ~ "1"
)


dataset <- dataset %>% filter(charcoal != "x")
dataset$charcoal <- as.factor(dataset$charcoal)


rm(bands, records)
