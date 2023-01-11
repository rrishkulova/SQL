--Найдите самые популярные направления перелетов из Москвы

select t1.arrival_city, count(t1.arrival_city) as count
from (
	select f.flight_id, r.arrival_city 
	from flights f 
	left join routes r on f.flight_no = r.flight_no 
	where r.departure_city = 'Москва') as t1
group by t1.arrival_city
order by count desc
limit 10;