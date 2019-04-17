SELECT ('Код : '+str(code,2)) AS code,
('Модель : '+str(model,4)) AS model,
('Швидкість : '+str(speed,3)) AS speed,
('ОЗП : '+str(ram,3)) AS ram,
('Жорсткий диск : '+str(hd,2)) AS hd,
('Оптичний привід : '+cd) AS cd,
('Ціна : '+str(price,3)) AS price FROM
PC;