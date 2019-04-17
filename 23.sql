select trip_no, town_from, town_to from trip
where town_from = 'london' or town_to = 'london'
order by time_out