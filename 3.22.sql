DECLARE @value money
         SELECT @value=MIN(price) FROM Printer WHERE Printer.color = 'y';
         SELECT maker, price FROM Product, Printer
         WHERE Printer.model = Product.model AND price = @value AND Printer.color = 'y'
