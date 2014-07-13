#
# Creates plot 3
#

source("./utilities.R")

plot3 <- function(save = TRUE){
  plot(two.days$datetime, two.days$sub.metering.1, 
       type = "l", 
       main = "", 
       xlab = "", 
       ylab = "Energy sub metering")
  lines(two.days$datetime, two.days$sub.metering.2, col = "red")
  lines(two.days$datetime, two.days$sub.metering.3, col = "blue")
  
  par(ps = 16)
  legend("topright", lty= 1, cex = 0.7, y.intersp = 0.8, 
         legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
         col = c("black", "red", "blue"))
  
  if(save){
    # save as a 480x480 png named plot3.png
    dev.copy(png, file = "output/plot3.png", width = 480, height = 480)
    dev.off()
  }
}

two.days <- get.days()
plot3()
