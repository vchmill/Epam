use V_Pereviazko_module_5
go 

-----------Task 1 Create queries using sub-queries------------
-----------[a]------------------------------------------------

select distinct productid 
from supplies
where supplierid = 3;

-----------[b]------------------------------------------------

select supplierid,name from suppliers
where supplierid in(
select productid from supplies 
where detailid=1 and quantity>
(select AVG(quantity) from supplies 
where detailid=1
group by detailid))

-----------[c]------------------------------------------------

select distinct detailid,name from details where detailid in(
select distinct detailid from supplies where productid in
(select productid from products where city='London'));

-----------[d]------------------------------------------------

select distinct suppliers.supplierid, name
from suppliers 
inner join supplies on suppliers.supplierid=supplies.supplierid
where detailid in (select detailid from details where color='Red');

-----------[e]------------------------------------------------

select distinct detailid from supplies
where productid in (select productid from supplies where supplierid=2)

 -----------[f]------------------------------------------------

(select productid from supplies
group by productid 
having AVG(quantity)> (select  MAX(quantity) from supplies where productid=1))

 -----------[g]------------------------------------------------

 select distinct productid
 from products
 where productid not in 
 (select distinct productid from supplies);
 
-----------Task 2 Create queries using CTE or Hierarchical queries------------
-----------[1]------------------------------------------------


-----------[2]------------------------------------------------

WITH factorial AS(
SELECT 0 AS Position, 1 AS Value, 1 AS Next
UNION ALL
SELECT Position + 1, Value * Next,  Next + 1
FROM factorial
WHERE Position < 10
)
SELECT Position, Value
FROM factorial
WHERE Position = 10

-----------[3]------------------------------------------------

WITH fibonacci AS
 ( SELECT 1 AS Value, 1 AS Next , 1 AS Position 
   UNION ALL
   SELECT Next, Next + Value, Position +1 
   FROM fibonacci 
   WHERE Position +1 < 21 )
 SELECT Position, Value FROM fibonacci
 
 -----------[4]------------------------------------------------
 
WITH Dates AS(
SELECT DATEFROMPARTS(2013,11,25) AS StartDate, EOMONTH('2013-11-25') AS EndDate, DATEADD(day, 1, EOMONTH('2013-11-25')) AS NewDate
UNION ALL
SELECT NewDate,  CASE
WHEN EndDate < DATEFROMPARTS(2014,02,28) THEN EOMONTH(NewDate)
WHEN EndDate = DATEFROMPARTS(2014,02,28) THEN DATEFROMPARTS(2014,03,05)
END AS EndDate 
, DATEADD(day, 1, EOMONTH(NewDate))
FROM Dates
WHERE EndDate < DATEFROMPARTS(2014,03,05)
)

SELECT StartDate, EndDate
FROM Dates

-----------[5]------------------------------------------------


-----------Task 3 Create queries from the table Geography------
-----------[1]------------------------------------------------

SELECT region_id AS regionID, id AS plase_ID, name, region_id AS PlaceLevel
FROM geography
WHERE region_id = 1;

-----------[2]------------------------------------------------

WITH region_ivano_frankivsk AS(
SELECT geography.id 
FROM geography
WHERE geography.name = 'Ivano-Frankivsk'), region_n AS(
SELECT geography.region_id AS regionID, geography.id AS plase_ID, geography.name, 0 AS PlaceLevel
FROM geography, region_ivano_frankivsk 
WHERE geography.region_id = region_ivano_frankivsk.id
UNION ALL
SELECT plase_ID , geography.id, geography.name,  PlaceLevel + 1
FROM region_n, geography 
WHERE geography.region_id = plase_ID )

SELECT * 
FROM region_n
ORDER BY plase_ID;

-----------[3]------------------------------------------------

WITH full_tree AS (
SELECT geography.id AS plase_ID, geography.name, geography.region_id AS regionID, 0 AS PlaceLevel
FROM geography 
WHERE geography.region_id IS NULL
UNION ALL
SELECT geography.id, geography.name, plase_ID,  PlaceLevel + 1
FROM full_tree, geography 
WHERE geography.region_id = plase_ID)

SELECT * 
FROM full_tree;

-----------[4]------------------------------------------------

WITH region_Lviv AS(
SELECT geography.name, geography.id AS plase_ID,  geography.region_id AS regionID, 1 AS level
FROM geography
WHERE geography.name = 'Lviv'
UNION ALL
SELECT geography.name, geography.id, plase_ID,  level + 1
FROM region_Lviv, geography 
WHERE geography.region_id = plase_ID)

SELECT * 
FROM region_Lviv;

-----------[5]------------------------------------------------

WITH region_Lviv AS(
SELECT geography.name, 1 AS level, CAST(CONCAT('/', geography.name) AS varchar(50))  AS path, geography.id AS plase_ID
FROM geography
WHERE geography.name = 'Lviv'
UNION ALL
SELECT geography.name,  level + 1, path = CAST(CONCAT(path, '/', geography.name) AS varchar(50)) ,  geography.id 
FROM region_Lviv, geography 
WHERE geography.region_id = plase_ID)

SELECT name, level, path
FROM region_Lviv;

-----------[6]------------------------------------------------

WITH region_Lviv AS(
SELECT geography.id, geography.name 
FROM geography
WHERE geography.name = 'Lviv'), region_n AS(
SELECT geography.name AS Region, region_Lviv.name AS center,  1 AS level, CAST(CONCAT('/', region_Lviv.name, '/', geography.name) AS varchar(50))  AS path, geography.id AS plase_ID
FROM geography, region_Lviv 
WHERE geography.region_id = region_Lviv.id
UNION ALL
SELECT geography.name, center,  level + 1, path = CAST(CONCAT(path, '/', geography.name) AS varchar(50)) ,  geography.id 
FROM region_n, geography 
WHERE geography.region_id = plase_ID )

SELECT Region, center, level, path  
FROM region_n;

-----------Task 4 Create queries using UNION, UNION ALL, EXCEPT, INTERSECT ------------

-----------[1]------------------------------------------------
select supplierid
from suppliers
where city= 'London'
UNION
select supplierid
from suppliers
where city= 'Paris';

-----------[2]------------------------------------------------

select city from suppliers
INTERSECT 
select city from details
order by city asc;

-----------[3]------------------------------------------------

select supplierid,name from suppliers
except
select supplierid,name from suppliers
where city='London';

-----------[4]------------------------------------------------

select productid from products
where city='London' or city='Paris'
except
select productid from products
where city='Paris' or city='Rome';

-----------[5]------------------------------------------------

select supplierid,detailid,productid
from supplies
where supplierid in(select supplierid from suppliers where city='London')
UNION
select supplierid,detailid,productid
from supplies
where detailid in(select detailid from details where color='Green')
EXCEPT
select supplierid,detailid,productid
from supplies
where productid in(select productid from products where city='Paris')


