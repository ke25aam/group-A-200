#Graph 2
ggplot(apples, aes(x = Quality, y = Sweetness, fill = Quality)) +
  geom_boxplot(alpha = 0.7) +
  labs(title = "Sweetness Distribution by Quality", x = "Quality", y = "Sweetness") +
  theme_minimal()
ggsave("sweetness_by_quality.png", width = 6, height = 4)
