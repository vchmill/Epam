select ship, battle, result from outcomes
where result = 'sunk'
order by ship desc
