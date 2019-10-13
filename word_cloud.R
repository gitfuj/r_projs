#win by efforts

setwd("C:/Users/Ujwal/Desktop/day 10")
readLines("Acknowledgment.txt")

a <- c("Hello", "world", "My", "First", "Handshake", "Through", "R")
a
b <- paste(a, collapse = " ")
b

chunk2 <- readLines("Acknowledgment.txt")
#create 1 chunk of data by pasting all the diffrent chunks
chunk2_pasted <- paste(chunk2, collapse = " ")
head(chunk2_pasted)

#clean the data and converting data to lower case
clean_data <- tolower(chunk2_pasted)
head(clean_data)

clean_data2 <- gsub(pattern = "\\W", replace = " ",
                    clean_data)
head(clean_data2)

clean_data3 <- gsub(pattern = "\\d", replace = " ",
                    clean_data2)
head(clean_data3)

install.packages("tm")
library(tm)

stopwords()
#remove stop words like we, on for your,in the etc.
clean_data4 <- removeWords(clean_data3, stopwords())
head(clean_data4)

#remove single letters 
clean_data5 <- gsub(pattern = "\\b[A-z]\\b{1}",
                    replace = " ", clean_data4)
clean_data5

#finally removing the white spaces
clean_data6 <- stripWhitespace(clean_data5)
head(clean_data6)

#split words and add space between them as spliters
clean_data7 <- strsplit(clean_data6, " ")
head(clean_data7)


word_freq1 <- table(clean_data7)
head(word_freq1)

word_freq2 <- cbind(names(word_freq1),
                    as.integer(word_freq1))
head(word_freq2)
write.csv(word_freq2, "Word Frequency5.csv")

install.packages("RColorBrewer")
install.packages("wordcloud")

library(RColorBrewer)
library(wordcloud)

class(clean_data7)
word_cloud1 <- unlist(clean_data7)

wordcloud(word_cloud1) #basic word cloude

wordcloud(word_cloud1, min.freq = 3)

wordcloud(word_cloud1, min.freq = 1, random.order = F)

wordcloud(word_cloud1, min.freq = 1,
          random.order = F, scale = c(4,1))

pal2 <- brewer.pal(5, "Dark2")
wordcloud(word_cloud1, min.freq = 1,
          random.order = F, scale = c(4,1),
          colors = pal2, random.color = T)

positive <- scan("positive.txt",
                 what = "character",
                 comment.char = ";")
negative <- scan("negative.txt",
                 what = "character",
                 comment.char = ";")

head(positive)
head(negative)

senti_analysis <- unlist(clean_data7)
match(senti_analysis, positive)

match(senti_analysis, negative)

p_score <- sum(!is.na(match(senti_analysis,positive)))
p_score

n_score <- sum(!is.na(match(senti_analysis,negative)))
n_score

sentiment_score <- p_score - n_score
sentiment_score
