select *
  from road_accident

select SUM (number_of_casualties) As Nc
 from road_accident
  where YEAR (accident_date)=2022 and road_surface_conditions = 'Dry'

select COUNT (distinct accident_index)
  from road_accident
   where YEAR (accident_date)= 2022

select count(accident_severity) As Ass
 from road_accident
 where accident_severity = 'Fatal' and YEAR(accident_date) = 2022

select SUM(number_of_casualties)
  from road_accident
  where accident_severity = 'Fatal' 


select SUM(number_of_casualties)
  from road_accident
  where accident_severity = 'Serious'


select SUM(number_of_casualties)
  from road_accident
  where accident_severity = 'Slight'

select SUM(number_of_casualties) *100/(select  SUM(number_of_casualties) from road_accident )
  from road_accident
  where accident_severity = 'Slight'
   


select
   case 
        when vehicle_type in ('Agricultural vehicle') then 'Agricultural'
		when vehicle_type in ('Car', 'Taxi/Private jire car') then 'Cars'
		when vehicle_type in ('Motorcycle 125cc and Under') then 'bike'
		when vehicle_type in ('Bus or coach (17 or more pass seats') then 'bus'
		when vehicle_type in ('Goods 7.5 tonnes and over') then 'truck'
		else 'other'
	END As vehicle_group,
	SUM(number_of_casualties) as CY
from road_accident
where YEAR(accident_date) = 2022
group by
         case 
        when vehicle_type in ('Agricultural vehicle') then 'Agricultural'
		when vehicle_type in ('Car', 'Taxi/Private jire car') then 'Cars'
		when vehicle_type in ('Motorcycle 125cc and Under') then 'bike'
		when vehicle_type in ('Bus or coach (17 or more pass seats') then 'bus'
		when vehicle_type in ('Goods 7.5 tonnes and over') then 'truck'
		else 'other'
	END 

select DATENAME(DW,accident_date) as day_name, SUM(number_of_casualties) as CY
 from road_accident
  where YEAR(accident_date) = 2022
  group by DATENAME(DW,accident_date)

select DATENAME(MONTH,accident_date) as month_name, SUM(number_of_casualties) as CY
 from road_accident
  where YEAR(accident_date) = 2022
  group by DATENAME(MONTH,accident_date)

select road_type, SUM(number_of_casualties)
 from road_accident
  where YEAR(accident_date)=2022
   group by road_type

select *
  from road_accident

select urban_or_rural_area , SUM(number_of_casualties) as CY
 from road_accident
 where YEAR(accident_date)=2022
 group by urban_or_rural_area

select urban_or_rural_area , SUM(number_of_casualties)  *100 /
 (select SUM(number_of_casualties) from road_accident where YEAR(accident_date)=2022)
 from road_accident
 where YEAR(accident_date)=2022
 group by urban_or_rural_area

