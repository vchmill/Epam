SELECT DISTINCT maker FROM Product, PC
WHERE type='Pritner'
AND maker = ANY (SELECT maker FROM Product, PC 
WHERE type='PC' AND Product.model=PC.model 
AND speed = (SELECT MAX(speed) FROM PC));