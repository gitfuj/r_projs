#win by efforts

setwd("C:/Users/Ujwal/Desktop/whatsapp")

chunk1 <- readLines("dodo.txt")
chunk1 <- paste(chunk1, collapse = " ")

clean_chunk1 <- tolower(chunk1)
head(clean_chunk1)

clean_chunk2 <- gsub(pattern = "\\W", 
                     replace = " ", clean_chunk1)
head(clean_chunk1)

clean_chunk3 <- gsub(pattern = "\\d", 
                     replace = " ", clean_chunk2)
head(clean_chunk2)

clean_chunk4 <- gsub(pattern = "\\b[A-z]\\b{1}", 
                     replace = " ", clean_chunk3)
head(clean_chunk4)



clean_chunk5 <- removeWords(clean_chunk4,stopwords())
clean_chunk6 <- stripWhitespace(clean_chunk5)
head(clean_chunk6)

clean_chunk7 <- removeWords(clean_chunk6, c("_c","в","media","omitted","а","_fwobsw","_cmcbv","ujwal chute","dodo","ря"))
clean_chunk8 <- strsplit(clean_chunk7, " ")
head(clean_chunk8)

word_freq <- table(clean_chunk8)
head(word_freq)

word_freq2 <- cbind(names(word_freq),
                    as.integer(word_freq))
head(word_freq2,10)

#install.packages("tm")
library(tm)
library(RColorBrewer)
library(wordcloud)
#install.packages("SnowballC")
library(SnowballC)
class(clean_chunk8)#to create a list


word_cloud <- unlist(clean_chunk8)
head(word_cloud)

clean_chunk8 <- as.character(clean_chunk8)

pal2 <- brewer.pal(5, "Dark2")

wordcloud(clean_chunk8,
          min.freq = 3,
          random.order = F,
          scale = c(4,1),
          max.words = 150,
          color=pal2,
          random.color = F
          )



install.packages("devtools")
require(devtools)
install_github("lchiffon/wordcloud2")
