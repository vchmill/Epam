select * from Trip
where (datename(hour, time_in) between 17 and 23)
