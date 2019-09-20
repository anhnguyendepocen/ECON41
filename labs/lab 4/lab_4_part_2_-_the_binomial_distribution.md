Lab 4: Part 2 - The Binomial Distribution
================
Gabriel Butler, UCLA Global Classroom

### Introduction

This lab was adapted from the following lab which was given as part of a
2009 version of STAT 10 at UCLA.

<http://www.stat.ucla.edu/~yexy/stat10/lab3.pdf>

For this lab we will continue thinking about the imbalance between male
and female births in the USA.

The tutorial contained a link to a news article which had some
information we needed for our simulation. The article is linked again
below because you will need to dig through its contents (including links
inside of the article) in order to correctly complete tasks for this
lab.

<https://www.npr.org/sections/health-shots/2015/03/30/396384911/why-are-more-baby-boys-born-than-girls>

**Please do not use any other sources of information.** It may be
tempting to just Google information that you might be able to use to
answer the first question instead of doing the hard work of finding this
stuff inside of the provided source. However, there is no guarantee that
alternative sources will contain the same information that will be used
to evaluate your work. This means that if you use the wrong data to do
your calculations, your errors will cascade through your work and add up
to a lot of lost points. Please follow the instructions as they are
written\!

### Your tasks

1.  Calculate the percentage of births in the USA that were female for
    the year that you were born. If you cannot find information for the
    year of your birth, use information for the most recent year that is
    available. Calculate this number inside of your lab report, save it
    as a variable so that you can use it later and print it so that its
    accuracy can be easily verified. Please do not round the number.

<!-- end list -->

  - Hint: Completion of the above task will require some detective work.
    This part of the lab is very important\! If you get this wrong, it
    will throw off the rest of your calculations\!

<!-- end list -->

2.  Using the value you calculated in the last problem together with R’s
    built-in functions for the binomial distribution, calculate the
    theoretical probabilities for the possible numbers of girls that a
    family with three children could have. Store this information in a
    dataframe that is easy to read and print it inside of your lab
    report.

3.  Using the same probability that was calculated in Question 1
    together with a `seed` integer of 10, simulate outcomes for 10
    families. Add this simulated data to the dataframe you created for
    your answer to Question 2. Print your results inside of your lab
    report.

4.  Repeat what you did to answer Question 3 for 1,000 families. Print
    your results inside of your lab report.

5.  Explain why your empirical results are not exactly equal to the
    theoretical probabilities.
