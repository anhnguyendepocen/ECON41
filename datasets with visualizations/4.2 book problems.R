# Function for calculating pooled standard deviation
s_pooled <- function(nx, ny, sx, sy){
  sqrt(((nx - 1) * sx^2 + (ny - 1) * sy^2) / (nx + ny - 2))
}

# 4.2-1.
fish_length <- c(13.1, 5.1, 18.0, 
                 8.7, 16.5, 9.8, 6.8,
                 12.0, 17.8, 25.4, 
                 19.2, 15.8, 23.0)

s <- sd(fish_length)

# a. Point estimate for standard deviation
s

# b. 95% confidence interval for standard deviation
df <- length(fish_length) - 1

upper <- sqrt((df * s^2) / qchisq(0.025, df))
lower <- sqrt((df * s^2) / qchisq(0.975, df))

c(lower, upper)


# 4.2-7.
cheese <- c(21.50, 18.95, 18.55, 19.40, 19.15,
            22.35, 22.90, 22.20, 23.10)

df <- length(cheese) - 1

upper <- mean(cheese) + qt(0.975, df) * (sd(cheese) / sqrt(length(cheese)))
lower <- mean(cheese) - qt(0.975, df) * (sd(cheese) / sqrt(length(cheese)))

c(lower, upper)


# 4.2-9
pressure <- c(3.1, 3.3, 4.5, 2.8, 3.5,
              3.5, 3.7, 4.2, 3.9, 3.3)

# a.
mean(pressure)

# b.
sd(pressure)

# c.
df <- length(pressure) - 1

upper <- mean(pressure) + qt(0.95, df) * (sd(pressure) / sqrt(length(pressure)))
lower <- mean(pressure) - qt(0.95, df) * (sd(pressure) / sqrt(length(pressure)))
c(lower, upper)


# 4.2-11.
wire_pull <- c(28.8, 24.4, 30.1, 25.6, 26.4,
               23.9, 22.1, 22.5, 27.6, 28.1,
               20.8, 27.7, 24.4, 25.1, 24.6,
               26.3, 28.2, 22.2, 26.3, 24.4)

# a.
mean(wire_pull)
sd(wire_pull)

# b.
df <- length(wire_pull) - 1
upper <- mean(wire_pull) + qt(0.99, df) * (sd(wire_pull) / sqrt(length(wire_pull)))
lower <- mean(wire_pull) - qt(0.99, df) * (sd(wire_pull) / sqrt(length(wire_pull)))
c(lower, upper)


# 4.2-13.
x <- c(649, 657, 714, 877, 975, 468,
       567, 849, 721, 791, 874, 405)

y <- c(699, 891, 632, 815, 589, 764, 524, 727,
       597, 868, 652, 978, 479, 733, 549, 790)

# a. 95% confidence interval for difference in means
d <- mean(x) - mean(y)

df <- length(x) + length(y) - 2

sp <- s_pooled(length(x), length(y), sd(x), sd(y))

upper <- d + qt(0.975, df) * sqrt(sp^2 / length(x) + sp^2 / length(y))
lower <- d - qt(0.975, df) * sqrt(sp^2 / length(x) + sp^2 / length(y))

c(lower, upper)

# b. Box plot
x <- as.data.frame(x)
y <- as.data.frame(y)
names(y) <- 'x'
names(x) <- 'x'
y$variable <- rep('Y', nrow(y))
x$variable <- rep('X', nrow(x))

ggplot(NULL, aes(x = variable, y = x)) + 
  geom_boxplot(data = x, aes(fill = 'pink')) + 
  geom_boxplot(data = y, aes(fill = 'turqoise')) + 
  theme(legend.position = 'none') + 
  labs(x = 'Variable', y = 'Butterfat production (in pounds)') + 
  scale_y_continuous(limits = c(0, 1200))

# c. Difference does not appear to be significant
