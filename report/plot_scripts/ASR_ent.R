# Load necessary libraries
if (!requireNamespace("ggplot2", quietly = TRUE)) {
  install.packages("ggplot2")
}
# Load the ggplot2 library
library(ggplot2)

# Create a data frame with your x and y values
data <- data.frame(
  Class = c("FedAvg", "Median", "TMean" ,"MKrum", "Foolsgold", "Tolpegin", "FLAME", "LFighter"),  # Replace with your class labels
  Line1 = c(22.3, 25.3, 24.1, 25.7, 23.0, 25.8, 26.5, 15.6),        # Replace with your data for Line 1
  Line2 = c(22.0, 19.7, 19.5, 21.7, 21.8, 18.8, 17.9, 14.1),       # Replace with your data for Line 2
  Line3 = c(17.8, 18.6, 17.4, 17.7, 17.6, 18.4, 20.4, 16.8)
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


ggsave("../imgs/ASR_ent.png", width = 8, height = 3, dpi = 300)
