SELECT maker, type,
(SELECT model FROM Product
WHERE Product.model=Laptop.model) AS model,speed
FROM Product, Laptop
WHERE Product.model = Laptop.model AND Laptop.speed >= 600;