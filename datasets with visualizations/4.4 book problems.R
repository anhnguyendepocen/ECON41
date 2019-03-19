# 4.4-1
mu <- 10.1
n <- 16
xbar <- 10.4
s <- 0.4

# a.
qnorm(0.95)
z <- z_score(xbar, mu, s, n)
z
pnorm(z, 0, 1, lower.tail = FALSE)

# Plot of hypothesis test result--one tailed
data.frame(x = seq(-3, 3, 0.01), 
           prob = dnorm(seq(-3, 3, 0.01), 0, 1)) %>% ggplot(aes(x, prob)) +
  geom_line(size = 1, color = 'blue') +
  scale_x_continuous(breaks = c(-3, -2, -1, 0, 1, 1.645, 2, 3)) +
  stat_function(fun = dnorm, 
                args = list(mean = 0, sd = 1), 
                geom = 'area', 
                fill = 'red',
                alpha = 0.3,
                xlim = c(1.645, 3)) +
  stat_function(fun = dnorm, 
                args = list(mean = 0, sd = 1), 
                geom = 'area', 
                fill = 'blue',
                alpha = 0.3,
                xlim = c(-3, 1.645)) +
  geom_vline(xintercept = 3, 
             color = 'red', 
             size = 1, 
             linetype = 'dashed') +
  theme(axis.text.x = element_text(angle = 45, hjust = 1), 
        axis.title.x = element_blank())

# 4.4-3
mu <- 47
n <- 20
xbar <- 46.94
s <- 0.15
z <- z_score(xbar, mu, s, n)
z
pnorm(z, 0, 1)

# Plot of hypothesis test result--one tailed
data.frame(x = seq(-3, 3, 0.01), 
           prob = dnorm(seq(-3, 3, 0.01), 0, 1)) %>% ggplot(aes(x, prob)) +
  geom_line(size = 1, color = 'blue') +
  scale_x_continuous(breaks = c(-3, -1.789, -1.645, -1, 0, 1, 2, 3)) +
  stat_function(fun = dnorm, 
                args = list(mean = 0, sd = 1), 
                geom = 'area', 
                fill = 'red',
                alpha = 0.3,
                xlim = c(-1.645, -3)) +
  stat_function(fun = dnorm, 
                args = list(mean = 0, sd = 1), 
                geom = 'area', 
                fill = 'blue',
                alpha = 0.3,
                xlim = c(-1.645, 3)) +
  geom_vline(xintercept = -1.789, 
             color = 'red', 
             size = 1, 
             linetype = 'dashed') +
  theme(axis.text.x = element_text(angle = 90, hjust = 1), 
        axis.title.x = element_blank())

# 4.4-5
x <- c(0.50, 0.58, 0.90, 1.17, 1.14, 
       1.25, 0.75, 1.22, 0.74, 0.80)
y <- c(0.79, 0.71, 0.82, 0.82, 0.73,
       0.77, 0.72, 0.79, 0.72, 0.91)
milk <- data.frame(x = x, y = y)

t.test(milk$x, milk$y, 
       paired = TRUE, 
       alternative = 'greater')

t.test(milk$x, milk$y, 
       paired = TRUE, 
       alternative = 'greater')$p.value

# Plot of hypothesis test result--one tailed
data.frame(x = seq(-3, 3, 0.01), 
           prob = dt(seq(-3, 3, 0.01), 9)) %>% ggplot(aes(x, prob)) +
  geom_line(size = 1, color = 'blue') +
  scale_x_continuous(breaks = c(-3, -2, -1, 0, 1, 1.477, 1.833, 3)) +
  stat_function(fun = dt, 
                args = list(df = 9), 
                geom = 'area', 
                fill = 'blue',
                alpha = 0.3,
                xlim = c(-3, 1.833)) +
  stat_function(fun = dt, 
                args = list(df = 9), 
                geom = 'area', 
                fill = 'red',
                alpha = 0.3,
                xlim = c(1.833, 3)) +
  geom_vline(xintercept = 1.477, 
             color = 'blue', 
             size = 1, 
             linetype = 'dashed') +
  theme(axis.text.x = element_text(angle = 90, hjust = 1), 
        axis.title.x = element_blank())

# Problem from the internet
# Source: http://learntech.uwe.ac.uk/da/Default.aspx?pageid=1439
data(bpres)

t.test(bpres$standing, bpres$laying, paired = TRUE)

qt(0.05, 11)
t.test(bpres$standing, bpres$laying, paired = TRUE)$p.value
pt(-1.574, 11)

# Plot of hypothesis test result--one tailed
data.frame(x = seq(-3, 3, 0.01), 
           prob = dt(seq(-3, 3, 0.01), 9)) %>% ggplot(aes(x, prob)) +
  geom_line(size = 1, color = 'blue') +
  scale_x_continuous(breaks = c(-3, -2, -1.796, -1.574, -1, 0, 1, 2, 3)) +
  stat_function(fun = dt, 
                args = list(df = 11), 
                geom = 'area', 
                fill = 'red',
                alpha = 0.3,
                xlim = c(-3, -1.796)) +
  stat_function(fun = dt, 
                args = list(df = 11), 
                geom = 'area', 
                fill = 'blue',
                alpha = 0.3,
                xlim = c(-1.796, 3)) +
  geom_vline(xintercept = -1.574, 
             color = 'blue', 
             size = 1, 
             linetype = 'dashed') + ds_theme_set() +
  theme(axis.text.x = element_text(angle = 90, hjust = 1), 
        axis.title.x = element_blank())

# 10.65.
gas_taxes <- c(42.89, 53.91, 48.55, 47.90, 47.73, 46.61,
               40.45, 39.65, 38.65, 37.95, 36.80, 35.95,
               35.09, 35.04, 34.95, 33.45, 28.99, 27.45)

t.test(gas_taxes, mu = 45, alternative = 'less')


# 10.66
dl <- c(103.768, 88.602, 77.003, 123.086, 91.052,
        92.295, 61.675, 90.677, 84.023, 76.014,
        100.615, 88.017, 71.210, 82.115, 89.222,
        102.754, 108.579, 73.154, 106.755, 90.479)

t.test(dl, mu = 100, alternative = 'less', conf.level = 0.99)

# 4.4-7
s <- 0.065
df <- 19
sigma <- 0.095
chisq <- (df * s^2) / sigma^2
chisq
qchisq(0.05, 19)
pchisq(chisq, df)


# Hypothesis test result--one tailed
data.frame(x = seq(0, 50, 0.01), 
           chiprob = dchisq(seq(0, 50, 0.01), 19)) %>% ggplot(aes(x)) + 
  geom_line(aes(y = chiprob), size = 1, color = 'blue') + 
  ds_theme_set() +
  stat_function(fun = dchisq, xlim = c(0, 10.117), geom = 'area', 
                fill = 'red', alpha = 0.3, args = list(df = 19)) + 
  stat_function(fun = dchisq, xlim = c(10.117, 50), geom = 'area', 
                fill = 'blue', alpha = 0.3, args = list(df = 19)) +
  scale_x_continuous(breaks = c(0, 8.895, 10.117, 20, 30, 40, 50)) + 
  geom_vline(xintercept = 8.895, size = 1, linetype = 'dashed', color = 'red') +
  labs(y = 'Probability') +
  theme(axis.text.x = element_text(angle = 90, hjust = 1),
        axis.title.x = element_blank())


# 10.71
male <- c(96.9, 97.4, 97.5, 97.8, 
          97.8, 97.9, 98.0, 98.6, 98.8)
female <- c(97.8, 98.0, 98.2, 98.2, 
            98.2, 98.6, 98.8, 99.2, 99.4)
temps <- data.frame(male = male, female = female)

t.test(temps$male, temps$female, paired = TRUE)


# 10.75
traps <- c(17.4, 18.9, 39.6, 34.4, 19.6,
           33.7, 37.2, 43.4, 41.7, 27.5,
           24.1, 39.6, 12.2, 25.5, 22.1,
           29.3, 21.1, 23.8, 43.2, 24.4)

t.test(mean(traps), mu = 30.31, alternative = 'less')


# 10.16
gamma_sq <- 0.0002
s_sq <- 0.0003
n <- 10

chi_stat <- (n - 1) * s_sq / gamma_sq
chi_stat
qchisq(0.95, n - 1)
pchisq(chi_stat, n - 1)

# Hypothesis test result--one tailed
data.frame(x = seq(0, 30, 0.01), 
           chiprob = dchisq(seq(0, 30, 0.01), n - 1)) %>% ggplot(aes(x)) + 
  geom_line(aes(y = chiprob), size = 1, color = 'blue') + 
  ds_theme_set() +
  stat_function(fun = dchisq, xlim = c(0, 16.919), geom = 'area', 
                fill = 'blue', alpha = 0.3, args = list(df = n - 1)) + 
  stat_function(fun = dchisq, xlim = c(16.919, 30), geom = 'area', 
                fill = 'red', alpha = 0.3, args = list(df = n - 1)) +
  scale_x_continuous(breaks = c(0, 10, 13.5, 16.919, 20, 30)) + 
  geom_vline(xintercept = 13.5, size = 1, linetype = 'dashed', color = 'blue') +
  labs(y = 'Probability') +
  theme(axis.text.x = element_text(angle = 45, hjust = 1),
        axis.title.x = element_blank())


# 10.18
gamma_sq <- 4
s_sq <- 6.1
n <- 16

chi_stat <- (n - 1) * s_sq / gamma_sq
chi_stat
qchisq(c(0.025, 0.975), n - 1)
pchisq(chi_stat, n - 1, lower.tail = FALSE) * 2

# Hypothesis test result--one tailed
data.frame(x = seq(0, 40, 0.01), 
           chiprob = dchisq(seq(0, 40, 0.01), n - 1)) %>% ggplot(aes(x)) + 
  geom_line(aes(y = chiprob), size = 1, color = 'blue') + 
  ds_theme_set() +
  stat_function(fun = dchisq, xlim = c(6.262, 27.488), geom = 'area', 
                fill = 'blue', alpha = 0.3, args = list(df = n - 1)) + 
  stat_function(fun = dchisq, xlim = c(27.488, 40), geom = 'area', 
                fill = 'red', alpha = 0.3, args = list(df = n - 1)) +
  stat_function(fun = dchisq, xlim = c(0, 6.262), geom = 'area', 
                fill = 'red', alpha = 0.3, args = list(df = n - 1)) +
  scale_x_continuous(breaks = c(0, 6.262, 10, 20, 22.875, 27.488, 30, 40)) + 
  geom_vline(xintercept = 22.875, size = 1, linetype = 'dashed', color = 'blue') +
  labs(y = 'Probability') +
  theme(axis.text.x = element_text(angle = 45, hjust = 1),
        axis.title.x = element_blank())


# 10.79
gamma_sq <- 0.01
s_sq <- 0.018
n <- 8

chi_stat <- (n - 1) * s_sq / gamma_sq
chi_stat
qchisq(0.95, n - 1)
pchisq(chi_stat, n - 1, lower.tail = FALSE)

# Hypothesis test result--one tailed
data.frame(x = seq(0, 30, 0.01), 
           chiprob = dchisq(seq(0, 30, 0.01), n - 1)) %>% ggplot(aes(x)) + 
  geom_line(aes(y = chiprob), size = 1, color = 'blue') + 
  ds_theme_set() +
  stat_function(fun = dchisq, xlim = c(0, 14.067), geom = 'area', 
                fill = 'blue', alpha = 0.3, args = list(df = n - 1)) + 
  stat_function(fun = dchisq, xlim = c(14.067, 30), geom = 'area', 
                fill = 'red', alpha = 0.3, args = list(df = n - 1)) +
  scale_x_continuous(breaks = c(0, 10, 12.6, 14.067, 20, 30)) + 
  geom_vline(xintercept = 12.6, size = 1, linetype = 'dashed', color = 'blue') +
  labs(y = 'Probability') +
  theme(axis.text.x = element_text(angle = 45, hjust = 1),
        axis.title.x = element_blank())



