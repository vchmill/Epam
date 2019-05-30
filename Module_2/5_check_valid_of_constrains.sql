USE V_Pereviazko_module_2
GO

insert into AGENCY_ORDERS values(11,'one','SMM','Ivanov',GETDATE(),GETDATE(),'12.06.2019',12000,6000,40);

insert into AGENCY_ORDERS values(11,1212,'SMM','Ivanov',GETDATE(),GETDATE(),'12.06.2019',12000,6000,40);

insert into AGENCY_ORDERS values(12,1212,'Web','Ivanov',GETDATE(),GETDATE(),'12.06.2019',-5,7000,25);

insert into COMPANY_ID values(12,'Vasara','Textile','Kiev','0996574841','aivanov@gmail.com','179612','Ivanov Alexey',null,GETDATE(),GETDATE());

insert into COMPANY_ID values(12,'Vasara','Textile','Kiev','0996574841','aivanov@gmail.com','179612','Ivanov Alexey',null,GETDATE(),GETDATE());

insert into [CUSTOMER] values('Vasara','Textile',null,'Zhilanska',8,'0996574841','aivanov@gmail.com','Ivanov','Alexey',6000,GETDATE(),GETDATE(),'This Company is perfect');

insert into [CUSTOMER] values('Vasara','Textile','Kyiv','Zhilanska','Five','0996574841','aivanov@gmail.com','Ivanov','Alexey',6000,GETDATE(),GETDATE(),'This Company is perfect');

insert into [CUSTOMER_OPERATIONS] values('MadeByDad',null,'Vinnitsa','Raduzhna',19,'0976375484','1furni@gmail.com','Tata','Vasara',7000,GETDATE(),GETDATE(),'This Company is not so good',null,GETDATE());

insert into [CUSTOMER_OPERATIONS] values('MadeByDad','Furniture','Vinnitsa','Raduzhna',19,'0976375484','1furni@gmail.com','Tata','Vasara',7000,GETDATE(),GETDATE(),8,null,GETDATE());