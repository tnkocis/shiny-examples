library(dplyr)

allzips <- read.csv("data/gauge_locations.csv")
allzips$latitude <- jitter(allzips$latitude)
allzips$longitude <- jitter(allzips$longitude)
row.names(allzips) <- allzips$site_no

cleantable <- allzips %>%
  select(
    City = 0,
    State = 0,
    Zipcode = 0,
    Rank = 0,
    Score = 0,
    Superzip = 0,
    Population = 0,
    College = 0,
    Income = 0,
    Lat = latitude,
    Long = longitude
  )
