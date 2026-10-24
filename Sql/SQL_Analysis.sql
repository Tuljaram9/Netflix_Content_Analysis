USE netflix_analysis;

-- 1. Check the total number of records
SELECT COUNT(*) AS total_titles
FROM netflix_titles;

-- 2. Preview the dataset
SELECT *
FROM netflix_titles
LIMIT 10;

-- 3. Check the column names and data types
DESCRIBE netflix_titles;

-- 4. Check for duplicate show IDs
SELECT
    show_id,
    COUNT(*) AS occurrences
FROM netflix_titles
GROUP BY show_id
HAVING COUNT(*) > 1;



SELECT
    type,
    COUNT(*) AS total_titles,
    ROUND(
        COUNT(*) * 100.0 / (SELECT COUNT(*) FROM netflix_titles),
        2
    ) AS percentage
FROM netflix_titles
GROUP BY type
ORDER BY total_titles DESC;





SELECT
    country,
    COUNT(*) AS total_titles
FROM netflix_titles
WHERE country IS NOT NULL
  AND TRIM(country) <> ''
GROUP BY country
ORDER BY total_titles DESC
LIMIT 10;


SELECT
    rating,
    COUNT(*) AS total_titles
FROM netflix_titles
WHERE rating IS NOT NULL
  AND TRIM(rating) <> ''
GROUP BY rating
ORDER BY total_titles DESC;

SELECT
    COUNT(*) AS total_movies,
    ROUND(AVG(CAST(SUBSTRING_INDEX(duration, ' ', 1) AS UNSIGNED)), 2)
        AS average_duration_minutes,
    MIN(CAST(SUBSTRING_INDEX(duration, ' ', 1) AS UNSIGNED))
        AS shortest_movie_minutes,
    MAX(CAST(SUBSTRING_INDEX(duration, ' ', 1) AS UNSIGNED))
        AS longest_movie_minutes
FROM netflix_titles
WHERE type = 'Movie'
  AND duration REGEXP '^[0-9]+ min$';
  
  
  
  SELECT
    YEAR(STR_TO_DATE(date_added, '%M %e, %Y')) AS added_year,
    COUNT(*) AS total_titles
FROM netflix_titles
WHERE date_added IS NOT NULL
  AND TRIM(date_added) <> ''
GROUP BY added_year
HAVING added_year IS NOT NULL
ORDER BY total_titles DESC;



SELECT
    release_year,
    SUM(CASE WHEN type = 'Movie' THEN 1 ELSE 0 END) AS total_movies,
    SUM(CASE WHEN type = 'TV Show' THEN 1 ELSE 0 END) AS total_tv_shows,
    COUNT(*) AS total_titles
FROM netflix_titles
WHERE release_year IS NOT NULL
GROUP BY release_year
ORDER BY release_year;



WITH RECURSIVE genre_split AS (
    SELECT
        show_id,
        TRIM(SUBSTRING_INDEX(listed_in, ',', 1)) AS genre,
        CASE
            WHEN listed_in LIKE '%,%'
            THEN SUBSTRING(listed_in, LOCATE(',', listed_in) + 1)
            ELSE NULL
        END AS remaining_genres
    FROM netflix_titles
    WHERE listed_in IS NOT NULL
      AND TRIM(listed_in) <> ''

    UNION ALL

    SELECT
        show_id,
        TRIM(SUBSTRING_INDEX(remaining_genres, ',', 1)),
        CASE
            WHEN remaining_genres LIKE '%,%'
            THEN SUBSTRING(
                remaining_genres,
                LOCATE(',', remaining_genres) + 1
            )
            ELSE NULL
        END
    FROM genre_split
    WHERE remaining_genres IS NOT NULL
)
SELECT
    genre,
    COUNT(*) AS total_titles
FROM genre_split
WHERE genre <> ''
GROUP BY genre
ORDER BY total_titles DESC
LIMIT 10;


SELECT
    rating,
    SUM(CASE WHEN type = 'Movie' THEN 1 ELSE 0 END) AS total_movies,
    SUM(CASE WHEN type = 'TV Show' THEN 1 ELSE 0 END) AS total_tv_shows,
    COUNT(*) AS total_titles
FROM netflix_titles
WHERE rating IS NOT NULL
  AND TRIM(rating) <> ''
GROUP BY rating
ORDER BY total_titles DESC;


