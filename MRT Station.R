library(readr)
library(tmap)
library(sf)
library(dplyr)

setwd("/Users/jcheah/Downloads/MITB/R Project")
MRT_DATA <- st_read(dsn = "TrainStation", layer = "MRTLRTStnPtt")
MRT_DATA2 <- MRT_DATA %>% select(STN_NAME, geometry)
tmap_mode("view")
tm_shape(MRT_DATA) +
  tm_bubbles(size = 1, col = "green")
