# Geospacial-Visualization-with-R-Shiny
Authors: Jeff CHEAH Vyi, Dylan Bristow MITCHELL, Neel CHOMAL, TEO Lip Peng, HO Pui Shan, Muhammad Jufri Bin RAMLI

## Introduction

Purchasing a propertyin Singapore isthe largest investment of most buyers’lifetimes. That decision must be carefully considered –many factorsweigh onthevalue of a property, such as thelocationof the block, the level of the unit, and theageof the block. Prices for resale properties are negotiated in the tens of thousands of dollars, and yet desirable units may stay on the market for only a few days.Savvy buyers will also consider the resale value of their properties–how much will theunitbe worth on the resale market in5, 10, or 15 years?The pressure to make a good decision quickly, and to know the value of the property, is substantial.Resources available to buyersare limited. HDB publishessimple summaries of how much money units in nearby blocks have sold for in the past few months,butthe real insights available from this data are quite limited.Our aim was to aid the buyers ofresale Executive Condominiums (ECs) in Singapore by predicting resale prices of ECs via analyses of relevant explanatory variables.

## Overall Concept

We have createda tool that providesinsightful analyses of the resale prices of Executive Condominiums in Singapore. This tool enablesbuyers of ECs to be more aware of the current market value of any givenunit as well as how the passage of time will affect the valueof that unit. This will enable thebuyersto negotiate their purchase from a data-driven position.Our tool includes a dashboard which visualizes the historical sale prices of EC sand predicts resale prices of existing ECs.

## Data Sources

This report will utilize the transactional data obtained from Real Estate Information System (REALIS); a paid subscription portal maintained by the Urban Redevelopment Authority (URA). The data will start from the sale date of the very first executive condominium, i.e. 01 Sep to 1996 to 30 Nov2019. Of the 20 variables in the dataset, some will be used directly in our analysis, while others will be transformed into applicable variables more suited to our methodology. To complete the prediction model, data on the MRT station locations (link), and school locations (link) will also be used to calculate proximity to the EClocations (link).

![GitHub Logo](/images/datasource.png)

All dollar values are denominated in Singapore Dollars.

![GitHub Logo](/images/mrt.png)

Figure 1: SMRT stations locations

## Specific Methodology

The real estate market is heterogenous. Each propertyunit has a unique set of characteristics. Thus, it is crucial that property prices take into account these quality differences.The project aims to provide resale buyers with their current and projected resale price after a number of years. We will analyze the historical data and apply statistical methods such as multiple linear regression, confidence interval, ANOVA and hypothesis testing to test the input variables and predict these prices. The project considerscharacteristics that are unique to the Singapore real estate market, such as whether the unit sits on the top floor, high, lowor the first floor, distance to MRT stationsand primaryschools, number of years held by the previous ownerbefore the resaleand ownertypedueto resale restrictions of EC.

## Descriptive statistics

### Distribution of EC locations in Singapore

![GitHub Logo](/images/ec.png)

The geographical map shows the distribution of ECs in Singapore. There is only 1 property in Central Region as indicated by the purple dot. The rest of the ECs can be found in the Eastern (red), North-Eastern (green), Northern (yellow) and Western (blue) regions. The highest number of ECs are in developing neighbourhoods of Seng Kang and Punggol inthe North-Eastern region.


### Distribution of resale price by floor levels

![GitHub Logo](/images/viz1.png)

From the unit number of each observation in the data set, we transform that information into 4 floor levels: Ground Floor; Bottom Half, Top Half and Penthouse. Note that the ground floor of abuilding may not necessarily be the level 1; and the bottom and top half are assigned based on the height of the building.After assigning a floor label to each unitinour data, the mean resale price is then plotted against each floor level. We can see from the bar chart that the Penthouse commands the highest mean resaleprice, followed by Ground Floor,Top Half and Bottom Half.

### Distribution of resale price by distance to MRT

![GitHub Logo](/images/viz2.png)

We calculatedthe absolute distance between the EC andits nearest MRT. This data is then categorized into‘<1km’, ‘1-2km’ and ‘>2km’. A bar chart of the resale price against distance to MRT shows that ECs that are moderatelyclose to aMRT enjoy a much higher mean resale price. Whilst ECs that are very close to the MRTs only command a slightly higher price than those further away.

### Distribution of resale price over time

![GitHub Logo](/images/viz3.png)

The mean resale price for each region is shown in the above scatter plot and regression lines for each region generated. Theregression lines for all regions are similar, with only the CentralRegion having a much higher resale price, that is increasing sharplyover time.We will look into thistrendacrossthe differentregions in the hypothesis testing below.Inferential statisticsSeveral statisticalmethods will be applied to the analysis.Hypothesis Testing: Compare mean resale priceof EC vs private condominium, profits of investing in EC and which region provides the best profits.Multiple Linear Regression:Predict the future prices by using historical price and significant variables.


## Inferential statistics

Several statisticalmethods will be applied to the analysis.Hypothesis Testing: Compare mean resale priceof EC vs private condominium, profits of investing in EC and which region provides the best profits.Multiple Linear Regression:Predict the future prices by using historical price and significant variables.


### R packages

##### dplyr: For data transformation and manipulation.
##### shiny:To create shinyUI and server.
##### shinydashboard:To create dashboard in the app.
##### readr: Read csv data into tibble format.
##### readxl:Read excel data into tibble format.
##### ggplot2: Create various graphics such as scatter plot, bar chart, histogram.
##### sf: Read and write shapefile for geometric operations.
##### leaflet & leaflet.extras: Visualize Singapore map and show different features by area.
##### ggmap:Used geocode function to get longitude and latitude data of ec.
##### xts: Convert data frame format to extensible time series format. 
##### dygraphs: Produce interactive graphics for time series analysis.
##### Geosphere:Spherical trigonometry for geographic applications.
##### multcompView: Convert a logical vector or a vector of p-values or a correlation, difference, or distance matrix into a display identifying the pairs for which the differences were not significantly different.

## Hypothesis Testing

### Test 1: Are EC prices cheaper than private condominiums?

To carry out this test, we first obtain a similar set of data for private condominiums. REALIS transactions for private condominiums were extracted for the period of Nov’19 to Oct’19. The sample mean price for square metre was calculated. EC data is then restricted to the same period, and we carried out the hypothesis testing below.

![GitHub Logo](/images/ht1.png)
![GitHub Logo](/images/ht2.png)

As the z-value (-49.79778) is lower than -0.645, we reject the null hypothesis; and conclude that there is
enough evidence to support the statement that the mean unit price of ECs is lower than the mean unit
price of private condominiums

### Test 2: Will EC owners make profits from their investment?

The data is already transformed such that all observations have its own resale price, as well as the prior
transacted price of the same unit. We thus carry out a paired t-test on the transacted price and prior
transacted price to determine if the EC sellers make any profit.

![GitHub Logo](/images/ht3.png)


![GitHub Logo](/images/ht4.png)

As the p-value is lower than the significant value of 0.05, we reject the null hypothesis, and conclude
that there is enough evidence to support the statement that the means of the resale price is higher than
the means of the prior transacted price.

### Test 3: Do properties in different regions have different profits?

A calculated variable “annualized profit” was derived using the formula:

![GitHub Logo](/images/ht5.png)

This standardized the value of the price differences to per unit year for a fairer comparison. An ANOVA
test was performed on this derived variable across different regions.

![GitHub Logo](/images/ht6.png)

Conclusion:
As the p-value is lower than the significant value of 0.05, we reject the null hypothesis. We can conclude
that there are significant differences in annualized profits between the different regions.

### Test 4: Which regions are different and have better profits?
A Tukey Test was performed to determine with regions are different from the rest

![GitHub Logo](/images/ht7.png)

![GitHub Logo](/images/ht8.png)

We conclude that Central Region provides the highest annualized profits amongst the groups. The
second highest annualized profits group are Northeast Region. The East, West and North Regions group
provide the lowest annualized profits.

##### Prediction: What is the relationship between prices and the significant variables?
Multiple Linear Regression was used to predict future housing prices based on known variables.
A total of 8 X variables were used to predict the Y variable (purchase price): 6 Continuous variables and 3
Categorical variables.

6 Continuous variables include: Area_sqm, PropertyAge, Prior_Transacted_Price, No_of_years_owned,
and MRT_dist_meter (meters to MRT), and sch_dist_meter (meters to nearest school).
3 Categorical variables include categorized floor level, purchaser type, and region – each variable was
recoded into a dummy variable for the purposes of this analysis.

Stepwise, Forward, and Backward methods were tried, and in no case were any variables removed by
the procedures, indicating that each plays an important role in contributing to the overall predictive
power of the model.

![GitHub Logo](/images/ht9.png)
![GitHub Logo](/images/ht10.png)

The model produced by this regression has an Adjusted R-Squared of 0.5035, indicating that it captures
roughly 50% of the variance in prices in houses. The p-value of < 2.2e-16 allows us to conclude that the
model is significant, allows its conclusions (found via the Shiny app created) to be interpreted as
significant.

## Summary
Prospective real estate buyers face a complex and challenging search for their 'best-fit' property. Their
decisions are based not only on the price of the prospective property, but also on factors such as
location, proximity to various amenities (i.e. MRT stations, primary schools) and prospective resale
value. These factors play a crucial role in determining the purchase price of the property today.

We can conclude that EC is a good investment. It is cheaper than private condominiums, profitable
statistically, and the amount of profits depends on the region of the property.

Generalizing, the resale prices of EC depends on qualities of the location (which determines proximity to
MRT stations and primary schools) and the unit itself (which includes the floor height, age of unit, prior
transacted price).

The tool we develop will analyze and predict the prices of Executive Condominiums by incorporating
these variables. The variables are available information at the point of decision. This will enable buyers
to make better decisions about their next investment.

To better enhance the predicting capabilities, we can further investigate and include other significant
variables, while bearing in mind the possibility of over-fitting the model, multi-collinearity of the
variables, as well as it becoming an overly complex model for practical use.

Other methods of prediction such as time-series analysis and decision tree can also be undertaken for
non-linear relationship modelling due to the complex nature of property prices.









