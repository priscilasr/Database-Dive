DROP TABLE CustomerMovies;
/* Collects all movies every customer has watched and adds the movie rating, genre, number of times the user has watched
said genre, actors, number of times a user has watched an actor, directors, number of times a user has watched said director,
writers, number of times a user has watched said writers*/
/* order Most likely not needed but is there for debugging convience, remove if necessary to speed up program*/
CREATE TABLE IF NOT EXISTS CustomerMovies (customerId, titleId, rating, genres, num_gen, actors, num_act, directors, num_dir, writers, num_wri) AS
(SELECT customerId, ratings.titleId, rating, genres, COUNT(genres) OVER (PARTITION BY ratings.customerId, genres) AS num_gen, nconst, COUNT (nconst) OVER (PARTITION BY ratings.customerId, nconst) AS num_act, directors, COUNT(directors) OVER (PARTITION BY ratings.customerId, directors) AS num_dir, writers, COUNT(writers) OVER (PARTITION BY ratings.customerId, writers) AS num_wri
    FROM ratings,video,content_management, 
    (SELECT actor_roles.titleId, actor_roles.nconst FROM
    content_viewer, actor_roles
    WHERE primaryprofession LIKE '%actor%'
    AND actor_roles.nconst = content_viewer.nconst) AS act_titles
    WHERE ratings.titleId = video.titleId
    AND video.titleId = content_management.titleId
    AND content_management.titleId = act_titles.titleId
    ORDER BY customerId, ratings DESC, num_gen DESC, num_act DESC, num_dir DESC, num_wri DESC);