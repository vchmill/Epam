SELECT maker, PC.model, type, price FROM Product, PC
WHERE Product.model=PC.model AND maker='B'
UNION
SELECT maker, Laptop.model, type, price FROM Product, Laptop
WHERE Product.model=Laptop.model AND maker='B'
UNION
SELECT maker, Printer.model, Product.type, price FROM Product, Printer
WHERE Product.model=Printer.model AND maker='B'