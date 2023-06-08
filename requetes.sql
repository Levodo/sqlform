/*Sommer les lignes d'une colonne pour calculer la surface totale*/

select sum(population)
from facts;

select sum(population) 
from facts
where area_land != "";

select sum(area_land), sum(area_water) 
from facts
where area_land != "";