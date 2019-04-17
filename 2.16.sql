SELECT PC.model,speed,hd FROM PC JOIN Product ON (Pc.model=Product.model)
WHERE hd=10 or hd=20 and maker='A'
ORDER BY speed