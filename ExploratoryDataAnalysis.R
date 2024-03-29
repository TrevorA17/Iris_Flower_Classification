# Load dataset
iris_data <- read.csv("data/iris.csv", colClasses = c(
  sepal_length = "numeric",
  sepal_width = "numeric",
  petal_length = "numeric",
  petal_width = "numeric",
  species = "character"
))

# Define levels for categorical column
species_levels <- c("Iris-setosa", "Iris-versicolor", "Iris-virginica")

# Update factor column with levels
iris_data$species <- factor(iris_data$species, levels = species_levels)

# Display the dataset
View(iris_data)

Mode <- function(x) {
  ux <- unique(x)
  ux[which.max(tabulate(match(x, ux)))]
}

# Calculate measures of central tendency for sepal_length
mean_sepal_length <- mean(iris_data$sepal_length)
median_sepal_length <- median(iris_data$sepal_length)
mode_sepal_length <- Mode(iris_data$sepal_length)

cat("Measures of Central Tendency for sepal_length:\n")
cat(paste0("Mean: ", round(mean_sepal_length, 2)), "\n")
cat(paste0("Median: ", median_sepal_length), "\n")
cat(paste0("Mode: ", mode_sepal_length), "\n\n")

# Calculate measures of central tendency for sepal_width
mean_sepal_width <- mean(iris_data$sepal_width)
median_sepal_width <- median(iris_data$sepal_width)
mode_sepal_width <- Mode(iris_data$sepal_width)

cat("Measures of Central Tendency for sepal_width:\n")
cat(paste0("Mean: ", round(mean_sepal_width, 2)), "\n")
cat(paste0("Median: ", median_sepal_width), "\n")
cat(paste0("Mode: ", mode_sepal_width), "\n\n")

# Calculate measures of central tendency for petal_length
mean_petal_length <- mean(iris_data$petal_length)
median_petal_length <- median(iris_data$petal_length)
mode_petal_length <- Mode(iris_data$petal_length)

cat("Measures of Central Tendency for petal_length:\n")
cat(paste0("Mean: ", round(mean_petal_length, 2)), "\n")
cat(paste0("Median: ", median_petal_length), "\n")
cat(paste0("Mode: ", mode_petal_length), "\n\n")

# Calculate measures of central tendency for petal_width
mean_petal_width <- mean(iris_data$petal_width)
median_petal_width <- median(iris_data$petal_width)
mode_petal_width <- Mode(iris_data$petal_width)

cat("Measures of Central Tendency for petal_width:\n")
cat(paste0("Mean: ", round(mean_petal_width, 2)), "\n")
cat(paste0("Median: ", median_petal_width), "\n")
cat(paste0("Mode: ", mode_petal_width), "\n\n")


# Calculate range, variance, and standard deviation for sepal_length
range_sepal_length <- range(iris_data$sepal_length)
variance_sepal_length <- var(iris_data$sepal_length)
sd_sepal_length <- sd(iris_data$sepal_length)

cat("Measures of Distribution for sepal_length:\n")
cat(paste0("Range: ", paste(range_sepal_length, collapse = " - ")), "\n")
cat(paste0("Variance: ", round(variance_sepal_length, 2)), "\n")
cat(paste0("Standard Deviation: ", round(sd_sepal_length, 2)), "\n\n")

# Calculate range, variance, and standard deviation for sepal_width
range_sepal_width <- range(iris_data$sepal_width)
variance_sepal_width <- var(iris_data$sepal_width)
sd_sepal_width <- sd(iris_data$sepal_width)

cat("Measures of Distribution for sepal_width:\n")
cat(paste0("Range: ", paste(range_sepal_width, collapse = " - ")), "\n")
cat(paste0("Variance: ", round(variance_sepal_width, 2)), "\n")
cat(paste0("Standard Deviation: ", round(sd_sepal_width, 2)), "\n\n")

# Calculate range, variance, and standard deviation for petal_length
range_petal_length <- range(iris_data$petal_length)
variance_petal_length <- var(iris_data$petal_length)
sd_petal_length <- sd(iris_data$petal_length)

cat("Measures of Distribution for petal_length:\n")
cat(paste0("Range: ", paste(range_petal_length, collapse = " - ")), "\n")
cat(paste0("Variance: ", round(variance_petal_length, 2)), "\n")
cat(paste0("Standard Deviation: ", round(sd_petal_length, 2)), "\n\n")

# Calculate range, variance, and standard deviation for petal_width
range_petal_width <- range(iris_data$petal_width)
variance_petal_width <- var(iris_data$petal_width)
sd_petal_width <- sd(iris_data$petal_width)

cat("Measures of Distribution for petal_width:\n")
cat(paste0("Range: ", paste(range_petal_width, collapse = " - ")), "\n")
cat(paste0("Variance: ", round(variance_petal_width, 2)), "\n")
cat(paste0("Standard Deviation: ", round(sd_petal_width, 2)), "\n\n")


# Calculate correlation coefficients for numerical columns
cor_sepal <- cor(iris_data[, c("sepal_length", "sepal_width")])
cor_petal <- cor(iris_data[, c("petal_length", "petal_width")])
cor_all <- cor(iris_data[, c("sepal_length", "sepal_width", "petal_length", "petal_width")])

cat("Correlation Coefficients for Sepal Length and Sepal Width:\n")
print(cor_sepal)
cat("\n")

cat("Correlation Coefficients for Petal Length and Petal Width:\n")
print(cor_petal)
cat("\n")

cat("Correlation Coefficients for All Numerical Columns:\n")
print(cor_all)
cat("\n")

# Perform ANOVA for sepal_length by species
anova_sepal_length <- aov(sepal_length ~ species, data = iris_data)
summary(anova_sepal_length)

# Perform ANOVA for sepal_width by species
anova_sepal_width <- aov(sepal_width ~ species, data = iris_data)
summary(anova_sepal_width)

# Perform ANOVA for petal_length by species
anova_petal_length <- aov(petal_length ~ species, data = iris_data)
summary(anova_petal_length)

# Perform ANOVA for petal_width by species
anova_petal_width <- aov(petal_width ~ species, data = iris_data)
summary(anova_petal_width)

# Install and load the necessary library if not already installed
if (!require("ggplot2")) {
  install.packages("ggplot2")
}
library(ggplot2)

# Assuming iris_data is the name of your dataset

# Install and load the necessary library if not already installed
if (!require("ggplot2")) {
  install.packages("ggplot2")
}
library(ggplot2)

# Create univariate plots for sepal_length, sepal_width, petal_length, and petal_width
ggplot(iris_data, aes(x = sepal_length)) +
  geom_histogram(binwidth = 0.1, fill = "blue", color = "black", alpha = 0.7) +
  labs(title = "Histogram of Sepal Length", x = "Sepal Length", y = "Frequency") +
  theme_minimal()

ggplot(iris_data, aes(x = sepal_width)) +
  geom_histogram(binwidth = 0.1, fill = "green", color = "black", alpha = 0.7) +
  labs(title = "Histogram of Sepal Width", x = "Sepal Width", y = "Frequency") +
  theme_minimal()

ggplot(iris_data, aes(x = petal_length)) +
  geom_histogram(binwidth = 0.1, fill = "orange", color = "black", alpha = 0.7) +
  labs(title = "Histogram of Petal Length", x = "Petal Length", y = "Frequency") +
  theme_minimal()

ggplot(iris_data, aes(x = petal_width)) +
  geom_histogram(binwidth = 0.1, fill = "red", color = "black", alpha = 0.7) +
  labs(title = "Histogram of Petal Width", x = "Petal Width", y = "Frequency") +
  theme_minimal()

# Scatterplot matrix
scatter_matrix <- ggplot(iris_data, aes(x = sepal_length, y = sepal_width, color = species)) +
  geom_point() +
  labs(title = "Scatterplot Matrix", color = "Species") +
  theme_minimal()

print(scatter_matrix)

# Pairwise Scatterplot with Species color differentiation
pairwise_scatterplot <- ggplot(iris_data, aes(color = species)) +
  geom_point(aes(x = sepal_length, y = sepal_width)) +
  geom_point(aes(x = petal_length, y = petal_width)) +
  geom_point(aes(x = sepal_length, y = petal_length)) +
  geom_point(aes(x = sepal_width, y = petal_width)) +
  labs(title = "Pairwise Scatterplot with Species Color Differentiation") +
  theme_minimal()

print(pairwise_scatterplot)

# 3D Scatterplot
three_d_scatterplot <- ggplot(iris_data, aes(x = sepal_length, y = sepal_width, z = petal_length, color = species)) +
  geom_point() +
  labs(title = "3D Scatterplot with Species Color Differentiation") +
  theme_minimal() +
  theme(legend.position = "bottom")

print(three_d_scatterplot)
