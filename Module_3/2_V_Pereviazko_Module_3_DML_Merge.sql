USE V_Pereviazko_module_3
GO

---[DML commands for the following tasks]---------------------------------
---[1]---------------------------------
SELECT rating FROM Suppliers WHERE supplierid = 4

UPDATE Suppliers 
SET rating = rating +10 
WHERE rating < (SELECT rating FROM Suppliers WHERE supplierid = 4);

SELECT * FROM Suppliers

---[2]---------------------------------

SELECT productid 
INTO Products_list
FROM Products
WHERE city = 'London' OR productid IN
(SELECT DISTINCT productid FROM Supplies
WHERE supplierid IN
(SELECT supplierid FROM Suppliers
WHERE city = 'London'));

SELECT * FROM Products_list

---[3]---------------------------------
DELETE FROM Products WHERE productid NOT IN 
(SELECT productid FROM Supplies);

SELECT * FROM Products

---[4]---------------------------------

SELECT DISTINCT s1.supplierid, s1.detailid as Detail1, s2.detailid Detail2 
INTO supliers_with_two_details
FROM Supplies s1
INNER JOIN Supplies s2 ON s1.supplierid=s2.supplierid AND /*s1.detailid!=s2.detailid and*/ s1.detailid<s2.detailid
WHERE s1.supplierid IN (SELECT supplierid FROM supplies GROUP BY supplierid HAVING COUNT (DISTINCT detailid)=2 )

/*SELECT distinct s1.supplierid, min(s1.detailid), max(s1.detailid) 
INTO supliers_with_two_details
FROM Supplies s1
group by supplierid 
having count (distinct detailid)=2
*/
SELECT * FROM supliers_with_two_details

---[5]---------------------------------

UPDATE Supplies SET quantity = quantity * 1.1
WHERE supplierid IN
(SELECT DISTINCT supplierid 
 FROM Supplies s, Details d
WHERE s.detailid = d.detailid AND color = 'red');

SELECT * FROM Supplies

---[6]---------------------------------

SELECT DISTINCT color, city 
INTO Details_color_city
FROM Details
;

SELECT * FROM Details_color_city

---[7]---------------------------------
CREATE TABLE Details_list 
(detailid int);
INSERT INTO Details_list (detailid)
SELECT DISTINCT detailid FROM Supplies
WHERE supplierid IN
(SELECT supplierid FROM Suppliers
WHERE city = 'London') OR
productid IN
(SELECT productid FROM Products
WHERE city = 'London');

SELECT * FROM Details_list

---[8]---------------------------------
INSERT INTO Suppliers (supplierid, name, city) 
VALUES('10', 'White', 'New-York');

SELECT * FROM Suppliers

---[9]---------------------------------
DELETE FROM Supplies WHERE 'Roma'=
(SELECT city FROM Products 
WHERE Products.productid=Supplies.productid);
DELETE FROM Products WHERE city = 'Roma';

SELECT * FROM Products

---[10]---------------------------------

SELECT city 
INTO Cities 
FROM Suppliers
UNION
SELECT city FROM Details 
UNION
SELECT city FROM Products
ORDER BY 1;

SELECT * FROM Cities

---[11]---------------------------------
UPDATE Details 
SET color = 'Yellow' WHERE color = 'Red' and weight < 15;

SELECT * FROM Details

---[12]---------------------------------

SELECT DISTINCT productid, city 
INTO Products_city
FROM Products
WHERE city LIKE '_o%' 

SELECT * FROM Products_city

---[13]---------------------------------

UPDATE Suppliers 
SET rating = rating + 10
WHERE Supplierid IN 
(SELECT DISTINCT  Supplierid 
FROM Supplies s2 
GROUP BY Supplierid
HAVING sum(quantity) > (SELECT avg(a.sum_suppl ) 
	FROM (SELECT sum(quantity) sum_suppl 
	FROM Supplies 
	GROUP BY Supplierid ) AS a )
		);
		
/* 
update Suppliers 
set rating = rating + 10
where Supplierid in 
(select distinct  Supplierid 
from Supplies s2 
group by Supplierid
having sum(quantity) > (select avg(quantity) from Supplies )  
)
*/
SELECT * FROM Suppliers

---[14]---------------------------------
SELECT DISTINCT supplierid,name 
INTO Suppliers_Detail1
FROM Suppliers
WHERE supplierid IN 
(SELECT supplierid 
FROM Supplies
WHERE productid = 1)
ORDER BY supplierid

SELECT * FROM Suppliers_Detail1

---[15]---------------------------------
INSERT INTO Suppliers 
VALUES
('11', 'Smith','20','London'),
('12', 'Smith','20','London')

select * from Suppliers

---[Merge]---------------------------------
CREATE TABLE tmp_Details (
detailid int not null,
name varchar(20),
color varchar(20),
weight int,
city varchar(20)
);

INSERT INTO tmp_Details (detailid, name, color, weight, city) VALUES (1, 'Screw',         'Blue',     13, 'Osaka');
INSERT INTO tmp_Details (detailid, name, color, weight, city) VALUES (2, 'Bolt',           'Pink', 12, 'Tokio');
INSERT INTO tmp_Details (detailid, name, color, weight, city) VALUES (18, 'Whell-24', 'Red',   14, 'Lviv');
INSERT INTO tmp_Details (detailid, name, color, weight, city) VALUES (19, 'Whell-28', 'Pink',     15, 'London');

GO
---[2]---------------------------------
MERGE Details AS TARGET	
USING tmp_Details AS SOURCE 
ON (TARGET.detailid = SOURCE.detailid) 
WHEN MATCHED  
THEN UPDATE SET TARGET.detailid = SOURCE.detailid, TARGET.name =SOURCE.name , TARGET.color = SOURCE.color, TARGET.weight = SOURCE.weight, TARGET.city = SOURCE.city
WHEN NOT MATCHED BY TARGET 
THEN INSERT (detailid, name, color, weight, city) VALUES (SOURCE.detailid, SOURCE.name, SOURCE.color, SOURCE.weight , SOURCE.city) ;

select * from Details;

