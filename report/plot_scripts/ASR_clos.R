# Load necessary libraries
if (!requireNamespace("ggplot2", quietly = TRUE)) {
  install.packages("ggplot2")
}
# Load the ggplot2 library
library(ggplot2)

# Create a data frame with your x and y values
data <- data.frame(
  Class = c("FedAvg", "Median", "TMean" ,"MKrum", "Foolsgold", "Tolpegin", "FLAME", "LFighter"),  # Replace with your class labels
  Line1 = c(26.3, 23.6, 25.7, 31.8, 23.6, 23.2, 32.9, 13.8),        # Replace with your data for Line 1
  Line2 = c(20.0, 20.0, 22.6, 26.2, 19.7, 19.9, 26.7, 15.5),       # Replace with your data for Line 2
  Line3 = c(17.5, 18.4, 19.1, 19.4, 18.5, 16.9, 22.0, 14.9)
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


ggsave("../imgs/ASR_clos.png", width = 8, height = 3, dpi = 300)
