# Load the dataset
data <- read.table("~/Desktop/datamanagementlinux/datamanproject/IOT_2018_pxp/satellite/D_cba.txt", 
                   header = TRUE, sep = "\t", stringsAsFactors = FALSE)
# Get all column names that start with "FR."
fr_columns <- grep("^FR\\.", colnames(data), value = TRUE)
# Subset data to include only columns for France
fr_data <- data[, fr_columns]
# Inspect the first few rows of FR data
head(fr_data)

# Save the extracted data to a CSV file
write.csv(fr_data, "~/Desktop/fr_data.csv", row.names = FALSE)


