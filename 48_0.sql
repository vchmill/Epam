SELECT PC.maker FROM (
SELECT maker FROM Product
WHERE type='PC' GROUP BY maker 
HAVING COUNT(*)>=2) PC
