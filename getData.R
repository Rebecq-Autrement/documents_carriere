# optional, set working directory
# setwd()

# get base url
text <- readLines("https://www.rebecq.be/vie-administrative-politique/vivre-a-rebecq/environnement/ep-carrieres")

# grep pdf and url
files <- grep(".pdf",text,value = TRUE)
files <- grep("href",files,value = TRUE)

# cleaning
files <- gsub('<a class=\\\"table_image no-image\\\" href=\\\"',"",files)
files <- gsub('\\\" target=\\\"\\\">',"",files)

# header of result urls
header <- "https://www.rebecq.be/vie-administrative-politique/vivre-a-rebecq/environnement/ep-carrieres/"

# sapply over urls to download files
sapply(files,function(x){
  # define destination
  dest <- gsub(header,"",x)
  # dest folder
  dest_folder <- unlist(strsplit(dest,"/"))[1]
  # if folder doesn't exist, create it
  if(!dir.exists(dest_folder)){dir.create(dest_folder,recursive=T)}
  # download the data
  try(download.file(x,dest,mode='wb',outFile = "try.log"))
})
# 
# #check number of files
# 
# length(files)
# length(list.files("./dossier-initial/")) + length(list.files("./complements/"))
