
SELECT DISTINCT r2.titleId AS title2, r1.customerId, r1.titleId AS title1
FROM ratings AS r1, ratings AS r2
WHERE 'tt0389605' = r1.titleID
AND r1.customerId = r2.customerId
AND r1.rating >= 4 AND r2.rating >=4




SELECT customerId
FROM (
SELECT title2, customerId, title1 FROM
(SELECT DISTINCT r2.titleId AS title2, r1.customerId, r1.titleId AS title1
FROM ratings AS r1, ratings AS r2
WHERE 'tt9701954' = r1.titleID
AND r1.customerId = r2.customerId
AND r1.rating >= 4 AND r2.rating >=4) AS round1) as subQ
FETCH FIRST 1 ROWS ONLY;
