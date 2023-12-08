
library(readr)
virus <- read_csv("question-5-data/Cui_etal2014.csv") 
View(virus)

library(dplyr)
virus2 = select(virus, -1:-9, -11, -13)
virus2

virus3 <- log(virus2)

ggplot(virus3, aes(x=length, y=Vol))+
  geom_point()+
  labs(x = "Genome length (kb)", y = "Virion volume (nmxnmxnm)")

model1 <- lm(Vol ~ length, data=virus3)
summary(model1)

#interpreted as logV = alphalogL + logbeta

##code for reproducing figure in part 4 of assignment

ggplot(virus3, aes(x=length, y=Vol))+
  geom_point()+
  geom_smooth(method = "lm")+
  labs(x = "log[Genome length (kb)]", y = "log[Virion volume (nm^3)")+
  theme_bw()+
  theme(axis.title.x = element_text(face="bold"), axis.title.y = element_text(face = "bold"))

sink(file = "package-versions.txt")
sessionInfo()
sink()

