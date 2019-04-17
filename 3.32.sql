SELECT name 
FROM Ships 
WHERE launched < 1941
 
UNION 
SELECT ship 
FROM Outcomes JOIN 
 Battles ON Battles.name = Outcomes.battle 
WHERE date < '19410101'
 
UNION 
SELECT ship 
FROM Outcomes 
WHERE ship IN (SELECT class 
 FROM Ships
 WHERE launched < 1941
 )
 
UNION 
SELECT ship 
FROM Outcomes 
WHERE Ship IN (SELECT class 
 FROM Ships JOIN
 Outcomes ON Ships.name = Outcomes.ship JOIN 
 Battles ON Battles.name = Outcomes.battle 
 WHERE date < '19410101'
 );