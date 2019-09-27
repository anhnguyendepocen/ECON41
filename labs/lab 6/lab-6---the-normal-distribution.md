Lab 6 - The Normal Distribution
================
Gabriel Butler, UCLA Global Classroom

### Our data

The dataset we’ll be working with in this lab comes from the Stat Labs
data repository at the University of California, Berkeley. We will be
using the “Birth weight I” dataset. Below is a description of its
contents from the *Stat Labs* book.

> The data available for this lab are a subset of a much larger study —
> the Child Health and Development Studies (Yerushalmy \[Yer64\]). The
> entire CHDS database includes all pregnancies that occurred between
> 1960 and 1967 among women in the Kaiser Foundation Health Plan in
> Oakland, California. The Kaiser Health Plan is a prepaid medical care
> program. The women in the study were all those enrolled in the Kaiser
> Plan who had obtained prenatal care in the San Francisco–East Bay area
> and who delivered at any of the Kaiser hospitals in Northern
> California.

> \[…\]

> At birth, measurements on the baby were recorded. They included the
> baby’s length, weight, and head circumference. Provided here is a
> subset of this information collected for 1236 babies — those baby boys
> born during one year of the study who lived at least 28 days and who
> were single births (i.e., not one of a twin or triplet). The
> information available for each baby is birth weight and whether or not
> the mother smoked during her pregnancy.

The birth weight of each baby was recorded in ounces.

### Your tasks

1.  Download and clean the “Birth weight I” data from the link below.

<https://www.stat.berkeley.edu/users/statlabs/labs.html>

When your cleaning process is finished, the first six rows of your data
should look like the printout below.

    ##   bwt smoke
    ## 1 120    No
    ## 2 113    No
    ## 3 128   Yes
    ## 4 123    No
    ## 5 108   Yes
    ## 6 136    No

2.  Using the definition of “low birth weight” from the tutorial, what
    is the proportion of babies in this sample that can be classified as
    low birth weight?

3.  Using the same definition of “low birth weight”, what is the
    proportion of babies in this sample among mothers who were not
    smokers that can be classified as low birth weight?

4.  Using the same definition of “low birth weight”, what is the
    proportionn of babies in this sample among mothers who were smokers
    that can be classified as low birth weight?

5.  What is the smoker vs. non-smoker ratio of low weight births in this
    sample?

6.  Reproduce the plot below. Explain what it tells us. Feel free to use
    information you used to answer previous questions in this lab to
    support your
explanation.

![](https://github.com/ghbutler/ECON41/blob/master/labs/lab%206/unnamed-chunk-3-1.png?raw=true)<!-- -->

Extra credit: What was your birth weight in ounces? Use this information
to report your birth weight percentile.
