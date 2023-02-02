#EBores
#class notes 2023-02-02

library("lubridate")

#practice while loops

x=10
while (x>0){
  x=x-1
  print(x)
}

#fishing game
#while it's less than 50lbs, I'm going to keep fishing
total_catch_lb=0
n_fish=0
while(total_catch_lb < 50){
 n_fish= n_fish +1
 new_fish_weight= rnorm(n=1, mean=2, sd=1)
 total_catch_lb= total_catch_lb + new_fish_weight
}

n_fish
total_catch_lb

#arctic sea ice extent

url = 'ftp://sidads.colorado.edu/DATASETS/NOAA/G02135/north/daily/data/N_seaice_extent_daily_v3.0.csv'
arctic_ice = read.delim(url, 
                        skip=2, 
                        sep=",", 
                        header=FALSE, 
                        col.names = c("Year", "Month", "Day", "Extent",
                                  "Missing", "Source_Data"))

head(arctic_ice)
arctic_ice$date= make_date(year=arctic_ice$Year, 
                           month=arctic_ice$Month, 
                           day=arctic_ice$Day)

head(arctic_ice)
plot(Extent~date,data=arctic_ice, type="l",
     ylab="Arctice sea ice extent (x10^6 km^2")

#creating annual average

tail(arctic_ice)
#initialize results data frame
arctic_ice_averages= data.frame(Year=seq(min(arctic_ice$Year)+1, max(arctic_ice$Year)-1), extent_annual_avg= NA,
                                extent_5yr_avg= NA)
arctic_ice_averages
head(arctic_ice_averages)
mean(arctic_ice$Extent[arctic_ice$Year==1979])

seq(dim(arctic_ice_averages)[1]) #44 rows 3 columns [1] just the rows

for(i in seq(dim(arctic_ice_averages)[1])){
  arctic_ice_averages$extent_annual_avg[i]= mean(arctic_ice$Extent[arctic_ice$Year==arctic_ice_averages$Year[i]])
}

head(arctic_ice_averages)


plot(extent_annual_avg~Year, data=arctic_ice_averages, type="l")


# 5 year average ice extent
#define 5 year average- here it is 2 years before and 2 years after
dim(arctic_ice_averages)[1]-2

i=42

for(i in seq(from=3, to=dim(arctic_ice_averages)[1]-2)){
  years= seq(arctic_ice_averages$Year[i]-2, arctic_ice_averages$Year[i]+2)
  arctic_ice_averages$extent_5yr_avg[i]= mean(arctic_ice$Extent[arctic_ice$Year %in% years])
}

head(arctic_ice_averages)
tail(arctic_ice_averages)


arctic_ice_averages$date= make_date(year=arctic_ice_averages$Year, month=7, day=1)
head(arctic_ice_averages)


plot(Extent~date,data=arctic_ice, type="l",
     ylab="Arctice sea ice extent (x10^6 km^2")
lines(extent_annual_avg~date, data=arctic_ice_averages, type="l", col="blue") +
  lines(x=arctic_ice_averages$date, y=arctic_ice_averages$extent_5yr_avg, col="red")
















