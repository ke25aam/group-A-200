apples <- read.csv("apple_quality.csv")
str(apples)
head(apples, 5)
table(apples$Quality)
cor.test(apples$Sweetness, apples$Acidity)

# Convert Acidity to numeric
apples$Acidity <- as.numeric(apples$Acidity)
apples$Quality <- as.factor(apples$Quality)
 
# Now correlations work!
cor.test(apples$Sweetness, apples$Acidity)


# Correlation by Quality group
> library(dplyr)
> apples %>%
  +     group_by(Quality) %>%
  +     summarise(cor = cor(Sweetness, Acidity, use = "complete.obs"))

-----------------------------------------------------------------------------------
apples %>%
  group_by(Quality) %>%
  summarise(
    n = n(),
    cor = cor(Sweetness, Acidity, use = "pairwise.complete.obs")
  )
-----------------------------------------------------------------------------------

library(ggplot2)
ggplot(apples, aes(x = Sweetness, y = Acidity, color = Quality)) +
  geom_point(alpha = 0.5, size = 0.8) +
  geom_smooth(method = "lm", se = TRUE) +
  labs(
    title = "Sweetness vs Acidity by Apple Quality",
    subtitle = "Weak positive correlation (r = 0.086, p < 0.001)",
    x = "Sweetness (standardised)", 
    y = "Acidity (standardised)",
    color = "Quality"
  ) +
  theme_minimal() +
  theme(plot.title = element_text(size = 14, face = "bold"))
ggsave("sweetness_acidity_scatter.png", width = 8, height = 6)

-------------------------------------------------------------------------------------
