Tutorial 3: Part 2 - Data Cleaning
================
Gabriel Butler, UCLA Global Classroom

### Introduction

The data we’re working with is stored at the Machine Learning Repository
at the University of California, Irvine. The original data along with
some information about it is linked below.

<https://archive.ics.uci.edu/ml/datasets/spambase>

The original data is not clean and it’s divided into two parts: variable
names and the data itself. We will begin by downloading these
files.

``` r
url <- 'https://archive.ics.uci.edu/ml/machine-learning-databases/spambase/spambase.data'

names <- 'https://archive.ics.uci.edu/ml/machine-learning-databases/spambase/spambase.names'

email <- read.table(url, header = FALSE, sep = ',')

names_vals <- read.table(names, 
                         comment.char = '|', 
                         sep = '', 
                         header = FALSE)
```

Let’s look first at our email data. It is quite a mess. We have 58
unnamed numeric variables to deal with.

``` r
str(email)
```

    ## 'data.frame':    4601 obs. of  58 variables:
    ##  $ V1 : num  0 0.21 0.06 0 0 0 0 0 0.15 0.06 ...
    ##  $ V2 : num  0.64 0.28 0 0 0 0 0 0 0 0.12 ...
    ##  $ V3 : num  0.64 0.5 0.71 0 0 0 0 0 0.46 0.77 ...
    ##  $ V4 : num  0 0 0 0 0 0 0 0 0 0 ...
    ##  $ V5 : num  0.32 0.14 1.23 0.63 0.63 1.85 1.92 1.88 0.61 0.19 ...
    ##  $ V6 : num  0 0.28 0.19 0 0 0 0 0 0 0.32 ...
    ##  $ V7 : num  0 0.21 0.19 0.31 0.31 0 0 0 0.3 0.38 ...
    ##  $ V8 : num  0 0.07 0.12 0.63 0.63 1.85 0 1.88 0 0 ...
    ##  $ V9 : num  0 0 0.64 0.31 0.31 0 0 0 0.92 0.06 ...
    ##  $ V10: num  0 0.94 0.25 0.63 0.63 0 0.64 0 0.76 0 ...
    ##  $ V11: num  0 0.21 0.38 0.31 0.31 0 0.96 0 0.76 0 ...
    ##  $ V12: num  0.64 0.79 0.45 0.31 0.31 0 1.28 0 0.92 0.64 ...
    ##  $ V13: num  0 0.65 0.12 0.31 0.31 0 0 0 0 0.25 ...
    ##  $ V14: num  0 0.21 0 0 0 0 0 0 0 0 ...
    ##  $ V15: num  0 0.14 1.75 0 0 0 0 0 0 0.12 ...
    ##  $ V16: num  0.32 0.14 0.06 0.31 0.31 0 0.96 0 0 0 ...
    ##  $ V17: num  0 0.07 0.06 0 0 0 0 0 0 0 ...
    ##  $ V18: num  1.29 0.28 1.03 0 0 0 0.32 0 0.15 0.12 ...
    ##  $ V19: num  1.93 3.47 1.36 3.18 3.18 0 3.85 0 1.23 1.67 ...
    ##  $ V20: num  0 0 0.32 0 0 0 0 0 3.53 0.06 ...
    ##  $ V21: num  0.96 1.59 0.51 0.31 0.31 0 0.64 0 2 0.71 ...
    ##  $ V22: num  0 0 0 0 0 0 0 0 0 0 ...
    ##  $ V23: num  0 0.43 1.16 0 0 0 0 0 0 0.19 ...
    ##  $ V24: num  0 0.43 0.06 0 0 0 0 0 0.15 0 ...
    ##  $ V25: num  0 0 0 0 0 0 0 0 0 0 ...
    ##  $ V26: num  0 0 0 0 0 0 0 0 0 0 ...
    ##  $ V27: num  0 0 0 0 0 0 0 0 0 0 ...
    ##  $ V28: num  0 0 0 0 0 0 0 0 0 0 ...
    ##  $ V29: num  0 0 0 0 0 0 0 0 0 0 ...
    ##  $ V30: num  0 0 0 0 0 0 0 0 0 0 ...
    ##  $ V31: num  0 0 0 0 0 0 0 0 0 0 ...
    ##  $ V32: num  0 0 0 0 0 0 0 0 0 0 ...
    ##  $ V33: num  0 0 0 0 0 0 0 0 0.15 0 ...
    ##  $ V34: num  0 0 0 0 0 0 0 0 0 0 ...
    ##  $ V35: num  0 0 0 0 0 0 0 0 0 0 ...
    ##  $ V36: num  0 0 0 0 0 0 0 0 0 0 ...
    ##  $ V37: num  0 0.07 0 0 0 0 0 0 0 0 ...
    ##  $ V38: num  0 0 0 0 0 0 0 0 0 0 ...
    ##  $ V39: num  0 0 0 0 0 0 0 0 0 0 ...
    ##  $ V40: num  0 0 0.06 0 0 0 0 0 0 0 ...
    ##  $ V41: num  0 0 0 0 0 0 0 0 0 0 ...
    ##  $ V42: num  0 0 0 0 0 0 0 0 0 0 ...
    ##  $ V43: num  0 0 0.12 0 0 0 0 0 0.3 0 ...
    ##  $ V44: num  0 0 0 0 0 0 0 0 0 0.06 ...
    ##  $ V45: num  0 0 0.06 0 0 0 0 0 0 0 ...
    ##  $ V46: num  0 0 0.06 0 0 0 0 0 0 0 ...
    ##  $ V47: num  0 0 0 0 0 0 0 0 0 0 ...
    ##  $ V48: num  0 0 0 0 0 0 0 0 0 0 ...
    ##  $ V49: num  0 0 0.01 0 0 0 0 0 0 0.04 ...
    ##  $ V50: num  0 0.132 0.143 0.137 0.135 0.223 0.054 0.206 0.271 0.03 ...
    ##  $ V51: num  0 0 0 0 0 0 0 0 0 0 ...
    ##  $ V52: num  0.778 0.372 0.276 0.137 0.135 0 0.164 0 0.181 0.244 ...
    ##  $ V53: num  0 0.18 0.184 0 0 0 0.054 0 0.203 0.081 ...
    ##  $ V54: num  0 0.048 0.01 0 0 0 0 0 0.022 0 ...
    ##  $ V55: num  3.76 5.11 9.82 3.54 3.54 ...
    ##  $ V56: int  61 101 485 40 40 15 4 11 445 43 ...
    ##  $ V57: int  278 1028 2259 191 191 54 112 49 1257 749 ...
    ##  $ V58: int  1 1 1 1 1 1 1 1 1 1 ...

Now let’s look at our name data for the above dataframe. It has two
variables, and it looks like the first one contains the variable names
we need, so let’s see what’s in it to make sure.

``` r
str(names_vals)
```

    ## 'data.frame':    58 obs. of  2 variables:
    ##  $ V1: Factor w/ 58 levels "1,","capital_run_length_average:",..: 1 38 18 20 13 43 44 51 34 41 ...
    ##  $ V2: Factor w/ 2 levels "0.","continuous.": 1 2 2 2 2 2 2 2 2 2 ...

``` r
names_vals$V1
```

    ##  [1] 1,                          word_freq_make:            
    ##  [3] word_freq_address:          word_freq_all:             
    ##  [5] word_freq_3d:               word_freq_our:             
    ##  [7] word_freq_over:             word_freq_remove:          
    ##  [9] word_freq_internet:         word_freq_order:           
    ## [11] word_freq_mail:             word_freq_receive:         
    ## [13] word_freq_will:             word_freq_people:          
    ## [15] word_freq_report:           word_freq_addresses:       
    ## [17] word_freq_free:             word_freq_business:        
    ## [19] word_freq_email:            word_freq_you:             
    ## [21] word_freq_credit:           word_freq_your:            
    ## [23] word_freq_font:             word_freq_000:             
    ## [25] word_freq_money:            word_freq_hp:              
    ## [27] word_freq_hpl:              word_freq_george:          
    ## [29] word_freq_650:              word_freq_lab:             
    ## [31] word_freq_labs:             word_freq_telnet:          
    ## [33] word_freq_857:              word_freq_data:            
    ## [35] word_freq_415:              word_freq_85:              
    ## [37] word_freq_technology:       word_freq_1999:            
    ## [39] word_freq_parts:            word_freq_pm:              
    ## [41] word_freq_direct:           word_freq_cs:              
    ## [43] word_freq_meeting:          word_freq_original:        
    ## [45] word_freq_project:          word_freq_re:              
    ## [47] word_freq_edu:              word_freq_table:           
    ## [49] word_freq_conference:       char_freq_;:               
    ## [51] char_freq_(:                char_freq_[:               
    ## [53] char_freq_!:                char_freq_$:               
    ## [55] char_freq_#:                capital_run_length_average:
    ## [57] capital_run_length_longest: capital_run_length_total:  
    ## 58 Levels: 1, capital_run_length_average: ... word_freq_your:

``` r
names_vals$V2
```

    ##  [1] 0.          continuous. continuous. continuous. continuous.
    ##  [6] continuous. continuous. continuous. continuous. continuous.
    ## [11] continuous. continuous. continuous. continuous. continuous.
    ## [16] continuous. continuous. continuous. continuous. continuous.
    ## [21] continuous. continuous. continuous. continuous. continuous.
    ## [26] continuous. continuous. continuous. continuous. continuous.
    ## [31] continuous. continuous. continuous. continuous. continuous.
    ## [36] continuous. continuous. continuous. continuous. continuous.
    ## [41] continuous. continuous. continuous. continuous. continuous.
    ## [46] continuous. continuous. continuous. continuous. continuous.
    ## [51] continuous. continuous. continuous. continuous. continuous.
    ## [56] continuous. continuous. continuous.
    ## Levels: 0. continuous.

### Naming our variables using the name data we downloaded

Okay, it’s pretty clear now that this dataframe contains the names we
need, but it still needs to be cleaned up a bit.

The first thing we’re going to do is delete that second column because
it doesn’t contain any useful information. Next, we’re going to use a
string manipulation function called `gsub()` to get rid of a couple of
features in the variable names that we saw above that we don’t need. The
first feature we’ll get rid of is the colons (`:`) and the second
feature is the `word_freq_` prefixes. (Please ignore any duplicate names
in the matrix below.)

``` r
names_vals$V2 <- NULL

names_vals <- gsub(':', '', as.matrix(names_vals$V1))

names_vals <- gsub('word_freq_', '', names_vals)

matrix(ncol = 4, names_vals)
```

    ## Warning in matrix(ncol = 4, names_vals): data length [58] is not a sub-
    ## multiple or multiple of the number of rows [15]

    ##       [,1]       [,2]        [,3]         [,4]                        
    ##  [1,] "1,"       "addresses" "labs"       "re"                        
    ##  [2,] "make"     "free"      "telnet"     "edu"                       
    ##  [3,] "address"  "business"  "857"        "table"                     
    ##  [4,] "all"      "email"     "data"       "conference"                
    ##  [5,] "3d"       "you"       "415"        "char_freq_;"               
    ##  [6,] "our"      "credit"    "85"         "char_freq_("               
    ##  [7,] "over"     "your"      "technology" "char_freq_["               
    ##  [8,] "remove"   "font"      "1999"       "char_freq_!"               
    ##  [9,] "internet" "000"       "parts"      "char_freq_$"               
    ## [10,] "order"    "money"     "pm"         "char_freq_#"               
    ## [11,] "mail"     "hp"        "direct"     "capital_run_length_average"
    ## [12,] "receive"  "hpl"       "cs"         "capital_run_length_longest"
    ## [13,] "will"     "george"    "meeting"    "capital_run_length_total"  
    ## [14,] "people"   "650"       "original"   "1,"                        
    ## [15,] "report"   "lab"       "project"    "make"

Our name data is looking a lot better now, but we still aren’t finished.
We’re missing one important variable name: `spam`, so we’re going to add
it by pasting it to the bottom of the list of variable names using
`rbind()`. Another thing we need to do is delete the name `"1,"` because
it serves no purpose.

``` r
names_vals <- rbind(names_vals, 'spam')

names_vals <- matrix(names_vals[-1, 1])

matrix(ncol = 4, names_vals)
```

    ## Warning in matrix(ncol = 4, names_vals): data length [58] is not a sub-
    ## multiple or multiple of the number of rows [15]

    ##       [,1]        [,2]       [,3]         [,4]                        
    ##  [1,] "make"      "free"     "telnet"     "edu"                       
    ##  [2,] "address"   "business" "857"        "table"                     
    ##  [3,] "all"       "email"    "data"       "conference"                
    ##  [4,] "3d"        "you"      "415"        "char_freq_;"               
    ##  [5,] "our"       "credit"   "85"         "char_freq_("               
    ##  [6,] "over"      "your"     "technology" "char_freq_["               
    ##  [7,] "remove"    "font"     "1999"       "char_freq_!"               
    ##  [8,] "internet"  "000"      "parts"      "char_freq_$"               
    ##  [9,] "order"     "money"    "pm"         "char_freq_#"               
    ## [10,] "mail"      "hp"       "direct"     "capital_run_length_average"
    ## [11,] "receive"   "hpl"      "cs"         "capital_run_length_longest"
    ## [12,] "will"      "george"   "meeting"    "capital_run_length_total"  
    ## [13,] "people"    "650"      "original"   "spam"                      
    ## [14,] "report"    "lab"      "project"    "make"                      
    ## [15,] "addresses" "labs"     "re"         "address"

Now we have the column names we need. (Again, please ignore any
duplicate names in the matrix above.)

So how can we rename the columns of `email` using them? That’s actually
pretty easy.

``` r
colnames(email) <- as.vector(names_vals)

head(email)
```

    ##   make address  all 3d  our over remove internet order mail receive will
    ## 1 0.00    0.64 0.64  0 0.32 0.00   0.00     0.00  0.00 0.00    0.00 0.64
    ## 2 0.21    0.28 0.50  0 0.14 0.28   0.21     0.07  0.00 0.94    0.21 0.79
    ## 3 0.06    0.00 0.71  0 1.23 0.19   0.19     0.12  0.64 0.25    0.38 0.45
    ## 4 0.00    0.00 0.00  0 0.63 0.00   0.31     0.63  0.31 0.63    0.31 0.31
    ## 5 0.00    0.00 0.00  0 0.63 0.00   0.31     0.63  0.31 0.63    0.31 0.31
    ## 6 0.00    0.00 0.00  0 1.85 0.00   0.00     1.85  0.00 0.00    0.00 0.00
    ##   people report addresses free business email  you credit your font  000
    ## 1   0.00   0.00      0.00 0.32     0.00  1.29 1.93   0.00 0.96    0 0.00
    ## 2   0.65   0.21      0.14 0.14     0.07  0.28 3.47   0.00 1.59    0 0.43
    ## 3   0.12   0.00      1.75 0.06     0.06  1.03 1.36   0.32 0.51    0 1.16
    ## 4   0.31   0.00      0.00 0.31     0.00  0.00 3.18   0.00 0.31    0 0.00
    ## 5   0.31   0.00      0.00 0.31     0.00  0.00 3.18   0.00 0.31    0 0.00
    ## 6   0.00   0.00      0.00 0.00     0.00  0.00 0.00   0.00 0.00    0 0.00
    ##   money hp hpl george 650 lab labs telnet 857 data 415 85 technology 1999
    ## 1  0.00  0   0      0   0   0    0      0   0    0   0  0          0 0.00
    ## 2  0.43  0   0      0   0   0    0      0   0    0   0  0          0 0.07
    ## 3  0.06  0   0      0   0   0    0      0   0    0   0  0          0 0.00
    ## 4  0.00  0   0      0   0   0    0      0   0    0   0  0          0 0.00
    ## 5  0.00  0   0      0   0   0    0      0   0    0   0  0          0 0.00
    ## 6  0.00  0   0      0   0   0    0      0   0    0   0  0          0 0.00
    ##   parts pm direct cs meeting original project   re  edu table conference
    ## 1     0  0   0.00  0       0     0.00       0 0.00 0.00     0          0
    ## 2     0  0   0.00  0       0     0.00       0 0.00 0.00     0          0
    ## 3     0  0   0.06  0       0     0.12       0 0.06 0.06     0          0
    ## 4     0  0   0.00  0       0     0.00       0 0.00 0.00     0          0
    ## 5     0  0   0.00  0       0     0.00       0 0.00 0.00     0          0
    ## 6     0  0   0.00  0       0     0.00       0 0.00 0.00     0          0
    ##   char_freq_; char_freq_( char_freq_[ char_freq_! char_freq_$ char_freq_#
    ## 1        0.00       0.000           0       0.778       0.000       0.000
    ## 2        0.00       0.132           0       0.372       0.180       0.048
    ## 3        0.01       0.143           0       0.276       0.184       0.010
    ## 4        0.00       0.137           0       0.137       0.000       0.000
    ## 5        0.00       0.135           0       0.135       0.000       0.000
    ## 6        0.00       0.223           0       0.000       0.000       0.000
    ##   capital_run_length_average capital_run_length_longest
    ## 1                      3.756                         61
    ## 2                      5.114                        101
    ## 3                      9.821                        485
    ## 4                      3.537                         40
    ## 5                      3.537                         40
    ## 6                      3.000                         15
    ##   capital_run_length_total spam
    ## 1                      278    1
    ## 2                     1028    1
    ## 3                     2259    1
    ## 4                      191    1
    ## 5                      191    1
    ## 6                       54    1

Viola\! This looks a lot better than the mess we started with. What a
relief\!

But if you compare the data above to the data we worked with in the
tutorial, there are still some big differences. In particular, all of
the variables in this dataset are numeric, but they should be logical
instead. Let’s get to work on fixing that.

### Restructuring our data for our lab

The reason why we’re converting these variables from numeric to logical
is because this is how the data was structured in the original STAT 13
lab by “Cocteau” of the UCLA Statistics Department. An extract from that
assignment which describes this is below.

> The labels of the first 48 represent words that might appear in an
> e-mail message. Each of these variables takes on the value 1 if the
> word occurred at least once in a given email message, and 0 otherwise.
> \[…\] The final variable \[…\] is called `spam` and indicates whether
> a given message is spam or not (0 means not spam, 1 means spam).

Source:
<http://www.stat.ucla.edu/~cocteau/teaching/stat13/labs/lab3.pdf>

Although R contains a type of variable called a logical variable with
two values, `TRUE` and `FALSE` for indicating whether a condition is
true or false, another way of representing this information is using 0
and 1, where 0 means “false” and 1 means “true”. (For example, this is
how this type of variable is represented in regression analysis with
what are called “dummy variables”.)

We *could* use this data as it is while keeping in mind what 0 and 1
mean, but this isn’t a traditional way of using the R language. In
addition, only one variable is currently recorded as only zeros and
ones. According to the comments in the names file, the rest of the
variables have numeric values which indicate the average frequency of
these words in the messages that our data summarize. There are
programming tricks we can use to use those variables in the same way
that we use `spam`, but it will complicate our code writing process, so
we will simplify this now by making all of these variables logical
variables instead like we saw in the tutorial.

This step of the cleaning process was actually quite tricky for me, so I
made a duplicate of `email` called `email2` so that I could always go
back to the file we made above if I made a big mistake and needed to
start over.

After a lot of trial and error I figured out that in order to change
these numeric variables into logical ones, all I needed to do was test
whether each value in each of the first 48 columns was not equal to `0`.
If for some observation it’s not equal to `0`, this means that the word
appeared in that message. If it is equal to `0`, this means that it did
not appear in that message. This test will tell me these results by
returning `TRUE` or `FALSE`, and what I needed to do was use these test
results to overwrite this original data.

Finally, since we’re focusing on whether or not 48 different words
appeared in the messages represented by our dataset and whether or not
these messages were classified as spam, I extracted those columns and
left the rest out.

The code I used to do this is shown below.

``` r
email2 <- email

for (col in colnames(email2)[1:48]){
  email2[[col]] <- email2[[col]] != 0
}

email2$spam <- email2$spam != 0

email2 <- email2 %>% select(c(1:48, 58))

str(email2)
```

    ## 'data.frame':    4601 obs. of  49 variables:
    ##  $ make      : logi  FALSE TRUE TRUE FALSE FALSE FALSE ...
    ##  $ address   : logi  TRUE TRUE FALSE FALSE FALSE FALSE ...
    ##  $ all       : logi  TRUE TRUE TRUE FALSE FALSE FALSE ...
    ##  $ 3d        : logi  FALSE FALSE FALSE FALSE FALSE FALSE ...
    ##  $ our       : logi  TRUE TRUE TRUE TRUE TRUE TRUE ...
    ##  $ over      : logi  FALSE TRUE TRUE FALSE FALSE FALSE ...
    ##  $ remove    : logi  FALSE TRUE TRUE TRUE TRUE FALSE ...
    ##  $ internet  : logi  FALSE TRUE TRUE TRUE TRUE TRUE ...
    ##  $ order     : logi  FALSE FALSE TRUE TRUE TRUE FALSE ...
    ##  $ mail      : logi  FALSE TRUE TRUE TRUE TRUE FALSE ...
    ##  $ receive   : logi  FALSE TRUE TRUE TRUE TRUE FALSE ...
    ##  $ will      : logi  TRUE TRUE TRUE TRUE TRUE FALSE ...
    ##  $ people    : logi  FALSE TRUE TRUE TRUE TRUE FALSE ...
    ##  $ report    : logi  FALSE TRUE FALSE FALSE FALSE FALSE ...
    ##  $ addresses : logi  FALSE TRUE TRUE FALSE FALSE FALSE ...
    ##  $ free      : logi  TRUE TRUE TRUE TRUE TRUE FALSE ...
    ##  $ business  : logi  FALSE TRUE TRUE FALSE FALSE FALSE ...
    ##  $ email     : logi  TRUE TRUE TRUE FALSE FALSE FALSE ...
    ##  $ you       : logi  TRUE TRUE TRUE TRUE TRUE FALSE ...
    ##  $ credit    : logi  FALSE FALSE TRUE FALSE FALSE FALSE ...
    ##  $ your      : logi  TRUE TRUE TRUE TRUE TRUE FALSE ...
    ##  $ font      : logi  FALSE FALSE FALSE FALSE FALSE FALSE ...
    ##  $ 000       : logi  FALSE TRUE TRUE FALSE FALSE FALSE ...
    ##  $ money     : logi  FALSE TRUE TRUE FALSE FALSE FALSE ...
    ##  $ hp        : logi  FALSE FALSE FALSE FALSE FALSE FALSE ...
    ##  $ hpl       : logi  FALSE FALSE FALSE FALSE FALSE FALSE ...
    ##  $ george    : logi  FALSE FALSE FALSE FALSE FALSE FALSE ...
    ##  $ 650       : logi  FALSE FALSE FALSE FALSE FALSE FALSE ...
    ##  $ lab       : logi  FALSE FALSE FALSE FALSE FALSE FALSE ...
    ##  $ labs      : logi  FALSE FALSE FALSE FALSE FALSE FALSE ...
    ##  $ telnet    : logi  FALSE FALSE FALSE FALSE FALSE FALSE ...
    ##  $ 857       : logi  FALSE FALSE FALSE FALSE FALSE FALSE ...
    ##  $ data      : logi  FALSE FALSE FALSE FALSE FALSE FALSE ...
    ##  $ 415       : logi  FALSE FALSE FALSE FALSE FALSE FALSE ...
    ##  $ 85        : logi  FALSE FALSE FALSE FALSE FALSE FALSE ...
    ##  $ technology: logi  FALSE FALSE FALSE FALSE FALSE FALSE ...
    ##  $ 1999      : logi  FALSE TRUE FALSE FALSE FALSE FALSE ...
    ##  $ parts     : logi  FALSE FALSE FALSE FALSE FALSE FALSE ...
    ##  $ pm        : logi  FALSE FALSE FALSE FALSE FALSE FALSE ...
    ##  $ direct    : logi  FALSE FALSE TRUE FALSE FALSE FALSE ...
    ##  $ cs        : logi  FALSE FALSE FALSE FALSE FALSE FALSE ...
    ##  $ meeting   : logi  FALSE FALSE FALSE FALSE FALSE FALSE ...
    ##  $ original  : logi  FALSE FALSE TRUE FALSE FALSE FALSE ...
    ##  $ project   : logi  FALSE FALSE FALSE FALSE FALSE FALSE ...
    ##  $ re        : logi  FALSE FALSE TRUE FALSE FALSE FALSE ...
    ##  $ edu       : logi  FALSE FALSE TRUE FALSE FALSE FALSE ...
    ##  $ table     : logi  FALSE FALSE FALSE FALSE FALSE FALSE ...
    ##  $ conference: logi  FALSE FALSE FALSE FALSE FALSE FALSE ...
    ##  $ spam      : logi  TRUE TRUE TRUE TRUE TRUE TRUE ...

And there we have it\! Our data is ready for analysis.
