select colA, colB, colC...
from my_table;

select Rank, Major
from recent_grads;

/* Ecrire une requete qui retourne les 5 colonnes de la table recent_grads dans lordre suivant: Rank, Major_code, Major,
  Major_category et Total */ 

select Rank, Major_code, Major, Major_category, Total
from recent_grads;

/*Les Majors qui ont plus de femmes diplomées que d'hommes*/

 SELECT Major, ShareWomen
 FROM recent_grads
 WHERE ShareWomen > 0.5
 ; 

 /* Ecrire une requete SQL qui retourne tous les Majors avec plus de 10000 diplomés ayant un emploi.
    Vous afficherez les colonnes Major et Employed dans cet ordre. (Rappel: La colonne des diplomés
    ayant un emploi est Employed)
 */

 SELECT Major, Employed
 FROM recent_grads
 WHERE Employed > 10000
 ;
 /* Limiter le nombre de résultat (LIMIT)*/

 SELECT Major 
 FROM recent_grads
 LIMIT 5
 ;

/* Ecrire une requete SQL qui retourne la colonne Major, dans laquelle les diplomés ayant un emploi
    est supérieur à 10000, vous allez afficher seulement les 10 premiers résultats */

SELECT Major 
FROM recent_grads
WHERE Employed > 10000
LIMIT 10
;
/*Conditions multiple avec AND et OR*/
AND

SELECT col1, col2, ...
FROM table1
WHERE condition1 AND condition2;

/*Regroupons les deux premières requetes avec la condition AND*/

SELECT Major, ShareWomen, Employed 
FROM recent_grads
WHERE ShareWomen > 0.5 AND Employed > 10000
LIMIT 10;

/*OR: il s'utilise  si l'une des deux conditions est vrai*/

SELECT col1, col2, ...
FROM table2
WHERE condition1 OR condition2;

/*Ecrire une requete SQL qui retourne les 20 premières majors qui ont un salaire
  median supérieur ou égal à 10000 ou un nombre de personnes sans emploi inférieur
  ou égal à 1000 (Afficher dans l'ordre les colonnes Major, Median, Unemployed)
  
  Rappel: le salaire médian se trouve dans la colonne Median et le nombre de 
  diplomés sans emploi est dans la colonne Unemployed */

SELECT Major, Median, Unemployed 
FROM recent_grads
WHERE Median >= 10000 OR Unemployed <= 1000
LIMIT 20;

/*Grouper les opérateurs avec les parenthèses*/

Major_category = 'Engineering' /*condition 1*/
ShareWomen >= 0.5 /*condition 2*/
Unemployed_rate < 0.051 /*condition 3*/

/*(condition 1) AND (condition 2 OR condition 3)*/

select Major, Major_category, ShareWomen, Unemployment_rate 
from recent_grads
where (Major_category = 'Engineering') AND (ShareWomen >= 0.5 or Unemployment_rate < 0.051);

/* Trouver toutes les Majors qui ont les critères suivants:
  - La catégorie de Major(Major_category) sera Business, Arts ou Health
  - Les diplomés ayant un emploi(Employed) seront supérieurs à 20000 OU le taux de personne
    sans emploi(Unemployment_rate) sera inférieur à 5.1%
  
  Nous nous intéresserons aux colonnes suivantes (dans l'ordre):
    Major, Major_category, Employed, Unemployment_rate
    sans aucune limite de résultat.
*/
select Major, Major_category, Employed, Unemployment_rate 
from recent_grads
where (Major_category ='Business' or Major_category ='Arts' or Major_category ='Health') 
and (Employed > 20000 or Unemployment_rate < 0.051)
;

/*Trier les résultats avec ORDER BY*/

ORDER BY (ASC ou DESC)

select Employed 
from recent_grads
order by Employed ASC
limit 10;

/*Retourner les 10 valeurs de la colonne Major dans l'ordre inverse alphabétique*/

select Major
from recent_grads
order by Major DESC
limit 10;

/*Ordre des résultats sur plusieurs colonnes*/
select col1, col2
from tab 
order by col1 asc, col2 asc;

/*Ecrire une requete qui classe les catégories de majors(Major_category) dans l'ordre croissant
  Puis par salaire médian (colonne median) dans l'ordre décroissant.
  Afficher les colonnes suivantes (dans l'ordre):
  Major_category, Median et Major
  Limiter les résulats aux 20 premiers */

  select Major_category, Median, Major 
  from recent_grads
  order by Major_category asc, Median desc 
  limit 20;

/*Ecrire une requete qui récupère les 20 premières lignes de la table avec seulement les 
  colonnes suivantes (dans l'ordre):
  -College_jobs
  -Median
  -Unemployment_rate*/

  select College_jobs, Median, Unemployment_rate
  from recent_grads
  limit 20;

  /*
  Utilisation de la boucle where pour filtrer les données
  Ecrire une requete qui retourne les 5 premières lignes des majors Arts.
    Afficher seulement la colonne Major.*/

  select Major, Major_category
  from recent_grads
  where Major_category = 'Arts'
  limit 5;

/* Ajouter des critères avec des Opérateurs logiques

    Retourner toutes les majors differentes de Engineering:
      - Avec un salaire Median inférieur ou égal à 50000
      - Ou avec un taux de personnes sans emploi supérieur à 6.5%
      
      Retourner les colonnes suivantes (dans l'ordre):
      Major, Total, Median, Unemployment_rate
      Sans limite de résultats
*/

  select Major, Total, Median, Unemployment_rate
  from recent_grads
  where (Major_category != 'Engineering') and (Median <= 50000 or Unemployment_rate > 0.065)
  ;

/*
    Trier les résultats
  Retourner les 20 premières majors dont la cotégories est différentes de Engineering
  Trier les résultats dans l'ordre anti alphabétique
*/

select Major
from recent_grads
where Major_category != 'Engineering'
order by Major desc
limit 20;

select *
from recent_grads;

/*Une requete qui retourne toutes les valeurs de la colonne Major */

select Major, Major_category
from recent_grads;

/*
Ecrire et exécuter une requete qui retourne tout les majors dans l'ordre alphabétique inverse
dans la base jobs2.db
*/
select Major
from recent_grads
order by Major desc;

/* . Ecrire une requete SQL qui retourne les minimums et maximums des valeurs des colonnes suivantes (pour lesquelles
      la colonne population est inférieure à 2 milliards et supérieure à 0): population, population_growth,  birth_rate, death_rate                         birth_rate, et death_rate.
   .  Assigner les résultats aux variables correspondantes suivantes: pop_min, pop_max, pop_growth_min, pop_growth_max,
      birth_rate_min, birth_rate_max, death_rate_min, death_rate_max.
*/
select min(population), max(population), min(population_growth), max(population_growth), min(birth_rate), max(birth_rate), min(death_rate), max(death_rate) from facts where population > 0 and population < 2000000000;


/* . Retourner les valeurs de la population estimée l'année suivante en prenant en compte les remarques suivantes:

  . Arrondir les valeurs à l'entier près(valeurs non décimales)
  . Filtrer les lignes contenant des valeurs NULL comme valeur pour les colonnes population ou                                     population_growth(population is not null)
  . Restreindre la requete aux pays ayant une population inférieur à 7 milliards et supérieur à 0
. Assigner les résultats à la variable projected_population. . Afficher les 10 premières valeurs du résultat.
*/

select ROUND(population + population *(population_growth/ 100),0) from facts where population > 0 and population < 7000000000 and population is not null and population_growth is not null;

/*  Dernière mission du challenge:
        . Ecrire une requete SQL qui retourne:
        
            . La valeur min de l'estimation de la population et l'assigner à la variable pop_proj_min.
            . La valeur max de l'estimation de la population et l'assigner à la variable pop_proj_max.
            . La valeur moyenne de l'estimation de la population et l'assigner à la variable pop_proj_avg.
            
        . Afficher les resultats.
*/

select min(ROUND(population + population *(population_growth/ 100),0)), max(ROUND(population + population *(population_growth/ 100),0)), avg(ROUND(population + population *(population_growth/ 100),0)) from facts where population > 0 and population < 7000000000 and population is not null and population_growth is not null;

/* MODIFIER LES DONNES DANS UNE TABLE

      INSERT - ajoute des données dans une table
      UPDATE - modifie des valeurs
      DELETE - supprime des données existantes
*/

/* Les dates en SQL*/

select *
from facts
where created_at < "2015-12-01 14:00" and created_at > "2015-10-30 12:00" ;

/* 
    --Les types de données--

    # INTEGER
    # REAL et FLOAT
    # TEXT et VARCHAR(255)
    # DATETIME
 */

PRAGMA table_info(facts);

/* Primary Keys (Clés primaires)*/

/* Training :

      Ecrire une requete SQL qui affiche toute la ligne possédant l'id le plus grand.
*/

select * 
from facts
order by id desc
limit 1;

/* Insérer des données dans une table*/

insert into nom_table
values(valeur1, valeur2, ...);

insert into facts
values(262, "nv", "November", 60000, 40000, 20000, 500000, 100, 50, 10, 20,
"2023-10-19 12:00:00", "2023-11-08 17:00:00");

/* Valeurs manquantes*/

NULL

select * 
from nom_table
where nom_colonne is null;

select *
from facts
where area is null;

/* Modifier des valeurs dans une table */

   update 
  
update nom_table 
set col1 = valeur1, col2 = valeur2
where col1 = valeur3;

  #renommer le nom du pays Australia par New Zealand

  update facts
  set name = "New Zealand", code = "nz"
  where name = "Australia";

    /* Training: 
        
        Ecrire une requete qui modifie le nom United States par Italy.
    */

update facts
set name = "Italy"
where name = "United States";


/* Supprimer des lignes */

       delete from nom_table
       where col = valeur1;

      delete from facts
      where name = "Brazil";

      /* Training:
          Ecrire une requete SQL qui Supprime toutes les lignes caractérisant le Canada.
      */

      delete 
      from facts
      where name = "Canada"; 

/* SCHEMA D'UNE TABLE 
    
    # Plan ou schéma d'une table
    # Relation entre tables
    # Commande INNER JOIN
*/

/* Ajout des colonnes */
      ALTER TABLE

        #syntaxe
        alter table nom_table
        add colonne dataType;

        ALTER TABLE facts
        add awesomeness integer;

/* Training: 

      Ecrire une requete SQL qui ajoute une colonne qu'on nommera leader à la 
      table facts, avec comme type de données text.
      
 */

    alter table facts
    add leader VARCHAR(255);

    alter table facts
    drop column leader;

/* Supprimer les colonnes */

   Alter table nom_table
   drop column nom_colonne;


/* Créer une table :

   Nous allons créer une table qui contient les chefs d'états de chaque pays
*/
    syntaxte:

    create table nom_db.nom_table(
      colonne1 dataType1 primary key,
      colonne2 dataType2,
      colonne3 dataType3,
      ...
    );

    create table leaders(
      id integer primary key,
      name text,
      country text
    );

/* Relations entre tables */

    insert into leaders
    values(1, "Barack Obama", "United States");


    select country
    from leaders
    where name = "Barack Obama";

    select *
    from facts
    where name = "United States";

  create table leaders2(
    id integer primary key,
    name text,
    country text,
    worth float,
    foreign key(country) references facts(id)
  );

/* Training: 

    Ecrire une requete SQL qui crée une table states dans la base de données
    factbook3.
    
    La table states contiendra les colonnes suivantes:
    .   id: integer qui sera la clé primaire
    .   name: text
    .   area: integer
    .   country: integer qui sera la clé externe de la colonne id de la 
    table facts
*/

     create table states(
        id integer primary key,
        name text,
        area integer,
        country integer,
        foreign key(country) references facts(id)
     );

/* La commande INNER JOIN: permet d'utiliser les relations entre tables */

    INNER JOIN

    select col1, col2, ...
    from nom_table1
    inner join nom_table2
    on nom_table1.col3 == nom_table2.col4;


    select *
    from states
    inner join facts 
    on states.country = facts.id;

/* Training: 

      Ecrire une requete SQL qui affiche toutes les colonnes de la table landmarks et
      facts (présent dans la base de données factbook.db)
*/

    select *
    from landmarks
    inner join facts
    on landmarks.country == facts.id;

/* Types de combinaison entre 2 tables */

INNER JOIN affiche la partie qui match après le on

LEFT OUTER JOIN: qui affiche toutes les colonnes de gauches, si une ligne de la table coté gauche ne présentent
aucun match avec le coté droit, alors on affichera la valeur null



    select *
    from facts
    left outer join landmarks
    on landmarks.country == facts.id;

/* NORMALISATION DE LA BASE DE DONNEES ET RELATIONS 

      *Relation one-to-many et many-to-many
      *Join Table
*/

/* Normalisation des bases de données */

    select year, host, category, nominee, movie, character, won 
    from ceremonies
    inner join nominations
    on ceremonies.id == nominations.ceremony_id;


/* Type de relation entre tables */

/* - Relation one-to-many: cette relation existe lorsque plusiseurs lignes d'une table sont liée à une seule ligne d'une autre table.
   - Relation many-to-many
*/


/* Requete sur une Base de données normalisées 

  "On souhaite retourner tout les films qui ont gagné une récompense en 2010" 
  
*/

select movie
from nominations
inner join ceremonies
on nominations.ceremony_id == ceremonies.id
where ceremonies.year == 2010 and nominations.won == 1;

/* On va afficher l'année, le nom du maitre de cérémonie, le film et les 
   les nominées pour ce film toujours pour l'année 2010.*/



select ceremonies.year, ceremonies.host, nominations.movie, nominations.nominee
from nominations
inner join ceremonies
on nominations.ceremony_id == ceremonies.id
where ceremonies.year == 2010;

/* Tr:

    Ecrire une requete SQL qui retourne tout les films pour lesquels l'actrice
    Natalie Portman fut nominée pour un oscar (vous indiqurez aussi l'année
    de la nomination)
    
    Tester la requete SQL sur DB Browser puis afficher les resultats sur 
    Jupyter Notebook*/

select movies.movie, ceremonies.year from nominations inner join ceremonies on nominations.ceremony_id == ceremonies.id where nominations.nominee == "Natalie Portman";

/* Relation many to many*/

# Créer une join table ou une table intermédiaire  

create table movies_actors(
  id integer primary key,
  movie_id integer references movies(id),
  actor_id integer references actors(id)
);

 # Requete SQL pour une relation many to many

select actors.actor
from movies
inner join movies_actors on movies.id == movies_actors.movie_id
inner join actors on movies_actors.movie_id == actors.id
where movies.movie == "Invictus" 
;
#On relie trois table: la table movies et la table movies_actors par le critère apres le premier on, ensuite la table movies_actors et la table actors par le second on.

/* Tr: pratique sur la relation many to many

  Ecrire une requete qui retourne tous les films dans lesquels "Natalie Portman" a joué. 
  Tester la requete SQL sur DB Browser puis afficher les résultats sur Jupyter Notebook */


select movies.movie, actors.actor
from movies
inner join movies_actors on movies.id == movies_actors.movie_id
inner join actors on movies_actors.actor_id == actors.id
where actors.actor == 'Natalie Portman';

/* PROJET GUIDE
  PREPARER LES DONNEES POUR SQLITE
  
  Objectif: cloner la table nominations de la base de données
   academy_awards.db( nettoyer un datasert en csv et l'ajouter à une BD
   SQLITE)*/
  
  1- présentation du dataset 
  2- Filtrage des données 