SELECT maker,
CASE WHEN
( SELECT COUNT(*)
FROM Product WHERE type='pc' GROUP BY maker HAVING maker=P.maker )IS NOT NULL THEN 'yes('+str(( SELECT COUNT(*)
FROM Product WHERE type='pc' GROUP BY maker HAVING maker=P.maker ),1)+')' ELSE 'no'
END AS PC FROM Product P GROUP BY maker;