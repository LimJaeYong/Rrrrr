ex1 = read.csv("csv_exam.csv")
exam = read.csv("csv_exam.csv")
library(dplyr)
exam = ex1 %>% 
  mutate(total = math + english + science)

exam = exam %>% 
  mutate(total7 = math + english + science, mean7 = (math +english +science)/3) %>% 
  head(5)
exam

exam %>% 
  mutate(test =ifelse(mean7 >= 65, "pass", "fail")) %>% 
  head(10)

exam %>% arrange(total)
exam %>% arrange(-total)



#p144
#q1
library(ggplot2)
mpg <- as.data.frame(ggplot2::mpg)
mpg_new <- mpg
mpg_new <- mpg_new %>% 
  mutate(total = hwy + cty)
#q2
mpg_new <- mpg_new %>% 
  mutate(mean = total / 2)
#q3
mpg_new %>% 
  arrange(desc(mean)) %>% 
  head(3)
#q4
mpg <- mpg %>% 
  mutate(total = hwy + cty, mean = total / 2) %>% 
  arrange(mean) %>% 
  head(3)
mpg


ex1 %>% 
  summarise(mean_m = mean(math))

exam %>% 
  group_by(class) %>% 
  summarise(mean_m = mean(math),
            sum_m = sum(math),
            median_m=median(math),
            n_m = n())

exam %>% 
  summarise(mean_m = mean(math),
            sum_m = sum(math),
            median_m=median(math),
            n_m = n())

mpg %>% 
  summarise(mean_cty = mean(cty))

mpg %>% 
  group_by(manufacturer) %>% 
  summarise(mean_cty = mean(cty)) %>% 
  arrange(-mean_cty)

mpg %>% 
  group_by(manufacturer, drv) %>% 
  summarise(mean_cty = mean(cty)) %>% 
  head(20)

mpg %>% 
  group_by(manufacturer) %>% 
  filter(class == "suv") %>% 
  mutate(total = (hwy+cty)/2) %>% 
  summarise(mean_total = mean(total)) %>% 
  arrange(desc(mean_total)) %>% 
  head(5)

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
  group_by(class) %>% 
  summarise(mean_hwy = mean(hwy)) %>% 
  arrange(desc(mean_hwy)) %>%
  head(3)
#q4
mpg %>% 
  group_by(manufacturer) %>% 
  filter(class == "compact") %>% 
  summarise(n_compact = n())


#practice
#Q1
mpg = as.data.frame(ggplot2::mpg)
mpg %>% 
  group_by(class) %>% 
  summarise(mean(cty))
#q2
mpg %>% 
  group_by(class) %>% 
  summarise(mean_cty = mean(cty)) %>% 
  arrange(desc(mean_cty))
#q3
mpg %>% 
  group_by(class) %>% 
  summarise(mean_hwy = mean(hwy)) %>% 
  arrange(desc(mean_hwy)) %>% 
  head(3)
#q4
mpg %>% 
  filter(class == "compact") %>% 
  group_by(manufacturer) %>% 
  summarise(n = n()) %>% 
  arrange(desc(n))
