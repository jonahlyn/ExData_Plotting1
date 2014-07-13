#
# Creates plot 2
#

source("./utilities.R")

plot2 <- function(save = TRUE){
  plot(two.days$datetime, two.days$global.active.power, 
       type = "l", 
       main = "", 
       xlab = "", 
       ylab = "Global Active Power (kilowatts)")
  
  if(save){
    # save as a 480x480 png named plot2.png
    dev.copy(png, file = "output/plot2.png", width = 480, height = 480)
    dev.off()
  }
}

two.days <- get.days()
plot2()