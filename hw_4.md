Homework\_4
================

# part\_1

``` r
a <- 3
b <- 2
print(a+b)
```

    ## [1] 5

``` r
sum(a, b)
```

    ## [1] 5

``` r
sum(3, 2)
```

    ## [1] 5

# part\_2

``` r
library(tidyverse)
library(nycflights13)
data("flights")
names(flights)
```

    ##  [1] "year"           "month"          "day"            "dep_time"      
    ##  [5] "sched_dep_time" "dep_delay"      "arr_time"       "sched_arr_time"
    ##  [9] "arr_delay"      "carrier"        "flight"         "tailnum"       
    ## [13] "origin"         "dest"           "air_time"       "distance"      
    ## [17] "hour"           "minute"         "time_hour"

``` r
head(flights)
```

    ## # A tibble: 6 × 19
    ##    year month   day dep_time sched_dep_time dep_delay arr_time sched_arr_time
    ##   <int> <int> <int>    <int>          <int>     <dbl>    <int>          <int>
    ## 1  2013     1     1      517            515         2      830            819
    ## 2  2013     1     1      533            529         4      850            830
    ## 3  2013     1     1      542            540         2      923            850
    ## 4  2013     1     1      544            545        -1     1004           1022
    ## 5  2013     1     1      554            600        -6      812            837
    ## 6  2013     1     1      554            558        -4      740            728
    ## # … with 11 more variables: arr_delay <dbl>, carrier <chr>, flight <int>,
    ## #   tailnum <chr>, origin <chr>, dest <chr>, air_time <dbl>, distance <dbl>,
    ## #   hour <dbl>, minute <dbl>, time_hour <dttm>

``` r
AA_flights = filter(flights, carrier == "AA")
ggplot(data = AA_flights) +
   geom_point(mapping = aes(x = dep_delay, y = arr_delay, color = origin))
```

    ## Warning: Removed 782 rows containing missing values (geom_point).

![](hw_4_files/figure-markdown_github/unnamed-chunk-2-1.png)
