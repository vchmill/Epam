SELECT DISTINCT maker
FROM Product
WHERE (maker=ANY(SELECT maker FROM Product WHERE type='PC')
and type='Laptop')