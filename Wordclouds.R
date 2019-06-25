library(wordcloud2)
library(tm)
library(SnowballC)
library(tidyverse)
library(webshot)
webshot::install_phantomjs()
#install.packages("processx")
library(processx)
library(htmlwidgets)
library(pracma)

DataList = list.files(path = "Word Frequencies/", pattern = "*.csv")

ProduceWordCloud <- function(image, index, HexCode, FontSize){
  Genre <- regmatches(DataList[index],regexpr(".*(?=.csv)", as.character(DataList[index]), perl =TRUE))
  Data <- read.csv(paste("Word Frequencies/",DataList[index], sep = ""))
  Data <- Data[2:3]
  Data$Freq <- nthroot(Data$Freq,2)
  LyricsCloud <- wordcloud2(Data, size = FontSize, color = HexCode,  backgroundColor = "Black", figPath = image)
  return(LyricsCloud)
}

DataList

Multiplier <- 1.25

ProduceWordCloud("Icons/Blues.png", 1, "#96928d", 0.4 * Multiplier)
as.vector(read.csv("Word Frequencies/Blues.csv")[1:10,1])

ProduceWordCloud("Icons/Country.png", 2, "#af4d11", 0.65 * Multiplier)
as.vector(read.csv("Word Frequencies/Country.csv")[1:10,1])

ProduceWordCloud("Icons/Electro.png", 3, "#58a6dd", 0.65 * Multiplier)
as.vector(read.csv("Word Frequencies/Electro.csv")[1:10,1])

ProduceWordCloud("Icons/HipHop.png", 5, "#edae25", 0.475 * Multiplier)
as.vector(read.csv("Word Frequencies/HipHop.csv")[1:10,1])

ProduceWordCloud("Icons/Pop.png", 6, "#9e0cf9", 0.475 * Multiplier)
as.vector(read.csv("Word Frequencies/Pop.csv")[1:10,1])

ProduceWordCloud("Icons/R&B.png", 7, "#135df4", 0.3 * Multiplier)
as.vector(read.csv("Word Frequencies/R&B.csv")[1:10,1])

ProduceWordCloud("Icons/Reggae.png", 8, "#42ad1b", 0.475 * Multiplier)
as.vector(read.csv("Word Frequencies/Reggae.csv")[1:10,1])

ProduceWordCloud("Icons/Rock.png", 10, "#c61305", 0.3 * Multiplier)
as.vector(read.csv("Word Frequencies/Rock.csv")[1:10,1])
