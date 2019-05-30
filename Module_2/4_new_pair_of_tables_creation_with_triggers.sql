USE V_Pereviazko_module_2
GO
---[Create pair of tables]-----------------------------------------------
CREATE TABLE [CUSTOMER] (
	[company_name] varchar (50) NOT NULL ,
	[market] varchar (50) NOT NULL ,
	[city] varchar (50) NOT NULL ,
	[street] varchar (50) NOT NULL ,
	[house] int NOT NULL ,
	[phone] varchar (50) NOT NULL ,
	[mail] varchar (50) NOT NULL ,
	[first_name] varchar (50) NOT NULL ,
	[last_name] varchar (50) NOT NULL ,
	[payments] decimal(8,2) NOT NULL ,
	[insterted_date] datetime NOT NULL ,
	[updated_date] datetime NOT NULL,
	[descriptions] text
	);

CREATE TABLE [CUSTOMER_OPERATIONS] (
	[company_name] varchar (50) NOT NULL ,
	[market] varchar (50) NOT NULL ,
	[city] varchar (50) NOT NULL ,
	[street] varchar (50) NOT NULL ,
	[house] int NOT NULL ,
	[phone] varchar (50) NOT NULL ,
	[mail] varchar (50) NOT NULL ,
	[first_name] varchar (50) NOT NULL ,
	[last_name] varchar (50) NOT NULL ,
	[payments] decimal(8,2) NOT NULL ,
	[insterted_date] datetime NOT NULL ,
	[updated_date] datetime NOT NULL,
	[descriptions] text,
	[type_of_operation] varchar (50),
	[date_of_operation] datetime
	);
	GO



---[Insert CUSTOMER]-----------------------------------------------
insert into [CUSTOMER] values('Vasara','Textile','Kiev','Zhilanska',8,'0996574841','aivanov@gmail.com','Ivanov','Alexey',6000,GETDATE(),GETDATE(),'This Company is perfect');
insert into [CUSTOMER] values('MadeByDad','Furniture','Vinnitsa','Raduzhna',19,'0976375484','1furni@gmail.com','Tata','Vasara',7000,GETDATE(),GETDATE(),'This Company is not so good');
insert into [CUSTOMER] values('Shved','Photo','Lviv','Zelena',90,'0956987144','lana.shved@gmail.com','Shved','Svitlana',7000,GETDATE(),GETDATE(),'This is almost not company');
insert into [CUSTOMER] values('GarageGym','Sport','Lviv','Sihivska',4,'0956111144','slyva.yrii@gmail.com','Yrii','Slyva',9000,GETDATE(),GETDATE(),'startup');
insert into [CUSTOMER] values('Plesko','Education','Lviv','Gorodocka',72,'0936971448','s.plesko@gmail.com','Plesko','Alexander',7000,GETDATE(),GETDATE(),null);

---[Insert CUSTOMER_OPERATIONS]-----------------------------------------------
insert into [CUSTOMER_OPERATIONS] values('Vasara','Textile','Kiev','Zhilanska',8,'0996574841','aivanov@gmail.com','Ivanov','Alexey',6000,GETDATE(),GETDATE(),'This Company is perfect',null,GETDATE());
insert into [CUSTOMER_OPERATIONS] values('MadeByDad','Furniture','Vinnitsa','Raduzhna',19,'0976375484','1furni@gmail.com','Tata','Vasara',7000,GETDATE(),GETDATE(),'This Company is not so good',null,GETDATE());
insert into [CUSTOMER_OPERATIONS] values('Shved','Photo','Lviv','Zelena',90,'0956987144','lana.shved@gmail.com','Shved','Svitlana',7000,GETDATE(),GETDATE(),'This is almost not company',null,GETDATE());
insert into [CUSTOMER_OPERATIONS] values('GarageGym','Sport','Lviv','Sihivska',4,'0956111144','slyva.yrii@gmail.com','Yrii','Slyva',9000,GETDATE(),GETDATE(),'startup',null,GETDATE());
insert into [CUSTOMER_OPERATIONS] values('Plesko','Education','Lviv','Gorodocka',72,'0936971448','s.plesko@gmail.com','Plesko','Alexander',7000,GETDATE(),GETDATE(),null,null,GETDATE());

---[Create 3 triggers]---------------------------
CREATE TRIGGER COMPANY_UPDATE
ON CUSTOMER
AFTER UPDATE
AS
INSERT INTO CUSTOMER.company_name
SELECT [company_name]
FROM INSERTED


CREATE TRIGGER OPERATION_INSERT
ON CUSTOMER
AFTER INSERT
AS
INSERT INTO CUSTOMER_OPERATIONS.type_of_operation
SELECT [company_name], 'INSERT' 
FROM INSERTED


CREATE TRIGGER OPERATION_DELETE
ON CUSTOMER
AFTER DELETE
AS
INSERT INTO CUSTOMER_OPERATIONS.type_of_operation
SELECT [company_name], 'DELETE'
FROM DELETED