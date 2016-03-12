#Developed by Obadowski
#For the Getting and Cleaning Data - Course Project

#This code supposes there are the directories "test" and "train"
#If they are missing, you should set your directory to base directory with all input data

run_analysis <- function(){
    #Loading the libraries necessary to run this code
    library(data.table)
    library(plyr)
    library(dplyr)
    
    #1st - Get the training set and test set
    tab_train <- get_data("train")
    tab_test <- get_data("test")
    
    #2rd - Now rbind them, i.e., binding them vertically
    tabfinal <- rbind(tab_train, tab_test)
    
    #Just cleaning the data, you dont need to keep after merging the tables!!
    rm(tab_train, tab_test)
    
    #3th - Extracting the measurements mean() e std() and renaming the Columns
    #For EVERY variable, that's a lot of stuff!!
    #It takes into account the variables names at CodeBook.rm
    tabfinal <- extract(tabfinal)
    
    #4th - Adjust the Activity name to something readable
    #The activity proper name rather than a number
    tabfinal <- renaming(tabfinal)
    
    #5th - Average of each variable for each activity and each subject
    #Awesome function, I really cant belive I found something so magical!
    #ddply performs a certain operation over some groups, in this case: Subject and Activity
    #numcolwise (FUN) does the FUN over all columns in a data.frame. Combining ddply and numcolwise, we can take the mean over a whole data.frame
    #AWESOME!
    Averages <- ddply(tabfinal, .(Subject, Activity), numcolwise(mean))
    
    #6th and last step - You get your data cleaned and the averages of means and standard deviations
    list(tidy_table = tabfinal, Averages = Averages)
    
    #7th - Thanks a lot for your patience in reading all this code and for grading me!
}

#Auxiliary Functions - Actually they do the hard work

#get_data Function
#It extract the data from directory type from files "X_type.txt", "y_type.txt" and "subject_type.txt"
#Important: the function also clear the extras spaces in "X_train.txt" file
get_data <- function(type = "train"){
    
    #Just ensures that something useful will be read!
    if (type != "train") {
        type <- "test"
    }
    
    #Build the path to the files
    path1 <- paste(getwd(), "/",  type, "/X_", type, ".txt", sep = "")
    path2 <- paste(getwd(), "/",  type, "/y_", type, ".txt", sep = "")
    path3 <- paste(getwd(), "/",  type, "/subject_", type, ".txt", sep = "")
    
    #Get the X_TYPE.txt
    #Need to correct it, multiples double spaces e two extras spaces at the beginning
    Xtrain <- readLines(path1)
    Xtrain <- gsub("  ", " ", Xtrain) 
    Xtrain <- sub(" ", "", Xtrain)
    writeLines(Xtrain, "tmp.txt")   # Save as temporary File
    Xtrain <- read.table("tmp.txt", sep = " ") # Read the temporary File
    file.remove("tmp.txt") #erases the temporary File, so you will not see it (I hope so)
    
    #Get the y_TYPE.txt
    #No need to correct it, however it is necessary to rename its column name
    Ytrain <- read.table(path2)
    Ytrain <- rename(Ytrain, Activity = V1)
    
    #Get the subject_type.txt
    #No need to correct it, however it is necessary to rename its column name
    Subtrain <- read.table(path3)
    Subtrain <- rename(Subtrain, Subject = V1)
    
    #Merging all tables in one
    final <- data.table(Subtrain, Ytrain, Xtrain)
    
    #returns Merged table
    final
}


#extract Function
#Main point of this function is to get only the data concerning to Mean and standard deviation
#Also provides a file back to user with the labels - not very useful, but quite handy for a quick consultation
extract <- function(tabfinal){
    
    #First open the file
    features <- readLines("features.txt")

    #Looking for names [mM]ean and [sS]td
    colindexes <- c(grep("[mM]ean", features), grep("[sS]td", features))
    colindexes <- sort(colindexes)
    
    #Get the names of variables
    names <- features[colindexes]
    names <- strsplit(names, " ")
    
    #Defining an anonymous function
    #Get the second element of a vector, useful for our string case
    secEl <- function(x){x[2]}
    
    #Get only the Descriptive names
    names <- sapply(names, secEl)
    
    #Creating the table with the data
    tabfinal <- select(tabfinal, c(1,2, (colindexes+2)))
    colnames(tabfinal) <- c("Subject", "Activity", names)
    
    #Generate an export file with the Features listed in the final table
    writeLines(names,"Feat_Coursera.txt")
    
    #Return the final table adjusted
    tabfinal
}


#renaming Function
#Quite simple, it substitutes the number of activity per its name
renaming <- function(tabfinal){
    
    #Getting the names!
    names <- read.table("activity_labels.txt")
    
    #Get the number of activity
    acts <- as.numeric(tabfinal$Activity)
    
    #convert row after row
    for (i in 1:length(acts)){
        tmp <- as.numeric(acts[i])
        acts[i] <- as.character(names[[2]][tmp])
    }
    
    #overwrite the previous data
    tabfinal$Activity <- acts
    
    #Changes the type to factor, easier to manipulate later
    tabfinal$Activity <- as.factor(tabfinal$Activity)
    tabfinal$Subject <- as.factor(tabfinal$Subject) #This is a plus, will easier the job later...
    
    tabfinal
}