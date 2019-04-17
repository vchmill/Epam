SELECT CONCAT('Код : ',code) AS code,
CONCAT('Модель : ',model) AS model,
CONCAT('Швидкість : ',speed) AS speed,
CONCAT('ОП : ',ram) AS ram,
CONCAT('Жорсткий диск : ',hd) AS hd,
CONCAT('Оптичний привід : ',cd) AS cd,
CONCAT('Ціна : ',price) AS price 
FROM PC;