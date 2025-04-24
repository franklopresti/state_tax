# read in stata Tax dataset
install.packages("readxl")
library(readxl)
file_path <- "C:/Users/frank/Downloads/FY2024-STC-Category-Table-Transposed.xlsx"
df <- read_excel(file_path)
print(df)
