library(ggplot2)
library(dplyr)
library(maps)
library(tibble)

# Load map data (lowercase full state names)
us_map <- map_data("state")

# 51-state tibble (state names MUST be lowercase and match `region` in us_map)
state_values <- tibble(
  region = tolower(c("Alabama", "Alaska", "Arizona", "Arkansas", "California", "Colorado",
                     "Connecticut", "Delaware", "Florida", "Georgia", "Hawaii", "Idaho",
                     "Illinois", "Indiana", "Iowa", "Kansas", "Kentucky", "Louisiana",
                     "Maine", "Maryland", "Massachusetts", "Michigan", "Minnesota",
                     "Mississippi", "Missouri", "Montana", "Nebraska", "Nevada",
                     "New Hampshire", "New Jersey", "New Mexico", "New York",
                     "North Carolina", "North Dakota", "Ohio", "Oklahoma", "Oregon",
                     "Pennsylvania", "Rhode Island", "South Carolina", "South Dakota",
                     "Tennessee", "Texas", "Utah", "Vermont", "Virginia", "Washington",
                     "West Virginia", "Wisconsin", "Wyoming", "District of Columbia")),

  value = runif(51, 100, 1000)  # Replace with your real data (e.g., tax per capita)
)

# Note: `us_map` does NOT include DC by default, so it will be ignored unless handled separately.

# Join to map data
map_with_values <- us_map %>%
  left_join(state_values, by = "region")

# Plot the map
ggplot(map_with_values, aes(x = long, y = lat, group = group, fill = value)) +
  geom_polygon(color = "white") +
  coord_fixed(1.3) +
  scale_fill_viridis_c(name = "Value", option = "plasma") +
  theme_minimal() +
  labs(title = "Thematic Map with Joined Values")
