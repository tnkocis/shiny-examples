library(dplyr)

allzips <- read.csv("data/gauge_locations.csv")
allzips$latitude <- jitter(allzips$latitude)
allzips$longitude <- jitter(allzips$longitude)
row.names(allzips) <- allzips$site_no

cleantable <- allzips %>%
  select(
    City = latitude,
    State = latitude,
    Zipcode = latitude,
    Rank = latitude,
    Score = latitude,
    Superzip = latitude,
    Population = latitude,
    College = latitude,
    Income = latitude,
    Lat = latitude,
    Long = longitude
  )
