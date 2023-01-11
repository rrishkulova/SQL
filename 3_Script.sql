--Найдите 10 бронирований с самой высокой стоимостью

select * 
from bookings 
order by total_amount desc 
limit 10;
