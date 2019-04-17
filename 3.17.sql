SELECT distinct maker FROM Product 
WHERE Type='PC' AND maker not in (SELECT maker FROM Product 
WHERE NOT EXISTS (SELECT * FROM PC WHERE PC.model=Product.model) AND type= 'PC')