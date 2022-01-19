library(tidyverse)
library(LivingNorwayR)

penguin_data=palmerpenguins::penguins_raw
penguin_data=penguin_data %>% 
  mutate(speciesName=str_extract(Species, "\\([^()]+\\)") ) %>% 
  mutate(speciesName=gsub("\\(", "", speciesName)) %>%
  mutate(speciesName=gsub("\\)", "", speciesName)) %>%
  separate(speciesName, c("Genus", "Species")) %>% 
  janitor::clean_names()

#names(penguin_data)

# penguin_data=penguin_data %>% 
#   group_by(study_name) %>% 
#   group_split()
# 
# #ParentEvents
# PAL0708=as_tibble(penguin_data[[1]])
# PAL0809=as_tibble(penguin_data[[2]])
# PAL0910=as_tibble(penguin_data[[3]])
# 
# #Events in each parent event
# # each penguin measurement is an event
# 
# library(listviewer)
# 
# listviewer::jsonedit(getGBIFEventMembers()) 
# 
# 
names(getGBIFEventMembers())

getGBIFEventMembers()[38]


penguin_data=penguin_data %>% 
  group_by(study_name) %>% 
  mutate(
    parentEventID = uuid::UUIDgenerate(use.time = FALSE)
  ) 

penguin_data=penguin_data %>% ungroup() %>% 
  rowwise()%>% 
    mutate(
    eventID = uuid::UUIDgenerate(use.time = FALSE)
  ) 

penguin_data %>% view()


# Parent Event information

# Event Date for parentIDs

parent_penguinEvent=penguin_data %>% 
  group_by(parentEventID) %>% 
  summarise(min=min(date_egg), max=max(date_egg)) %>% 
  mutate(eventDate=paste0(min,"/", max))


# Event continent and isalndGroup for parentIDs
parent_penguinEvent %>% 
  mutate(continent="Antarctica") %>% 
  mutate(islandGroup="Palmer Archipelago") %>% 
  mutate(year=lubridate::year(min)) %>% 
  select(!c(min,max)) 


#Event Information - island is in there




penguin_data %>% 
  distinct(island) %>% 
  mutate(case_when()
    decimalLatitude=c(-64.7666667,-65.4333316 , -64.7333333)) %>% 
  mutate(decimalLongitude=c(-64.0833333,-65.499998,-64.2333333))




# %>% 
#   mutate(samplingProtocol="Each season, study nests, where pairs of adults were present, 
#          were individually marked and chosen before the onset of egg-laying, and consistently monitored. 
#          When study nests were found at the one-egg stage, both adults were captured to obtain blood samples 
#          used for molecular sexing and stable isotope analyses, and measurements of structural size and body mass. 
#          At the time of capture, each adult penguin was quickly blood sampled (~1 ml) from the brachial vein. 
#          After handling, individuals at study nests were further monitored to ensure the pair reached clutch completion, 
#          i.e., two eggs. Molecular analyses were conducted at Simon Fraser University following standard PCR protocols, 
#          and stable isotope analyses were conducted at the Stable Isotope Facility at the University of California, 
#          Davis using an elemental analyzer interfaced with an isotope ratio mass spectrometer. (https://portal.edirepository.org/nis/mapbrowse?packageid=knb-lter-pal.219.5)")
#   
  

