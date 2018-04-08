######################################################################################################
# Display distribution of p-values from multiple t-tests vs. ANOVA
# Author: Matt Grobis
#
# - Purpose: demonstrate flaws in multiple t-test comparisons
# - Requirements: 'scales' package
#
######################################################################################################
# Prerequisite: install 'scales' package if necessary
install.packages('scales')

#####################################################################################################
# The function
# - Summary:
#   o For each of n_groups, draw n_obs from a population that is normally distributed
#      x Because these groups are all drawn from the same distribution, they should not be
#        significantly different (i.e. p > 0.05)
#   o Perform t-tests between each group and record the lowest p-value
#   o Perform an ANOVA on all groups and record the p-value
#   o Do this n_iter times to form a distribution

compare <- function(n_groups = 3, n_obs = 10, n_iter = 1000, figure = T, verbose = T, 
                    full_summary = F){
   
   # Create empty variables to store data
   t_test_p_vals <- c()
   anova_p_vals <- c()
   groups <- list()
   
   # Run through the iterations
   for(i in 1:n_iter){
      
      # Create the samples
      for(j in 1:n_groups){
         
         groups[[j]] <- rnorm(n_obs)  # Default mean = 0, SD = 1
         
      }
      
      # Generate all pairwise comparisons
      combinations <- combn(n_groups, 2)
      
      # Run the comparisons
      p_vals <- c()
      
      for(k in 1:ncol(combinations)){
         p_vals[k] <- t.test(groups[[combinations[1, k]]],
                             groups[[combinations[2, k]]])$p.value
         
      }
      
      # Save the lowest p-value 
      t_test_p_vals[i] <- min(p_vals)
      
      # Convert list to data frame for ANOVA
      pops_df <- data.frame("values" = unlist(groups),  
                            "group" = sort(rep(1:n_groups, n_obs)))
      
      # Run the ANOVA and save p-value
      anova_p_vals[i] <- summary(aov(values ~ group, data = pops_df))[[1]][["Pr(>F)"]][1]
      
      # Print % completion every 10 iterations
      if(verbose == T){
         if(i %%10 == 0){
            cat(round(i / n_iter * 100, 2), "% complete \n")
         }
      }
   }
   
   # If figure = T, display it
   if(figure == T){
      
      # Ensure 'scales' library is installed
      try(library(scales), outFile = print("Please install 'scales' library first"))
      
      par(mfrow = c(1,1))
      hist(t_test_p_vals, main = "Distribution of p-values\n", xlab = "p-value", font.lab = 2, 
           font.axis = 2, las = 1, breaks = 25, col = alpha("black", 0.4), xlim = c(0,1), 
           cex.lab = 1.2, cex.axis = 1.1)
      hist(anova_p_vals, main = "ANOVA", add = T, border = "deepskyblue4", breaks = 25,
           col = alpha("deepskyblue4", 0.4))
      title(paste0("\nGroups: ", n_groups, " | Observations: ", n_obs, " | Iterations: ", n_iter),
            col.main = "gray40")
      par(font = 2)
      legend("topright", bty = 'n', pch = 19, c("Multiple t-tests", "ANOVA"),
             col = c(alpha("black", 0.4), alpha("deepskyblue4", 0.4)))
      
   }
   
   # Display summary stats of t-tests vs. ANOVAs otherwise
   cat("\n")
   cat("% iterations below p = 0.05:\nt-tests: ", 
       round(sum(t_test_p_vals < 0.05) / n_iter, 3) * 100, " | ANOVA: ",
       round(sum(anova_p_vals < 0.05) / n_iter, 3) * 100)
   cat("\n\n")
   
   if(full_summary == T){
      return(data.frame("stat" = names(summary(t_test_p_vals)),
                        "t-test" = as.vector(summary(t_test_p_vals)),
                        "ANOVA" = as.vector(summary(anova_p_vals))))
   }   

}

######################################################################################################
### Demo ###

# Defaults
compare()

# 100x n_obs: barely any decrease in % iterations below p = 0.05
compare(n_obs = 1000, n_pop = 3)

# 3x n_pop: ~3x increase in % iterations below p = 0.05
compare(n_pop = 6, n_obs = 10)

# Competing effects: n_pop wins
compare(n_pop = 6, n_obs = 1000)







