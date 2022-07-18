# 2021 World Population Dataset SQL Project

# In this Case study, I will work with the dataset Rishav Sharma Kaggle dataset collection
# https://www.kaggle.com/datasets/rsrishav/world-population?resource=download

#Why I choose this project, Since Population keeps increasing day by day and it's a concern for the society and environment
#As the world's population grows, so do its demands for water, land, trees, food,place, and soil, etc - all of which come at a 
#high price for already endangered plants and animals.

#In this article, They have mentioned 
#"India to overtake China as world's most populated country in 2023": UN
 
#https://www.business-standard.com/article/economy-policy/india-to-overtake-china-as-world-s-most-populated-country-in-2023-un-
#122071100983_1.html

# Why Population Control is necessary

#In Simple word, population control is necessary for a healthy and prosperous life, for Good Health and Education ,and for 
#the speedy development of a country.
#Population control is also necessary to reduce the burden on nature and 
#to tackle the environmental problem growing day by day.

#In this project, I analyzed the data based on the Population in 2021,2020 Population data is also included in the file, etc

#Importing the data now,Creating Database SQL_Project

#Selecting the Sql_project database for table creation
USE Sql_Project;

#Imported the data using Table Data Import Wizard option
SHOW TABLES;

#Querying all the data in the population table
SELECT * FROM population;

#Renaming the column name for growth_rate_ to growth_rate
ALTER TABLE population RENAME COLUMN growth_rate_ TO growth_rate;

# 1st Analysis-- Which country has the highest population in 2021?
SELECT * FROM population WHERE 2021_last_updated = (SELECT MAX(2021_last_updated) FROM population);

# 2nd Analysis-- Which country has the least number of people in 2021?
SELECT * FROM population WHERE 2021_last_updated = (SELECT MIN(2021_last_updated) FROM population);

#3rd Analysis--Find the Population of India with all details.

SELECT * from population WHERE country='India';

#4th Analysis--Checking a list The word IN allows us to check if an item is in a list.

#Show the name and the population for 'Germany', 'Spain' and 'Egypt'.

SELECT country,2021_last_updated FROM population WHERE country IN ('Germany', 'Spain','Egypt')
ORDER BY 2021_last_updated;

#5th Analysis--Which country are not too small and not too big in Population?

#First let find the Average Population in whole world in 2021?

SELECT AVG(2021_last_updated) AS Average_population FROM population;

#Let's found the countries which are in between 1 crore to 10 crore.

SELECT * FROM population where 2021_last_updated BETWEEN 10000000 AND 100000000
ORDER BY 2021_last_updated;

#6th Analysis Find out how much population was increased from 2020-2021 for all countries?

SELECT iso_code,country,2021_last_updated - 2020_population AS increased_population_count
from population;

#7th Analysis--Find out the total Population of the world in 2021 and 2020?

SELECT SUM(2021_last_updated) as total_pop_2021,
        SUM(2020_population) as total_pop_2020 FROM population;

#8th Analysis Find countries whose area is more than 10 lakh sq_km

SELECT COUNT(country) from population WHERE area_sq_km > 1000000;
