SELECT DISTINCT maker FROM Product, PC
WHERE speed>=600 AND Product.model=PC.model
