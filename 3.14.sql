SELECT P1.maker FROM product P1 WHERE type ='PC' 
AND NOT EXISTS (SELECT PC.model FROM PC WHERE PC.model=P1.model) 
GROUP BY P1.maker HAVING count(*)!= (SELECT COUNT(*) FROM 
(select distinct P2.model from Product P2,PC WHERE P2.maker=P1.maker AND P2.model=PC.model) PC)