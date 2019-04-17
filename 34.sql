select * from Trip
where (datename(hour, time_out) between 12 and 17)
