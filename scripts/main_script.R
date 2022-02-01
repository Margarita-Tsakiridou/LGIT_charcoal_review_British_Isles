library(tidyverse)
library(readxl)
library(janitor)

'#Step 1

read Excel file'

records <- read_excel('./data/Appendix 1.1 Thesis.xlsx', sheet=1) %>% mutate(type="charcoal_record") %>% select(-1,-2) %>% clean_names()
bands <- read_excel('./data/Appendix 1.1 Thesis.xlsx', sheet=2) %>% mutate(type ="charcoal_band") %>% select(-1) %>% clean_names()

dataset <- rbind(records,bands) %>% select(-3,-5) %>% pivot_longer(cols=4:7, names_to= "interval", values_to = "charcoal")
str(dataset)


'Step 3
find a way to turn NGRs to coordinates (take out spaces)
I think irish coordinates have one letter as opposed to the english with two
But do some research to doublecheck that

Step 4
Build the map with GGplot
and do facet wrap :)
