select * from printer
where type <> 'matrix' and price<=300
order by type desc