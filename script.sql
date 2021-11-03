DROP TABLE video;
DROP TABLE content_viewer;
DROP TABLE content_analyst;
DROP TABLE ratings;
DROP TABLE content_management;
CREATE TABLE IF NOT EXISTS video(titleId TEXT PRIMARY KEY, directors TEXT, writers TEXT);
CREATE TABLE IF NOT EXISTS content_viewer(nconst TEXT PRIMARY KEY, primaryName TEXT, birthYear INT, deathYear INT, primaryProfession TEXT);
CREATE TABLE IF NOT EXISTS content_analyst(nconst TEXT PRIMARY KEY, primaryName TEXT, birthYear INT, deathYear INT, primaryProfession TEXT);
CREATE TABLE IF NOT EXISTS ratings(customerId TEXT, rating FLOAT, date TEXT, titleId TEXT);
CREATE TABLE IF NOT EXISTS content_management(titleId TEXT PRIMARY KEY, titleType TEXT, originalTitle TEXT, startYear INT, endYear INT, runtimeMinutes INT, genres TEXT, year INT, averageRating FLOAT, numVotes INT);
\copy video from 'new_crew.csv' CSV HEADER
\copy content_viewer from 'new_names.csv' CSV HEADER
\copy content_analyst from 'new_names.csv' CSV HEADER
\copy ratings from 'new_customer_ratings.csv' CSV HEADER
\copy content_management from 'new_content_management.csv' CSV HEADER

