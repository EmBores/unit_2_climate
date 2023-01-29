#EB 2023-01-26
#logical, boolean, if/else

vec=c(1,0,2,1)
vec
vec[c(TRUE, FALSE, TRUE, FALSE)] #true gives you those vectors, false does not

#practice logical operators
1>2
1 > c(0,1,2)
c(1,2,3)== c(3,2,1)
1 %in% c(1,2,3)
c(1,3,5,7) %in% c(1,2,3)


world_oceans= data.frame(ocean= c("Atlantic", "Pacific", "Indian", "Arctic", "Southern"),
                         area_km2= c(77e6, 156e6, 69e6, 14e6, 20e6),
                         avg_depth_m= c(3926, 4028, 3963,3953, 4500))
world_oceans
world_oceans$avg_depth_m > 4000
deep_oceans= world_oceans [world_oceans$avg_depth_m >4000,]
#grabs section of it based on criteria >4000 rows, nothing (all columns)
deep_oceans

deep_oceans= world_oceans$ocean[world_oceans$avg_depth_m >4000]
deep_oceans
sum(world_oceans$avg_depth_m >4000) #coerces true and falses into 1s and 0s

#imprecise numerics
1+2==3
0.1 +0.2 == 0.3 #binary numbers of 0.1 and 0.2 don't EXACTLY add to equal 0.3
0.3-(0.1+0.2) #if you're comparing things they need to be exactly equal
my_error= 0.001
abs(0.3- (0.1+0.2)) > my_error


#boolean operators

x=5
x
x>3 & x<15
x>2 & <9 #returns and error as x is not included- needs to be x<9
x<3 | x >15  #| means or so if one of those was true it would return a true
x<10 | x %in% c(1,2,3)

world_oceans
#subset
world_oceans[world_oceans$avg_depth_m >4000 | world_oceans$area_km2 <50e6,]



z= c(TRUE, FALSE, FALSE)
any(z) #are any of them true?
all(z) # are all of them true?

#handling missing data NA

NA == NA
is.na(NA)
vec= c(0,1,2,NA,4)
is.na(vec)
any (is.na(vec)) #is any of those trues? Yes there is NA in the data



############################
# starting if/else statements (section 2.3)
############################

a=54
b=63

if(a>b){
  print("you won")
} else if (a <b){
    print ("you lost")
} else{
  print("you tied")
}

#ifelse(0)


#exercise 3.1

temp= 100

if(temp > 98.6){
  print("you have a high fever")
  diff = temp-98.6
  print(diff)
}if(temp>101){
  print("you have a high fever")   
  }
    

    
#exercise 3.2

n_donuts= 10

if(n_donuts==12){
  print("dad bought a dozen donuts")
}else if(n_donuts==13){
  print("dad bough a baker's dozen")
}else if (n_donuts > 13){
  print("Dad bought more than a baker's dozen")
}else if (n_donuts <12){
  print("dad bought less than a dozen")
}


a = c(0, 1, 2, -4, 5)
reciprocals = ifelse(a != 0, 1/a, NA)
cbind(a, reciprocals)


# exercise 3.3

data = c(1,3,5,-999,2,-999,8)

reciprocals= ifelse(data)





 
