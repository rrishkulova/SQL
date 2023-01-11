--Куда, в какие дни недели и за какое время можно долететь из Волгограда

SELECT r.arrival_city as city,
--       r.arrival_airport as code,
--       r.arrival_airport_name as airport_name,
       r.days_of_week,
       r.duration
FROM   routes r
WHERE  r.departure_city = 'Волгоград';