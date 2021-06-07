library(ggplot2)
progress <- read.delim("data/progress",
                       header=F,
                       col.names=c("date",
                                   "words",
                                   "lines",
                                   "paragraphs"))
progress$date <- as.Date(progress$date)

png("image/words.png")
ggplot(progress, aes(x=date, y=words)) + geom_point() + geom_line()
dev.off()

png("image/lines.png")
ggplot(progress, aes(x=date, y=lines)) + geom_point() + geom_line()
dev.off()

png("image/paragraphs.png")
ggplot(progress, aes(x=date, y=paragraphs)) + geom_point() + geom_line()
dev.off()
