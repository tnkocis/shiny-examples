library(dplyr)

allzips <- readRDS("data/superzip.rds")
ourdata <- read.csv("data/gauge_locations.csv")
allzips$latitude <- ourdata$latitude
allzips$longitude <- ourdata$longitude
allzips$zipcode <- outdata$site_no
allzips$college <- allzips$college * 100
#allzips$zipcode <- formatC(allzips$zipcode, width=5, format="d", flag="0")
row.names(allzips) <- allzips$zipcode

cleantable <- allzips %>%
  select(
    City = city.x,
    State = state.x,
    Rank = rank,
    Score = centile,
    Superzip = superzip,
    Population = adultpop,
    College = college,
    Income = income,
    Lat = latitude,
    Long = longitude
  )
