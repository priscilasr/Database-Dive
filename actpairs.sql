DROP TABLE ActorsPairs;
CREATE TABLE IF NOT EXISTS ActorsPairs (avg_rating, actor1, actor2) AS
    (SELECT DISTINCT AVG(ratings.rating) OVER (PARTITION BY act_titles.nconst, act_titles2.nconst) AS avg_rating, act_titles.nconst AS actor1, act_titles2.nconst AS actor2
    FROM ratings,
    (SELECT actor_roles.titleId, actor_roles.nconst FROM
    content_viewer, actor_roles
    WHERE primaryprofession LIKE '%act%'
    AND actor_roles.nconst = content_viewer.nconst) AS act_titles,
    (SELECT actor_roles.titleId, actor_roles.nconst FROM
    content_viewer, actor_roles
    WHERE primaryprofession LIKE '%act%'
    AND actor_roles.nconst = content_viewer.nconst) AS act_titles2
    WHERE ratings.titleId = act_titles.titleId
    AND act_titles.titleId = act_titles2.titleId
    AND act_titles.nconst < act_titles2.nconst
    ORDER BY avg_rating DESC);