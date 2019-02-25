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

grafico9 <- ggplot(Datosblog, aes(x=age,fill=topic)) + geom_bar() + labs(title="Topics by age")
grafico9

AGE <- table(Datosblog$age)
head(AGE)
min(AGE)
max(AGE)

barplot(AGE, col= "cyan3", main= "Dispercion de edades", cex.axis = 0.5, cex.main=1.5, font.main=2, font.axis=4,font.lab=4 , xlab = "Edad", ylab = "Cantidad")

TOPIC <- table(Datosblog$topic)
head(TOPIC)
min(TOPIC)
max(TOPIC)

barplot(TOPIC)

Copia.datos <- Datosblog
mean(Datosblog$age)
median(Datosblog$age)
rangos <- split(Copia.datos, cut(Copia.datos$age, c(13, 20, 27, 34, 41, 48), include.lowest = TRUE ))
rangos
length(rangos$`(41,48]`)
dim(rangos$`(41,48]`)
T1 <- summary(rangos$`[13,20]`)
T2 <- summary(rangos$`(20,27]`)
T3 <- summary(rangos$`(27,34]`)
T4 <- summary(rangos$`(34,41]`)
T5 <- summary(rangos$`(41,48]`)

sink("output.txt")
print(T1)
print(T2)
print(T3)
print(T4)
print(T5)
sink()


grafico3 <- ggplot(rangos$`[13,20]`, aes(x="",fill=topic)) + geom_bar() + labs(x=NULL, y=NULL, fill=NULL, title="Topics by age-range") + coord_polar("y") + guide_legend(reverse = TRUE)+ theme(axis.line = element_blank(), axis.text= element_blank(), axis.ticks= element_blank())
grafico3

Topics1 <- c("Student","indUnk","Technology","Arts","Non-Profit","Education","Other")
Entries1 <- c(94976, 64521, 5411, 5006, 4989, 4984, 15281)
Porcentage1 <- (Entries1/195168)*100
Rango13_20 <- data.frame(Topics1=Topics1,Entries1=Entries1,Porcentage1=Porcentage1)
Rango13_20


Topics2 <- c("Student","indUnk","Technology","Arts","Communication-Media","Education","Other")
Entries2 <- c(31277, 99026, 22712, 18292, 11511, 13235, 79455)
Porcentage2 <- (Entries2/275508)*100
Rango20_27 <- data.frame(Topics2=Topics2,Entries2=Entries2,Porcentage2=Porcentage2)
Rango20_27


Topics3 <- c("indUnk","Technology","Arts","Internet","Publishing","Education","Other")
Entries3 <- c(16325, 1366, 1416, 2424, 1654, 2742, 6259)
Porcentage3 <- (Entries3/32186)*100
Rango27_34 <- data.frame(Topics3=Topics3,Entries3=Entries3,Porcentage3=Porcentage3)
Rango27_34


Topics4 <- c("indUnk","Technology","Arts","Fashion","Communication-Media","Education","Other")
Entries4 <- c(24017, 6098, 2903, 2754, 2282, 2486, 13574)
Porcentage4 <- (Entries4/54114)*100
Rango34_41 <- data.frame(Topics4=Topics4,Entries4=Entries4,Porcentage4=Porcentage4)
Rango34_41


Topics5 <- c("indUnk","Accounting","Technology","Consulting","Publishing","Education","Other")
Entries5 <- c(7060, 1060, 758, 757, 863, 1778, 5878)
Porcentage5 <- (Entries5/18154)*100
Rango41_48 <- data.frame(Topics5=Topics5,Entries5=Entries5,Porcentage5=Porcentage5)
Rango41_48

grafico4 <- ggplot(rangos$`[13,20]`, aes(x="",fill=topic)) + geom_bar() + labs(x=NULL, y="(13-20)", fill=NULL, title="Topics by age-range") + theme(axis.line = element_blank(), axis.text= element_blank()) + coord_polar("y") + theme(axis.line = element_blank(), axis.text= element_blank(), axis.ticks= element_blank())
grafico4

pie(Entries3, labels=Porcentage3, main="Temas para rango de edad 13-20", col=c("cadetblue3","chartreuse3","chocolate2","coral2","cyan3","darkgoldenrod2","firebrick3")) 

grafico5 <- ggplot(rangos$`(20,27]`, aes(x="",fill=topic)) + geom_bar() + labs(x=NULL, y="(20-27)", fill=NULL, title="Topics by age-range") + theme(axis.line = element_blank(), axis.text= element_blank()) + coord_polar("y") + theme(axis.line = element_blank(), axis.text= element_blank(), axis.ticks= element_blank())
grafico5

grafico6 <- ggplot(rangos$`(27,34]`, aes(x="",fill=topic)) + geom_bar() + labs(x=NULL, y="(27-34)", fill=NULL, title="Topics by age-range") + theme(axis.line = element_blank(), axis.text= element_blank()) + coord_polar("y") + theme(axis.line = element_blank(), axis.text= element_blank(), axis.ticks= element_blank())
grafico6

grafico7 <- ggplot(rangos$`(34,41]`, aes(x="",fill=topic)) + geom_bar() + labs(x=NULL, y="(34-41)", fill=NULL, title="Topics by age-range") + theme(axis.line = element_blank(), axis.text= element_blank()) + coord_polar("y") + theme(axis.line = element_blank(), axis.text= element_blank(), axis.ticks= element_blank())
grafico7

grafico8 <- ggplot(rangos$`(41,48]`, aes(x="",fill=topic)) + geom_bar() + labs(x=NULL, y="(41-48)", fill=NULL, title="Topics by age-range") + theme(axis.line = element_blank(), axis.text= element_blank()) + coord_polar("y") + theme(axis.line = element_blank(), axis.text= element_blank(), axis.ticks= element_blank())
grafico8

sink("output2.txt")
print(Rango13_20)
print(Rango20_27)
print(Rango27_34)
print(Rango34_41)
print(Rango41_48)
sink()


grafico10 <- ggplot(Datosblog, aes(x=topic,fill=gender)) + geom_bar() + labs(title="Topics by gender") + coord_flip()
grafico10

grafico11 <- ggplot(Datosblog, aes(x=as.factor(age),fill=gender)) + geom_bar() + labs(title="Age and gender") 
grafico11

grafico22 <- ggplot(rangos$`(27,34]`, aes(x=topic,fill=gender)) + geom_bar() + labs(x=NULL, y="(13-20)", fill=NULL, title="Topics by gender") + theme(axis.line = element_blank(), axis.text= element_blank()) + theme(axis.line = element_blank(), axis.text= element_blank(), axis.ticks= element_blank())
grafico22

grafico23 <- ggplot(rangos$`[13,20]`, aes(x=topic,fill=gender)) + geom_bar() + labs(x=NULL, y="(13-20)", fill=NULL, title="Topics by gender") + theme(axis.line = element_blank(), axis.text= element_blank()) + theme(axis.line = element_blank(), axis.text= element_blank(), axis.ticks= element_blank())
grafico23
