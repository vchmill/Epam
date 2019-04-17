SELECT DISTINCT maker FROM Product WHERE maker IN 
(SELECT maker FROM Laptop,Product WHERE Laptop.model = Product.model) AND maker IN 
(SELECT maker FROM PC,Product WHERE PC.model = Product.model)
