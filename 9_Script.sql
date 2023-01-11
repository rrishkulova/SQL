--Назовите самое популярное место бронирования у пассажиров бизнес-класса

select t1.seat_no
from (
	select s.seat_no, count(s.seat_no) as count
	from seats s 
	where s.fare_conditions = 'Business'
	group by s.seat_no
	order by count desc) as t1
where count = (
	select count(s.seat_no) as count
	from seats s 
	where s.fare_conditions = 'Business'
	group by s.seat_no
	order by count desc
	limit 1);