SELECT ship, battle, date
FROM Battles JOIN Outcomes ON battle=name
WHERE result LIKE 'damaged'
