# An investigation of revenue change for Fortune500 companies using PostgreSQL
An exploratory data analysis in SQL using data from Stack Overflow, Fortune 500 companies, and 311 help requests from Evanston, IL.

This is a project work using SQL of a data analysis course that I have completed from DataCamp named 'Exploratory Data Analysis in SQL'.

It is mainly comprised of:
- Analysis of numeric, character, and date/time data types.
- Using functions to aggregate, summarize, and analyze data without leaving the database.
- We also fixed common problems faced with the dataset and cleaned up the messy data.

### Course Link and Data Source: https://app.datacamp.com/learn/courses/exploratory-data-analysis-in-sql
**All datasets and images are the subject to the course referred.

The relation between the tables are shown with this ER Diagram:

![image](https://github.com/Rezwan66/EDA_fortune500-companies/blob/b591a6b4d0b233036c2c91e108baf7a260f8f47d/erdiagram.png)


At first, let us look at a few rows of each of the "evanston311", "fortune500", and the "stackexchange" tables:

```sql
SELECT TOP (5) *
  FROM [datacamp_eda].[dbo].[ev311$]; /* evanston311 table */
```

![image](https://user-images.githubusercontent.com/63563859/216164510-d16ddad8-a184-42d7-972a-524cac7ce905.png)
*Fig: Screenshot of the evanston311 table queried for the first 5 rows in Microsoft SQL Server Management Studio*

```sql
SELECT TOP (5) *
  FROM [datacamp_eda].[dbo].[fortune$]; /* fortune500 table */
```

![image](https://user-images.githubusercontent.com/63563859/216167568-f7d574a6-fd42-4bd2-8abe-35a00554da0d.png)
*Fig: Screenshot of the fortune500 table queried for the first 5 rows in Microsoft SQL Server Management Studio*

```sql
SELECT TOP (5) *
  FROM [datacamp_eda].[dbo].[stackexchange$]; /* stackexchange table */
```

![image](https://user-images.githubusercontent.com/63563859/216168942-c891ab9d-3357-43cd-8b48-0aae273ead7d.png)
*Fig: Screenshot of the stackexchange table queried for the first 5 rows in Microsoft SQL Server Management Studio*

```sql
/****** Summarize the distribution of numeric values
Was 2017 a good or bad year for revenue of Fortune 500 companies? 
Examine how revenue changed from 2016 to 2017 by first looking at the distribution of revenues_change 
and then counting companies whose revenue increased.  ******/
-- Select the count of each value of revenues_change
SELECT revenues_change, COUNT(revenues_change) as revcount
  FROM [datacamp_eda].[dbo].[fortune$]
   GROUP BY revenues_change
 -- order by the values of revenues_change
 ORDER BY revcount;
```
NEXT

```sql
--Repeat step 1, but this time, cast revenues_change as an integer to reduce the number of different values.
-- Select the count of each revenues_change integer value
SELECT cast(revenues_change as integer), count(revenues_change) as revcount
  FROM [datacamp_eda].[dbo].[fortune$]
 group by cast(revenues_change as integer)
 -- order by the values of revenues_change
 ORDER BY revcount;
 ```
 next
 
 ```sql
 --How many of the Fortune 500 companies had revenues increase in 2017 compared to 2016? 
--To find out, count the rows of fortune500 where revenues_change indicates an increase.
-- Count rows 
SELECT count(*) as comp_pos_change
  FROM [datacamp_eda].[dbo].[fortune$]
 -- Where...
 WHERE revenues_change>0;
 ```
