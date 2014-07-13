#
# Creates plot 1
#

source("./utilities.R")

plot1 <- function(save = TRUE){
  hist(two.days$global.active.power, 
       xlab = "Global Active Power (kilowatts)", 
       main = "Global Active Power", 
       col = "red")
  
  if(save){
    # save as a 480x480 png named plot1.png
    dev.copy(png, file = "output/plot1.png", width = 480, height = 480)
    dev.off()
  }
}

two.days <- get.days()
plot1()
