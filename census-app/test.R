library(maps)
library(mapproj)
source("census-app/helpers.R")

counties <- readRDS("census-app/data/counties.rds")
percent_map(counties$white, "darkgreen", "% white")
head(counties)
# install.packages(c("maps", "mapproj"))

