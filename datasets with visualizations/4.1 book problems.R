# 4.1-1. r1 = 4, r2 = 2
# Plot of PDF with r = 6
data.frame(x = seq(0, 20, 0.01), prob = dchisq(seq(0, 20, 0.01), 6)) %>% ggplot(aes(x)) + geom_line(aes(y = prob), size = 1, color = 'blue')

# a. P(2.204 < X1 + X2 < 16.81)
pchisq(16.81, 6) - pchisq(2.204, 6)
data.frame(x = seq(0, 20, 0.01), prob = dchisq(seq(0, 20, 0.01), 6)) %>% ggplot(aes(x)) + geom_line(aes(y = prob), size = 1, color = 'blue') + stat_function(fun = dchisq, xlim = c(2.204, 16.81), geom = 'area', fill = 'blue', alpha = 0.3, args = list(df = 6)) + scale_x_continuous(breaks = c(0, 2.204, 10, 16.81, 20))

# b. P(12.59 < X1 + X2)
pchisq(12.59, 6, lower.tail = FALSE)
data.frame(x = seq(0, 20, 0.01), prob = dchisq(seq(0, 20, 0.01), 6)) %>% ggplot(aes(x)) + geom_line(aes(y = prob), size = 1, color = 'blue') + stat_function(fun = dchisq, xlim = c(12.59, 20), geom = 'area', fill = 'blue', alpha = 0.3, args = list(df = 6)) + scale_x_continuous(breaks = c(0, 10, 12.59, 20))

# 4.1-7c. n = 8, m = 10, xbar = 7.3, ybar = 6.4, sx = 12.7, sy = 10.3
s_pooled <- function(nx, ny, sx, sy){
  sqrt(((nx - 1) * sx^2 + (ny - 1) * sy^2) / (nx + ny - 2))
}

# Plot of critical value selection
data.frame(x = seq(-3, 3, 0.01), tprob = dt(seq(-3, 3, 0.01), 16)) %>% ggplot(aes(x)) + geom_line(aes(y = tprob), size = 1, color = 'blue') + stat_function(fun = dt, xlim = c(-1.746, 1.746), geom = 'area', fill = 'blue', alpha = 0.3, args = list(df = 16)) + annotate('text', x = 0, y = 0.2, size = 8, label = '0.95', color = 'blue') + annotate('text', x = 0, y = 0.15, size = 8, label = 't[16,0.90]^0.90 == 1.746', color = 'blue', parse = TRUE) + scale_x_continuous(breaks = c(-3, -1.746, -1, 0, 1, 1.746, 3)) + labs(y = 'Probability')

d <- 7.3 - 6.4

sp <- sqrt((7 * 12.7^2 + 9 * 10.3^2) / 16)

lower <- d - (qt(0.95, 16) * sp * sqrt(1 / 8 + 1 / 10))
upper <- d + (qt(0.95, 16) * sp * sqrt(1 / 8 + 1 / 10))

c(lower, upper)

# T distribution critical value plot (one tailed)
data.frame(x = seq(-3, 3, 0.01), tprob = dt(seq(-3, 3, 0.01), 16)) %>% ggplot(aes(x)) + geom_line(aes(y = tprob), size = 1, color = 'blue') + stat_function(fun = dt, xlim = c(-3, 1.746), geom = 'area', fill = 'blue', alpha = 0.3, args = list(df = 16)) + stat_function(fun = dt, xlim = c(1.746, 3), geom = 'area', fill = 'red', alpha = 0.3, args = list(df = 16)) + annotate('text', x = 0, y = 0.2, size = 8, label = '0.95', color = 'blue') + annotate('text', x = 0, y = 0.15, size = 8, label = 't[16,0.90]^0.90 == 1.746', color = 'blue', parse = TRUE) + annotate('text', x = 2.05, y = 0.02, size = 5, label = '0.05', color = 'red') + scale_x_continuous(breaks = c(-3, -1.746, -1, 0, 1, 1.746, 3)) + labs(y = 'Probability')

# Two tailed plot
data.frame(x = seq(-3, 3, 0.01), tprob = dt(seq(-3, 3, 0.01), 16)) %>% ggplot(aes(x)) + geom_line(aes(y = tprob), size = 1, color = 'blue') + stat_function(fun = dt, xlim = c(-1.746, 1.746), geom = 'area', fill = 'blue', alpha = 0.3, args = list(df = 16)) + stat_function(fun = dt, xlim = c(-3, -1.746), geom = 'area', fill = 'red', alpha = 0.3, args = list(df = 16)) + stat_function(fun = dt, xlim = c(1.746, 3), geom = 'area', fill = 'red', alpha = 0.3, args = list(df = 16)) + annotate('text', x = 0, y = 0.2, size = 8, label = '0.95', color = 'blue') + annotate('text', x = 0, y = 0.15, size = 8, label = 't[16,0.90]^0.90 == 1.746', color = 'blue', parse = TRUE) + annotate('text', x = -2.05, y = 0.02, size = 5, label = '0.05', color = 'red') + annotate('text', x = 2.05, y = 0.02, size = 5, label = '0.05', color = 'red') + scale_x_continuous(breaks = c(-3, -1.746, -1, 0, 1, 1.746, 3)) + labs(y = 'Probability')



# 4.1-3. X1 = N(3, 9), X2 = N(6, 16)
# P(-10 < Y < 5), Y = X1 - X2
# Variance of Y is given by the sum of the individual variances
y <- 3 - 6
var <- 9 + 16
pnorm(5, y, sqrt(var)) - pnorm(-10, y, sqrt(var))

# Plot of PDF
data.frame(x = seq(-25, 25, 0.01), prob = dnorm(seq(-25, 25, 0.01), -3, 5)) %>% ggplot(aes(x)) + geom_line(aes(y = prob), size = 1, color = 'blue') + geom_vline(xintercept = -3, color = 'blue', size = 1, linetype = 'dashed') + scale_x_continuous(breaks = c(-20, 10, -3, 0, 10, 20))

# Plot of probability
data.frame(x = seq(-25, 25, 0.01), prob = dnorm(seq(-25, 25, 0.01), -3, 5)) %>% ggplot(aes(x)) + geom_line(aes(y = prob), size = 1, color = 'blue') + geom_vline(xintercept = -3, color = 'blue', size = 1, linetype = 'dashed') + stat_function(fun = dnorm, xlim = c(-10, 5), geom = 'area', fill = 'blue', alpha = 0.3, args = list(mean = -3, sd = 5)) + scale_x_continuous(breaks = c(-20, -10, -3, 0, 5, 10, 20))







