library(dplyr)

allzips <- readRDS("data/superzip.rds")
ourdata <- read.csv("data/gauge_locations.csv")
allzips$latitude <- ourdata$latitude
allzips$longitude <- ourdata$longitude
allzips$zipcode <- ourdata$site_no
allzips$college <- allzips$college * 100
allzips$zipcode <- as.char(allzups$zipcode)
#formatC(allzips$zipcode, width=7, format="d", flag="0")
# try as.char
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
