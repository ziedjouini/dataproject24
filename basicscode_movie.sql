USE moviesdb;
SELECT * FROM movies;
SELECT * FROM movies Where industry='Bollywood';
SELECT distinct industry FROM movies ;
SELECT * From movies where title like'%THOR%';
SELECT * From movies where title like'%America%';
SELECT * From movies where imdb_rating >= 9;
SELECT * FROM movies WHERE studio= '';
SELECT * FROM movies WHERE studio= '' AND industry='Hollywood';
SELECT * FROM movies WHERE release_year=2022 or release_year=2019;
SELECT * FROM movies WHERE release_year IN (2022,2019);
SELECT * FROM movies WHERE studio IN ('Marvel Studios', 'Zee Studios');
SELECT * FROM movies WHERE imdb_rating IS NULL;
SELECT * FROM movies WHERE industry='Bollywood' order By imdb_rating DESC LIMIT 5;
SELECT * FROM movies WHERE industry='Hollywood' order By imdb_rating DESC LIMIT 5 OFFSET 1;
-- Summary
SELECT count(*) FROM movies WHERE industry = 'Hollywood';

-- print all the years where more than 2 movies was release .alter
SELECT release_year, count(*) as movies_count FROM movies 
group by release_year 
having movies_count > 2
order by release_year DESC;
-- search age actors 
SELECT *,year(curdate()) - birth_year as age  FROM actors;
-- calculate profit
-- 1 Dollar = 83,02 =83 inr :today (2024/10/01)  (( creat new columns))
-- if(condition,True,False)
SELECT * , (revenue - budget) AS profit, 
IF (currency='USD', revenue*83,revenue) AS revenue_inr
FROM financials ;
-- transform all unit in Millions 
SELECT * ,
CASE
    WHEN unit = 'thousands' THEN revenue /1000
    WHEN unit = 'Billions' THEN revenue*1000
    ELSE revenue
end as revenue_mln
    
FROM financials ;

-- SQL joins 
SELECT movie_id,title,budget,revenue,unit,currency FROM movies m
left join financials f
using(movie_id);