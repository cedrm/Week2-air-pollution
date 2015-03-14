complete <- function(directory,id){

## 'directory' is a character vector of length 1 indicating
## the location of the CSV files
#if(id>0)
#{
directory<-paste(directory,"/",sep="")
## READ DIRECTORY
fichiers <- list.files(directory,)
file=list() 
indice_list=1 


obs=vector()
## 'id' is an integer vector indicating the monitor ID numbers
## to be used
##READ FOR EACH IDS
for (i in id) { 

#file[[i]]=read.csv(paste(directory,fichiers[i],sep=""),header=TRUE,sep=",")
## STORE VALUES IN LIST() FILE
recup_file_liste=read.csv(paste(directory,fichiers[i],sep=""),header=TRUE,sep=",")
##REMOVE 'NA' VALUES
recup_file<-recup_file_liste
recup_file_cat=complete.cases(recup_file)
recup_file_nona=recup_file[recup_file_cat,]
#STORE COUNTING VALUES FOR EACH IDS 
obs[indice_list] = c(nrow(recup_file_nona))
indice_list = indice_list + 1

}

ret<-data.frame(id=id,nobs=obs)
return(ret)
}
#else
#{
#ret<-data.frame(id=0,nobs=0)
#}

