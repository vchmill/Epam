USE V_Pereviazko_module_2
GO
---[Create pair of tables]-----------------------------------------------
CREATE TABLE AGENCY_ORDERS (
	[order] int NOT NULL ,
	[company] int NOT NULL ,
	[service] varchar (50) NOT NULL ,
	[responsible] varchar (50) NOT NULL ,
	[insterted_date] datetime NOT NULL ,
	[updated_date] datetime NOT NULL ,
	[deadline] datetime NOT NULL ,
	[price] decimal(8,2) NOT NULL ,
	[prepayment] decimal(8,2) NOT NULL ,
	[progress] int NOT NULL 
	);

CREATE TABLE COMPANY_ID (
	[order_id] int NOT NULL ,
	[company_name] varchar (50) NOT NULL ,
	[market] varchar (50) NOT NULL ,
	[adress] varchar (50) NOT NULL ,
	[phone] varchar (50) NOT NULL ,
	[mail] varchar (50) NOT NULL ,
	[account] varchar (50) NOT NULL ,
	[contact_name] varchar (50) NOT NULL ,
	[payments] decimal(8,2) NOT NULL ,
	[insterted_date] datetime NOT NULL ,
	[updated_date] datetime NOT NULL,
	[descriptions] text
	);
	GO

---[Create PK, CK and FK, UQ for the child table]--------------------------
ALTER TABLE AGENCY_ORDERS ADD 
	CONSTRAINT PK_order PRIMARY KEY ([order]),
	CONSTRAINT CK_price CHECK (price >0);

ALTER TABLE COMPANY_ID ADD 
	CONSTRAINT FK_order_id FOREIGN KEY ([order_id]) 
	REFERENCES AGENCY_ORDERS ([order]),
	CONSTRAINT UQ_account UNIQUE(account);
	GO

---[Insert AGENCY_ORDERS]-----------------------------------------------
insert into AGENCY_ORDERS values(11,1111,'SMM','Ivanov',GETDATE(),GETDATE(),'12.06.2019',12000,6000,40);
insert into AGENCY_ORDERS values(12,1212,'SMM','Chmill',GETDATE(),GETDATE(),'11.06.2019',15000,7000,35);
insert into AGENCY_ORDERS values(14,1414,'Web','Ivanov',GETDATE(),GETDATE(),'10.07.2019',17000,7000,25);
insert into AGENCY_ORDERS values(15,1515,'Foreign','Ivanov',GETDATE(),GETDATE(),'03.07.2019',22000,9000,65);
insert into AGENCY_ORDERS values(19,1919,'Online-ed','Ivanov',GETDATE(),GETDATE(),'01.08.2019',19000,8000,10);

---[Insert COMPANY_ID]-----------------------------------------------
insert into COMPANY_ID values(11,'Vasara','Textile','Kiev','0996574841','aivanov@gmail.com','0534','Ivanov Alexey',6000,GETDATE(),GETDATE(),'This Company is perfect');
insert into COMPANY_ID values(12,'MadeByDad','Furniture','Vinnitsa','0976375484','1furni@gmail.com','179612','Tata Vasara',7000,GETDATE(),GETDATE(),'This Company is not so good');
insert into COMPANY_ID values(14,'Shved','Photo','Lviv','0956987144','lana.shved@gmail.com','44152612','Shved Svitlana',7000,GETDATE(),GETDATE(),'This is almost not company');
insert into COMPANY_ID values(15,'GarageGym','Sport','Lviv','0956111144','slyva.yrii@gmail.com','2124574','Yrii Slyva',9000,GETDATE(),GETDATE(),'startup');
insert into COMPANY_ID values(19,'Plesko','Education','Lviv','0936971448','s.plesko@gmail.com','6978','Plesko Alexander',7000,GETDATE(),GETDATE(),null);

---[Create trigger for update, which modify updated_day]---------------------------
CREATE TRIGGER UPDATE_DATE
ON AGENCY_ORDERS
AFTER UPDATE 
AS 
BEGIN
	SET NOCOUNT ON;
	UPDATE AGENCY_ORDERS SET updated_date = GETDATE() where [order] IN (select DISTINCT [order] from inserted);
END;

---[Create view for each table and view with check_option]---------------------------
CREATE VIEW LVIV_ORDERS AS
   SELECT *
      FROM COMPANY_ID
      WHERE adress = 'Lviv';

CREATE VIEW CHEAP_ORDERS AS
   SELECT *
      FROM AGENCY_ORDERS
      WHERE price < 15000;

CREATE VIEW Ivanov_ORDERS AS
   SELECT *
      FROM AGENCY_ORDERS
	  where responsible = 'Ivanov'
      WITH CHECK OPTION;