



library(tmap)
library(rgdal)

#get ca wine regions shapefile
cawine <- readOGR(dsn = "Desktop/CA_avas_shapefile", layer = "CA_avas")



#get california state boundary shapefile
ca <- readOGR(dsn = "Desktop/CA-state-boundary", layer = "CA_State_TIGER2016")


#static plot
tmap_mode("plot")
tm_shape(ca) +
  tm_fill("white") +
  tm_borders()  +
  tm_shape(cawine) +
  tm_fill("name",legend.show = FALSE, alpha = .5) +
  tm_borders() +
  tm_layout(bg.color = "#cfe4e8") 


#dynamic plot
tmap_mode("view")
tm_shape(cawine) +
  tm_fill("name",legend.show = FALSE, alpha = .5,
          id="name",
          popup.vars = c("Within" = "within",
                         "Counties" = "county",
                         "Created" = "created")) +
  tm_borders() +
  tm_basemap("Stamen.TonerLite")