# a
pnorm(0.87, 0, 1) - pnorm(0, 0, 1)
# b
pnorm(0, 0, 1) - pnorm(-2.64, 0, 1)
# c
pnorm(-0.56, 0, 1) - pnorm(-2.13, 0, 1)
# d
pnorm(1.39, 0, 1, lower.tail = FALSE) + pnorm(-1.39, 0, 1)
# e
pnorm(-1.62, 0, 1)
# f
pnorm(1, 0, 1, lower.tail = FALSE) + pnorm(-1, 0, 1)
# g
pnorm(2, 0, 1, lower.tail = FALSE) + pnorm(-2, 0, 1)
# h
pnorm(3, 0, 1, lower.tail = FALSE) + pnorm(-3, 0, 1)