SELECT  DISTINCT name, numGuns, bore, displacement, type, country, launched, Classes.class
   FROM Classes , Ships
 WHERE Classes.class = Ships.class AND
 
 (CASE WHEN numGuns=8 THEN 1 ELSE 0 END + 
  CASE WHEN bore=15 THEN 1 ELSE 0 END + 
  CASE WHEN displacement=32000 THEN 1 ELSE 0 END +
  CASE WHEN type='bb' THEN 1 ELSE 0 END +
  CASE WHEN country='USA' THEN 1 ELSE 0 END +
  CASE WHEN launched=1915 THEN 1 ELSE 0 END +
  CASE WHEN Ships.class='Kongo' THEN 1 ELSE 0 END ) >=4
