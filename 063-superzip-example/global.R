library(dplyr)

bigset<- readRDS("data/superzip.rds")
allzips<-bigset[1:93,]

# read in site #, name, location
gauge_data <- read.csv("data/gauge_locations.csv")
allzips$zipcode <- gauge_data$site_no
allzips$statname <- gauge_data$station_nm
allzips$latitude <- gauge_data$dec_lat_va
allzips$longitude <- gauge_data$dec_long_v

# subset data 
# FULL VOL
redo_full_vol <- read.csv("data/redo_simp_data_full_vol_90.csv")

# IMP VOL
redo_imp_vol <- read.csv("data/redo_simp_data_imp_vol_90.csv")

allzips$college <- allzips$college * 100
allzips$zipcode <- formatC(allzips$zipcode, width=7, format="d", flag="0")
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
