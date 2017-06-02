
#Processing Data with R
#Pondi Brian

library(plyr)

setwd("C:/Users/Bpondi/Desktop/R_Workshop")

fertilizers <- read.csv("fertilizations_amount.csv")

summary(fertilizers)

long_fertilizers <- reshape(fertilizers, idvar = "id_event", varying = list(2:7,8:13,14:19),
        v.names = c("n_amount","p_amount","k_amount"),direction = "long")

long_fertilizers <- long_fertilizers[complete.cases(long_fertilizers),]
#long_fertilizers <- na.omit(long_fertilizers)

long_fertilizers

new_fertilizers <- ddply(long_fertilizers,~id_event, summarise, accumm_N = sum(n_amount),
      accumm_p = sum(p_amount), accum_k = sum(k_amount), freqFert = length(n_amount))

yield <- read.csv("yield_inf.csv")

completeDataset <-merge(yield, new_fertilizers, by.x = "id", by.y = "id_event", all.x = T, all.y =  T)

summary(completeDataset)

write.csv(completeDataset, "completeDataset.csv")

