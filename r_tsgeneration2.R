require("tsgeneration")
require("tsfeatures")

# function ---------------------------------------------------- 

generator <- function(num_sample,length, feature, selected, param_low, param_high){

    low  <- generate_ts_with_target(n = num_sample, ts.length = length, freq = 1, seasonal = 0,features = feature, selected.features = selected, target = param_low)
    high <- generate_ts_with_target(n = num_sample, ts.length = length, freq = 1, seasonal = 0,features = feature, selected.features = selected, target = param_high)

    # integrate and save to csv file

    x <- cbind(low,high)
    dirname <- "feature_controled_data"
    filename <- paste(dirname, "/","lowhigh_generated-",selected,".csv", sep="" )
    write.csv(x, file=filename)

    # check the feature outputs 

    features    <- c("length", "frequency", "stl_features", "entropy", "acf_features", "heterogeneity","hurst","lumpiness")
    featurelist <- tsfeatures(x, features=features)
    filename <- paste(dirname, "/","featurescheck-",selected,".csv", sep="" )
    write.csv(featurelist, file=filename)
}


# general settings ---------------------------------------------

num_sample <- 10    # sample for each low and high
length     <- 50    # time length of each sample 


# by feature ---------------------------------------------------

# feature    <- 'hurst'
feature    <- 'bla'
selected   <- 'hurst'
param_low  <- 0.87033   # 2nd decile
param_high <- 0.99982   # 9th decile

generator(num_sample,length,feature,selected, param_low, param_high)


feature    <- 'stl_features'
selected   <- 'trend'
param_low  <- 0.53941   # 2nd decile
param_high <- 0.99712   # 9th decile

generator(num_sample,length,feature,selected, param_low, param_high)