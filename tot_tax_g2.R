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

#get rid of sci notation....................
# Load the scales library (if not already installed)
install.packages("scales")
library(scales)

# Adjust the scale_fill_gradient with a labels argument
ggplot(map_data, aes(long, lat, group = group, fill = value)) +
  geom_polygon(color = "white") +
  scale_fill_gradient(low = "lightblue", high = "darkblue",
                      name = "Thematic Value",
                      labels = comma) +  # Use comma() from the scales package to format numbers
  theme_minimal() +
  labs(title = "Thematic Map of U.S. States",
       subtitle = "Visualizing state-specific values")

