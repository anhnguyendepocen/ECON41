# Function for standardizing a sample mean for a given population mean
z_score <- function(xbar, mu, sd, n){
  (xbar - mu) / (sd / sqrt(n))
}

# 3.6-1
# (a, b) = (0, 1)
# mu = (a + b) / 2 = 0.5
# var = (b - a) / 12 = 1 / 12
# sd = sqrt(1 / 12)
upper1 <- z_score(2 / 3, 0.5, sqrt(1 / 12), 12)
lower1 <- z_score(0.5, 0.5, sqrt(1 / 12), 12)
pnorm(upper1, 0, 1) - pnorm(lower1, 0, 1)

# Plot of the above approximation
# Probably needs to be shaded for P(1 / 2 <= X =< 2 / 3)
# Should it be scaled differently too?
# Should I bother with a visualization at all?
uniform(12, 8, 0, 1) + stat_function(fun = dnorm, color = 'red', args = list(mean = 0.5, sd = sqrt(1 / 12)), size = 1)

# 3.6-3
# mu = sd = theta = 3
upper2 <- z_score(4, 3, 3, 36)
lower2 <- z_score(2.5, 3, 3, 36)
pnorm(upper2, 0, 1) - pnorm(lower2, 0, 1)

# 3.6-5
upper3 <- z_score(54.453, 54.030, 5.8, 47)
lower3 <- z_score(52.761, 54.030, 5.8, 47)
pnorm(upper3, 0, 1) - pnorm(lower3, 0, 1)

# 3.6-7
upper4 <- z_score(3406.24, 3320, 660, 225)
lower4 <- z_score(3233.76, 3320, 660, 225)
pnorm(upper4, 0, 1) - pnorm(lower4, 0, 1)

# 3.6-10
z1 <- z_score(2050, 2000, 500, 25)
pnorm(z1, 0, 1, lower.tail = FALSE)

# 3.6-11
z2 <- z_score(29.5, 30, 3, 100)
pnorm(z2, 0, 1, lower.tail = FALSE)


