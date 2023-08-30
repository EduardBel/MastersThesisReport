# Load necessary libraries
if (!requireNamespace("ggplot2", quietly = TRUE)) {
  install.packages("ggplot2")
}
library(ggplot2)
theme_set(theme_minimal())  #minimal theme

# Sample data: Replace this with your actual data
high_entropy <- data.frame(
  label = c("dog", "horse", "truck", "cat", "car"),
  predict = c(0.36, 0.14, 0.02, 0.38, 0.10)
)

plot1 <- ggplot(high_entropy, aes(x = factor(label), y = predict, fill = "Same Color")) +
  geom_bar(stat = "identity", width = 0.5) +
  labs(x = "",
       y = "Prediction") +
  scale_fill_manual(values = "royalblue") +
  theme(legend.position = "none") +
  coord_cartesian(ylim = c(0, 1)) +
  ggtitle("High Closeness")

high_entropy <- data.frame(
  label = c("dog", "horse", "truck", "cat", "car"),
  predict = c(0.45, 0.1, 0.15, 0.20, 0.1)
)

plot2 <- ggplot(high_entropy, aes(x = factor(label), y = predict, fill = "Same Color")) +
  geom_bar(stat = "identity", width = 0.5) +
  labs(x = "",
       y = "") +  # Set y-axis label to be empty
  scale_fill_manual(values = "royalblue") +
  theme(legend.position = "none") +
  coord_cartesian(ylim = c(0, 1)) +
  ggtitle("Low Closeness") +
  theme(axis.text.y = element_blank(), axis.ticks.y = element_blank())  # Hide y-axis text and ticks

# Combine the plots using grid.arrange
combined_plot <- grid.arrange(plot1, plot2, ncol = 2)

# Save the combined plot as an image file
ggsave("../imgs/high_vs_low_closeness.png", combined_plot, width = 8, height = 4, dpi = 300)
