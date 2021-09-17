Homework\_5
================

# Part\_1

``` r
library(tidyverse)
data("diamonds")
names(diamonds)
```

    ##  [1] "carat"   "cut"     "color"   "clarity" "depth"   "table"   "price"  
    ##  [8] "x"       "y"       "z"

``` r
diamonds %>% count(cut)
```

    ## # A tibble: 5 × 2
    ##   cut           n
    ##   <ord>     <int>
    ## 1 Fair       1610
    ## 2 Good       4906
    ## 3 Very Good 12082
    ## 4 Premium   13791
    ## 5 Ideal     21551

# Part\_2

``` r
diamonds1 <- sample_n(diamonds, 539, replace = TRUE)
glimpse(diamonds1)
```

    ## Rows: 539
    ## Columns: 10
    ## $ carat   <dbl> 1.10, 0.52, 0.32, 1.51, 0.32, 0.83, 1.23, 0.53, 0.52, 1.05, 0.…
    ## $ cut     <ord> Premium, Very Good, Premium, Premium, Ideal, Ideal, Ideal, Ide…
    ## $ color   <ord> F, G, G, I, H, D, F, F, F, F, G, G, F, H, E, G, I, H, D, H, I,…
    ## $ clarity <ord> SI1, VS2, VS2, SI2, VVS1, VS2, VS2, VS1, VS1, VS2, VS1, VVS2, …
    ## $ depth   <dbl> 59.5, 63.0, 61.0, 60.4, 61.6, 62.0, 61.7, 61.7, 61.2, 61.6, 61…
    ## $ table   <dbl> 59.0, 56.0, 59.0, 56.0, 54.9, 54.9, 57.0, 55.0, 57.0, 54.0, 58…
    ## $ price   <int> 5821, 1369, 561, 7577, 681, 4378, 9547, 2046, 1872, 6810, 5111…
    ## $ x       <dbl> 6.77, 5.09, 4.42, 7.40, 4.40, 6.03, 6.94, 5.18, 5.20, 6.54, 6.…
    ## $ y       <dbl> 6.70, 5.13, 4.46, 7.36, 4.43, 6.04, 6.90, 5.22, 5.16, 6.58, 6.…
    ## $ z       <dbl> 4.01, 3.22, 2.71, 4.46, 2.72, 3.74, 4.27, 3.21, 3.17, 4.04, 3.…

# Part\_3

``` r
clarity_carat <- diamonds %>%
  group_by(clarity) %>%
  slice_max(carat, n=100) %>%
  summarise(average.size = mean (carat, na.rm = TRUE))
print(clarity_carat)
```

    ## # A tibble: 8 × 2
    ##   clarity average.size
    ##   <ord>          <dbl>
    ## 1 I1              2.46
    ## 2 SI2             2.62
    ## 3 SI1             2.29
    ## 4 VS2             2.22
    ## 5 VS1             2.10
    ## 6 VVS2            1.64
    ## 7 VVS1            1.50
    ## 8 IF              1.39

# Part\_4

``` r
ggplot(data = diamonds) +
   geom_point(mapping = aes(x = x, y = y, color = clarity))
```

![](hw_5_files/figure-markdown_github/unnamed-chunk-4-1.png)

``` r
ggplot(data = diamonds) +
   geom_point(mapping = aes(x = x, y = z, color = clarity))
```

![](hw_5_files/figure-markdown_github/unnamed-chunk-4-2.png)

# Part\_5

``` r
diamonds2 <- filter(diamonds, x > 3 & z < 10 & y < 20 & z > 2)
ggplot(data = diamonds2) +
   geom_point(mapping = aes(x = x, y = y, color = clarity))
```

![](hw_5_files/figure-markdown_github/unnamed-chunk-5-1.png)

``` r
ggplot(data = diamonds2) +
   geom_point(mapping = aes(x = x, y = z, color = clarity))
```

![](hw_5_files/figure-markdown_github/unnamed-chunk-5-2.png)
