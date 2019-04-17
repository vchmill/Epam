SELECT C1.model model1, C2.model model2, C1.ram, C1.speed
FROM Laptop C1, Laptop C2
WHERE C1.ram = C2.ram AND C1.speed = C2.speed AND C1.model > C2.model
