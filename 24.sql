select trip_no, plane, town_from, town_to from trip
where plane = 'TU-134'
order by time_out desc