library(httr)
library(jsonlite)
library(tidyverse)
library(data.table)
library(dplyr)

url <-GET(url='https://opendata.arcgis.com/datasets/a163c5addf2c4b7f9079f08751bd2e1a_0.geojson?where=crashYear%20%3E%3D%202018%20AND%20crashYear%20%3C%3D%202018')
json_file<- content(url,as= "text")
json_file


json_data <- fromJSON(json_file)
json_data
glimpse(json_data)

Crash_dataframe <-as.data.frame(json_data)
glimpse(Crash_dataframe)
Crash_dataframe <- Crash_dataframe[3]
Crash_dataframe
#sample code to extract crashyear data
#a<- Crash_dataframe$features.properties$crashYear[-1]
#head(a)
