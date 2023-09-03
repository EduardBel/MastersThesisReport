# Load necessary libraries
if (!requireNamespace("ggplot2", quietly = TRUE)) {
  install.packages("ggplot2")
}
# Load the ggplot2 library
library(ggplot2)

# Create a data frame with your x and y values
data <- data.frame(
  Class = c("FedAvg", "Median", "TMean" ,"MKrum", "Foolsgold", "Tolpegin", "FLAME", "LFighter"),  # Replace with your class labels
  Line1 = c(43.2, 41.6, 45.3, 62.7, 15.8, 15.4, 55.5, 15.2),        # Replace with your data for Line 1
  Line2 = c(32.6, 28.4, 32.4, 37.8, 18.3, 14.2, 41.6, 15.2),       # Replace with your data for Line 2
  Line3 = c(21.7, 23.1, 21.5, 24.7, 13.9, 13.4, 27.8, 13.7)
)

# Define the desired order of class labels
class_order <- c("FedAvg", "Median", "TMean", "MKrum", "Foolsgold", "Tolpegin", "FLAME", "LFighter")

# Convert "Class" to a factor with the specified order
data$Class <- factor(data$Class, levels = class_order)

# Reshape data into long format
library(tidyr)
data_long <- pivot_longer(data, -Class, names_to = "Line", values_to = "ASR")

# Create a ggplot object with a legend
ggplot(data_long, aes(x = Class, y = ASR, fill = Line)) +
  geom_bar(stat = "identity", position = "dodge", width = 0.7) +
  labs(x = "", y = "ASR") +
  scale_y_continuous(limits = c(0, 100)) +
  scale_fill_manual(values = c("Line1" = "blue", "Line2" = "red", "Line3" = "green"),
                     labels = c("30%", "20%", "10%"),
                     name = "Attacker's ratio") +
  theme_minimal()


ggsave("../imgs/ASR_std.png", width = 8, height = 3, dpi = 300)
