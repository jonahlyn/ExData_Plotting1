#
# Creates plot 4
#

source("./utilities.R")

plot4 <- function(save = TRUE){
  par(mfcol = c(2,2), mar = c(5, 5, 2, 1))
  
  # plot2
  plot(two.days$datetime, two.days$global.active.power, 
       type = "l", 
       main = "", 
       xlab = "", 
       ylab = "Global Active Power")
  
  
  # plot3
  plot(two.days$datetime, two.days$sub.metering.1, 
       type = "l", 
       main = "", 
       xlab = "", 
       ylab = "Energy sub metering")
  lines(two.days$datetime, two.days$sub.metering.2, col = "red")
  lines(two.days$datetime, two.days$sub.metering.3, col = "blue")
  
  par(ps = 16)
  legend("topright", lty= 1, bty = "n", cex = 0.7, y.intersp = 0.8, 
         legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
         col = c("black", "red", "blue"))
  
  # plot4
  plot(two.days$datetime, two.days$voltage, xlab = "datetime", ylab = "Voltage", type = "l")
  
  # plot5
  plot(two.days$datetime, two.days$global.reactive.power, xlab = "datetime", ylab = "Global_reactive_power", type = "l")
  
  if(save){
    dev.copy(png, file = "output/plot4.png", width = 480, height = 480)
    dev.off()
  }
}

two.days <- get.days()
plot4()
