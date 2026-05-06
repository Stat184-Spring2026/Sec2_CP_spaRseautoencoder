# Analyzing the Correlation Between Binge Drinking and Mental Health Using CDC Data

## Overview

This project explores the relationship between binge drinking behavior and 
depression rates across all 50 U.S. states and the District of Columbia using 
publicly available CDC data from 2022. Our analysis is exploratory in nature: 
we seek to identify patterns and generate hypotheses rather than establish 
causal claims.

## Research Questions

1. Do states with higher binge drinking prevalence tend to have higher rates of depression?
2. Is the average number of drinks consumed per binge occasion associated with 
depression rates across states?

## Data Sources

All data come from the CDC's Behavioral Risk Factor Surveillance System (BRFSS), 2022:

- Percentage of adults who binge drink by state
- Average number of drinks consumed per binge occasion by state
- Number of adults diagnosed with depression per 100,000 people by state
All the data used in this project comes from publicly available CDC resources.

## Repo Structure

- `final_merged_data.csv` — cleaned and merged dataset used for analysis
- `binge_percent_clean.csv` — cleaned binge drinking prevalence data
- `binge_amount_clean.csv` — cleaned drinks per occasion data
- `depression_clean.csv` — cleaned depression rate data
- `data sets/` — raw CDC datasets
- `binge_drinking_report.qmd` — main analysis report (renders to PDF)
- `references.bib` — bibliography file
- `linting_script.R` — script for code style checking

## How to Reproduce

1. Clone this repo
2. Open `binge_drinking_report.qmd` in RStudio
3. Render to PDF

## Authors

Shlok, Sailesh, and Nihal
