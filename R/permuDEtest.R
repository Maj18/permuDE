

permuDEtest = function(data, samples_group1, samples_group2, n_perm=1000, workers=4) {
  workers = ifelse(workers > 1, workers, 1)
	future::plan("multisession", workers = workers)
	result = future.apply::future_lapply(1:nrow(data), function(i) {
		group1 = data[i, samples_group1, drop=T] %>% as.numeric()
		group2 = data[i, samples_group2, drop=T] %>% as.numeric()
		# Combined data
		combined_data = c(group1, group2)
		# Original test statistic: difference in means
		original_statistic = mean(group2) - mean(group1)
		# Number of permutations
		n_perm = n_perm
		# Function to calculate the difference in means
		diff_means = function(x, n1, n2) {
		    return(mean(head(x, n1)) - mean(tail(x, n2)))
		}
		# Permutation test
		set.seed(123)  # For reproducibility
		perm_stats = replicate(n_perm, {
		    permuted_data = sample(combined_data)
		    diff_means(permuted_data, length(group1), length(group2))
		})
		# P-value calculation
		p_value = mean(abs(perm_stats) >= abs(original_statistic))
		combined_data2 = 
			setNames(combined_data,c(samples_group1, samples_group2)) %>%
			as.data.frame() %>% t() %>% as.data.frame()
		rownames(combined_data2) = rownames(data)[i]
		combined_data2$P_value = p_value
		combined_data2$diff_mean = original_statistic
		combined_data2 %>% dplyr::select(P_value, diff_mean, everything())
	}, future.seed = TRUE) %>% Reduce(rbind, .)
	result$padj_BH = p.adjust(result$P_value, method = "BH")
	result %>% select(P_value, padj_BH, everything()) %>% 
	  arrange(P_value) %>% as.data.frame()
}




