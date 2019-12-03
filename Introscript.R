# My First R Script

# Scripts prepared by Katie Jepson & Josh Clothier for the CoEDL Summer School 2019 workshop on R & RStudio for Fresh Users
# Materials herein include references data adapted from the LanguageR package (Baayen & Shafaei-Bajestan, 2019)

#Slide 13
y <- 2
y
Y

#Slide 14
(3 + 7) / 2 + 11
mean(c(2, 3, 5, 6, 11, 7, 30))

#Slide 15
some_numbers <- c(2, 3, 11, 7, 30)

#Slide 16
mean(some_numbers)
sum(some_numbers)
some_numbers/y
sum(some_numbers)+y

#Slide 21
## install packages
install.packages("dplyr")

## load libraries
library(dplyr)

# Slide 23 - Make some data in R
Subject <- "pp28"
Word <- "coulantheid"
Subject2 <- pp29

RT <- 5.89
base_frequency <- 6.14
GenderCode <- 2

# Slide 24 - Make some data in R
dutch_data <- data.frame(Subject, Word, RT, base_frequency, GenderCode)

# Slide 25 - Get some data into R using code
my_data_csv <- read.csv("heid_mod.csv", header = TRUE)

# Slide 30 - Inspect the data
class(my_data_csv)

view(my_data_csv)

summary(my_data_csv)

head(my_data_csv)

# Slide 31 - Inspect the data
levels(my_data_csv$Subject)

class(my_data_csv$RT)

# Slide 32 - Combining data - rbind
rbind(my_data_import, dutch_data)

## Get column names
colnames(my_data_import)
colnames(dutch_data)

#Slide 33 - Combining data - rbind
#Detour: renaming columns
names(dutch_data)[names(dutch_data) == "base_frequency"] <- "BaseFrequency"

##Get column names (just to double check!)
colnames(my_data_import)
colnames(dutch_data)

##Try our rbind function again
rbind(my_data_import, dutch_data)
my_data_modified <- rbind(my_data_import, dutch_data)

#Slide 34 - Combining data - cbind
##Add new column to dataframe

cbind(my_data_modified, some_numbers)

# Slide 35 - Using R as a calculator (to make new variables)
##Transform RT into raw values (RT(ms))
exp(my_data_modified$RT)
my_data_modified$RT_raw_ms <- exp(my_data_modified$RT)

##Convert RT(ms) into seconds
my_data_modified$RT_raw_ms/1000
my_data_modified$RT_raw_s <- my_data_modified$RT_raw_ms/1000

# Slide 36 - get data out of R - save or write.csv
write.csv(my_data_modified, "my_data_export.csv")
saveRDS(my_data_modified, "my_data_modified.RDS")

# Slide 39 - doing things with packages
install.packages("tidyverse", "languageR")
library(tidyverse, languageR)

# Slide 40 - renaming columns

head(rename(my_data_modified, Base_Frequency = BaseFrequency))

my_data_modified <- rename(my_data_modified,
                           base_frequency = BaseFrequency)

# Slide 41 - Filtering data

filter(my_data_modified,
       Subject == "pp15")

pp15_dutch_data <- filter(my_data_modified,
                          Subject == "pp15")

# Slide 42 - Selecting data

select(my_data_modified,
       Subject)

select(my_data_import,
       Subject:RT)

reaction_time_data <- select(my_data_modified,
                             Subject:RT)

#Slide 43 - Summarise your data
RT_summary <-
  my_data_modified %>%
  group_by(Subject) %>%
  summarise(mean = mean(RT_raw_ms),
            SD = sd(RT_raw_ms),
            min = min(RT_raw_ms),
            max = max(RT_raw_ms),
            n = n())
View(RT_summary)

#Slide 44 - manipulate data between different types
my_data_modified$GenderCode <- as.factor(my_data_modified$GenderCode)

#Slide 45 - recoding data
my_data_modified <-
  my_data_modified %>%
  mutate(Gender =
           ifelse(GenderCode == 1, "Female",
                  ifelse(GenderCode == 2, "Male", "Other")))

# not on a slide
# you might want to save / export your `my_data_modified`
# dataframe again now that you've finished.
