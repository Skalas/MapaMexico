mexico <- readOGR(dsn = "./estados", layer = "states", encoding = "UTF-8")
map <- mexico
head(mexico@data)
str(mexico@data)
mexico@data['rand'] <- round(rnorm(32,1500,200))

pal <- colorBin("Blues", mexico@data$rand, 5, pretty = FALSE)
map <- mexico
leaflet(data = map) %>%
  addTiles() %>%
  addPolygons(
    fillOpacity = 0.8, 
    smoothFactor = 0.5,
    fillColor = ~pal(rand),
    color = "#BDBDC3", 
    weight = 1)
