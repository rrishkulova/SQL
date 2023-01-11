--Выведете список топ-10 городов по убыванию средней стоимости билета

select t2.city
from (
	select a.city, sum(t1.amount) / count(t1.amount) as mean_amount
	from (
		select tf.flight_id, tf.amount, f.arrival_airport
		from ticket_flights tf 
		left join flights f on tf.flight_id = f.flight_id) as t1
	left join airports a on t1.arrival_airport = a.airport_code 
	group by a.city
	order by mean_amount desc
	limit 10) as t2;