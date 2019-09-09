Standards for Lab Assignments
================
Gabriel Butler, UCLA Global Classroom

**1. ALL lab assignments must be performed using R in RStudio and
published using RMarkdown.**

Credit will not be given for assignments that are done using other
languages or software packages. This means that if you do a lab in
Microsoft Excel or in a Jupyter Notebook using Python, or if you do your
work in Python in RStudio using `reticulate`, or in some other way, you
will receive a zero for this assignment. **No** exceptions.

**2. Absolutely no hard coding.**

In this class, hard coding is when instead of using code to generate
some output, you enter the desired output directly. This basically means
that you avoid the tricky work of writing a program by taking a shortcut
that doesn’t really require any programming knowledge.

For example, suppose that we want to calculate the sum of 2 and 3 and we
want to do it in a programmatic way by adding a couple of variables
together that we define. Below is an example of such a calculation that
is not hard coded.

``` r
a <- 2
b <- 3

c <- a + b

c
```

    ## [1] 5

If we’re struggling with the concept of combining user defined variables
or we’re just lazy, we could hard code our answer instead. Below is an
example of a calculation that is hard coded.

``` r
d <- 5

d
```

    ## [1] 5

One of the main goals of our course is for you to develop basic
statistical programming skills. If you avoid using the tools and
programming knowledge to which you are introduced in order to do your
lab work, then this will not happen. And if you fail to demonstrate your
ability to use this knowledge and these skills in your labs by hard
coding, you can expect to lose a lot of points on every assignment in
which this is done.

**3. ALWAYS show your code.**

This follows from the previous requirement. It won’t be possible to tell
whether or not your output is hard coded without being able to see the
code which generates the output.

**4. Write code that is clean and legible. Do not put several operations
on a single line.**

This makes it easier for other people to read your code. If you write in
an ideosyncratic way, this makes it much harder for your code to be
useful to other people or for me or anyone else to evaluate the quality
of your code. It will also make it much harder for you to go back weeks,
months or even years later and immediately understand your own code.

Look closely at the way in which I write code in the tutorials. You
should do your best to write it in the same way.

**5. `ggplot2` is the only acceptable visualization package for this
course.**

Of course there are others out there, and you may install these and
tinker with them on your own if you wish. But for your lab work, all of
your visualizations must be done using this package. One reason for this
is `ggplot2` is part of the `tidyverse` package and in order to use data
with `tidyverse`, your data must be in a “tidy” format. One of the goals
of this course is to familiarize you with tidy data. One way we will do
that is by using `tidyverse` tools with tidy data. These tools are very
powerful, but they don’t work with data that is not tidy.

And to clarify, it is fine to use other packages to augment your
`ggplot2` visualizations. For example, I often use the `ggarrange()`
function from the `ggpubr` package to make grids of `ggplot2`
visualizations. And it is fine to do stuff like this in your lab work
when it’s appropriate.

**6. All output from your code must be polished.**

This means your visualizations must be easy to interpret and so must the
output of any calculations you perform. It is up to you to figure out
how to do this, although plenty of guidance and examples are given in
the lab tutorials. Although you may always understand the output of the
code you create because you wrote the code, it is important for somebody
else who may have no programming background whatsoever to be able to
understand it without having to strain themselves. This will be
especially important in the future if you use R or other
languages/packages for more data analysis tasks in other courses that
you take or in the workplace.

I use examples of polished summaries and visualizations throughout the
tutorials. The amount of code this requires may seem daunting at first,
but you will get used to it.
