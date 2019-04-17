select ship, battle, result from outcomes
where battle = 'Guadalcanal' and result != 'sunk'
order by ship desc
