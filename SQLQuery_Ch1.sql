/****** Summarize the distribution of numeric values
Was 2017 a good or bad year for revenue of Fortune 500 companies? 
Examine how revenue changed from 2016 to 2017 by first looking at the distribution of revenues_change 
and then counting companies whose revenue increased.  ******/
-- Select the count of each value of revenues_change
SELECT revenues_change, count(revenues_change) as revcount
  FROM [datacamp_eda].[dbo].[fortune$]
   group by revenues_change
 -- order by the values of revenues_change
 ORDER BY revcount;

--Repeat step 1, but this time, cast revenues_change as an integer to reduce the number of different values.
-- Select the count of each revenues_change integer value
SELECT cast(revenues_change as integer), count(revenues_change) as revcount
  FROM [datacamp_eda].[dbo].[fortune$]
 group by cast(revenues_change as integer)
 -- order by the values of revenues_change
 ORDER BY revcount;

--How many of the Fortune 500 companies had revenues increase in 2017 compared to 2016? 
--To find out, count the rows of fortune500 where revenues_change indicates an increase.
-- Count rows 
SELECT count(*) as comp_pos_change
  FROM [datacamp_eda].[dbo].[fortune$]
 -- Where...
 WHERE revenues_change>0;