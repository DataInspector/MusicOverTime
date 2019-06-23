#devtools::install_github("lchiffon/wordcloud2", force = TRUE)
#install.packages("tm")
#install.packages("SnowballC")

library(wordcloud2)
library(tm)
library(SnowballC)
library(tidyverse)

for (i in unique(Data$Genre2)[unique(Data$Genre2)!=""]){
  
  rm(list=ls())
  Data <- read.csv("CleanData.csv")
  Data <- Data[2:ncol(Data)]

  Document <- Corpus(VectorSource(Data$LyricsClean[Data$Genre2 == i]))
  
  Document <- tm_map(Document, content_transformer(tolower))
  Document <- tm_map(Document, removeNumbers)
  Document <- tm_map(Document, removeWords, stopwords("english"))
  
  Document <- tm_map(Document, removeWords, c("know", "just", "can", "chorus", "verse", "get", "got", "will", "much", "well", "keep", "let", "see", "tell", "take")) 
  
  Document <- tm_map(Document, removePunctuation)
  Document <- tm_map(Document, stripWhitespace)
  
  # Document <- tm_map(Document, stemDocument)
  
  rm(Data)
  
  Document <- sort(rowSums(as.matrix(TermDocumentMatrix(Document))),decreasing=TRUE)
  Document <- data.frame(Word = names(Document), Freq = Document)
  
  write.csv(Document,paste(i,".csv", sep = ""))

}


#wordcloud2(Document, color = "Brown",  backgroundColor = "White", figPath = "/Users/Harib/OneDrive/Pictures/Music/Country.png")