

# The source data were recorded either as charcoal series, where data from more
# than one levels exist, or bands, where the existence of charcoal in sediments
# is reported for isolated levels.


records <- readxl::read_excel('./data/Appendix 1.1 Thesis.xlsx', sheet=1) %>% 
  mutate(type="charcoal_record") %>%
  select(-1,-2) %>% 
  janitor::clean_names()

bands <- readxl::read_excel('./data/Appendix 1.1 Thesis.xlsx', sheet=2) %>% 
  mutate(type ="charcoal_band") %>% 
  select(-1) %>% 
  janitor::clean_names()

all_charcoal_data <- rbind(records,bands) %>% 
  select(-2,-5,-7) %>% 
  pivot_longer(cols=5:8,
               names_to= "interval",
               values_to = "charcoal") %>% 
  mutate(interval = recode(interval, 
                           "gs_2" = "GS-2",
                           "gi_1" = "GI-1", 
                           "gs_1" = "GS-1", 
                           "early_holocene" = "Early Holocene"))

all_charcoal_data$interval <-factor(all_charcoal_data$interval, 
                                    levels = c("GS-2", 
                                               "GI-1",
                                               "GS-1",
                                               "Early Holocene"))


all_charcoal_data$charcoal= case_when(
  all_charcoal_data$charcoal == "x" ~ "x",
  all_charcoal_data$charcoal == "x?"~ "x",
  all_charcoal_data$charcoal == "0?"~ "0",
  all_charcoal_data$charcoal == "0" ~ "0",
  all_charcoal_data$charcoal == "1?" ~ "0",
  all_charcoal_data$charcoal == "1" ~ "1"
)


all_charcoal_data <- all_charcoal_data %>% 
  filter(charcoal != "x") %>% 
  mutate(charcoal = as.factor(charcoal))


data_id <- distinct(all_charcoal_data, 
                    site_name,
                    .keep_all = TRUE) %>% 
  arrange(desc(lat), 
          desc(long))

data_id$site_id <- 1:nrow(data_id)

all_charcoal_data <- merge(all_charcoal_data,
                           data_id[,c(1,8)])




rm(bands,
   records,
   data_id)
