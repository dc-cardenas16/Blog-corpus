##Directorio##
getwd()
Datosblog <- read.csv("blogtext.csv",header=TRUE, sep=",")
names(Datosblog)
Datosblog$text <- NULL
names(Datosblog)
head(Datosblog)
ID <- table(Datosblog$id)
head(ID)

##Instalacion de ggplot para graficas ##
install.packages("ggplot2")
library(ggplot2)
grafico1 <- ggplot(data=ID)+ geom_bar(mapping=aes(x=id))+ xlab("ID")
grafico1 <- ggplot(ID) + geom_bar(stat="identity")
grafico1 <- ggplot(ID) + geom_bar()
grafico1 <- barplot(ID)
install.packages("plotly")
grafico2 <- ggplot(Datosblog, aes(x=topic,fill=as.factor(age))) + geom_bar() + coord_flip() + labs(title="Topics by age")
grafico2
AGE <- table(Datosblog$age)
head(AGE)
min(AGE)
max(AGE)
grafico3 <- barplot(AGE)
TOPIC <- table(Datosblog$topic)
head(TOPIC)
min(TOPIC)
max(TOPIC)
grafico4 <- barplot(TOPIC)
Copia.datos <- Datosblog
mean(Datosblog$age)
median(Datosblog$age)
