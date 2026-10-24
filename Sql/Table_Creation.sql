CREATE DATABASE netflix_analysis;

USE netflix_analysis;

CREATE TABLE netflix_titles (
    show_id VARCHAR(10) PRIMARY KEY,
    type VARCHAR(20),
    title VARCHAR(255),
    director TEXT,
    cast TEXT,
    country TEXT,
    date_added VARCHAR(50),
    release_year INT,
    rating VARCHAR(20),
    duration VARCHAR(30),
    listed_in TEXT,
    description TEXT
);

SHOW GLOBAL VARIABLES LIKE 'local_infile';


USE netflix_analysis;

LOAD DATA LOCAL INFILE
'C:/Users/mydal/OneDrive/Desktop/Project_Netflix/Dataset/netflix_titles (1).csv'
INTO TABLE netflix_titles
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES
(
    show_id,
    type,
    title,
    director,
    cast,
    country,
    date_added,
    release_year,
    rating,
    duration,
    listed_in,
    description
);

SELECT COUNT(*) AS total_rows
FROM netflix_titles;

SELECT *
FROM netflix_titles
LIMIT 5;