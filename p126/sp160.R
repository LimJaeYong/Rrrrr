library(ggplot2)
library(dplyr)

midwest <- as.data.frame(ggplot2::midwest)
#q1
midwest <- midwest %>% 
  mutate(perchild = (poptotal - popadults)/poptotal * 100)

#q2
midwest %>% 
  select(county, perchild) %>% 
  arrange(desc(perchild)) %>% 
  head(5)
#q3
midwest <- midwest %>% 
  mutate(grade = ifelse(perchild >= 40, "large",
                        ifelse(perchild >= 30, "middle", small)))
#q4
midwest <- midwest %>% 
  mutate(ratio_asian = popasian / poptotal *100) %>% 
  arrange(ratio_asian) %>% 
  select(state, county, ratio_asian) %>% 
  head(10)
midwest

