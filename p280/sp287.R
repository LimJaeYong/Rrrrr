library(ggiraphExtra)
library(ggplot2)
str(changeCode(tbc))
kormap1 = kormaps2014::kofmap1
tbc$name = iconv(tbc$name, "UTF-8", "CP949") #한글깨질떄
tbc$name1 = iconv(tbc$name1, "UTF-8", "CP949")

gido_tbc = ggChoropleth(tbc)

#숙제 경상북도 나누기
library(kormaps2014)
library(ggiraphExtra)
library(dplyr)

korpop3 = kormaps2014::korpop3
kormap3 = kormaps2014::kormap3
kormap2 = kormaps2014::kormap2


korpop = filter(korpop3, (korpop3$code >= 3700000) & (korpop3$code < 3800000))
kormap = filter(kormap3, (kormap3$code >= 3700000) & (kormap3$code < 3800000))

ggChoropleth(korpop, aes(fill = 총인구_명, map_id = code, tooltip = 행정구역별_읍면동), map = kormap3, interactive = T)

#ggplot2
library(maps)
library(mapproj)
library(ggplot2)

map3 = map_data(map = 'kormap3')
ggplot(kormap2, aes(x = long, y = lat, group = group)) + geom_polygon()

ggplot(kormap3, aes(x = long, y = lat, group = group)) + geom_polygon(color = "blue", fill = "white")+coord_quickmap()

ggplot(kormap3, aes(x = long, y = lat, group = group)) + geom_polygon(color = "blue", fill = "white")+coord_quickmap()