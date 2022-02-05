#### Preamble ####
# Purpose: Gather data from Open data Toronto
# Author: Zoie So
# Data: 24 January 2022
# Contact: zoie.so@utoronto.ca 
# License: MIT
# Pre-requisites: 
# - None

#### Workspace setup ####
#install.packages("opendatatoronto")
#install.packages("tidyverse")

#library(opendatatoronto)
#library(tidyverse)

#### Gather data ####
# Based on: https://open.toronto.ca/dataset/covid-19-cases-in-toronto/
# Each dataset is part of a package of data. These packages have unique ids. We can find the unique id by going to the webpage for the dataset, e.g. see above. 
package <- show_package("64b54586-6180-4485-83eb-81e8fae3b8fe")
package

# Within each package there are a bunch of different resources, e.g.datasets. We use the unique id to get them. 
resources <- list_package_resources("64b54586-6180-4485-83eb-81e8fae3b8fe")

# We want a specific dataset that has information about covid-19 cases in Toronto.
datastore_resources <- filter(resources, tolower(format) %in% c('csv'))

# Now we get the dataset
data <- filter(datastore_resources, row_number()==1) %>% get_resource()
data

#### Save ####
write_csv(data, "C:\\Users\\User\\Desktop\\starter_folder-main\\starter_folder-main\\inputs\\data\\covid19_data.csv")


