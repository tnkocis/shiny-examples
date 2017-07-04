library(dplyr)

allzips <- read.csv("data/gauge_locations.csv")
allzips$latitude <- jitter(allzips$latitude)
allzips$longitude <- jitter(allzips$longitude)
row.names(allzips) <- allzips$site_no
