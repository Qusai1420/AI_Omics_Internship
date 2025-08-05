#After I created the folder on my disk and created a new project named module_1 in R
# Task_1: creating sub folders 
dir.create("raw_data")
dir.create("clean_data")
dir.create("scripts")
dir.create("results")
dir.create("plots")

#Task_2: loading the data
data <- read.csv("patient_info.csv") # I saved the downloaded patient_info file in the wd
str(data)
#variables with wrong data type are : age, gender, diagnosis,smoker
data$age <- as.numeric(data$age)
class(data$age)

data$gender <- as.factor(data$gender)
class(data$gender)

data$diagnosis <- as.factor(data$diagnosis)
class(data$diagnosis)

data$smoker <- as.factor(data$smoker)
class(data$smoker)
str(data)

#Creating a new variable 
data$smoking_status <- ifelse(data$smoker == "No",0,1)
data$smoking_status <- as.factor(data$smoking_status)
data$smoking_status <- factor(data$smoking_status, levels = c(0,1))
cleaned_data <- data
str(cleaned_data)
str(data)
#saving_data
write.csv(data, file = "clean_data/patient_info_clean.csv")
save.image(file = "Qusai_Class_Ib_Assignment.RData")
