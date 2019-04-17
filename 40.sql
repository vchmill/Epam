SELECT SUBSTRING(name, PATINDEX('% %', name)+1, LEN(name)-PATINDEX('% %', name)) FROM Passenger
WHERE LEFT(SUBSTRING(name, PATINDEX('% %', name)+1, LEN(name)-PATINDEX('% %', name)), 1) NOT LIKE 'J%'
