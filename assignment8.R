library(plyr)


#  imports data and summarizes by factor
student6 <- read.table(
  "Assignment 6 Dataset.txt", 
  header = TRUE, 
  sep = ",", 
  stringsAsFactors = FALSE
)

# computes the mean of Grade grouped by Sex
gender_mean <- ddply(
  student6,
  "Sex",
  summarise,
  GradeAverage = mean(Grade, na.rm = TRUE)
)

# writes the grouped means to a tab-delimited text file
write.table(
  gender_mean,
  file = "gender_mean.txt",
  sep = "\t",
  row.names = FALSE
)

# filters Names Containing "i" or "I"

i_students <- subset(
  student6,
  grepl("i", Name, ignore.case = TRUE)
)

# extracts just the names column and write to a CSV
write.csv(
  i_students$Name,
  file = "i_students.csv",
  row.names = FALSE,
  quote = FALSE
)

# exports filtered dataset
write.csv(
  i_students,
  file = "i_students_full.csv",
  row.names = FALSE
)

# verifies that the files exist in your working directory 
cat("\nChecking working directory for output files:\n")
list.files(pattern = "gender_mean.txt|i_students.csv|i_students_full.csv")
