chicken_df <- read.csv("becker.chicken.csv", stringsAsFactors = TRUE)

# inspects structure
str(chicken_df)
summary(chicken_df)

# Task 1: Base R Graphics

# Plot 1A: Histogram of Offspring Weight with Density Curve
hist(chicken_df$weight,
     breaks = 10,
     col = "#74a9cf",
     border = "white",
     main = "Base R: Distribution of Offspring Weight",
     xlab = "Offspring Weight (grams)",
     ylab = "Frequency",
     las = 1)
abline(v = mean(chicken_df$weight), col = "firebrick", lwd = 2, lty = 2)
legend("topright", legend = c("Mean Weight"), col = "firebrick", lty = 2, lwd = 2, bty = "n")

# Plot 1B: Boxplot of Offspring Weight by Male (Sire)
boxplot(weight ~ male,
        data = chicken_df,
        col = "#a6bddb",
        border = "#02818a",
        main = "Base R: Offspring Weight by Sire (Male)",
        xlab = "Sire ID",
        ylab = "Offspring Weight (grams)",
        las = 1,
        pch = 19)

# Task 2: Lattice Graphics
library(lattice)

# Plot 2A: Conditioned Box-and-Whisker Plot (Small Multiples by Male)
bwplot(weight ~ female | male,
       data = chicken_df,
       layout = c(5, 1),
       scales = list(x = list(rot = 45)),
       main = "Lattice: Offspring Weight by Dam (Female) Conditioned on Sire (Male)",
       xlab = "Dam ID",
       ylab = "Weight (grams)",
       fill = "#bcbddc")

# Plot 2B: Conditioned Density Plot
densityplot(~ weight | male,
            data = chicken_df,
            layout = c(5, 1),
            plot.points = "rug",
            main = "Lattice: Density of Weight Conditioned on Sire (Male)",
            xlab = "Offspring Weight (grams)",
            col = "#756bb1",
            lwd = 2)

# Task 3: ggplot Graphics
library(ggplot2)

# Plot 3A: Publication-Ready Boxplot + Jittered Points by Sire
p1 <- ggplot(chicken_df, aes(x = male, y = weight, fill = male)) +
  geom_boxplot(alpha = 0.6, outlier.shape = NA, width = 0.5) +
  geom_jitter(width = 0.15, size = 2, alpha = 0.8, color = "#252525") +
  stat_summary(fun = mean, geom = "point", shape = 18, size = 3, color = "darkred") +
  scale_fill_brewer(palette = "Set2") +
  labs(
    title = "ggplot2: Offspring Weight Distribution Across Sires",
    subtitle = "Diamonds represent sire group means; individual dots indicate observations",
    x = "Sire ID (Male)",
    y = "Weight (grams)",
    fill = "Sire"
  ) +
  theme_minimal(base_size = 12) +
  theme(legend.position = "none",
        plot.title = element_text(face = "bold"))
print(p1)

# Plot 3B: Faceted Boxplot Exploring Female Variation Nested in Male Sires
p2 <- ggplot(chicken_df, aes(x = female, y = weight, fill = male)) +
  geom_boxplot(alpha = 0.7, color = "grey30") +
  geom_point(position = position_jitter(width = 0.1), size = 1.5, alpha = 0.7) +
  facet_wrap(~ male, scales = "free_x", nrow = 1) +
  scale_fill_brewer(palette = "Pastel1") +
  labs(
    title = "ggplot2: Dam-Level Offspring Weight Nested within Sires",
    x = "Dam ID (Female)",
    y = "Weight (grams)"
  ) +
  theme_bw(base_size = 11) +
  theme(
    legend.position = "none",
    axis.text.x = element_text(angle = 45, hjust = 1),
    strip.background = element_rect(fill = "#e0e0e0", color = NA),
    strip.text = element_text(face = "bold")
  )
print(p2)
