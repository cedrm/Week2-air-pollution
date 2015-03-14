pollutantmean <- function(directory,polluant,id=0){

## 'pollutant' is a character vector of length 1 indicating
## the name of the pollutant for which we will calculate the
## mean; either "sulfate" or "nitrate".
concat_tab = c()

cc<-polluant
directory<-paste(directory,"/",sep="")
## 'directory' is a character vector of length 1 indicating
## the location of the CSV files 
## READ DIRECTORY
fichiers <- list.files(directory,)
file=list() 

if(id == 0)
{
id = 1:length(fichiers)
}

## 'id' is an integer vector indicating the monitor ID numbers
## to be used
## READ FILES CSV IN DIRECTORY
for (i in id) { 

## STORE VALUES IN LIST() FILE
file[[i]]=read.csv(paste(directory,fichiers[i],sep=""),header=TRUE,sep=",")

}


sumformoy = 0
concat_tab = c()

##REMOVE 'NA' VALUES
##FOR EACH LIST VALUES
for (i in id) {

	##STORE FOR PROCESS
	recup_file_liste<-file[[i]]
	##FILTER POLLUANT
	recup_file_sulfate<-recup_file_liste[cc]
	
	##REMOVE 'NA' VALUES
	recup_file_cat=complete.cases(recup_file_sulfate)
	recup_file_nona=recup_file_sulfate[recup_file_cat,]
	
	#STORE VALUES WITH NO 'NA' VALUES 
	concat_tab = c(concat_tab,recup_file_nona)
} 

## Return the mean of the pollutant across all monitors list
## in the 'id' vector (ignoring NA values)
## RETURN MEAN

return(round(mean(concat_tab), digits = 3))
}


