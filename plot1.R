# June 2015
# This script was written for Johns Hopkins University Coursera "Exploratory 
# Data Analysis" course

# This script reads data and graphs it, as specified in the assignment instructions

# Data description from assignment instructions:

# This assignment uses data from the UC Irvine Machine Learning Repository, a 
# popular repository for machine learning datasets. In particular, we will be 
# using the “Individual household electric power consumption Data Set” which I 
# have made available on the course web site:

# Dataset: Electric power consumption [20Mb]
# Description: Measurements of electric power consumption in one household with 
# a one-minute sampling rate over a period of almost 4 years. Different 
# electrical quantities and some sub-metering values are available.

# The following descriptions of the 9 variables in the dataset are taken from 
# the UCI web site:
     
# 1.  Date: Date in format dd/mm/yyyy
# 2.  Time: time in format hh:mm:ss
# 3.  Global_active_power: household global minute-averaged active power (in kilowatt)
# 4.  Global_reactive_power: household global minute-averaged reactive power (in kilowatt)
# 5.  Voltage: minute-averaged voltage (in volt)
# 6.  Global_intensity: household global minute-averaged current intensity (in ampere)
# 7.  Sub_metering_1: energy sub-metering No. 1 (in watt-hour of active energy). 
#         It corresponds to the kitchen, containing mainly a dishwasher, an oven 
#         and a microwave (hot plates are not electric but gas powered).
# 8.  Sub_metering_2: energy sub-metering No. 2 (in watt-hour of active energy). 
#         It corresponds to the laundry room, containing a washing-machine, a tumble-drier, 
#         a refrigerator and a light.
# 9.  Sub_metering_3: energy sub-metering No. 3 (in watt-hour of active energy). 
#         It corresponds to an electric water-heater and an air-conditioner.

alldata = read.csv2("household_power_consumption.txt", header = T, as.is = TRUE)

# subsets data to include only two dates, as specified in assignment instructions
data = alldata[alldata[ , 1] == "1/2/2007" | alldata[ , 1] == "2/2/2007", ]

# adds a column and converts date and time into a single variable
data[ , dim(data)[2] + 1] = as.POSIXct(paste(data[ , 1], data[ , 2]), 
                                       format = "%d/%m/%Y %H:%M:%S")
colnames(data)[dim(data)[2]] = "datetime"

# plots histogram of 'global active power' variable
png(file = "plot1.png", width = 480, height = 480)
hist(as.numeric(data[ , 3]), col = "red", main = "Global Active Power", xlab = 
          "Global Active Power (kilowatts)")
dev.off()
