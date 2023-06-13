/*Sommer les lignes d'une colonne pour calculer la surface totale*/

select sum(population)
from facts;

select sum(population) 
from facts
where area_land != "";

select sum(area_land), sum(area_water) 
from facts
where area_land != "";

/*On peut aussi plus investiguer la base de donnée en se posant des questions telles que:
    - Quels pays ont reçu le plus d'imigrants?
    - Quels pays ont perdu le plus d'imigrants?
    - Quels pays auront moins d'habitant en 2050?
    - Quels pays ont la plus grosse  et la plus faible densité d'habitation?
*/

/*Les pays ayants reçu le plus d'imigrants*/
select name, migration_rate
from facts
where migration_rate != ""
order by migration_rate desc
;

/*Quels pays ont perdu le plus d'imigrants?*/
select name, migration_rate
from facts
where migration_rate != ""
order by migration_rate asc
;

/*Quels pays ont la plus grande  et la plus faible densité d'habitation?*/

    /*La plus grande densité*/
select name, population / area_land as densité
from facts
order by densité desc
limit 1; 

    /*La plus petite densité*/
select name, population / area_land as  densité
from facts
order by densité asc
limit 1;