SELECT distinct maker, type, speed, hd FROM PC, Product  
WHERE PC.model = Product.model AND hd <= '8'