library(ggplot2)

ggplot(map_data, aes(long, lat, group = group, fill = tot_tax)) +
  geom_polygon(color = "white") +
  scale_fill_gradient(low = "lightblue", high = "darkblue", name = "Thematic Value",
                      labels = scales::comma) +  # Use `scales::comma` to avoid scientific notation
  theme_minimal() +
  labs(title = "Thematic Map of U.S. States",
       subtitle = "Visualizing state-specific values")
