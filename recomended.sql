DROP TABLE Recomended;
CREATE TABLE IF NOT EXISTS Recomended (id, titleId, add_date, rating, genres, num_gen, actors, num_act, directors, num_dir, writers, num_wri) AS(
SELECT DISTINCT ROW_NUMBER() OVER(ORDER BY titleId ASC)AS id, * FROM
((SELECT DISTINCT oldVids.titleId, 1 AS add_date, oldVids.rating, oldVids.genres, oldVids.num_gen, oldVids.actors, oldVids.num_act, oldVids.directors, oldVids.num_dir, oldVids.writers, oldVids.num_wri
 FROM (SELECT * FROM CustomerMovies WHERE customerId <> '1001129') AS newVids,
 (SELECT * FROM CustomerMovies WHERE customerId = '1001129' AND rating >= 3) AS oldVids
 WHERE newVids.genres = oldVids.genres
 AND newVids.actors = oldVids.actors
 AND newVids.directors = oldVids.directors
 AND newVids.writers = oldVids.writers
 AND newVids.titleId <> oldVids.titleId)
 UNION
(SELECT DISTINCT oldVids.titleId, 2 AS add_date, oldVids.rating, oldVids.genres, oldVids.num_gen, oldVids.actors, oldVids.num_act, oldVids.directors, oldVids.num_dir, oldVids.writers, oldVids.num_wri
 FROM (SELECT * FROM CustomerMovies WHERE customerId <> '1001129') AS newVids,
 (SELECT * FROM CustomerMovies WHERE customerId = '1001129' AND rating >= 3) AS oldVids
 WHERE newVids.genres = oldVids.genres
 AND newVids.actors = oldVids.actors
 AND newVids.directors = oldVids.directors
 AND newVids.titleId <> oldVids.titleId)
 UNION
(SELECT DISTINCT oldVids.titleId, 3 AS add_date, oldVids.rating, oldVids.genres, oldVids.num_gen, oldVids.actors, oldVids.num_act, oldVids.directors, oldVids.num_dir, oldVids.writers, oldVids.num_wri
 FROM (SELECT * FROM CustomerMovies WHERE customerId <> '1001129') AS newVids,
 (SELECT * FROM CustomerMovies WHERE customerId = '1001129' AND rating >= 3) AS oldVids
 WHERE newVids.genres = oldVids.genres
 AND newVids.actors = oldVids.actors
 AND newVids.titleId <> oldVids.titleId)
 UNION
(SELECT DISTINCT oldVids.titleId, 4 AS add_date, oldVids.rating, oldVids.genres, oldVids.num_gen, oldVids.actors, oldVids.num_act, oldVids.directors, oldVids.num_dir, oldVids.writers, oldVids.num_wri
 FROM (SELECT * FROM CustomerMovies WHERE customerId <> '1001129') AS newVids,
 (SELECT * FROM CustomerMovies WHERE customerId = '1001129' AND rating >= 3) AS oldVids
 WHERE newVids.genres = oldVids.genres
 AND newVids.titleId <> oldVids.titleId)
) AS recUnion
ORDER BY add_date, rating DESC, num_gen DESC, num_act DESC, num_wri DESC
);
DROP TABLE RF;
CREATE TABLE RF AS SELECT * FROM Recomended; 
DELETE FROM RF y
    WHERE EXISTS (SELECT 1 FROM RF y2 WHERE y.titleId = y2.titleId AND (y2.id > y.id));