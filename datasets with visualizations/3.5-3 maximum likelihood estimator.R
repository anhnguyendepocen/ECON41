pdf <- function(x, theta){
  theta * x^(theta - 1)
}

dat <- data.frame(x = seq(0, 1, 0.01), prob05 = pdf(seq(0, 1, 0.01), 0.5), prob1 = pdf(seq(0, 1, 0.01), 1), prob2 = pdf(seq(0, 1, 0.01), 2))
dat %>% ggplot(aes(x)) + geom_line(aes(y = prob05), color = 'blue', size = 1) + geom_line(aes(y = prob1), color = 'green', size = 1) + geom_line(aes(y = prob2), color = 'red', size = 1) + annotate('text', x = 0.13, y = 3, label = expression(theta~'= 0.5'), size = 8) + annotate('text', x = 0.8, y = 1.2, label = expression(theta~'= 1'), size = 8) + annotate('text', x = 0.8, y = 2, label = expression(theta~'= 2'), size = 8) + theme(axis.title.y = element_blank())

a <- c(0.0256, 0.3051, 0.0278, 0.8971, 0.0739,
       0.3191, 0.7379, 0.3671, 0.9763, 0.0102)

b <- c(0.9960, 0.3125, 0.4374, 0.7464, 0.8278,
       0.9518, 0.9924, 0.7112, 0.2228, 0.8609)

c <- c(0.4698, 0.3675, 0.5991, 0.9513, 0.6049,
       0.9917, 0.1551, 0.0710, 0.2110, 0.2154)

mlf <- function(n, x){
  -n / log(prod(x))
}

c(mlf(10, a), mlf(10, b), mlf(10, c))


