install.packages("mapproj")
install.packages("ggiraphExtra")
#1
library(mapproj)
library(ggiraphExtra)
library(tibble)

#2
USArrests
crime <- rownames_to_column(USArrests, var = "state")
crime$state <- tolower(crime$state)

#3
install.packages("maps")
library(maps)
library(ggplot2)
state_map <- map_data("state")

#4
ggChoropleth(crime, aes(fill = Rape, map_id = state),state_map, interactive = T)

