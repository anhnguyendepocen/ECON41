Tutorial for Lab 1 - Part 2: Who plays video games?
================

## Getting data from the web and data cleaning

### Gabriel Butler, UCLA Global Classroom

### Downloading our data

Recall that we have been working with a dataset that we downloaded from
a UC Berkeley website. This dataset, along with many others, can be
found at the URL below.

<https://www.stat.berkeley.edu/users/statlabs/labs.html>

In the last tutorial I provided a “clean” version of this data. Using
the codebook in the link above together with the dataset, it was
relatively easy to tell what each variable represented and what each
value of each variable represented. But what did the data look like
before I cleaned it?

In order to answer this question, we need to get the original dataset
off the web in order to look at it. There are a couple of ways that we
can do this.

The first way was used in the last tutorial: I downloaded the dataset
from the Berkeley Statistics website and then imported it into RStudio
manually using a button in the top right window of the program called
“Import Dataset”. It’s okay to do this sometimes, and sometimes it
isn’t. When you want the analysis of some data that you’ve created to
be reproducible, you need to give people who read your analysis access
to your data in its original form and show them everything you did to
manipulate your data from start to finish as part of your analysis. This
is basic transparency. I could’ve made the last tutorial a bit more
transparent by including the original dataset along with detailed
information about my cleaning process, but I felt that would’ve been too
much information for our first tutorial, so I decided to break this
tutorial into two parts and discuss the cleaning process here.

The second way is by downloading data directly into whatever software
you’re using for your analysis, in this case RStudio. (Another very
popular platform that we won’t be using in this class is the web-based
Jupyter Notebook, which you will learn much more about if you start
learning Python for data analysis.)

How can we do this? We’re going to download the original data into this
document using the function `read.table()` because it is the most
appropriate for the type of data that we are working with. However,
downloading data from the web into R is a **huge** topic in itself
because there are so many different types of data out there and the
quality of data out there varies greatly. Below is an article and a
series of courses on DataCamp about this topic in R. I recommend having
a glance at the article before proceeding.

<https://www.datacamp.com/community/tutorials/r-data-import-tutorial>

<https://www.datacamp.com/tracks/importing-cleaning-data-with-r>

With so many different types of data out there and so many different
functions for reading them into R, how do we know we’re supposed to
`read.table()` for our data?

![](https://github.com/ghbutler/ECON41/blob/master/tutorials/tutorial%201a/Screen%20Shot%202019-09-04%20at%209.49.16%20AM.png?raw=true)<!-- -->

First, we should download the file to our computer and have a look at it
using a program like Notepad (on Windows) or TextEditor (on Mac). How
are the values of the variables separated? There are many kinds of
separators out there, such as commas, semicolons, spaces, tabs and so
on. In this file it looks like the values are separated by several
spaces, which are tabs. According to that DataCamp article
`read.table()` is used with “tab-delimited text files”, so this is
probably the function we need to use, so let’s give it a try.

After consulting the documentation for this function by typing
`?read.table` into the RStudio console, we find that this function has
one mandatory argument, `file`, which “can also be a complete URL”. We
can pass a URL to this function by entering it as a string. Let’s try it
by saving our result as `video` like in the last tutorial and inspect it
by using `head()`, which will show us the first six lines of the
dataframe.

``` r
url <- 'https://www.stat.berkeley.edu/users/statlabs/data/video.data'

video <- read.table(url)

head(video)
```

    ##     V1   V2    V3   V4   V5   V6  V7  V8   V9  V10  V11 V12   V13   V14
    ## 1 time like where freq busy educ sex age home math work own cdrom email
    ## 2    2    3     3    2    0    1   0  19    1    0   10   1     0     1
    ## 3    0    3     3    3    0    0   0  18    1    1    0   1     1     1
    ## 4    0    3     1    3    0    0   1  19    1    0    0   1     0     1
    ## 5  0.5    3     3    3    0    1   0  19    1    0    0   1     0     1
    ## 6    0    3     3    4    0    1   0  19    1    1    0   0     0     1
    ##     V15
    ## 1 grade
    ## 2     4
    ## 3     2
    ## 4     3
    ## 5     3
    ## 6     3

Look closely at our result. Something is wrong with the names of our
variables. They’re strange numbered ones that R has automatically
generated, not actual words like we saw in the last tutorial. What can
we do about this?

By looking again at the documentation for `read.table()`, we find that
there is a second optional argument for this function called `header`,
which is “a logical variable indicating whether the file contains the
names of the variables as the first line”. Its default value is `FALSE`,
and since we didn’t tell R otherwise, it generated new variable names
for us, hence these weird numbered variable names that start with `V`.
(“`V`” probably stands for “vague”.) To fix this, all we need to do is
add `header = TRUE` to our `read.table()` call.

``` r
video <- read.table(url, header = TRUE)

head(video)
```

    ##   time like where freq busy educ sex age home math work own cdrom email
    ## 1  2.0    3     3    2    0    1   0  19    1    0   10   1     0     1
    ## 2  0.0    3     3    3    0    0   0  18    1    1    0   1     1     1
    ## 3  0.0    3     1    3    0    0   1  19    1    0    0   1     0     1
    ## 4  0.5    3     3    3    0    1   0  19    1    0    0   1     0     1
    ## 5  0.0    3     3    4    0    1   0  19    1    1    0   0     0     1
    ## 6  0.0    3     2    4    0    0   1  19    0    0   12   0     0     0
    ##   grade
    ## 1     4
    ## 2     2
    ## 3     3
    ## 4     3
    ## 5     3
    ## 6     3

Great\! Now our dataframe is starting to look more like the one we
worked with in the last tutorial. But there’s still one big problem: all
of our variables are numerics or integers. When we look back at the
codebook for this dataset on the Berkeley Statistics website, we are
reminded that some of these variables, such as `age` and `time` are
indeed numeric variables. However, for others, such as `freq` and
`busy`, these numbers correspond to verbal statements about these
topics, such as whether or not a respondent plays video games while they
are “busy”. Before we run any kind of analysis on this data, we need to
make its values more easily interpretable. In other words, we need to
“clean” it up because it’s pretty “dirty” (difficult to interpret
and/or analyze) in its current form. If you’re thinking about a career
in Data Science or any field that requires you to work with data, you
should get used to doing stuff like this because it will likely take up
a majority of your time. The article below provides a great overview of
this aspect of Data Science in
practice.

<https://www.nytimes.com/2014/08/18/technology/for-big-data-scientists-hurdle-to-insights-is-janitor-work.html>

<https://github.com/ghbutler/ECON41/blob/master/tutorials/tutorial%201a/For%20Big-Data%20Scientists%2C%20%E2%80%98Janitor%20Work%E2%80%99%20Is%20Key%20Hurdle%20to%20Insights%20-%20The%20New%20York%20Times.pdf>

### Cleaning our data

To clean up this dataset, first we need to review using the codebook
what each of the variables in it represent. After doing this it is
obvious that `time`, `age` and `work` are appropriately expressed as
numerics or integers, so we do not need to do modify these variables in
any way.

It follows that we need to somehow change all of the other variables.
Since we now know that the values of these other variables in their
current form correspond to verbal responses to the questions that
correspond to these variables, we should change the values of these
variables so that they represent the responses themselves and not
numbers which represent these responses.

In order to do this, we need to transform these variables into different
data types, in this case factors. We can do this using the `factor()`
function. After turning these variables into factors, we need to change
the levels of each of these variables so that each level corresponds to
a verbal statement instead of just a number. We will start by working
with `like`.

``` r
video$like <- factor(video$like)

levels(video$like)
```

    ## [1] "1"  "2"  "3"  "4"  "5"  "99"

``` r
levels(video$like) <- c('Never played', 
                        'Very much', 
                        'Somewhat', 
                        'Not really', 
                        'Not at all',
                        'No response')

levels(video$like)
```

    ## [1] "Never played" "Very much"    "Somewhat"     "Not really"  
    ## [5] "Not at all"   "No response"

To change the levels of this factor so that they contain levels that are
verbal statements and not numbers that represent verbal statements,
first we must transform `video$like` into a factor variable using
`factor()`.

According to the codebook, the values of `like` have the following
meanings: “1=Never played, 2=Very much, 3=Somewhat, 4=Not really, 5=Not
at all”. These are the levels for `like` that we want to use in our
analysis of this data. But we see from the printout of
`levels(video$like)` that this variable actually has six levels, the
last being `99`. Recall from the last tutorial that `99` represents `No
response`. We need to include this level too, just like we did in the
last tutorial.

Next, we need to overwrite the current levels of this new factor
variable, which are still `1`, `2`, `3`, `4`, `5` and `99`. This
information is contained in a vector, so we need to overwrite it using a
new vector which contains **the same number of elements** as the
original vector. This detail is very important. If the vector we are
using for overwriting contains a different number of elements than the
original vector, R will throw an error. Always inspect the levels of a
factor variable that you’re modifying **before** modifying it to avoid
simple and frustrating mistakes like this.

For the remaining variables to be modified, the cleaning process is
identical, so I will include one more example below but exclude the
other cases because it would be too repetitive.

``` r
video$where <- factor(video$where)

levels(video$where)
```

    ## [1] "1"  "2"  "3"  "4"  "5"  "6"  "99"

``` r
levels(video$where) <- c('Arcade', 
                         'Console', 
                         'Personal computer', 
                         'Computer and console', 
                         'Arcade and home(console or computer)', 
                         'Arcade and home (both console and computer)',
                         'No response')

levels(video$where)
```

    ## [1] "Arcade"                                     
    ## [2] "Console"                                    
    ## [3] "Personal computer"                          
    ## [4] "Computer and console"                       
    ## [5] "Arcade and home(console or computer)"       
    ## [6] "Arcade and home (both console and computer)"
    ## [7] "No response"

After completing the cleaning process for this dataset, we see a
familiar sight.

``` r
str(video)
```

    ## 'data.frame':    91 obs. of  15 variables:
    ##  $ time : num  2 0 0 0.5 0 0 0 0 2 0 ...
    ##  $ like : Factor w/ 6 levels "Never played",..: 3 3 3 3 3 3 4 3 3 3 ...
    ##  $ where: Factor w/ 7 levels "Arcade","Console",..: 3 3 1 3 3 2 3 3 2 3 ...
    ##  $ freq : Factor w/ 5 levels "Daily","Weekly",..: 2 3 3 3 4 4 4 4 1 4 ...
    ##  $ busy : Factor w/ 3 levels "No","Yes","No response": 1 1 1 1 1 1 1 1 2 1 ...
    ##  $ educ : Factor w/ 3 levels "No","Yes","No response": 2 1 1 2 2 1 1 1 2 2 ...
    ##  $ sex  : Factor w/ 2 levels "Female","Male": 1 1 2 1 1 2 2 1 2 2 ...
    ##  $ age  : int  19 18 19 19 19 19 20 19 19 19 ...
    ##  $ home : Factor w/ 2 levels "No","Yes": 2 2 2 2 2 1 2 2 1 2 ...
    ##  $ math : Factor w/ 3 levels "No","Yes","No response": 1 2 1 1 2 1 2 1 1 2 ...
    ##  $ work : int  10 0 0 0 0 12 10 13 0 0 ...
    ##  $ own  : Factor w/ 2 levels "No","Yes": 2 2 2 2 1 1 2 1 1 2 ...
    ##  $ cdrom: Factor w/ 3 levels "No","Yes","No response": 1 2 1 1 1 1 1 1 1 1 ...
    ##  $ email: Factor w/ 2 levels "No","Yes": 2 2 2 2 2 1 2 2 1 2 ...
    ##  $ grade: Factor w/ 5 levels "A","B","C","D",..: 3 1 2 2 2 2 2 2 3 3 ...

### More resources

The articles and courses about importing and cleaning data and its
importance that were linked above really are worth your time, so I have
linked them again below. In addition, Google is also a great way to
search for answers to more specific questions. Please take this topic
seriously, because very soon you will have to clean a dataset yourself
in order to analyze it as part of a lab assignment for this
class.

<https://www.nytimes.com/2014/08/18/technology/for-big-data-scientists-hurdle-to-insights-is-janitor-work.html>

<https://github.com/ghbutler/ECON41/blob/master/tutorials/tutorial%201a/For%20Big-Data%20Scientists%2C%20%E2%80%98Janitor%20Work%E2%80%99%20Is%20Key%20Hurdle%20to%20Insights%20-%20The%20New%20York%20Times.pdf>

<https://www.datacamp.com/community/tutorials/r-data-import-tutorial>

<https://www.datacamp.com/tracks/importing-cleaning-data-with-r>
