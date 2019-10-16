library(curlconverter) # devtools::install_github("hrbrmstr/curlconverter")
library(tidyverse)
library(xml2)

u <- "curl -k -H \"username: YYYYY\" -H \"password: YYYYY\" https://infoconnect1.highwayinfo.govt.nz/ic/jbi/TrafficCameras/REST/FeedService/"

feed <-straighten(u) %>% 
  make_req()


feed <-httr::VERB(verb = "GET", url = "https://infoconnect1.highwayinfo.govt.nz/ic/jbi/TrafficConditions2/REST/FeedService/", 
           httr::add_headers(username = "YYYYY", password = "YYYYY"))


below <- xmlParse(feed)

below

congestion <- xmlToDataFrame(nodes = getNodeSet(below, "//tns:locations/tns:congestion"))


id <- xmlToDataFrame(nodes = getNodeSet(below, "//tns:locations/tns:id"))


name <- xmlToDataFrame(nodes = getNodeSet(below, "//tns:locations/tns:name"))

congestiondetails <- cbind(id,name,congestion)

write.csv(congestiondetails, file = "congestiondetails.csv")