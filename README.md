**Muhammad Syahirul Khaliq bin Mohamed Aidi Shahriz**

**22075208**

**Github link:** <https://github.com/Syahirulkhaliq/Khaliq_22075208/>

# Introduction to dataset and objective

Dataset consists of 1020 rows of unique customers and 13 attributes
which are Customer ID, Gender, Age, City, Membership Type, Total Spend,
Items Purchased, FavoriteCategory, Average Rating, Discount Applied,
Days Since Last Purchase, Satisfaction Level and Churn. Below are the
details of the attributes.

  -------------------------------------------------------------------------------
  Column                     Type          Description
  -------------------------- ------------- --------------------------------------
  Customer_ID                Numeric       A unique identifier assigned to each
                                           customer, ensuring distinction across
                                           the dataset

  Gender                     Categorical   Specifies the gender of the customer,
                                           allowing for gender-based analytics

  Age                        Numeric       Represents the age of the customer,
                                           enabling age-group-specific insights.

  City                       Categorical   Indicates the city of residence for
                                           each customer, providing geographic
                                           insights

  Membership_Type            Categorical   Identifies the type of membership held
                                           by the customer, influencing perks and
                                           benefits

  Total_Spend                Numeric       Records the total monetary expenditure
                                           by the customer on the e-commerce
                                           platform

  Items_Purchased            Numeric       Quantifies the total number of items
                                           purchased by the customer

  FavoriteCategory           Categorical   Records most-explored category of a
                                           user, represents customer biasness
                                           towards products

  Average_Rating             Numeric       Represents the average rating given by
                                           the customer for purchased items,
                                           gauging satisfaction

  Discount_Applied           Boolean       Indicates whether a discount was
                                           applied to the customer\'s purchase,
                                           influencing buying behavior

  Days_Since_Last_Purchase   Numeric       Reflects the number of days elapsed
                                           since the customer\'s most recent
                                           purchase, aiding in retention analysis

  Satisfaction_Level         Categorical   Captures the overall satisfaction
                                           level of the customer, providing a
                                           subjective measure of their experience

  Churn                      Numeric       A binary column indicating whether the
                                           customer has churned (0 for retained,
                                           1 for churned), indicating customer
                                           retention
  -------------------------------------------------------------------------------

Based on the dataset, \"Churn\" variable is the most suitable target
variable. This is because it directly relates to customer retention, a
key aspect of understanding and predicting customer behaviour. By
analysing churn, you can identify patterns and factors that indicate
whether a customer is likely to stop purchasing (churn) or continue
being active. Analyzing churn can provide valuable insights into
customer loyalty, satisfaction, and overall engagement with the
e-commerce platform. It can also help in developing strategies to
improve customer retention and targeting interventions to reduce the
churn rate. Thus, objective of this study to

-   Analyse the customer behaviour dataset and derived meaningful
    insights from the model analysis

-   Assess and compare the performance of models which can emphasize the
    reliability of the insights develop

In this study, SAS Enterprise Miner will be mainly utilised to extract
information for the following objectives with the inclusion of other
tools such as Talend Data Prep.

# Dataset Import and Preprocessing

Prior from using SAS Enterprise Miner, Talend Data Preparation was
utilized to provide comprehensive details on dataset, ensure data
consistency of categorical data values such as spelling errors and
alphabet casing, as well as checking missing values. There were some
data inconsistencies that can be group using "Find and group similar
text" function in city column as below:

![](vertopal_b073f5901b81407ebf71bd36f24c2aae/media/image1.png){width="4.024090113735783in"
height="2.168532370953631in"}

Such approach would be easier to conduct in Talend Data Preparation
compared to SAS. In addition, missing values were detected in 'Age' and
'Satisfaction Level' column as shown below:

['Age' Column]{.underline}

![](vertopal_b073f5901b81407ebf71bd36f24c2aae/media/image2.png){width="2.2352252843394576in"
height="1.9010378390201226in"}

['Satisfaction Level' column]{.underline}

![](vertopal_b073f5901b81407ebf71bd36f24c2aae/media/image3.png){width="2.2944181977252844in"
height="2.106540901137358in"}

Considering the amount of dataset rows to be quite limited, imputation
method is preferable in comparison with deleting rows to prevent the
loss of data. Such method will be implied in SAS Enterprise Miner. In
addition, columns containing 2 unique values like 'Gender' and 'Discount
Applied' was duplicated, and the duplicated columns were replace with
binary values using 'replace the cells that match' function with below
as an example:

![](vertopal_b073f5901b81407ebf71bd36f24c2aae/media/image4.png){width="2.673086176727909in"
height="2.241279527559055in"}

For 'Gender' column, 'Male' value represents as 1 while 'Female' value
represents as 0. While for 'Discount Applied' column, 'TRUE' value
represents as 1 while 'FALSE' value represents as 0. The result of
columns are as below:

![](vertopal_b073f5901b81407ebf71bd36f24c2aae/media/image5.png){width="2.483548775153106in"
height="3.4169630358705163in"}![](vertopal_b073f5901b81407ebf71bd36f24c2aae/media/image6.png){width="2.300082020997375in"
height="3.4192475940507436in"}

The dataset was then exported to be imported in SAS for further
preprocessing. Below

![](vertopal_b073f5901b81407ebf71bd36f24c2aae/media/image7.png){width="6.268055555555556in"
height="3.8222222222222224in"}

The file was imported via 'File import' node. Considering the dataset
consists of only 1020 rows, no sampling was needed as dataset itself
will be considered as representation. Details of initial roles were as
below:

![](vertopal_b073f5901b81407ebf71bd36f24c2aae/media/image8.png){width="6.108862642169729in"
height="2.2085247156605425in"}

In the 'edit variable' section of file import. Minor changes were
conducted in terms of role and level. Churn was selected as the target
variable for customer behaviour analysis while Customer_ID role was
changed to ID. The role of nominal level columns of Discount_Applied and
Gender were set to rejected to prevent redundancy with the modified
columns of these 2 columns. In addition, the level of
Discount_Applied_Binary, Gender_Binary and Churn were set to Binary due
to its binary value. Below are the overall changes made:

![](vertopal_b073f5901b81407ebf71bd36f24c2aae/media/image9.png){width="6.048277559055118in"
height="2.3201301399825023in"}

A quick exploration on attributes was conducted via choosing every
related attributes in 'edit variable' section and clicking 'explore'.
Below are some visualizations of the exploration:

![](vertopal_b073f5901b81407ebf71bd36f24c2aae/media/image10.png){width="6.268055555555556in"
height="3.0694444444444446in"}

Based on the graphs, there is opportunity to perform log transformation
for skewed distribution, particularly 'Age' and 'Items_Purchased'
attribute. Log transformation smoothens the data for better
distribution. In handling the missing values, imputation method was
selected by using the impute node as in SAS workflow diagram. In the
edit variable section, the 'Use' column were changed to 'Yes' for 'Age'
and 'Satisfaction_Level'. Considering the missing value type is missing
completely at random (MCAR) as well as having low count (only 14 for
'Age' and 2 for 'Satisfaction_Level'), the method of imputation was set
to Mean and Count respectively. Below are the changes made:

![](vertopal_b073f5901b81407ebf71bd36f24c2aae/media/image11.png){width="4.292038495188102in"
height="2.0585115923009623in"}

Below is the output after running impute node:

![](vertopal_b073f5901b81407ebf71bd36f24c2aae/media/image12.png){width="6.68780293088364in"
height="0.28391622922134735in"}

After that, 'Transform Variable' node was connected to normalize data
via performing log transformation. This can be done on edit variable
section of Transform variable node such as below:

![](vertopal_b073f5901b81407ebf71bd36f24c2aae/media/image13.png){width="3.683652668416448in"
height="2.0585115923009623in"}

The result of transformation is indicated as below:

![](vertopal_b073f5901b81407ebf71bd36f24c2aae/media/image14.png){width="6.772754811898513in"
height="0.46752187226596675in"}

![](vertopal_b073f5901b81407ebf71bd36f24c2aae/media/image14.png){width="6.3521041119860016in"
height="1.1513495188101488in"}

The reduction in standard deviation and skewness of indicates a better
distribution of the transformed attributes. The higher negative value of
Kurtosis for transformed 'Item_Purchased' attributes indicates fewer
outliers and less extreme values in dataset.

# Data Partition process

Dataset must undergo partition into Training, validation and test set.
Data partition node was dragged and connected to impute node from
previous data preprocessing. In this case, dataset was only divide into
training (80%) and test set (20%) due to limited dataset amount.
Partitioning method was set to simple random method as every data points
have equal chance to be selected, subsequently reducing biasness. Below
are details of data partition process:

![](vertopal_b073f5901b81407ebf71bd36f24c2aae/media/image15.png){width="2.275196850393701in"
height="1.633474409448819in"}

# Data Modelling and Analysis

## Decision Tree Model

Since the target variable is binary, Gini is used as target criterion as
it is effective in binary classification as it is fast to be computed.
The maximum depth was limited to 3 to provide main overview of the
important details of customer behaviour. Below are the decision tree
details:

![](vertopal_b073f5901b81407ebf71bd36f24c2aae/media/image16.png){width="6.268055555555556in"
height="3.5729166666666665in"}

From the decision tree formed, this indicates that favorite category
affects the most outcome of Churn. While electronics from category are
mainly impacted by cities bought, other category mainly being impacted
by age. While age is either impacted by average rating if log age
\<3.314, or number of items purchased if it is more than or equal to
3.314. From the cities that impacted electronics, Houston and Chicago
city is dependent on age as well.

There a few strategies that can be developed from this model:

1.  Target customers in specific cities like Houston and Chicago with
    electronics, as city location appears to be a significant factor for
    this category

2.  For other categories, age seems to be the most significant factor.
    Marketing and product recommendations can be age-specific to cater
    to different preferences.

3.  Lower age groups can focus on higher rating products as it is
    heavily influenced from it. For higher age groups, items purchased
    seems to be a significant factor. Strategies like bundle offers can
    be introduced for higher volume purchasing

4.  Since electronics are more influenced based on cities, company can
    adjust stock inventory to these locations

## Bagging using High Performance Random Forest (HP Random Forest)

![](vertopal_b073f5901b81407ebf71bd36f24c2aae/media/image17.png){width="6.268055555555556in"
height="0.83125in"}

The variable importance indicated that Gender_Binary, FavoriteCategory,
Discount_Applied_Binary and Age are the top 4 attributes of the
importance. These provides details of insights for strategic business
such as:

1.  Strong influence of gender bias indicates necessity of creating
    gender-based marketing campaigns

2.  Promoting products that are categorical based on the
    customers/users' favourite. These can increase engagement of users
    and prevent churning

3.  Analyse effectiveness of discounts and considering personal ones as
    well

## Boosting using Gradient Boosting Decision Trees

Gradient boosting tree is a great approach as it corrects the error of
previous tree decision under a number of iterations until it reaches its
minimum loss function. Different iterations were implied and tested to
find its minimal globalization, which is around 189 iterations. Thus, it
is used in case study. The variable indicator based on result running is
as below:

![](vertopal_b073f5901b81407ebf71bd36f24c2aae/media/image18.png){width="6.268055555555556in"
height="1.3916666666666666in"}

As indicated, the top 5 main factors influencing such result would be
'total spend', 'Day Since Last Purchase', 'Items Purchased', 'City' and
'Age'. Thus, such strategies that can be implied in business strategy
would be:

1.  Target customers who have spent more but have not purchased recently
    with personalized offers or reminders

2.  Develop loyalty programs to reward repeat purchases, thereby
    reducing the likelihood of churn.

3.  Develop strategies to local tastes and purchasing habits, possibly
    reflecting regional differences and different age

## Models' comparison based on performance metrics

The model comparison node was utilized the compare the performance of
tree models utilized

### 

### Classification table

### 

Classification table involves 4 labels, which are True Positive, True
Negative, False Positive, False Negative. These are the description of
these 4 labels in terms of churn analysis:

-   True Positive (TP): Indicates the customers who were predicted to
    churn and did churn. It helps to understand the effectiveness of
    retention strategies targeted at at-risk customers.

-   True Negative (TN): Represents customers who were predicted to stay
    and did stay. It shows the accuracy of the model in identifying
    loyal customers.

-   False Positive (FP): Customers who were predicted to churn but did
    not churn. This could lead to unnecessary spending on retention
    efforts or incentives for customers who were not at risk

-   False Negative (FN): Customers who were not identified as at-risk
    but churned. This is a missed opportunity for intervention to retain
    the customer

FN is the most important label in this aspect as it describes the
failure of capturing potential customers that will churn. While other
labels are important as well, FN is the main focus on this evaluation.

![](vertopal_b073f5901b81407ebf71bd36f24c2aae/media/image19.png){width="6.268055555555556in"
height="1.2597222222222222in"}

Based on training dataset classification table , HP Forest model is the
least suitable model in predicting churn risk as it generates FN more
than 2 times the amount of both Gradient Boosting and Decision Tree
respectively. In addition, Gradient boosting is the most suitable model
in prediction of churn risk with the lowest FN of 122 followed by
Decision Tree with 128

### Evaluation Metrices

This will involve comparison based on few metrices based on model in
both trained and test data

[Trained data]{.underline}

![](vertopal_b073f5901b81407ebf71bd36f24c2aae/media/image20.png){width="5.833838582677165in"
height="4.142025371828521in"}

Overall, Gradient Boosting decision tree is significantly the better
model compared to decision tree and HP random forest as it has a
relatively lower misclassification rate, sum of squared error, as well
as higher gini coefficient in comparison to HP Random Forest and
Decision Tree model. This indicates that gradient boosting likely better
to handle noise in data, overfitting issues, and provide better
prediction accuracy.

[Test data]{.underline}

![](vertopal_b073f5901b81407ebf71bd36f24c2aae/media/image21.png){width="5.992186132983377in"
height="3.908672353455818in"}

However, for test dataset, Gradient Boost have a higher
misclassification rate, sum of squared errors with lower gini
coefficient compared to the other two models. This might indicate the
model being overfitting. While Decision Tree has the lowest
misclassification rate providing a better prediction accuracy, HP Random
Forest produces the highest gini coefficient and lowest sum of squared
errors.

### ROC Chart

![](vertopal_b073f5901b81407ebf71bd36f24c2aae/media/image22.png){width="6.268055555555556in"
height="3.084722222222222in"}

ROC curve provides indication on models predictive ability with higher
area under curve (AUC) indicates better ability of predicting. In train
dataset, it is depicted that all three models AUC is above the baseline,
indicating its reliability on developing a reliable prediction model.
However, different trend was seen in test dataset, with Gradient
boosting and Decision Tree model covers below the baseline with only HP
random forest barely covering above the baseline. This indicates poor
performance of prediction test dataset. This indicates high possibility
of outliers and noise as models learned the data too well, and unable to
generalize to new and unseen data. Generalizability issues are related a
few aspects such as:

1.  Limited amount of dataset to capture overall representation of the
    analysis

2.  High complexity of the model, which needs to be reduced

3.  Lack of more generalized training methods such as utilization of
    cross validation technique

Thus, these limitations can be address for further studies

# Conclusion

Based on the data preprocessing and modelling, certain insights can be
gained from the customer behaviour analysis which includes:

-   Localized and Demographic Targeting: Develip marketing strategies
    for electronics in cities like Houston and Chicago and align product
    recommendations with age-specific preferences for other categories.

-   Personalized Engagement: Implement gender-specific campaigns and
    promote items based on individual customer\'s favourite categories
    to enhance user engagement.

-   Incentive Programs: Conduct analysis on the significance of
    discounts and introduce personalized offers, reminders, and loyalty
    programs to encourage repeat purchases and higher spend.

-   Inventory and Marketing Optimization: Adjust inventory such as
    electronics in specific cities and use bundle offers for higher age
    groups to incentivize volume purchases.

Based on the performance evaluation, Gradient boosting decision tree
provides the best model on training dataset. However, due to possibility
of outliers and noise, as well as limited amount of dataset, the model
provided is overfitted. This indicates further study with dataset with
better representation, different models of different complexities, as
well as different training approach such as cross validation technique.
Limitation of this studies include time-constraint of implying
pre-processing techniques such as sequence analysis and associate rule
mining, as well as multiple sources of dataset to increase
generalizability of model developed.
