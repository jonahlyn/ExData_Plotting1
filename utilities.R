# Utilities for creating plots
##############################


# Prepare an output directory
if(!file.exists("output")){ dir.create("output") }


#
# Creates a data directory if needed and stores the raw data.
#
ret.data <- function(){
  # Create a data directory if needed and set it as the working directory
  if(!file.exists("data")){ dir.create("data") }
  setwd("data")
  
  # Check for the data file
  if(!file.exists("household_power_consumption.txt")){
    
    # Check for the compressed data file and download if necessary
    zipfile = "exdata-data-household_power_consumption.zip"
    if(!file.exists(zipfile)){
      download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", zipfile, method="curl")
    }
    
    # Decompress the file
    unzip(zipfile, exdir = ".")
  }
  
  # Reset the working directory to the parent
  setwd("..")
}


#
# Cleans the data and returns a data frame.
#
get.data <- function(){
  library(dplyr)
  
  # The file is ';' delimited so read it in using the csv2 function.
  # Wrap the data frame in tbl_df to make it easier to deal with.
  datafile <- "data/household_power_consumption.txt"
  power.data <- tbl_df(read.csv2(datafile, stringsAsFactors = FALSE, na.strings = "?"))
  
  # Clean up the column names a bit.
  colnames(power.data) <- gsub("_", ".", tolower(colnames(power.data)))
  
  # Remove incomplete data
  power.data <- power.data[complete.cases(power.data),]
  
  # Convert columns to the correct type
  power.data$global.active.power   <- as.numeric(power.data$global.active.power)
  power.data$global.reactive.power <- as.numeric(power.data$global.reactive.power)
  power.data$voltage               <- as.numeric(power.data$voltage)
  power.data$global.intensity      <- as.numeric(power.data$global.intensity)
  power.data$sub.metering.1        <- as.numeric(power.data$sub.metering.1)
  power.data$sub.metering.2        <- as.numeric(power.data$sub.metering.2)
  power.data$sub.metering.3        <- as.numeric(power.data$sub.metering.3)
  
  # Add a datetime column
  power.data$datetime <- strptime(paste(power.data$date, power.data$time), format = "%d/%m/%Y %H:%M:%S")
  
  # Return the processed data set
  power.data
}


#
# Gets data for requested days
#
get.days <- function(){
  ret.data()
  power.data <- get.data()
  power.data <- power.data[power.data$date %in% c("1/2/2007", "2/2/2007"),]
  power.data
}
