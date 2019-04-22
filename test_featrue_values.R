library("tsgeneration")
library("tsfeatures")



feature_class = c("max_var_shift", "max_kl_shift", "pacf_features", "stl_features")

selected_features = c("max_var_shift", "max_kl_shift", "seas_pacf", "seasonal_strength")

params = c(77, 73, 0.01, 190)



output <- generate_ts_with_target(n = 1000, ts.length = 300,
								  freq = 24, seasonal = 1,
                                  features = feature_class, 
							      selected.features = selected_features, 
                                  target = params)


write.csv(output, file="test-generated.csv")

# check the feature outputs 

features_for_ts_features   <- c("length", "max_var_shift",
				                "pacf_features", "stl_features", 
				                "max_level_shift", "max_kl_shift")

featurelist <- tsfeatures(x, features=features_for_ts_features)
write.csv(featurelist, file="test-measurement.csv")

