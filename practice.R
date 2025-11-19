# Load necessary libraries
library(ggplot2)
library(dplyr)
library(tidyr)
data <- data.frame(
  Donor = c("Bill & Melinda Gates Foundation", "Rockefeller Foundation", "Cystic Fibrosis Foundation", "Netherlands DGIS", "Ireland IrishAid", 
            "Korea KOICA", "USG USAID", "USG Food & Drug Administration", "USG Nat'l Institutes of Health", "UK FCDO (DFID)", "UK DOH", 
            "Japan GHIT", "Australia DFAT", "Germany KfW", "UNITAID"),
  `2000` = c(1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
  `2001` = c(1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
  `2002` = c(1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
  # Add other years similarly
)


funding_totals <- data.frame(
  Donor = c("Bill & Melinda Gates Foundation", "Rockefeller Foundation", "Cystic Fibrosis Foundation", "Netherlands DGIS", "Ireland IrishAid", 
            "Korea KOICA", "USG USAID", "USG Food & Drug Administration", "USG Nat'l Institutes of Health", "UK FCDO (DFID)", "UK DOH", 
            "Japan GHIT", "Australia DFAT", "Germany KfW", "UNITAID"),
  Total = c(501.7, 21.1, 14.8, 22.3, 29.4, 3.1, 60.6, 4.8, 22.3, 169.5, 4.5, 6.2, 25.0, 13.0, 21.1)
)
data <- read.csv("C:\\Users\\parya\\ScienceandIndustry Dropbox\\Payal Arya\\RESEARCH TB Alliance\\Working\\Payal_arya\\Funding_Summary_TBAlliance\\Metataged_donor_contribtution_TBAlliance.csv")

library(reshape2)

# Reshape the data to a long format
data_long <- data %>%
  gather(key = "Year", value = "Contribution", -Donor) %>%
  mutate(Year = as.numeric(gsub("X", "", Year))) # Ensure Year is numeric


ggplot(data_long, aes(x = Year, y = Donor, fill = as.factor(Funding))) +
  geom_tile(color = "white", size = 0.2) +
  scale_fill_manual(values = c("white", "black")) +  # 0 = white, 1 = black
  labs(x = "Year", y = "Donor", fill = "Funding") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))
