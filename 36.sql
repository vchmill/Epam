select * from Trip
where (datename(hour, time_in) between 21 and 23) 
or (datename(hour, time_in) between 00 and 10)
