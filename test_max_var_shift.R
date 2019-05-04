library("tsgeneration")
library("tsfeatures")



feature_class = c("max_var_shift")

selected_features = c("max_var_shift")

params = c(77)



output <- generate_ts_with_target(n = 1000, ts.length = 300,
								  freq = 24, seasonal = 0,
                                  features = feature_class, 
							      selected.features = selected_features, 
                                  target = params)


write.csv(output, file="test-generated-max_var_shift_seas-0.csv")

# check the feature outputs 

features_for_ts_features   <- c("length", "max_var_shift")

featurelist <- tsfeatures(output, features=features_for_ts_features)
write.csv(featurelist, file="test-measurement-max_var_shift_seas-0.csv")

