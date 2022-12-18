t1 = data.frame(id = c(1,2,3,4,5), midterm = c(60, 80, 70, 90 ,85))
t2 = data.frame(id = c(1,2,3,4,5), final = c(70, 83,65, 95, 80))

library(dplyr)
t1_2 = left_join(t1, t2, by = "id")

ex1 = data.frame(id = c(1,2,3,4,5), teacher = c('Kim', '이지수', '홍지호', '이경란', '박병수'))

write.csv(ex1, file = "ex1.csv")


ex1_1 = left_join(t1, ex1, by = "id")
write.csv(ex1_1, file = "ex1_1.csv")

ex1_1_new = t1 %>% 
  left_join(ex1_1, by = "id") %>% 
  mutate(t_N = ifelse(is.na(class), "None", teacher))
