require("tsgeneration")
require("tsfeatures")

# function ---------------------------------------------------- 

generator <- function(num_sample,length, feature, selected, param_low, param_high){

	feature_class_strong_default = c(feature, "max_var_shift", "max_kl_shift", "pacf_features", "stl_features")

	selected_features = c(selected, "max_var_shift", "max_kl_shift", "seas_pacf", "seasonal_strength")
	print(feature_class_strong_default)
	print(selected_features)
	strong_features_params = c(77, 73, 0.01, 0.26)
	param_low = c(param_low, strong_features_params)
	param_high = c(param_high, strong_features_params)

    low  <- generate_ts_with_target(parallel = 20, n = num_sample, ts.length = length,
    								freq = 24, seasonal = 2,
                                    features = feature_class_strong_default,
    								selected.features = selected_features,
                                    target = param_low)
    
    high <- generate_ts_with_target(parallel=20, n = num_sample, ts.length = length,
    								freq = 24, seasonal = 2,
                                    features = feature_class_strong_default, 
    								selected.features = selected_features, 
                                    target = param_high)

    # integrate and save to csv file

    x <- cbind(low,high)
    dirname <- "feature_controled_data"
    filename <- paste(dirname, "/","lowhigh_generated-",selected,".csv", sep="" )
    write.csv(x, file=filename)
    print ('finished first file')
    # check the feature outputs 

    features_for_ts_features   <- c("length", "max_var_shift", "max_kl_shift",
    				 "pacf_features", "stl_features", 
    				 "entropy", "max_level_shift", "max_kl_shift", 
    				 "stability", "lumpiness")
    featurelist <- tsfeatures(x, features=features_for_ts_features)
    filename <- paste(dirname, "/","featurescheck-",selected,".csv", sep="" )
    write.csv(featurelist, file=filename)
    print ('finished second file')
}
# x <- generate_ts_with_target(n = 1, ts.length = 60, freq = 1, seasonal = 0,
#                              features = c('entropy', 'stl_features'),
#                              selected.features = c('entropy', 'trend'),
#                              target = c(0.6, 0.9))



	

# general settings ---------------------------------------------

num_sample <- 1000  # sample for each low and high
length     <- 300    # time length of each sample 


# by feature ---------------------------------------------------



# Entropy - 0.5   0.4  - 0.9 entropy
# time_level_shift- 72 - 10 - 300 max_level_shift
# time_kl_shift 73 - 15 - 300 max_kl_shift
# stability 0.85 - 0.2 - 1.0 stability

# feature    <- 'hurst'
feature    <- 'entropy'
selected   <- 'entropy'
param_low  <- 0.5   # 2nd decile
param_high <- 0.9   # 9th decile

generator(num_sample,length,feature,selected, param_low, param_high)


# feature    <- 'stl_features'
# selected   <- 'trend'
# param_low  <- 0.53941   # 2nd decile
# param_high <- 0.99712   # 9th decile

# generator(num_sample,length,feature,selected, param_low, param_high)
