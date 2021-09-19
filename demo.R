demo_table <- read.csv(file='demo.csv',check.names=F,stringsAsFactors=F)
demo_table2 <- fromJSON((txt='demo.json'))
filter_table <- demo_table2[demo_table2$price > 10000,]
filter_table2 <- subset(demo_table2, price > 10000 & drive == "4wd" & "clean" %in% title_status)
demo_table3 <- read.csv('demo2.csv',check.names = F,stringsAsFactors = F)
demo_table4 <- read.csv('Vehicle_Data.xlsx',check.names = F,stringsAsFactors = F)
long_table <- gather(demo_table3,key="Metric",value="Score",buying_price:popularity)
wide_table <- long_table %>% spread(key="Metric",value="Score")

################

################BASIC BAR PLOT
plt <- ggplot(mpg,aes(x=class)) #import dataset into ggplot2
plt + geom_bar() #plot a bar plot

################BAR PLOT WITH FORMATTING
mpg_summary <- mpg %>% group_by(manufacturer) %>% summarize(Vehicle_Count=n(), .groups = 'keep') #create summary table
plt <- ggplot(mpg_summary,aes(x=manufacturer,y=Vehicle_Count)) #import dataset into ggplot2
plt + geom_col() #plot a bar plot
plt + geom_col() + xlab("Manufacturing Company") + ylab("Number of Vehicles in Dataset") + #plot a barplot with labels
theme(axis.text.x=element_text(angle=45,hjust=1)) #rotate the x-axis label 45 degrees

################LINE CHART
mpg_summary <- subset(mpg,manufacturer=="toyota") %>% group_by(cyl) %>% summarize(Mean_Hwy=mean(hwy), .groups = 'keep') #create summary table
plt <- ggplot(mpg_summary,aes(x=cyl,y=Mean_Hwy)) #import dataset into ggplot2
plt + geom_line()
plt + geom_line() + scale_x_discrete(limits=c(4,6,8)) + scale_y_continuous(breaks = c(15:30)) #add line plot with labels

################SCATTER PLOT
plt <- ggplot(mpg, aes(x=displ, y=cty, color=class,shape=drv)) #import dataset int ggplot2
plt + geom_point() + labs(x="Engine Size (L)", y="City Fuel-Efficiency (MPG)", color="Vehicle Class",shape="Type of Drive",scale_size_identity()) #add scatter plot with multiple aesthetics

################BASIC BOXPLOT
plt <- ggplot(mpg,aes(y=hwy)) #import dataset into ggplot2
plt + geom_boxplot() #add boxplot

################BOXPLOT (SKILL DRILL)
plt <- ggplot(mpg,aes(x=manufacturer,y=hwy)) #import dataset into ggplot27
plt + geom_boxplot() + theme(axis.text.x=element_text(angle=45,hjust=1,)) #add boxplot and rotate x-axis labels 45 degrees

################HEAT MAP
mpg_summary <- mpg %>% group_by(class,year) %>% summarize(Mean_Hwy=mean(hwy), .groups = 'keep') #create summary table
plt <- ggplot(mpg_summary, aes(x=class,y=factor(year),fill=Mean_Hwy))
plt + geom_tile() + labs(x="Vehicle Class",y="Vehicle Year",fill="Mean Highway (MPG)") #create heatmap with labels

################HEAT MAP (SKILL DRILL)
mpg_summary <- mpg %>% group_by(model,year) %>% summarize(Mean_Hwy=mean(hwy), .groups = 'keep') #create summary table
plt <- ggplot(mpg_summary, aes(x=model,y=factor(year),fill=Mean_Hwy)) #import dataset into ggplot2
plt + geom_tile() + labs(x="Model",y="Vehicle Year",fill="Mean Highway (MPG)") + theme(axis.text.x = element_text(angle=90,hjust=1,vjust=.5)) #add heatmap with labels#rotate x-axis labels 90 degrees

################BOX PLOT
plt <- ggplot(mpg,aes(x=manufacturer,y=hwy)) #import dataset into ggplot2
plt + geom_boxplot() + #add boxplot
theme(axis.text.x=element_text(angle=45,hjust=1)) + #rotate x-axis labels 45 degrees
geom_point() #overlay scatter plot on top

################SCATTER PLOT
mpg_summary <- mpg %>% group_by(class) %>% summarize(Mean_Engine=mean(displ), .groups = 'keep') #create summary table
plt <- ggplot(mpg_summary,aes(x=class,y=Mean_Engine)) #import dataset into ggplot2
plt + geom_point(size=4) + labs(x="Vehicle Class",y="Mean Engine Size") #add scatter plot

################SCATTER PLOT
mpg_summary <- mpg %>% group_by(class) %>% summarize(Mean_Engine=mean(displ),SD_Engine=sd(displ), .groups = 'keep')
plt <- ggplot(mpg_summary,aes(x=class,y=Mean_Engine)) #import dataset into ggplot2
plt + geom_point(size=4) + labs(x="Vehicle Class",y="Mean Engine Size") + #add scatter plot with labels
geom_errorbar(aes(ymin=Mean_Engine-SD_Engine,ymax=Mean_Engine+SD_Engine)) #overlay with error bars

###############BOX PLOT
mpg_long <- mpg %>% gather(key="MPG_Type",value="Rating",c(cty,hwy)) #convert to long format
head(mpg_long)
plt <- ggplot(mpg_long,aes(x=manufacturer,y=Rating,color=MPG_Type)) #import dataset into ggplot2
plt + geom_boxplot() + theme(axis.text.x=element_text(angle=45,hjust=1)) #add boxplot with labels rotated 45 degrees

################BOX PLOT (SKILL DRILL)
mpg_long <- mpg %>% gather(key="MPG_Type",value="Rating",c(cty,hwy)) #convert to long format
head(mpg_long)
plt <- ggplot(mpg_long,aes(x=manufacturer,y=Rating,color=MPG_Type)) #import dataset into ggplot2
plt + geom_boxplot() + facet_wrap(vars(MPG_Type)) + #create multiple boxplots, one for each MPG type
theme(axis.text.x=element_text(angle=45,hjust=1),legend.position = "none") + xlab("Manufacturer") #rotate x-axis labels

###############TEST THE DISTRIBUTION OF VEHICLE WIEGHTS (density plot)
ggplot(mtcars,aes(x=wt)) + geom_density() #visualize distribution using density plot

###############shapiro.test()#### Results W = 0.94326, p-value = 0.09265
shapiro.test(mtcars$wt)

###############visualize the distribution of driven miles for teh entire population data set
population_table <- read.csv('used_car_data.csv',check.names = F,stringsAsFactors = F) #import used car dataset
plt <- ggplot(population_table,aes(x=log10(Miles_Driven))) #import dataset into ggplot2
plt + geom_density() #visualize distribution using density plot

###############crate a sample data set using dplyr's sample_n() function
sample_table <- population_table %>% sample_n(50) #randomly sample 50 data points
plt <- ggplot(sample_table,aes(x=log10(Miles_Driven))) #import data set into ggplot2
plt + geom_density() #visualize distribution using density plot

############### One sided TTEST
t.test(log10(sample_table$Miles_Driven),mu=mean(log10(population_table$Miles_Driven)))#compare sample versus population means
####answer
##t = 1.2333, df = 49, p-value = 0.2234 alternative hypothesis: true mean is not equal to 4.39449 95 percent confidence interval:
###  4.344807 4.602033 sample estimates: mean of x 4.47342 

############### Tow sided TTEST
sample_table <- population_table %>% sample_n(50) #generate 50 randomly sampled data points
sample_table2 <- population_table %>% sample_n(50) #generate another 50 randomly sampled data points
t.test(log10(sample_table$Miles_Driven),log10(sample_table2$Miles_Driven)) #compare means of two samples

############### Two Sample TTEST
mpg_data <- read.csv('mpg_modified.csv') #import dataset
mpg_1999 <- mpg_data %>% filter(year==1999) #select only data points where the year is 1999
mpg_2008 <- mpg_data %>% filter(year==2008) #select only data points where the year is 2008
t.test(mpg_1999$hwy,mpg_2008$hwy,paired = T) #compare the mean difference between two samples

############### anova
mtcars_filt <- mtcars[,c("hp","cyl")] #filter columns from mtcars dataset
mtcars_filt$cyl <- factor(mtcars_filt$cyl) #convert numeric column to factor
aov(hp ~ cyl,data=mtcars_filt) #compare means across multiple levels
summary(aov(hp ~ cyl,data=mtcars_filt))

###############PEARSON
head(mtcars)
plt <- ggplot(mtcars,aes(x=hp,y=qsec)) #import data set into ggplot2
plt + geom_point() #create scatter plot
cor(mtcars$hp,mtcars$qsec) #calculate correlation coefficient


## Used Cars
used_cars <- read.csv('used_car_data.csv',stringsAsFactors = F) #read in dataset
head(used_cars)
plt <- ggplot(used_cars,aes(x=Miles_Driven,y=Selling_Price)) #import dataset into ggplot2
plt + geom_point() #create a scatter plot
cor(used_cars$Miles_Driven,used_cars$Selling_Price) #calculate correlation coefficient

##Corelation Matrix
used_matrix <- as.matrix(used_cars[,c("Selling_Price","Present_Price","Miles_Driven")]) #convert data frame into a numeric matrix
cor(used_matrix)

################Linear Regression
lm(qsec~hp,mtcars) #create a linear model

################p-value and our r-squared value for a simple linear regression model
summary(lm(qsec~hp,mtcars)) #summarize linear model

##visualize the fitted line against our dataset
model <- lm(qsec ~ hp,mtcars) #create linear model
yvals <- model$coefficients['hp']*mtcars$hp +
  model$coefficients['(Intercept)'] #determine y-axis values from linear model
plt <- ggplot(mtcars,aes(x=hp,y=qsec)) #import dataset into ggplot2
plt + geom_point() + geom_line(aes(y=yvals), color = "red") #plot scatter and linear model

################multiple linear regression
lm(qsec~mpg + disp + drat + wt + hp,data=mtcars) #generate multiple linear regression model
summary(lm(qsec ~ mpg + disp + drat + wt + hp,data=mtcars)) #generate summary statistics
################chi squared test contingency table
table(mpg$class,mpg$year)#generate contingency table
tbl <- table(mpg$class,mpg$year) #generate contingency table
chisq.test(tbl) #compare categorical distributions
