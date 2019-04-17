SELECT DISTINCT maker FROM Product, Laptop
WHERE speed<=500 AND Product.model=Laptop.model
