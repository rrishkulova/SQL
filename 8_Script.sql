--Основные направления перелетов по месяцам

select t2.*
from (
	select t1.month, t1.direction, count(t1.direction)
	from (
		select f.flight_id, f.flight_no, extract(month from f.scheduled_departure) as month, (r.departure_city || ' - ' || r.arrival_city) as direction 
		from flights f 
		left join routes r on f.flight_no = r.flight_no) as t1
	group by t1.month, t1.direction
	order by t1.month, t1.count desc) as t2
left join (
	select t1.month, t1.direction, count(t1.direction)
	from (
		select f.flight_id, f.flight_no, extract(month from f.scheduled_departure) as month, (r.departure_city || ' - ' || r.arrival_city) as direction 
		from flights f 
		left join routes r on f.flight_no = r.flight_no) as t1
	group by t1.month, t1.direction
	order by t1.month, t1.count desc) t22 on t2.month=t22.month and t22.count>t2.count
where t22.direction is null;