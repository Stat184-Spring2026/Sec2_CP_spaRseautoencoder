install.packages("ggplot2")
library(ggplot2)
library(tidyverse)

data <- read_csv("final_merged_data.csv")

data <- data %>%
  rename(
    prevalence = `Binge drinking* prevalence†`,
    p75 = p75
  )

#1 Depression vs Binge Drinking
ggplot(data, aes(x = prevalence, y = depression)) +
  geom_point() +
  labs(
    title = "Depression vs Binge Drinking",
    x = "Binge Drinking Prevalence",
    y = "Depression Rate"
  )

#2 Scatter Plot with Trend Line
ggplot(data, aes(x = prevalence, y = depression)) +
  geom_point() +
  geom_smooth(method = "lm") +
  labs(
    title = "Relationship Between Binge Drinking and Depression",
    x = "Binge Drinking Prevalence",
    y = "Depression Rate"
  )

#3 Bar Chart
ggplot(data, aes(x = reorder(State, prevalence), y = prevalence)) +
  geom_col() +
  coord_flip() +
  labs(
    title = "Binge Drinking by State",
    x = "State",
    y = "Prevalence"
  )

#4 Compare Mean vs 75th Percentile
ggplot(data, aes(x = State)) +
  geom_col(aes(y = mean), fill = "blue", alpha = 0.6) +
  geom_col(aes(y = p75), fill = "red", alpha = 0.6) +
  coord_flip() +
  labs(
    title = "Mean vs 75th Percentile",
    x = "State",
    y = "Value"
  )

#5 Clean + Better Looking Plot

ggplot(data, aes(x = prevalence, y = depression)) +
  geom_point(color = "steelblue", size = 3) +
  geom_smooth(method = "lm", se = FALSE, color = "red") +
  theme_minimal() +
  labs(
    title = "Binge Drinking vs Depression",
    x = "Prevalence (%)",
    y = "Depression (%)"
  )