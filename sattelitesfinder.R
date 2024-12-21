# Specify the directory containing EXIOBASE files
dataset_dir <- "~/Desktop/datamanagementlinux/datamanproject/IOT_2018_pxp/satellite/"

# List all files in the directory
file_list <- list.files(dataset_dir, pattern = "\\.txt$", full.names = TRUE)

# Display the available files
cat("Available files in the dataset directory:\n")
print(file_list)

# Categorize files based on known EXIOBASE structure
categories <- list(
  Consumption_Based_Accounting = grep("D_cba", file_list, value = TRUE),
  Air_Emissions = grep("D_air_emissions", file_list, value = TRUE),
  Energy_Accounts = grep("D_energy", file_list, value = TRUE),
  Material_Accounts = grep("D_materials", file_list, value = TRUE),
  Water_Accounts = grep("D_water", file_list, value = TRUE),
  Land_Accounts = grep("D_land", file_list, value = TRUE),
  Trade_Accounts = grep("D_trade", file_list, value = TRUE)
)

# Display categorized files
cat("\nCategorized files:\n")
print(categories)
