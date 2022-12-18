exam = read.csv("csv_exam.csv")

library(dplyr)
exam %>% filter(class==1)


exam %>% 
  filter(class == 1 & science > 50)

exam %>%
  filter(class == 2 & math > 60)

exam %>% 
  filter(english > 60 | math > 70)

#p133
#q1
library(ggplot2)
mpg = ggplot2::mpg
mean_under4 = mpg %>% filter(displ <= 4)
mean_over5 = mpg %>% filter(displ >= 5)
mean(mean_under4$hwy)
mean(mean_over5$hwy)
#q2
mean_cty1 = mpg %>% filter(manufacturer == "audi")
mean_cty2 = mpg %>% filter(manufacturer == "toyota")
mean(mean_cty1$cty)
mean(mean_cty2$cty)
#q3
mean_hwy = mpg %>% filter(manufacturer %in% c("chevrolet", "ford", "honda"))
mean(mean_hwy$hwy)

#p138
#q1
new = mpg %>% select(class, cty)
new
#q2
new_com = mpg %>% filter(class == "compact") %>% select(cty)
new_suv = mpg %>% filter(class == "suv") %>% select(cty)
mean(new_com$cty)
mean(new_suv$cty)

#p141
#q1
mpg %>% 
  filter(manufacturer == "audi") %>% 
  arrange(desc(hwy)) %>% 
  head(5)


################################################################################
#p133
#q1
library(dplyr)
library(ggplot2)
mpg = ggplot2::mpg
mpg_4 = mpg %>% filter(4 < displ)
mpg_5 = mpg %>% filter(displ< 5)
mean(mpg_4$hwy)
mean(mpg_5$hwy)
#q2
mpg_a = mpg %>% filter(manufacturer == "audi")
mpg_t = mpg %>% filter(manufacturer == "toyota")
mean(mpg_a$cty)
mean(mpg_t$cty)
#q3
mpg_1 = mpg %>% filter(manufacturer %in% c("chevrolet", "ford", "honda"))
mean(mpg_1$hwy)

#p138
#q1
mpg %>% 
  select(class, cty)
#q2
mpg_s = mpg %>% 
  filter(class == "suv") %>% 
  select(cty)
mpg_c = mpg %>% 
  filter(class == "compact") %>% 
  select(cty)
mpg_s
mean(mpg_s$cty)
mean(mpg_c$cty)

#p141
#q1
mpg %>% 
  filter(manufacturer == "audi") %>% 
  arrange(desc(hwy)) %>% 
  head(5)

#p144
#q1
new_mpg <- mpg %>% 
  mutate(total = cty + hwy)
#q2
new_mpg %>% 
  mutate(ave = total/2 )
new_mpg
#q3
new_mpg %>% 
  arrange(desc(ave_ch)) %>% 
  head(3)
#q4
mpg %>% 
  mutate(ave_ch = (cty+hwy)/2) %>% 
  arrange(desc(ave_ch)) %>% 
  head(3)

#p150
#q1
mpg %>% 
  group_by(class) %>% 
  summarise(mean_cty = mean(cty))
#q2
mpg %>% 
  group_by(class) %>% 
  summarise(mean_cty = mean(cty)) %>% 
  arrange(desc(mean_cty))
#q3
mpg %>% 
  group_by(manufacturer) %>% 
  summarise(mean_hwy= mean(hwy)) %>% 
  arrange(desc(mean_hwy)) %>% 
  head(3)
#q4
mpg %>% 
  group_by(manufacturer) %>% 
  filter(class == "compact") %>% 
  summarise(n = n()) %>% 
  arrange(desc(n))

#p150
fuel <- data.frame(fl = c("c","d","e","p","r"), price_fl = c(2.35, 2.38, 2.11, 2.76, 2.22))
fuel
#q1
mpg <- left_join(mpg, fuel, id = "fl")
mpg
#q2
mpg %>% 
  select(model, fl, price_fl) %>%
  head(5)

#p160
midwest = ggplot2::midwest
#q1
midwest <- midwest %>% 
  mutate(perchild = (poptotal - popadults)/poptotal*100)
#q2
midwest %>% 
  select(county, perchild) %>% 
  arrange(desc(perchild)) %>% 
  head(5)
midwest
#q3
midwest %>% 
  mutate(grade = ifelse(perchild > 40, "large", ifelse(perchild > 30, "middle", "small")))
#q4
midwest %>% 
  mutate(perasian = (poptotal - popasian)/poptotal*100) %>% 
  select(state, county, perasian) %>% 
  head(10)
