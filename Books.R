install.packages("arules")
library("arules") # Used for building association rules i.e. apriori algorithm

# Importing the dataset
Books <- read.csv(file.choose())
View(Books)


summary(Books)

# making rules using apriori algorithm 
# Keep changing support and confidence values to obtain different rules

# Building rules using apriori algorithm
rules <- apriori(as.matrix(Books), parameter = list(support = 0.02, confidence = 0.5, minlen = 5))
rules

# Viewing rules based on lift value
inspect(head(sort(rules, by = "lift"))) # to view we use inspect 

# Overal quality 
head(quality(rules))

# install.packages("arueslViz")
library("arulesViz") # for visualizing rules

# Different Ways of Visualizing Rules
plot(rules)

plot(rules,method="two-key plot") # Two-key Plot

plot(rules, method = "grouped")

windows()
plot(rules[1:100], method = "graph") # for good visualization try plotting only few rules

write(rules, file = "Books_Output.csv", sep = ",")

getwd()

