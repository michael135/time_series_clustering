library(tsgeneration)
library(tsfeatures)


# x <- generate_ts_with_target(n = 2, ts.length = 60, freq = 1, seasonal = 0,
#                              features = c('entropy', 'stl_features'),
#                              selected.features = c('entropy', 'trend'),
#                              target = c(0.6, 0.9))


# x <- generate_ts_with_target(n = 2, ts.length = 60, freq = 1, seasonal = 0,
#                              features = c('max_kl_shift'),
#                              selected.features = c('max_kl_shift'),
#                              target = c(73))



x <- generate_ts_with_target(n = 2, ts.length = 120, freq = c(7, 24), seasonal = 1,
                             features = c('pacf_features'),
                             selected.features = c('seas_pacf'),
                             target = c(0.01))


# x <- generate_ts_with_target(n = 2, ts.length = 60, freq = 1, seasonal = 0,
#                              features = c('pacf_features'),
#                              selected.features = c('pacf_features'),
#                              target = c(0.01))



# x <- generate_ts_with_target(n = 2, ts.length = 60, freq = 1, seasonal = 2,
#                              features = 'pacf_features',
#                              selected.features = 'pacf_features',
#                              target = 0.01)