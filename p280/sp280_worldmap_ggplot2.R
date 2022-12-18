install.packages('maps')
install.packages('mpproj')
library(maps)
library(mapproj)
library(ggplot2)
world = map_data(map = 'world')

ggplot(world, aes(x = long, y =lat))+ geom_polygon()
ggplot(world, aes(x = long, y =lat, group = group))+ geom_polygon()

#국경표시
ggplot(world, aes(x = long, y =lat, group = group))+ geom_polygon(color = 'blue', fill = 'white')+coord_quickmap()
