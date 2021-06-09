library(ggplot2)
progress <- read.delim("data/progress",
                       header=F,
                       col.names=c("date",
                                   "words",
                                   "lines",
                                   "paragraphs",
                                   "comments"))
progress$date <- as.Date(progress$date)

png("image/words.png")
ggplot(progress, aes(x=date, y=words, ymin=0)) + geom_point() + geom_line()
dev.off()

png("image/lines.png")
ggplot(progress, aes(x=date, y=lines, ymin=0)) + geom_point() + geom_line()
dev.off()

png("image/paragraphs.png")
ggplot(progress, aes(x=date, y=paragraphs, ymin=0)) + geom_point() + geom_line()
dev.off()

png("image/comments.png")
ggplot(progress, aes(x=date, y=comments, ymin=0)) + geom_point() + geom_line()
dev.off()
