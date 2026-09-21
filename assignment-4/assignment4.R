# Assignment #4: Visualizing and Interpreting Hospital Patient Data

# 1
Frequency     <- c(0.6, 0.3, 0.4, 0.4, 0.2, 0.6, 0.3, 0.4, 0.9, 0.2)
BloodPressure <- c(103, 87, 32, 42, 59, 109, 78, 205, 135, 176)
FirstAssess   <- c(1, 1, 1, 1, 0, 0, 0, 0, NA, 1)    # bad=1, good=0
SecondAssess  <- c(0, 0, 1, 1, 0, 0, 1, 1, 1, 1)    # low=0, high=1
FinalDecision <- c(0, 1, 0, 1, 0, 1, 0, 1, 1, 1)    # low=0, high=1

df_hosp <- data.frame(
  Frequency, BloodPressure, FirstAssess,
  SecondAssess, FinalDecision, stringsAsFactors = FALSE
)

# 2
cat("Summary before cleaning:\n")
summary(df_hosp)

# Remove rows containing missing values (removes row 9)
df_hosp_clean <- na.omit(df_hosp)

cat("\nSummary after listwise deletion:\n")
summary(df_hosp_clean)

# 3

# Boxplot 1: BP by First MD Assessment
png("boxplot_first_assess.png", width = 800, height = 600, res = 120)
boxplot(
  BloodPressure ~ FirstAssess,
  data = df_hosp_clean,
  names = c("Good", "Bad"),
  xlab = "First MD Assessment",
  ylab = "Blood Pressure (mmHg)",
  main = "BP by First MD Assessment",
  col = c("lightblue", "lightcoral")
)
dev.off()

# Boxplot 2: BP by Second MD Assessment
png("boxplot_second_assess.png", width = 800, height = 600, res = 120)
boxplot(
  BloodPressure ~ SecondAssess,
  data = df_hosp_clean,
  names = c("Low", "High"),
  xlab = "Second MD Assessment",
  ylab = "Blood Pressure (mmHg)",
  main = "BP by Second MD Assessment",
  col = c("lightgreen", "salmon")
)
dev.off()

# Boxplot 3: BP by Final Decision
png("boxplot_final_decision.png", width = 800, height = 600, res = 120)
boxplot(
  BloodPressure ~ FinalDecision,
  data = df_hosp_clean,
  names = c("Low", "High"),
  xlab = "Final Decision",
  ylab = "Blood Pressure (mmHg)",
  main = "BP by Final Decision",
  col = c("moccasin", "mediumpurple1")
)
dev.off()

# 4

# Histogram 1: Visit Frequency
png("hist_frequency.png", width = 800, height = 600, res = 120)
hist(
  df_hosp_clean$Frequency,
  breaks = seq(0, 1, by = 0.1),
  xlab = "Visit Frequency",
  main = "Histogram of Visit Frequency",
  col = "skyblue",
  border = "white"
)
dev.off()

# Histogram 2: Blood Pressure
png("hist_blood_pressure.png", width = 800, height = 600, res = 120)
hist(
  df_hosp_clean$BloodPressure,
  breaks = 8,
  xlab = "Blood Pressure (mmHg)",
  main = "Histogram of Blood Pressure",
  col = "coral",
  border = "white"
)
dev.off()