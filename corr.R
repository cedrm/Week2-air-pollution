corr <- function(directory, threshold = 0) {



## 'directory' is a character vector of length 1 indicating
## the location of the CSV files
directory<-paste(directory,"/",sep="")
fichiers <- list.files(directory,)
file=list() 
nb = length(fichiers)

## PROCESSING treshold
tab<-complete(directory,1:nb)
tabseuil<-tab[tab[2] > threshold,]

## NBROW FOR COUNTING
nb2<-nrow(tabseuil)
tab_cor = as.numeric(c())

##TEST 
if(nb2>0)
{
	##
	for(i in 1:nb2)
	{
	## STORE VALUES IN LIST() FILE
	recup_file<-read.csv(paste(directory,fichiers[tabseuil[i,1]],sep=""),header=TRUE,sep=",")
	## REMOVE NA VALUES
	recup_file_cat=complete.cases(recup_file)
	recup_file_nona=recup_file[recup_file_cat,]
	##PROCESS COR
	cc<-cor(recup_file_nona[2],recup_file_nona[3])
	##CONCAT COR
	tab_cor = c(tab_cor,round(cc, digits = 5))
	}
}
return(round(tab_cor,4))

}