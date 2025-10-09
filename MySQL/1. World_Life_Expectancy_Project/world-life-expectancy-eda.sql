# World Life Expectancy Project (EDA)

SELECT *
FROM world_life_expectancy
;


SELECT Country, 
MIN(`Life expectancy`), 
MAX(`Life expectancy`),
ROUND(MAX(`Life expectancy`) - MIN(`Life expectancy`), 1) AS life_increase_15_years
FROM world_life_expectancy
GROUP BY Country
HAVING MIN(`Life expectancy`) <> 0
	AND MAX(`Life expectancy`) <> 0
ORDER BY life_increase_15_years 
;


SELECT Year, ROUND(AVG(`Life expectancy`), 2)
FROM world_life_expectancy
WHERE `Life expectancy` <> 0
	AND `Life expectancy` <> 0
GROUP BY Year
ORDER BY Year
;


SELECT *
FROM world_life_expectancy
;


SELECT Country, 
	ROUND(AVG(`Life expectancy`), 1) as life_expectancy, 
	ROUND(AVG(GDP), 1) as gdp
FROM world_life_expectancy
WHERE `Life expectancy` <> 0
	AND GDP <> 0
GROUP BY Country
ORDER BY GDP DESC
;


SELECT 
SUM(CASE WHEN GDP >= 1500 THEN 1 ELSE 0 END) High_GDP_Count,
AVG(CASE WHEN GDP >= 1500 THEN `Life expectancy` ELSE NULL END) High_GDP_Life_Expectancy,
SUM(CASE WHEN GDP <= 1500 THEN 1 ELSE 0 END) Low_GDP_Count,
AVG(CASE WHEN GDP <= 1500 THEN `Life expectancy` ELSE NULL END) Low_GDP_Life_Expectancy
FROM world_life_expectancy
;


SELECT Status, AVG(`Life expectancy`)
FROM world_life_expectancy
GROUP BY Status
;


SELECT Status, COUNT(DISTINCT Country), ROUND(AVG(`Life expectancy`), 1)
FROM world_life_expectancy
GROUP BY Status
;


SELECT Country, 
	ROUND(AVG(`Life expectancy`), 1) as life_expectancy, 
	ROUND(AVG(BMI), 1) as BMI
FROM world_life_expectancy
GROUP BY Country
HAVING life_expectancy <> 0
	AND BMI <> 0
ORDER BY BMI ASC
;


SELECT Country,
Year,
`Life expectancy`,
`Adult Mortality`,
SUM(`Adult Mortality`) OVER(PARTITION BY Country ORDER BY Year) AS Rolling_Total
FROM world_life_expectancy
WHERE Country LIKE '%United%'
;


