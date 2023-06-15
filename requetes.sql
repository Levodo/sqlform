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


/*Compter le nombre de lignes en SQL: COUNT*/

select COUNT(*)
from facts
;

/*Compter les valeurs non null d'une colonne*/

select COUNT(area_water)
from facts
;

select count(birt_rate) from facts;

/*Trouver les valeurs minimales et maximales d'une colonne SQL (MIN & MAX qui ne prend des entiers)*/

select MAX(birth_rate)
from facts
;

/*Objectifs:

    1. Utiliser la fonction MIN sur la colonne population_growth.
    2. Utiliser la fonction MAX sur la colonne death_rate.
    
    Travail à réaliser sur DB Browser puis sur Jupyter Notebook
*/

    select MIN(population_growth)
    from facts;

    select MAX(death_rate)
    from facts;


/*Calculer des Sommes et des Moyennes en SQL*/

select sum(birth_rate)
from facts;

select avg(birth_rate)
from facts
;

/*Objectifs :
        1. Utiliser la fonction SUM pour trouver le total de la colonne area_land.
        2. Utiliser la fonction AVG pour trouver la moyenne de la colonne area_water.

        Travail à réaliser sur DB Browser puis sur jupyter Notebook
*/

select sum(area_land) from facts;

select avg(area_water) from facts;