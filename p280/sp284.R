install.packages("stringi")

install.packages("devtools")
devtools::install_github("cardiomoon/kormaps2014")

library(kormaps2014)
korpop1 = kormaps2014::korpop1
str(korpop1) 

#한글이 안되면 #
str(changeCode(korpop1))
##

library(dplyr)
korpop1 = rename(korpop1, name = 행정구역별_읍면동,pop = 총인구_명)
korpop1$name = iconv(korpop1$name, "UTF-8","cp949")

#단계 구분도
install.packages("mapproj")
install.packages(ggiraphExtra)
library(ggiraphExtra)
library(ggplot2)


ggChoropleth(korpop1, aes(fill = pop, map_id = code, tooltip = name), kormap1, interactive = T)
                           
#숙제 참조
#사용 데이터 kormap2, korpop2
library(ggiraphExtra)
library(dplyr)
korpop2 = kormaps2014::korpop2
korpop2 = rename(korpop2, name = 행정구역별_읍면동, pop = 총인구_명)
korpop2_kb = filter(korpop2, korpop2$code >= 37000 & korpop2$code < 38000)
ggChoropleth(korpop2_kb, aes(fill = pop, map_id = code, tooltip = name), map = kormap2, interactive = T)