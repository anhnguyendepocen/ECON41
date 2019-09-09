Lab 2: Probability
================

### Your tasks

Use the tools and concepts you were introduced to in Tutorial 2 to
accomplish the following tasks. Use a `seed` integer of 5 to make your
work reproducible for all tasks.

1.  Generate a reproducible numeric summary of 8 trials of 100 flips of
    a fair coin. The structure and totals of your numeric summary must
    be identical to the one below. Don’t forget to show your code. **0
    points for hardcoded summaries.**

<!-- end list -->

    ##     names one two three four five six
    ## 1   first  15  20    16   12   16  21
    ## 2  second  13  17    21   15   17  17
    ## 3   third  25  16    16   12   16  15
    ## 4  fourth  18  19    18    9   17  19
    ## 5   fifth  16  15    22   12   19  16
    ## 6   sixth  13  18    15   24   14  16
    ## 7 seventh  17  18    18   13   14  20
    ## 8  eighth  12  19    15   18   15  21

2.  Summarize your results visually using an appropriate plot. Remember
    that the only acceptable visualization package is `ggplot2`.

3.  Repeat tasks 1 and 2 for an unfair die with a probability of 0.3 for
    rolling a 4.

4.  Create a function like `flip_heads()`, but for a fair die instead,
    and have it focus on the probability of rolling a 4. Show a grid of
    4 plots for 5, 10, 100 and 1,000 rolls.

5.  Repeat task 4, but for a biased die with a probability of 0.3 for
    rolling a 4.
