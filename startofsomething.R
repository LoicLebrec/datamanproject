# Load necessary library
if (!requireNamespace("data.table", quietly = TRUE)) {
  install.packages("data.table")
}
library(data.table)

# Directory containing the files
dataset_dir <- "~/Desktop/datamanagementlinux/datamanproject/IOT_2018_pxp/satellite/"

# Load key files
cba_path <- file.path(dataset_dir, "D_cba.txt")
pba_path <- file.path(dataset_dir, "D_pba.txt")
units_path <- file.path(dataset_dir, "unit.txt")

# Load datasets
cba <- fread(cba_path)
pba <- fread(pba_path)
units <- fread(units_path)

# Debug: Inspect the "region" column
cat("\nUnique regions in D_cba.txt:\n")
print(unique(cba$region))

# Function to analyze stressors and economic impacts for a specific country
analyze_country <- function(country_code, cba, pba) {
  # Filter rows for the specified country in "region"
  country_cba <- cba[region == country_code, ]
  country_pba <- pba[region == country_code, ]
  
  # Remove non-numeric columns (e.g., "region") for calculations
  country_cba_numeric <- country_cba[, lapply(.SD, as.numeric), .SDcols = -1]
  country_pba_numeric <- country_pba[, lapply(.SD, as.numeric), .SDcols = -1]
  
  # Calculate totals
  total_stressors <- colSums(country_cba_numeric, na.rm = TRUE)
  total_economic_activity <- colSums(country_pba_numeric, na.rm = TRUE)
  
  # Identify top contributors
  most_polluting <- sort(total_stressors, decreasing = TRUE)
  most_economically_important <- sort(total_economic_activity, decreasing = TRUE)
  
  # Output results
  list(
    Most_Polluting_Industries = head(most_polluting, 10),
    Most_Important_Activities = head(most_economically_important, 10)
  )
}

# Example: Analyze for Austria (AT)
result <- analyze_country("AT", cba, pba)

# Display results
cat("\nMost Polluting Industries:\n")
print(result$Most_Polluting_Industries)

cat("\nMost Economically Important Activities:\n")
print(result$Most_Important_Activities)
