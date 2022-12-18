library(ggplot2)
library(dplyr)
fuel <- data.frame(fl = c("c","d","e","p","r"),price_fl = c(2.35, 2.38, 2.11, 2.76, 2.22))

fuel
#q1
mpg_f = left_join(mpg, fuel, by="fl")
#q2
mpg_f %>% 
  select(model, fl, price_fl) %>% 
  head(5)
