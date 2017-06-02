
#R workshop- Intro
#Pondi Brian
#2017 - 02-05

age <- c(18,21,30,31,10,37)

sex <-c("M","F","M","M","F","M")


is(age)
is(sex)
data_base <- data.frame(age,sex)

mean(age)
sd(age)

#HELP IN R

?aov

## Set orthogonal contrasts.
op <- options(contrasts = c("contr.helmert", "contr.poly"))
( npk.aov <- aov(yield ~ block + N*P*K, npk) )
summary(npk.aov)
coefficients(npk.aov)

help.search("Anova")

#INSTALL PACKAGES

install.packages("plyr")


#LIST

ls_obj <- list(age, data_base)

ls_obj[[1]]

ls_obj[[2]]

#For dataframe
data_base[4, ]#call a row
data_base[,2]# a column

data_base[3,1]

data_extr <- data_base[1:3,]

getwd()#Workspace
setwd("C:/Users/Bpondi/Desktop/R_Workshop")
getwd()

#READ A DATASET
maize_dataset <- read.csv("Regression_Methods/tolima_maiz_csm_2016.csv")

##read.csv(choose.files()) Option 2

summary(maize_dataset)
str(maize_dataset)
head(maize_dataset)
head(maize_dataset,10)
tail(maize_dataset)
tail(maize_dataset,10)

#rm(maize_dataset)

#HISTOGRAM

hist(maize_dataset$RDT, main ="Maize - Colombia",
     xlab="yield (kg/ha)",
     col="green")
plot(maize_dataset$Sol_Ener_Accu_Mad, maize_dataset$RDT, 
     main ="Solar Energy vs Yield",
     xlab="solar Energy",
     ylab="yield",
     col="red")

library(ggplot2)
ggplot(maize_dataset,aes(x=split,y=RDT))+geom_boxplot(fill="red") + xlab("yield kg/ha")+
  theme_bw() + theme_classic()

#Boxplot
ggplot(maize_dataset, aes(x=TIPO_MATERIAL, y=RDT))+
  geom_boxplot()+facet_grid(DRENAJE~.)

#Histogram
ggplot(maize_dataset,aes(x=RDT, fill=TIPO_MATERIAL))+geom_histogram()+
  xlab("Yield (Kg/Ha)") + ylab("Frequency") + theme_bw()

#S
ggplot(maize_dataset, aes(x=RDT, y=TotN))+
  geom_point(aes(colour=split))+geom_smooth()+facet_grid(DRENAJE~TIPO_MATERIAL)+theme_bw()


#Save a dataset
data_base$income <- c (12000,15000,30000,40000,0,18000)

write.csv(data_base,"population.csv")
