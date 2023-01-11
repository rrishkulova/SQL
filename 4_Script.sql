--В какие города летали пассажиры с самой высокой стоимостью бронирования?

select distinct r.arrival_city 
from routes r  
where r.arrival_airport in (
	select distinct f.arrival_airport 
	from flights f
	where f.flight_id in (
		select distinct tf.flight_id 
		from ticket_flights tf
		where tf.ticket_no in (
			select t.ticket_no
			from tickets t
			where t.book_ref in (
				select b.book_ref
				from bookings b
				order by total_amount desc 
				limit 1
				)
			)
		)
	);