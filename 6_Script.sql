--В какие города наиболее дешевые билеты?

select distinct a.city, t1.amount
from (
	select tf.flight_id, tf.amount, f.arrival_airport
	from ticket_flights tf 
	left join flights f on tf.flight_id = f.flight_id) as t1
left join airports a on t1.arrival_airport = a.airport_code 
order by t1.amount asc
limit 10;