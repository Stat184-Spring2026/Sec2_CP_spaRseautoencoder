library(tidyverse)


binge_percent <- read_csv("Percentage_sup_†__sup_ of adults who binge drink_ by state, 2022.csv")
binge_amount  <- read_csv("The amount of drinks that adults who binge drink_ have on an occasion, by state, 2022.csv")
depression    <- read_csv("Depression_State Bar_data.csv")

binge_amount_clean <- binge_amount %>%
  mutate(
    type = case_when(
      str_detect(key, "median") ~ "mean",
      str_detect(key, "75th") ~ "p75"
    )
  ) %>%
  select(Location, type, `No. of Drinks (75th percentile)†`) %>%
  pivot_wider(
    names_from = type,
    values_from = `No. of Drinks (75th percentile)†`
  ) %>%
  rename(State = Location)


binge_percent_clean <- binge_percent %>%
  pivot_wider(
    names_from = key,
    values_from = value
  ) %>%
  rename(State = Location)


depression_clean <- depression %>%
  rename(State = State,
         depression = `Total Depression Responses`)

final_df <- depression_clean %>%
  left_join(binge_percent_clean, by = "State") %>%
  left_join(binge_amount_clean, by = "State") %>%
  select(
    State,
    depression,
    prevalence,
    p75,
    mean
  )

write_csv(binge_amount_clean, "binge_amount_clean.csv")
write_csv(binge_percent_clean, "binge_percent_clean.csv")
write_csv(depression_clean, "depression_clean.csv")

write_csv(final_df, "final_merged_data.csv")
