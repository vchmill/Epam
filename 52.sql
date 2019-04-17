SELECT trip_no,plane, (
	CASE
		WHEN time_out > time_in THEN '12:00:00'-time_out+time_in+'12:00:00'
	ELSE time_in - time_out
	END) flytime

FROM trip;



