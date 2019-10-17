Tutorial 9 - Confidence Intervals
================
Gabriel Butler, UCLA Global Classroom

### Confidence intervals in R

We already know what a confidence interval is because we’ve taken AP
Statistics, because we’ve heard about it in lecture and because we’ve
probably heard about it in discussion by now too.

Below is the output of a function from another writer which randomly
generated some 95% confidence intervals for the mean of the standard
normal distribution. Notice that about 95% of these confidence intervals
contain the population mean of 0. (The script of this function is
available upon request, but I’ve decided not to include it here because
it is quite complicated and a bit of a
distraction.)

![](https://github.com/ghbutler/ECON41/blob/master/tutorials/tutorial%209/unnamed-chunk-2-1.png?raw=true)<!-- -->

Now we are going to start generating our own confidence intervals. The
first way we’re going to produce a confidence interval in R is by
extracting it from a run of `t.test()`. In the last tutorial and lab,
you probably noticed that the information this function returns includes
not only stuff like the p value of our test statistic, but also a
confidence interval which corresponds to the type of test that was run.

Let’s review how to use this function by running it on a vector of data
which contains the weights of several different wheels of cheese. And
let’s test the hypothesis that the mean weight of these cheese wheels is
equal to 18.

``` r
cheese <- c(21.5, 18.95, 18.55, 19.4, 19.15,
            22.35, 22.9, 22.2, 23.1)

t.test(cheese, mu = 18, alternative = 'two.sided')
```

    ## 
    ##  One Sample t-test
    ## 
    ## data:  cheese
    ## t = 4.6814, df = 8, p-value = 0.001579
    ## alternative hypothesis: true mean is not equal to 18
    ## 95 percent confidence interval:
    ##  19.47149 22.32851
    ## sample estimates:
    ## mean of x 
    ##      20.9

If we want to extract the confidence interval from the above printout,
all we need to do is extract `conf.int` as if this were a column from a
dataframe.

``` r
t.test(cheese, mu = 18, alternative = 'two.sided')$conf.int
```

    ## [1] 19.47149 22.32851
    ## attr(,"conf.level")
    ## [1] 0.95

This returns not only the confidence interval but the confidence level
for it. That is a pretty important piece of information because it says
a lot about the precision of the confidence interval and its accuracy.

Since the focus of this tutorial is on the production of confidence
intervals, we’re going to leave the topic of hypothesis testing aside
for now. In order to better focus on this topic, we’re going to write a
function called `ci_calculator()` that we will use to produce confidence
intervals. It will be pretty easy to use. It takes four arguments. The
first, `x_bar` is the mean of the sample data for which we want to
construct a confidennce interval. This can be a vector or a column from
a dataframe. The second argument, `conf_lvl`, is the confidence level
for which we want to construct our confidence interval. The third
argument, `sd`, is the standard deviation of our sample data, and `n` is
the number of observations in our sample. Let’s run it on `cheese` and
see what we get.

``` r
ci_calculator <- function(x_bar, conf_lvl, sd, n){
  upper <- x_bar + qt(conf_lvl + 0.025, n - 1) * sd / sqrt(n)
  lower <- x_bar + qt(1 - conf_lvl - 0.025, n - 1) * sd / sqrt(n)
  return(c(lower, upper))
}

ci_calculator(mean(cheese), 0.95, sd(cheese), length(cheese))
```

    ## [1] 19.47149 22.32851

We get the same confidence interval that we calculated earlier using
`t.test()`. This function will be very useful for us later.

### Constructing confidence intervals for time series data

The first dataset we’re going to work with also comes from the Machine
Learning Repository at the University of California, Irvine. The data
covers a sample of real estate transactions in the Sindian District of
Taipei, Taiwan, China in 2012 and 2013.

<https://archive.ics.uci.edu/ml/datasets/Real+estate+valuation+data+set>

``` r
load('taipei_housing.RData')

str(taipei_data)
```

    ## Classes 'tbl_df', 'tbl' and 'data.frame':    414 obs. of  7 variables:
    ##  $ date              : chr  "2012.9166667" "2012.9166667" "2013.5833333" "2013.5" ...
    ##  $ age               : num  32 19.5 13.3 13.3 5 7.1 34.5 20.3 31.7 17.9 ...
    ##  $ mrt_dist          : num  84.9 306.6 562 562 390.6 ...
    ##  $ convenience_stores: num  10 9 5 5 5 3 7 6 1 3 ...
    ##  $ latitude          : num  25 25 25 25 25 ...
    ##  $ longitude         : num  122 122 122 122 122 ...
    ##  $ unit_area_price   : num  37.9 42.2 47.3 54.8 43.1 32.1 40.3 46.7 18.8 22.1 ...

The data in its current form isn’t very useful to us. According to the
documentation on the UCI website, dates are recorded as fractions of a
year, where 2013.250 means March 2013. There is also geocoding data
(longitude and latitude) which is not useful to us either.

Two bits of information that will be useful, however, are
`unit_area_price` and `date`. The former is fine in its current form,
but the latter will require some cleaning to become useful. Notice that
from the summary we can see that the `date` variable is a “character”
data type. In other words, dates are recorded as strings.

In order to clean up the dates data, we’ll use a basic string
manipulation tool called splitting. If you’ve taken a Computer Science
course before, especially a Python based one, you probably already have
some experience with this. If not, you’re about to learn something
completely new.

The first thing we’re going to do with our dates data is feed it into a
function called `strsplit()`. The first argument is the `date` column
and the second is the separator that is used to divide up different
parts of the dates as they’re recorded. In this case, that is a period.
We also need to set `fixed = TRUE` to make sure this function will read
the data it’s being given properly.

``` r
dates <- strsplit(taipei_data$date, '.', fixed = TRUE)

dates[1]
```

    ## [[1]]
    ## [1] "2012"    "9166667"

There are over 400 observations in this dataset, so let’s just look at
the first result we get after splitting the dates inside of the `date`
column. Notice that this returns a list with two items. The first item
is the year of the transaction and the second item is the fraction of
that year which is supposed to represent the date of the transaction in
that year. We’re not going to bother trying to turn those fractions into
months and days, so all we need from each of the lists inside `dates` is
the year. That will be our next cleaning step.

``` r
year <- c()

for (lst in dates){
  row <- c(unlist(lst)[1])
  year <- rbind(year, row)
}

taipei_data$date <- NULL

taipei_data$year <- as.vector(year)

str(taipei_data)
```

    ## Classes 'tbl_df', 'tbl' and 'data.frame':    414 obs. of  7 variables:
    ##  $ age               : num  32 19.5 13.3 13.3 5 7.1 34.5 20.3 31.7 17.9 ...
    ##  $ mrt_dist          : num  84.9 306.6 562 562 390.6 ...
    ##  $ convenience_stores: num  10 9 5 5 5 3 7 6 1 3 ...
    ##  $ latitude          : num  25 25 25 25 25 ...
    ##  $ longitude         : num  122 122 122 122 122 ...
    ##  $ unit_area_price   : num  37.9 42.2 47.3 54.8 43.1 32.1 40.3 46.7 18.8 22.1 ...
    ##  $ year              : chr  "2012" "2012" "2013" "2013" ...

In the `for` loop above, we go through each of the lists in `dates`,
unlist them, extract the first element (the transaction year) and then
put this element into a vector called `year`. After we done, we delete
the original `date` column and add our `year` vector as a column to our
`taipei_data` dataframe. Our cleaning process is complete.

Now we’re going to summarize this data, in this case by calculating the
average unit area price for each year in our dataset with a 95%
confidence interval for each year.

``` r
housing_summary <- taipei_data %>% 
  group_by(year) %>% 
  summarize(avg_price = mean(unit_area_price),
            lower = ci_calculator(mean(unit_area_price),
                                  0.95,
                                  sd(unit_area_price),
                                  length(unit_area_price))[1],
            upper = ci_calculator(mean(unit_area_price),
                                  0.95,
                                  sd(unit_area_price),
                                  length(unit_area_price))[2])

housing_summary
```

    ## # A tibble: 2 x 4
    ##   year  avg_price lower upper
    ##   <chr>     <dbl> <dbl> <dbl>
    ## 1 2012       36.3  34.1  38.5
    ## 2 2013       38.7  37.1  40.3

Notice that this summary is not a dataframe, but rather a similar data
type called a tibble. A tibble is like a cross between a dataframe and a
table object. But in order to use stuff like `ggplot2` with this kind of
an object, we do need to turn it into a dataframe.

``` r
as.data.frame(housing_summary) %>% ggplot() +
  geom_line(aes(as.double(year), avg_price), size = 1) +
  geom_line(aes(as.double(year), lower), linetype = 'dashed') +
  geom_line(aes(as.double(year), upper), linetype = 'dashed') +
  scale_y_continuous(limits = c(0, 42)) +
  scale_x_continuous(breaks = c(2012, 2013)) +
  labs(x = 'Year', 
       y = 'Average unit price',
       title = 'Average real estate transaction values in Taipei, Taiwan, China',
       subtitle = 'n = 414') +
  theme_bw()
```

![](https://github.com/ghbutler/ECON41/blob/master/tutorials/tutorial%209/unnamed-chunk-10-1.png?raw=true)<!-- -->

The plot above shows us how the average unit area price in our sample
changed from 2012 to 2013. The dashed lines represent the upper and
lower bounds of the confidence intervals for this average in each year.
The average price increased over this period, but there is some
uncertainty about whether this change really happened because our
confidence intervals for each year overlap.

### Another confidence interval example with time series data

The `datasets` package contains a trio of datasets under the name
`UKLungDeaths` with the following description:

> Three time series giving the monthly deaths from bronchitis, emphysema
> and asthma in the UK, 1974–1979, both sexes (`ldeaths`), males
> (`mdeaths`) and females (`fdeaths`).

Let’s load this package and have a look at the `mdeaths` dataset. It’s
not necessary to look at `fdeaths` because the structure of the data is
identical.

``` r
library(datasets)
mdeaths
```

    ##       Jan  Feb  Mar  Apr  May  Jun  Jul  Aug  Sep  Oct  Nov  Dec
    ## 1974 2134 1863 1877 1877 1492 1249 1280 1131 1209 1492 1621 1846
    ## 1975 2103 2137 2153 1833 1403 1288 1186 1133 1053 1347 1545 2066
    ## 1976 2020 2750 2283 1479 1189 1160 1113  970  999 1208 1467 2059
    ## 1977 2240 1634 1722 1801 1246 1162 1087 1013  959 1179 1229 1655
    ## 1978 2019 2284 1942 1423 1340 1187 1098 1004  970 1140 1110 1812
    ## 1979 2263 1820 1846 1531 1215 1075 1056  975  940 1081 1294 1341

This data is easy to read, but it isn’t tidy, so we need to clean it up
before we can do anything with it. The process of reshaping this data
will be pretty similar to the one we used for the last dataset we worked
with, so I will skip explaining it. Do read through the code and try to
make sure you understand everything that’s being done down there though.

``` r
male_death_df <- data.frame('num_deaths' = mdeaths)
male_death_df$dates <- seq(as.Date('1974-01-01'), as.Date('1979-12-31'), by = 'months')

dates <- strsplit(as.character(male_death_df$dates), '-', fixed = TRUE)

year <- c()

for (lst in dates){
  row <- c(unlist(lst)[1])
  year <- rbind(year, row)
}

male_death_df$year <- year

male_death_df$dates <- NULL

head(male_death_df)
```

    ##   num_deaths year
    ## 1       2134 1974
    ## 2       1863 1974
    ## 3       1877 1974
    ## 4       1877 1974
    ## 5       1492 1974
    ## 6       1249 1974

The preview of our tidied dataset we get by using `head()` on it shows
that our cleaning process is complete.

Now that our data is tidied, let’s summarize it. We’re going to
calculate average monthly deaths for each year along with a 95%
confidence interval for each of these averages.

``` r
male_death_summary <- male_death_df %>% 
  group_by(year) %>% 
  summarize(avg_deaths = mean(num_deaths),
            lower = ci_calculator(mean(num_deaths),
                                  0.95,
                                  sd(num_deaths),
                                  length(num_deaths))[1],
            upper = ci_calculator(mean(num_deaths),
                                  0.95,
                                  sd(num_deaths),
                                  length(num_deaths))[2])

male_death_summary
```

    ## # A tibble: 6 x 4
    ##   year  avg_deaths lower upper
    ##   <chr>      <dbl> <dbl> <dbl>
    ## 1 1974       1589. 1380. 1798.
    ## 2 1975       1604. 1332. 1876.
    ## 3 1976       1558. 1190. 1927.
    ## 4 1977       1411. 1162. 1660.
    ## 5 1978       1444. 1157. 1731.
    ## 6 1979       1370. 1106. 1633.

The summary above contains the information we want. `avg_deaths`
represents average monthly deaths for each year, `lower` represents the
lower bound of a 95% confidence interval for this number, and `upper`
represents the upper bound of a 95% confidence interval for this number.

After cleaning up `fdeaths` in a similar way, which has been done in the
background, we can put these datasets together in a plot that is quite
informative.

``` r
ggplot() +
  geom_line(aes(as.double(year), avg_deaths), 
            data = female_death_summary,
            size = 1,
            color = 'salmon') +
  geom_line(aes(as.double(year), lower),
            data = female_death_summary,
            linetype = 'dashed',
            color = 'salmon') +
  geom_line(aes(as.double(year), upper),
            data = female_death_summary,
            linetype = 'dashed',
            color = 'salmon') +
  geom_line(aes(as.double(year), avg_deaths),
            data = male_death_summary,
            size = 1,
            color = 'blue') +
  geom_line(aes(as.double(year), lower),
            data = male_death_summary,
            linetype = 'dashed',
            color = 'blue') +
  geom_line(aes(as.double(year), upper),
            data = male_death_summary,
            linetype = 'dashed',
            color = 'blue') +
  scale_y_continuous(limits = c(0, 2000)) +
  labs(title = 'Average monthly lung disease deaths in the UK',
       subtitle = '1974 - 1979',
       x = 'Year',
       y = 'Number of deaths') +
  theme_bw()
```

![](https://github.com/ghbutler/ECON41/blob/master/tutorials/tutorial%209/unnamed-chunk-15-1.png?raw=true)<!-- -->

Although there is more uncertainty about average monthly deaths from
these diseases among men over this period, there is an obvious
difference in the frequency of deaths from bronchitis, emphysema and
asthma between men and women in the UK over this period. What do you
think explains these differences? This is an extremely complicated
question.

However, one of the reasons why men died at higher rates than women over
this period is related to smoking. In 1974, over 50% of men in the UK
were smokers, while over 40% of women in the UK were smokers. Smoking
causes emphysema, which is one of the diseases covered by the
`UKLungDeaths`
dataset.

![](https://github.com/ghbutler/ECON41/blob/master/tutorials/tutorial%209/unnamed-chunk-16-1.png?raw=true)<!-- -->

We can see from the plot above that during three two year periods which
span most of the period shown above in our confidence interval plot, men
in the UK smoked at significantly higher rates than women. Higher rates
of smoking undoubtedly contributed to the higher average monthly lung
disease deaths for men compared to women in the UK over the same period.
The original data for UK smoking rates and a short article about this
topic are linked
below.

<https://www.ons.gov.uk/peoplepopulationandcommunity/healthandsocialcare/drugusealcoholandsmoking/datasets/adultsmokinghabitsingreatbritain>

<http://news.bbc.co.uk/2/hi/uk_news/8490490.stm>

### Estimating monthly average PM 2.5 readings in Beijing, China

Our next example is also based on data from the Machine Learning
Repository at the University of California, Irvine. The data we’re
focusing on consists of hourly readings of PM 2.5 concentration in the
air outside of the US Embassy in Beijing, China. The original data along
with a description of its contents is available at the link below.

<https://archive.ics.uci.edu/ml/datasets/Beijing+PM2.5+Data>

We’re going to read this data in from the web and delete one of the
variables, `No`, because it represents row numbers, so this information
is
redundant.

``` r
url <- 'https://archive.ics.uci.edu/ml/machine-learning-databases/00381/PRSA_data_2010.1.1-2014.12.31.csv'

beijing_air <- read.csv(url)

beijing_air$No <- NULL

str(beijing_air)
```

    ## 'data.frame':    43824 obs. of  12 variables:
    ##  $ year : int  2010 2010 2010 2010 2010 2010 2010 2010 2010 2010 ...
    ##  $ month: int  1 1 1 1 1 1 1 1 1 1 ...
    ##  $ day  : int  1 1 1 1 1 1 1 1 1 1 ...
    ##  $ hour : int  0 1 2 3 4 5 6 7 8 9 ...
    ##  $ pm2.5: int  NA NA NA NA NA NA NA NA NA NA ...
    ##  $ DEWP : int  -21 -21 -21 -21 -20 -19 -19 -19 -19 -20 ...
    ##  $ TEMP : num  -11 -12 -11 -14 -12 -10 -9 -9 -9 -8 ...
    ##  $ PRES : num  1021 1020 1019 1019 1018 ...
    ##  $ cbwd : Factor w/ 4 levels "cv","NE","NW",..: 3 3 3 3 3 3 3 3 3 3 ...
    ##  $ Iws  : num  1.79 4.92 6.71 9.84 12.97 ...
    ##  $ Is   : int  0 0 0 0 0 0 0 0 0 0 ...
    ##  $ Ir   : int  0 0 0 0 0 0 0 0 0 0 ...

The next thing we’re going to do is merge the `year`, `month` and `day`
variables and seperate them with a hyphen (-) to create a single
variable, `date`, which will be a date object instead of simply string.
After putting this variable into the original dataset, we’re going to
extract it together with `pm2.5` to create a smaller dataset that
contains only the information we
need.

``` r
beijing_air$date <- as.Date(with(beijing_air, paste(year, month, day, sep = '-')))

beijing_air_filtered <- beijing_air %>% filter(!is.na(pm2.5)) %>% select(date, pm2.5)

str(beijing_air_filtered)
```

    ## 'data.frame':    41757 obs. of  2 variables:
    ##  $ date : Date, format: "2010-01-02" "2010-01-02" ...
    ##  $ pm2.5: int  129 148 159 181 138 109 105 124 120 132 ...

Now we’re going to summarize the PM 2.5 readings my calculating the
average for each month, and we’re going to construct 95% confidence
intervals for each monthly average. The grouping step is a bit more
complicated here because we have to make use of a function called
`floor_date()` from the `lubridate` package.

``` r
library(lubridate)

air_summary <- beijing_air_filtered %>% 
  group_by(month = floor_date(date, unit = 'month')) %>%
  summarize(avg_pm2.5 = mean(pm2.5),
            lower = ci_calculator(mean(pm2.5), 
                                  0.95, 
                                  sd(pm2.5), 
                                  length(pm2.5))[1],
            upper = ci_calculator(mean(pm2.5),
                                  0.95,
                                  sd(pm2.5),
                                  length(pm2.5))[2])

air_summary
```

    ## # A tibble: 60 x 4
    ##    month      avg_pm2.5 lower upper
    ##    <date>         <dbl> <dbl> <dbl>
    ##  1 2010-01-01      90.4  83.2  97.7
    ##  2 2010-02-01      97.2  90.8 104. 
    ##  3 2010-03-01      94.1  87.9 100. 
    ##  4 2010-04-01      80.0  74.6  85.4
    ##  5 2010-05-01      86.9  82.6  91.2
    ##  6 2010-06-01     109.  105.  113. 
    ##  7 2010-07-01     124.  118.  129. 
    ##  8 2010-08-01      97.6  92.5 103. 
    ##  9 2010-09-01     123.  115.  130. 
    ## 10 2010-10-01     119.  110.  128. 
    ## # … with 50 more rows

Now we have a summary that looks a lot like others we’ve generated
before in this tutorial. The only difference is that there are many more
averages and confidence intervals because we’re calculating these over
shorter time intervals, monthly instead of annually. (Don’t worry about
the lack of ending zeroes in the confidence intervals.)

Now we can visualize our summary.

``` r
as.data.frame(air_summary) %>% ggplot() +
  geom_line(aes(month, avg_pm2.5)) +
  geom_line(aes(month, lower), linetype = 'dashed', color = 'red', alpha = 0.5) +
  geom_line(aes(month, upper), linetype = 'dashed', color = 'red', alpha = 0.5) +
  theme_bw() +
  scale_x_date(date_labels = '%b %y', breaks = '3 months') +
  scale_y_continuous(limits = c(0, 200)) +
  labs(y = 'Monthly average reading',
       title = 'Monthly average PM 2.5 reading at US Embassy, Beijing, China',
       subtitle = '2010 - 2014') +
  theme(axis.text.x = element_text(angle = 45, hjust = 1),
        axis.title.x = element_blank())
```

![](https://github.com/ghbutler/ECON41/blob/master/tutorials/tutorial%209/unnamed-chunk-20-1.png?raw=true)<!-- -->

Notice that the lines which represent the upper and lower limits of the
95% confidence interval fit the line which represents the monthly
average PM 2.5 reading pretty tightly. This suggests a lot of certainty
about the accuracy of these readings. And this probably matches your
intuition anyway. Beijing is not a city that is famous for its fresh
air, and these readings reflect this.
