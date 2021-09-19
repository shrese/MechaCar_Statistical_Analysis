### 1. Download the MechaCar_mpg.csv file, and place it in the active directory for your R session.
### 2. Create a new RScript in your R source pane, name it MechaCarChallenge.RScript, and save it to your active directory.

### 3. Use the library() function to load the dplyr package.
library(dplyr)

### 4. Import and read in the MechaCar_mpg.csv file as a dataframe.
mechacar <- read.csv('MechaCar_mpg.csv', check.names = F, stringsAsFactors = F)
head(mechacar)

### 5. Perform linear regression using the lm() function. 
###    In the lm() function, pass in all six variables (i.e., columns), and add the dataframe you created in Step 4 
###    as the data parameter.
lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD,data=mechacar)

### 6. Using the summary() function, determine the p-value and the r-squared value for the linear regression model.
summary(lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD,data=mechacar))

### 7. Save your MechaCarChallenge.RScript file to your GitHub repository.