# state_tax
2024 state taxes
## tot state tax 2024 
```{r state tax stata file imported}
# read in stata Tax dataset
install.packages("readxl")
library(readxl)
file_path <- "C:/Users/frank/Downloads/FY2024-STC-Category-Table-Transposed.xlsx"
df <- read_excel(file_path)
print(df)

```
## Create tipple with states total state taxes 2024

```{r first thematic map.. Total State Tax}
# Load required libraries
library(ggplot2)
library(maps)
library(dplyr)

# Your tibble (replace `state_tot` with your actual data)
#   state_tot <- tibble(
#  state = c("Alabama", "Alaska", "Arizona", "Arkansas", "California"), # Your state names
#  value = c(10, 20, 30, 40, 50)  # Your thematic values
#  )

# Load U.S. map data
us_map <- map_data("state")

# Prepare tibble: ensure state names are lowercase to match `region` column in map data
state_tot <- state_tot %>%
  mutate(state = tolower(state))

# Merge your tibble with the map data
map_data <- us_map %>%
  left_join(state_tot, by = c("region" = "state"))

# Plot the thematic map
ggplot(map_data, aes(long, lat, group = group, fill = tot_tax)) +
  geom_polygon(color = "white") +
  scale_fill_gradient(low = "lightblue", high = "darkblue", name = "Thematic Value") +
  theme_minimal() +
  labs(title = "Thematic Map of U.S. States",
       subtitle = "Visualizing state-specific values")
```
### But look at use of sci notation in map 

![image](https://github.com/user-attachments/assets/f39bbf63-632c-4672-9e2f-6efaab338ff2)

### But I asked chatgpt to get rid of sci notation in map... new code

```{r I got this code from chat}
library(ggplot2)

ggplot(map_data, aes(long, lat, group = group, fill = tot_tax)) +
  geom_polygon(color = "white") +
  scale_fill_gradient(low = "lightblue", high = "darkblue", name = "Thematic Value",
                      labels = scales::comma) +  # Use `scales::comma` to avoid scientific notation
  theme_minimal() +
  labs(title = "Thematic Map of U.S. States",
       subtitle = "Visualizing state-specific values")
```
###  And new map...

![image](https://github.com/user-attachments/assets/adfc5301-90ef-43bd-96f5-db8524c187ca)

