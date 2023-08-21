# Load necessary libraries
if (!requireNamespace("ggplot2", quietly = TRUE)) {
  install.packages("ggplot2")
}
library(ggplot2)
theme_set(theme_minimal())  #minimal theme


# Sample data: Replace this with your actual data
paper_data <- data.frame(
  year = c(2016, 2017, 2018, 2019, 2020, 2021, 2022),
  total_papers = c(30, 52, 76, 184, 398, 487, 1218)
)

# Create the bar chart using ggplot2
# Create the bar chart
# Create the bar chart
# Create the bar chart
ggplot(paper_data, aes(x = factor(year), y = total_papers, fill = "Same Color")) +
  geom_bar(stat = "identity", width = 0.5) +
  labs(x = "Year",
       y = "Total Papers") +
  scale_fill_manual(values = "forestgreen")+   # Set the color you want for all bars
  theme(legend.position = "none")
# Save the plot as an image file (e.g., PNG)
ggsave("bar_chart.png", width = 6, height = 4, dpi = 300)
