#EB
#2023-01-24
# Ice mass loss over poles

ant_ice_loss= read.table(file="data/antarctica_mass_200204_202209.txt", skip=31, sep="", header=FALSE, 
           col.names=c("decimal_date", "mass_Gt", "sigma_Gt")) 
#used "skip" to skip the first 31 lines in the data package, 32 starts the data
#sep "" indicates data is separated by space


typeof(ant_ice_loss)
class(ant_ice_loss)
dim(ant_ice_loss)
View(ant_ice_loss)


grn_ice_loss= read.table(file="data/greenland_mass_200204_202209.txt", skip=31, sep="", header=FALSE, 
                         col.names=c("decimal_date", "mass_Gt", "sigma_Gt"))

head(grn_ice_loss) #shows first 6 rows of data frame
tail(grn_ice_loss) #shows last 6 rows of data frame
summary(ant_ice_loss)

#plot it!!
plot(x=ant_ice_loss$decimal_date, y=ant_ice_loss$mass_Gt, type="l", xlab="Year", ylab= "Antarctic ice loss (Gt)")
lines(mass_Gt~decimal_date,data=grn_ice_loss, col="red")

#type "l" for line "p" for point

#Add data break between Grace missions
# data break to include missing dating from 2018

data_break= data.frame(decimal_date=2018.0, mass_Gt=NA, sigma_Gt=NA)

#insert data break into ice loss dataframes using rbind
ant_ice_loss_with_NA=rbind(ant_ice_loss, data_break)
grn_ice_loss_with_NA=rbind(grn_ice_loss, data_break)

order(ant_ice_loss_with_NA$decimal_date)
ant_ice_loss_with_NA= ant_ice_loss_with_NA[order(ant_ice_loss_with_NA$decimal_date),]
dim(ant_ice_loss_with_NA)
tail(ant_ice_loss_with_NA)

order(grn_ice_loss_with_NA$decimal_date)
grn_ice_loss_with_NA= grn_ice_loss_with_NA[order(grn_ice_loss_with_NA$decimal_date),]

plot(x=ant_ice_loss_with_NA$decimal_date, y=ant_ice_loss_with_NA$mass_Gt, type="l", xlab="Year", ylab= "Antarctic ice loss (Gt),
     ylim=range(grn_ice_loss$mass_GT")
lines(mass_Gt~decimal_date,data=grn_ice_loss_with_NA, col="red")

head(ant_ice_loss_with_NA)
pdf('figures/ice_mass_trends.pdf', width=7, height=5)
plot(x=ant_ice_loss_with_NA$decimal_date, y=ant_ice_loss_with_NA$mass_Gt, type="l", xlab="Year", ylab= "Antarctic ice loss (Gt),
     ylim=range(grn_ice_loss$mass_GT")
lines((mass_Gt + 2*sigma_Gt) ~ decimal_date, data=ant_ice_loss_with_NA, lty="dashed")
lines((mass_Gt - 2*sigma_Gt) ~ decimal_date, data=ant_ice_loss_with_NA, lty="dashed")
dev.off()

# Bar plot of total ice loss

tot_ice_loss_ant=min(ant_ice_loss_with_NA$mass_Gt, na.rm=T)- max(ant_ice_loss_with_NA$mass_Gt, na.rm=T)
tot_ice_loss_ant
tot_ice_loss_grn=min(grn_ice_loss_with_NA$mass_Gt, na.rm=T)- max(grn_ice_loss_with_NA$mass_Gt, na.rm=T)
tot_ice_loss_grn

barplot(height=-1*c(tot_ice_loss_ant, tot_ice_loss_grn), 
        names.arg=c("Antarctica", "Greenland"))

        