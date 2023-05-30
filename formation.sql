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