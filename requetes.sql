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

/*Combiner plusieurs fonctions sur une unique requete */

select birth_rate, death_rate, population_growth
from facts;

select count(*), sum(death_rate), avg(population_growth)
from facts; 

/*Objectifs :
    Ecrire une requete qui calcule:
        
        - La moyenne de la colonne population
        - La somme de la colonne population
        - Le maximum de la colonne birth_rate

    Travail à réaliser sur DB Browser puis sur Jupyter Notebook
    
    Afficher les 3 resultats que vous assignerez à 3 variables différentes
*/

select avg(population), sum(population), max(birth_rate) from facts;


/*Associer les fonctions de calcul avec la condition where*/

select count(*)
from facts
where population > 5000000
;

/*Objectifs:

    Ecrire une requete SQL qui calcul la moyenne de la colonne population_growth pour les pays ayant une 
    population supérieure à 10000000 d'habitants.

    Travail à réaliser sur DB Browser puis sur Jupyter Notebook
*/

select avg(population_growth) from facts where population > 10000000;

/* Sélectionner des éléments ou données uniques: DISTINCT*/

select distinct name
from table;

select distinct name, population
from table;

select distinct birth_rate from facts;


/*Associer les fonctions de calcul avec distinct*/

select count(distinct birth_rate)
from facts;

select avg(distinct birth_rate)
from facts;

/*Objectifs : Associer les fonctions de calcul avec DISTINCT

    - Trouver la moyenne des valeurs distinctes de la colonne birth_rate pour lesquelles population est 
      plus grand que 20.000.000
    - Trouver la somme de toutes les valeurs distinctes de la colonne population pour lesquelles area_land 
      est plus grand que 1.000.000

    Travail à réaliser sur DB Browser puis sur Jupyter Notebook
*/

select avg(distinct birth_rate) from facts where population > 20000000;

select sum(distinct population) from facts where area_land > 1000000;

/*Opérations mathématiques en SQL*/

select population / 1000000
from facts;

/*Objectifs : 

    - Afficher  les valeurs de la colonne population_growth en millions (décimales). 
    
      Travail à réaliser sur DB Browser puis sur Jupyter Notebook
*/

select population_growth / 1000000.0 from facts;


/* Exécuter des opérations mathématiques entre colonne*/

select birth_rate / death_rate
from facts;

select (birth_rate + migration_rate) / death_rate
from facts;

/* Objectifs:

    - Ecrire une requete SQL qui calcule pour chaque pays le nombre d'habitants qu'il y'aura 
      pour l'année suivante.

      Travail à réaliser sur DB Browser puis sur Jupyter Notebook

      Indice: Multiplier les colonnes population et population_growth pour avoir l'augmentation
      sur un an et ajouter la colonne population au résultat.
*/

select name, population * (population_growth + 1) as next_year_population from facts;

/* Calculer des statistiques en regroupants des éléments par niveau*/

GROUP BY

select sum(Employed) 
from recent_grads
group by Major_category
;

/* Objectifs:

    Trouver le pourcentage moyen de femmes pour chaque catégorie de majors.
    Vous afficherez les colonnes Major_category et le pourcentage moyen de femmes.
    
    Uniquement requete SQL à visualiser sur DB Browser
*/

select Major_category, AVG(ShareWomen)
from recent_grads
group by Major_category;

/*Renommer les colonnes avec la commande as*/

/*Objectifs :

    Ecrire une requete qui affiche le total d'hommes et le total de femmes et modifie le nom des colonnes:
    - pour les hommes: total_men
    - pour les femmes: total_women
    
    Uniquement requete SQL à visualiser sur DB Browser.
*/

select sum(Men) as total_men, sum(Women) as total_women
from recent_grads;

/*Objectifs :
    
    Trouver pour chaque catégorie de major, le pourcentage de diplomé ayant un emploi.
    Vous pourrez modifier le nom des colonnes si besoin.
    
    Indice: le pourcentage de diplomés ayant un emploi se calcule en divisant la moyenne des diplomés ayant un emploi
    sur la moyenne totale des diplomés.
*/

select Major_category, avg(Employed) / avg(Total)* 100 as share_employed
from recent_grads
group by Major_category;

/*Colonnes virtuelles et HAVING( HAVING nous permet de filtrer sur des colonnes virtuelles)

reprenons le code ci-dessus et affichons par major_category les employés dans la colonne share_employed > 0.8*/

select Major_category, avg(Employed) / avg(Total) as share_employed
from recent_grads
group by Major_category
having share_employed > 0.8;

/*Mission:

    Trouver toutes les categories de major pour lesquelles la proportion de diplomés avec de faibles revenues
    est supérieure à 0.1.
*/
