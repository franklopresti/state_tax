# create tibble of states and then one of tot_tax

# Create a vector "state" containing all column names from "Alabama" to "Wyoming"
state <- as.character( df[4,4:54])

tot_tax <- as.numeric(df[5,4:54])
