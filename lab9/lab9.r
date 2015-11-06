require(graphics)
mosaicplot(Titanic, main = "Survival on the Titanic")
apply(Titanic, c(3,4),sum)
apply(Titanic, c(2,4),sum)

inspect(rules.all)
str(Titanic)
df <- as.data.frame(Titanic)
head(df)
titanic.raw <- NULL

for(i in 1:5){titanic.raw <- cbind(titanic.raw, rep(as.character(df[,i]), df$Freq))}
titanic.raw <- as.data.frame(titanic.raw)
names(titanic.raw) <- names(df)[1:5]
dim(titanic.raw)
str(titanic.raw)
head(titanic.raw)
summary(titanic.raw)

library(arules)
rules.all <- apriori(titanic.raw)
rules.all
inspect(rules.all)
rules <- apriori(titanic.raw, control = list(verbose=F), parameter = list(minlen=2, supp=0.005, conf=0.8),appearance = list(rhs=c("Survived=No", "Survived=Yes"), default="lhs"))
quality(rules) <- round(quality(rules), digit=3)
rules.sorted <- sort(rules, by="lift")
inspect(rules.sorted)
library(arulesViz)
plot(rules.all, method="grouped")

