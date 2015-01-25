CodeBook <- function() {  
  ## This function writes a CodeBook file for the  Activity Recognition Mean : The
  ## average of each variable measurabled for each physical activity
  ## and each subject or volunteer in the 
  ## “Human Activity Recognition Using Smartphones” experiment
  ##( http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)
  ## 
##1. Reads 'ActivityRecognitionMean.txt' into a R data frame.
rec <- read.table("ActivityRecognitionMean.txt", header = T)

## 2. Writes titles 
write.table("# Activity Recognition Mean - Code Book",
            "CodeBook.md",eol = "\n", row.names = F,col.names = F, quote=F)

write.table("## Data Dictionary", "CodeBook.md",eol = "\n", row.names = F,col.names = F, append =T,quote=F)

## 3. Writes Activity_Name and Subject_Id features
tmp <- paste(names(rec[1]),": Name of physical human activity", "  ",  sep =" ")
write.table(tmp, "CodeBook.md",eol = "\n", row.names = F,col.names = F, append =T,quote=F)
tmp <- paste(levels(rec[,1]), "  ")
write.table(tmp, "CodeBook.md",eol = "\n", row.names = F,col.names = F, append =T,quote=F)
ab <- min(rec[,2])
ac <- max(rec[,2])
cd <- paste(ab,ac,sep="..")
tmp <- paste(names(rec[2]),": Volunteer identification number.  values between:", cd, "  ", sep =" ")
write.table(tmp, "CodeBook.md",eol = "\n", row.names = F,col.names = F, append =T,quote=F)
ab <- apply(rec[3:81],2,min)
ac <- apply(rec[3:81],2,max)
cd <- paste(ab,ac,sep="..")
## 4. Writes Mean Variables features

tmp <- paste(names(rec[3:81]),": Mean of", names(rec[3:81]), 
             " - Measurment of Human Activity Recognition using Smartphones experiment.","  ", "values between:", 
             cd,"  ", sep =" ")
write.table(tmp, "CodeBook.md",eol = "\n", row.names = F,col.names = F, append =T,quote=F)

## 5. Writes Study Design references

write.table("# Activity Recognition Mean - Study Design",
            "CodeBook.md",eol = "\n", row.names = F,col.names = F, quote=F, append =T)
write.table("Activity Recognition Mean was based on Human Activity Recognition Using ",
            "CodeBook.md",eol = "\n", row.names = F,col.names = F, quote=F, append =T)
write.table("Smartphones Dataset Version 1.0. ",
            "CodeBook.md",eol = "\n", row.names = F,col.names = F, quote=F, append =T)
write.table("For total and additional information visit http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones",
            "CodeBook.md",eol = "\n", row.names = F,col.names = F, quote=F, append =T)
}