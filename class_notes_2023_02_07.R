#2023-02-07
#EMB

#user-defined function

x=c(1,2,3)

#allow user to switch between arithmetic and geometric means
avg= function(x, arithmetic=TRUE){
  if(!is.numeric(x)){
    stop("x must be numeric")
  }
  n= length(x)
  result= ifelse(arithmetic, sum(x)/n, prod(x)^(1/n))
  return(result)
}

dat=c(1,3,5,7)
avg(FALSE, dat)

#Exercise 7.1

letter= function(grade){
  if(grade>=90){
    return("A")
  }else if (grade>=80){
    return("B")
  }else if (grade >=70){
    return("C")
  }else if (grade >=60){
    return("D")
  }else{
    return("F")
  }
}
  
letter(99)


###############
##Analyze global temps
###############


url= 'https://data.giss.nasa.gov/gistemp/graphs/graph_data/Global_Mean_Estimates_based_on_Land_and_Ocean_Data/graph.txt'


temp_anomaly= read.delim(url,
                         skip=5,
                         sep="",
                         header=FALSE,
                         col.names=c("Year", "No_Smoothing", "Lowess_5"))

head(temp_anomaly)
class(temp_anomaly)
tail(temp_anomaly)

temp1998= temp_anomaly$No_Smoothing[temp_anomaly$Year==1998]
temp2012= temp_anomaly$No_Smoothing[temp_anomaly$Year==2012]

plot(No_Smoothing~Year, data=temp_anomaly, type="b", ylab="Global temp anomaly")+
  lines(Lowess_5~ Year, data=temp_anomaly, col="red", lwd=2)
  abline(v=1998, lty="dashed") +
  abline(v=2012, lty="dashed") +
  lines(c(temp1998, temp2012)~c(1998, 2012), col="blue", lwd=2.5)

calc_rolling_avg= function(data, moving_window=5){
  result= rep(NA, length(data))
  for(i in seq(from=moving_window, to=length(data))){
    result[i]= mean(data[seq(from=(i-moving_window+1), to=i)])
  }
  return(result)
  
}  

temp_anomaly$avg_5_yr= calc_rolling_avg(data=temp_anomaly$No_Smoothing, moving_window=5)
temp_anomaly$avg_10_yr= calc_rolling_avg(data=temp_anomaly$No_Smoothing, moving_window=10)
head(temp_anomaly)
tail(temp_anomaly)

plot(No_Smoothing~Year, data=temp_anomaly, type="b", ylab="Global temp anomaly")+
  lines(avg_5_yr~ Year, data=temp_anomaly, col="red", lwd=2)
  lines(avg_10_yr ~Year, data=temp_anomaly, col="blue", lwd=2)

