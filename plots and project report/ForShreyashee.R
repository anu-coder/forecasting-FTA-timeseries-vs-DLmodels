# Reading Tourism data 
tourism.data=readxl::read_xlsx("Tourism_new.xlsx")

# Check the Dimension
dim(tourism.data)

# Check the Structure 
str(tourism.data)

# Creating a ts(time series) object.
# Monthly Seasonality (frequency set to 12 for monthly data)
# data starts from march 1987, so start set to c(1987,3)
tourism <- ts(tourism.data[,2],start= c(1987, 3),frequency=12)
tourism

# Checking total number of years
2020-03 - 1988-03	

# Taking 23 years for training data : 1988-Mar to 2017-Mar
# Delimit training range̥
tourism.train <- window(tourism, end= c(2017,03))
tourism.train

# 3 years of data for testing: Mar 2017-Feb 2020
# Delimit testing range
# Not keeping the march month as it is affcted by corona and can impact the RMSE (accuracy) later. 
tourism.test <- window(tourism, start=c(2017,03), end = c(2020,02))
tourism.test

# Plot the training and testing. 
# run together. 
plot(tourism,main="Tourist Arrival 1988-2017",ylab="Tourist arrival",xlab="Years")
lines(tourism.train,col="blue")
lines(tourism.test,col="green")
legend("bottomright",col=c("blue","green"),lty=1,legend=c("Training","Testing"))

