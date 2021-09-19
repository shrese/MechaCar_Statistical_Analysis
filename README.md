# MechaCar Statistical Analysis
## Summary
AutosRUs has decided to improve the decision making process around new vehicle prototypes with additional data analytics around the manufacturing process.  The executives recognize the that to make the launch new prototype to be successful, they will need to use data analytics in each decision throughout the manufacturing process.  

Jeremy has been working for AutosRUs for 10 years, and has been asked to do some statistical analysis around production struggles that the manufacturing team is having with the new prototype, MechaCar.  His team is responsible for looking at historical data, analytical verification and validation of current automotive specifications, and study design of future product testing.  

## Results
### Linear Regression to Predict Miles Per Gallon (MPG)
Before starting the analysis, a p-value of 0.05 as a tolerance level was chosen to test null and alternative hypotheses. 

The multiple line regression produced the following statistical results:

![](Resources/summary_D1.PNG)

1. Which variables/coefficients provided a non-random amount of variance to the mpg values in the dataset?

    The p-values for vehicle length and ground clearance were below the p = 0.05 threshold to reject the null hypothesis.  They are likely to provide non-random variances to the model.  We can delcare both are statistically significant to the mpg.

    On the other hand, the p-values for the vehicle weight, spoiler angle, and all wheel drive (AWD) trend towards a random amount of variance.

2. Is the slope of the linear model considered to be zero? Why or why not?

    The p-value of 5.35 × 10-11 for the linear model is smaller than a significance level of p = 0.05 We have evidence to reject the null hypothesis, which leans toward a slope of our linear model is zero.  

3. Does this linear model predict mpg of MechaCar prototypes effectively? Why or why not?

    This linear model has an Rsquared value of 0.7149.  This indicates that approximately 71% of the mpg predictions can be determined by this model with the following linear regression formula:

        mpg = 6.28×(vehicle_length) + 1.245×10-3×(vehicle_weight) + 6.877×10-2×(spoiler_angle) 
        + 3.546×(ground_clearance) -3.411×AWD - 1.04×102

For our purposes, the multiple regression model does predict mpg effectively.

### Summary Statistics on Suspension Coils
The design specifications for the MechaCar suspension coils dictate that the variance of the suspension coils must not exceed 100 pounds per square inch. 

Does the current manufacturing data meet this design specification for all manufacturing lots in total and each lot individually? Why or why not?

![](Resources/total_summary_D2.PNG)

Looking at the summary statistics of all three lots combined (chart above), the PSI variance is 62.29 which is well within the specification limit of 100 PSI.  

By looking at the data grouped by individual lot number (below), it can be readily seen that the variance in lot #3 is over 170 while lot #1 and #2 are within the specification limit of 100 PSI at 0.98 and 7.47, respectively.  The variance of lot #3 is out of porportion from the other two lots.  This is sewing the overall PSI variance. 

Lot #3 should be investigated as to what is causing the issue so that adjustments can be made in the manufacturing and engineering procces.

![](Resources/lot_summary_D2.PNG)

The below boxplot demonstrates how disporportinate lot #3 is to the full population.

![](Resources/boxplot_D2.png)

### T-Tests on Suspension Coils
Several T-Tests were performed to determin if the PSI is statistically different across the different populations.

1. Full Population
     The p-value for the entire population is 0.06 with a mean of 1500.  We are able to reject the alternative hypothesis in favor of the null hypothesis.  The conclusion is there is no statistical difference in means.

![](Resources/population_t_test_D3.PNG)

2. Each Lot Independently
    Reviewing the p-values of each lot, we can see that p-value for lot 3 is 0.04 compared to lot #1 and #2 with a p-value of 1 and .61, respectively. This demonstrates significant evidence that suspension coiled in lot #3 is different from the population mean.

    Lots #1 and #2 have the same outcome as the full population.  with a sample mean of 1500.  We can reject the alternative hypothisis in favor of the null hypothisis because they are statistically similar.

    For lot #3, the conculsion is that we would reject the the null hypothsis.  The p-value is significantly different from the other two data sets and the full population and the mean is statistically different when compared to the other data sets.

![](Resources/t_test_D3.PNG)

