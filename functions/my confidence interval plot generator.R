# Adapted from https://github.com/leonjessen/confidence_intervals_visualised
ci_generator <- function(n){
  mk_samples <- function(n, size, mean = 0, sd = 1){
    m <- sapply(1:n, function(i){
      s <- rnorm(n = size, mean = mean, sd = sd)
      return( c(mean(s), t.test(s)$conf.int) )
    })
    rownames(m) <- c("sample_mean", "ci_lower", "ci_upper")
    m <- m %>% t %>% as_tibble
    return(m)
  }
  m <- mk_samples(n = n, size = 100) %>%
    mutate(i = seq(1,n)) %>% 
    mutate(contains_pop_mean = ifelse(0 > ci_lower & 0 < ci_upper,'yes','no') %>%
             factor(levels = c('yes', 'no')))
  m %>%
    ggplot(aes(x = sample_mean, y = i,color = contains_pop_mean)) +
    geom_point() +
    geom_errorbarh(aes(xmin = ci_lower, xmax = ci_upper), height = 1) +
    geom_vline(xintercept = 0, linetype = 'dashed') +
    scale_y_continuous(expand = c(0, 0)) +
    scale_color_manual(values=c('darkgrey','red')) +
    xlab(paste0('Sample mean +/- 95% confidence interval whiskers\n',
                'Each sample is n=100 draws from N(0,1)')) +
    ylab("Sample number") +
    ds_theme_set() +
    theme(panel.grid.major.y = element_blank(),
          panel.grid.minor.y = element_blank(),
          legend.position='bottom')
}