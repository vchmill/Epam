select p.maker, p.type from product p, laptop l
where p.model=l.model
order by maker