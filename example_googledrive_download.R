### Downloading up to date Hemigrapsus parasite data from Google Drive

# Required packages googledrive, tidyverse, lubridate
library(googledrive)
library(tidyverse)
library(lubridate)

# googledrive::drive_find() will send you to the browser, to authenticate and authorize googledrive package
# drive_find takes A LONG TIME to go through all the items in your drive, but will return a tibble with 3 columns:
#   name, id, drive_resource
# x<-drive_find(pattern = "Hemigrapsus")
# Use a local file ('.httr-oauth'), to cache OAuth access credentials between R sessions?
# 1: Yes
# 2: No
# Select 1


# For 01_Hemigrapsus_parasite_data, use file id to recover
(y<-drive_get(as_id("1XS06Maka-8r4lHocp0tEImq_dsYlb2mBPQoyCKanIeo")))

# Download most current version of 01_Hemigrapsus_parasite_data
drive_download(as_id("1XS06Maka-8r4lHocp0tEImq_dsYlb2mBPQoyCKanIeo"), path = "data/processing/hemi-para-data.csv")

# Two options here.  Could rewrite over any existing file with that name by executing:
#   drive_download(as_id("1XS06Maka-8r4lHocp0tEImq_dsYlb2mBPQoyCKanIeo"),
#                         path = "data/processing/hemi-para-data.csv", overwrite = TRUE)
# Or could rename file with current date.
# Rename file
# lubridate::today() simply returns today's date.
date<-today()

file.rename("data/processing/hemi-para-data.csv", file.path("data", "processing", paste0(date,"_hemi-para-data.csv")))