USE master;
GO
---CREATE DATABASE WITH DEFAULT FILEGROUPS AND PATHS------------
CREATE DATABASE V_Pereviazko_module_6
GO

USE V_Pereviazko_module_6
GO

---[Create tables]-----------------------------------------------
CREATE TABLE Suppliers (
supplierid int not null PRIMARY KEY,
name varchar(20),
rating int,
city varchar(20)
);

CREATE TABLE Details (
detailid int not null  PRIMARY KEY,
name varchar(20),
color varchar(20),
weight int,
city varchar(20)
);

CREATE TABLE Products (
productid int not null  PRIMARY KEY,
name varchar(20),
city varchar(20)
);

CREATE TABLE Supplies (
supplierid int not null FOREIGN KEY REFERENCES Suppliers(supplierid),
detailid int not null FOREIGN KEY REFERENCES Details(detailid),
productid int not null FOREIGN KEY REFERENCES Products(productid),
quantity int
);
GO

---[Insert into tables]-----------------------------------------------
INSERT INTO Suppliers VALUES ('1', 'Smith','20','London');
INSERT INTO Suppliers VALUES ('2', 'Jonth','10','Paris');
INSERT INTO Suppliers VALUES ('3', 'Blacke','30','Paris');
INSERT INTO Suppliers VALUES ('4', 'Clarck','20','London');
INSERT INTO Suppliers VALUES ('5', 'Adams','30','Athens');

INSERT INTO Details VALUES ('1', 'Screw','Red','12','London');
INSERT INTO Details VALUES ('2', 'Bolt','Green','17','Paris');
INSERT INTO Details VALUES ('3', 'Male-screw','Blue','17','Roma');
INSERT INTO Details VALUES ('4', 'Male-screw','Red','14','London');
INSERT INTO Details VALUES ('5', 'Whell','Blue','12','Paris');
INSERT INTO Details VALUES ('6', 'Bloom','Red','19','London');

INSERT INTO Products VALUES('1','HDD','Paris');
INSERT INTO Products VALUES('2','Perforator','Roma');
INSERT INTO Products VALUES('3','Reader','Athens');
INSERT INTO Products VALUES('4','Printer','Athens');
INSERT INTO Products VALUES('5','FDD','London');
INSERT INTO Products VALUES('6','Terminal','Oslo');
INSERT INTO Products VALUES('7','Ribbon','London');

INSERT INTO Supplies VALUES 
('1', '1','1','200'),
('1', '1','4','700'),
('2', '3','1','400'),
('2', '3','2','200'),
('2', '3','3','200'),
('2', '3','4','500'),
('2', '3','5','600'),
('2', '3','6','400'),
('2', '3','7','800'),
('2', '5','2','100'),
('3', '3','1','200'),
('3', '4','2','500'),
('4', '6','3','300'),
('4', '6','7','300'),
('5', '2','2','200'),
('5', '2','4','100'),
('5', '5','5','500'),
('5', '5','7','100'),
('5', '6','2','200'),
('5', '1','4','100'),
('5', '3','4','200'),
('5', '4','4','800'),
('5', '5','4','400'),
('5', '6','4','500');
GO


USE V_Pereviazko_module_6

-------[Task1]-----------------------

SELECT productid, name, city,
ROW_NUMBER() Over(ORDER BY city ) AS RowNum
FROM products

-------[Task2]-----------------------

SELECT productid,name, city,
ROW_NUMBER() Over(PARTITION BY city ORDER BY name ) AS RowNum
FROM products

-------[Task3]-----------------------

SELECT * FROM (SELECT productid,name, city,
ROW_NUMBER() Over(PARTITION BY city ORDER BY name ) AS RowNum
FROM products) AS RowNum
WHERE RowNum = 1

-------[Task4]-----------------------

SELECT productid, detailid, quantity,
SUM(quantity) Over(PARTITION BY productid ) AS all_quantity_per_prod,
SUM(quantity) Over(PARTITION BY detailid ) AS all_quantity_per_det
FROM supplies

-------[Task5]-----------------------

SELECT * FROM (SELECT *,
ROW_NUMBER () over(ORDER BY supplierid) AS RowNum,
Count(*) over() AS tot
FROM supplies) AS Z	
WHERE RowNum between 10 and 15

-------[Task6]-----------------------

SELECT * FROM (SELECT supplierid, detailid, productid, quantity,
AVG(quantity) over() AS avg_quantity  
FROM supplies) AS C
WHERE quantity < avg_quantity			

