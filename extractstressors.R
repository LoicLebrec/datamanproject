# Load necessary library
if (!requireNamespace("data.table", quietly = TRUE)) {
  install.packages("data.table")
}
library(data.table)

# Directory containing the files
dataset_dir <- "~/Desktop/datamanagementlinux/datamanproject/IOT_2018_pxp/satellite/"
cba_path <- file.path(dataset_dir, "D_cba.txt")

# Load the dataset
cba <- fread(cba_path)

# Extract rows where 'region' indicates stressors
stressor_rows <- grep("stressor", cba$region, ignore.case = TRUE)
stressors <- cba$region[stressor_rows]

# Save the names of stressors to a file
output_path <- "~/Desktop/stressors_list.txt"
writeLines(stressors, con = output_path)

# Print confirmation
cat("Stressors have been saved to:", output_path, "\n")
print(stressors)
