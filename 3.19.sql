SELECT DISTINCT Ships.class FROM Ships, Outcomes
  WHERE  Outcomes.ship = Ships.name AND  Outcomes.result = 'sunk'
UNION
SELECT DISTINCT Outcomes.ship FROM Classes, Outcomes
WHERE Outcomes.ship = Classes.class AND  Outcomes.result = 'sunk';
