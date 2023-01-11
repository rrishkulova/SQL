--Найдем ближайший рейс, вылетающий из Екатеринбурга в Москву

select distinct f.flight_id, f.flight_no, f.scheduled_departure, r.departure_city, r.arrival_city 
from flights f 
left join routes r on f.flight_no = r.flight_no 
where r.departure_city = 'Екатеринбург' and r.arrival_city = 'Москва'
order by f.scheduled_departure
limit 1;
