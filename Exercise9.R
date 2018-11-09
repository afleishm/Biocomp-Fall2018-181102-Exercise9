rm(list=ls()) #remove global environment
setwd("/Users/Ashley/Documents/Biocomputing_2018/Biocomp-Fall2018-181102-Exercise9")

#1
SAT = read.csv("SAT.csv", header = TRUE) #Import SAT score data 
SAT

plot(SAT, type = "p") #Create scatterplot of data
abline(lm(Math.SAT.Score~GPA, data = SAT)) #Create trendline of scatterplot

#2
data=read.csv("data.txt", header = TRUE) #Import given data
data

north = c() #Create empty vectors for each of the directions (these will be the bars later)
south = c()
east = c()
west = c()

#Attaching observation data to the appropriate vector
for (i in 1:nrow(data)) {
  if (data[i,1] == "north") {
    north = rbind(north, data[i,2])
  } else if (data[i,1] == "south") {
    south = rbind(south, data[i,2])
  } else if (data[i,1] == "east") {
    east = rbind(east, data[i,2])
  } else {
    west = rbind(west, data[i,2])
  }
}

#Finding the mean of each bar data
mean.north = sum(north)/length(north)
mean.south = sum(south)/length(south)
mean.east = sum(east)/length(east)
mean.west = sum(west)/length(west)

bars = c(mean.north, mean.south, mean.east, mean.west) #Creates vector of all the means
dir = c("North", "South", "East", "West") #Creates vector of all the direction names

barplot(bars, names.arg=dir, xlab = "Location" , ylab = "Mean of Observations", col = "blue") #Creates bargraph

data2 = data.frame(data)

ggplot(data2, aes(as.factor(region),observations)) + geom_point() #Creates plot of observations

#They DO tell different stories. The bar plot is nearly level, showing that all the means are nearly equal. 
#However, the scatter plot shows that although the means are similar, the data itself varies drastically.

