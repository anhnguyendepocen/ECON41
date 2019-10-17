Lab 9 - Confidence Intervals
================
Gabriel Butler, UCLA Global Classroom

### Introduction

This is our last mandatory lab assignment for the course, so this
assignment is intended be a bit challenging.

After downloading the dataset linked below, you will notice that it is
quite large (almost 23 megabytes) compared to other files we’ve used.
This is one of the reasons I chose it. In order to work with it you have
to have a good grasp of the methods that were introduced in the
tutorial. Successful implementation of these methods on such a large
dataset will demonstrate their power.

### Our data

The dataset for this lab also comes from the Machine Learning Repository
at the University of California, Irvine. It consists of a single
Microsoft Excel spreadsheet. The data and some basic information about
it are linked below.

<https://archive.ics.uci.edu/ml/datasets/Online+Retail>

### Your tasks

In this lab you’re going to have to clean the dataset you’re supposed to
use yourself. Please take the cleaning process seriously. If you don’t
do it correctly, you’ll be working with a different dataset than the one
I used to write the answers for this lab, which means you will lose lots
of points if you don’t do Part 1 correctly even if Part 2 is perfect,
which it won’t be because errors in Part 1 will carry over into Part 2.

**Part 1: Data cleaning**

1.  After downloading the dataset from the UCI website, load it into
    RStudio using the “Import Dataset” button. Save it as an object
    called `retail`. And be sure that you load the `InvoiceDate` column
    as a date variable.

2.  Filter `retail` so that it only contains rows for which `Quantity`
    and `UnitPrice` are greater than 0. Delete the `InvoiceNo` annd
    `CustomerID` columns.

3.  Reformat `InvoiceDate` so that all values are in year-month-day
    format, e.g., “2011-07-04”. This is simple, but you’ll have to do
    some searching in order to figure out how to do it.

4.  Create a new variable, `sale_value`, which is the product of the
    `UnitPrice` and `Quantity` columns.

When you are finished with your cleaning process, `retail` should look
like the printout
    below.

    ## Classes 'tbl_df', 'tbl' and 'data.frame':    530104 obs. of  7 variables:
    ##  $ StockCode  : chr  "85123A" "71053" "84406B" "84029G" ...
    ##  $ Description: chr  "WHITE HANGING HEART T-LIGHT HOLDER" "WHITE METAL LANTERN" "CREAM CUPID HEARTS COAT HANGER" "KNITTED UNION FLAG HOT WATER BOTTLE" ...
    ##  $ Quantity   : num  6 6 8 6 6 2 6 6 6 32 ...
    ##  $ InvoiceDate: chr  "2010-12-01" "2010-12-01" "2010-12-01" "2010-12-01" ...
    ##  $ UnitPrice  : num  2.55 3.39 2.75 3.39 3.39 7.65 4.25 1.85 1.85 1.69 ...
    ##  $ Country    : chr  "United Kingdom" "United Kingdom" "United Kingdom" "United Kingdom" ...
    ##  $ sale_value : num  15.3 20.3 22 20.3 20.3 ...

**Part 2: Analysis**

5.  Create a summary of `retail` which lists total sales per day. Save
    this as a dataframe called `retail_daily_sales`. Make sure your date
    column is a date object. If you have done this correctly, your
    output should look like the one below.

<!-- end list -->

    ## 'data.frame':    305 obs. of  2 variables:
    ##  $ InvoiceDate: Date, format: "2010-12-01" "2010-12-02" ...
    ##  $ daily_sales: num  58961 47748 46944 31775 54830 ...

6.  Use the dataframe you made to answer the last question to create a
    new summary which lists average daily sales for each month and
    contains a 95% confidence interval for each monthly average. If you
    have done this correctly, your output should look like the one
    below. (Don’t worry about the inclusion of the first of every month
    in each date.)

<!-- end list -->

    ## # A tibble: 13 x 4
    ##    month      avg_daily_sales  lower   upper
    ##    <date>               <dbl>  <dbl>   <dbl>
    ##  1 2010-12-01          41187. 31103.  51271.
    ##  2 2011-01-01          28807. 20628.  36986.
    ##  3 2011-02-01          21818. 18059.  25577.
    ##  4 2011-03-01          26579. 21749.  31410.
    ##  5 2011-04-01          25610. 20932.  30288.
    ##  6 2011-05-01          30821. 25507.  36136.
    ##  7 2011-06-01          29298. 24029.  34567.
    ##  8 2011-07-01          27662. 22749.  32576.
    ##  9 2011-08-01          29198. 22443.  35952.
    ## 10 2011-09-01          40715. 32867.  48563.
    ## 11 2011-10-01          44422. 37625.  51220.
    ## 12 2011-11-01          58058. 50394.  65721.
    ## 13 2011-12-01          79849. 35604. 124094.

7.  Use the summary you created to answer question six to create a plot
    like the one
below.

![](https://github.com/ghbutler/ECON41/blob/master/labs/lab%209/unnamed-chunk-5-1.png?raw=true)<!-- -->

8.  What do you think explains the apparent explosion in uncertainty
    towards the end of the timeframe considered in the figure above?
    (This question has a correct answer and is not really a matter of
    opinion.)
