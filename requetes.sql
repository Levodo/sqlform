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

Indices :

    - Pour calculer la proportion de diplomés ayant de faibles revenus, c'est avg(Low_wage_job) / avg(Total)
     que l'on peut renommer avec as en Low_wage_jobs.
    - Vous devez utiliser group by sur la colonne Major_category.
    - Utiliser la commande having pour restreindre les valeurs de la colonne crée à l'indice 1
*/

SELECT Major_category, AVG(Low_wage_jobs) / AVG(Total) AS share_low_wage
FROM recent_grads
GROUP BY Major_category
HAVING share_low_wage > 0.1
;

/*Arrondir les résultats avec la fonction ROUND*/

select Major_category, ROUND(ShareWomen, 2) as rounded_share_women
from recent_grads;


SELECT Major_category, ROUND(AVG(Low_wage_jobs) / AVG(Total), 3) AS share_low_wage
FROM recent_grads
GROUP BY Major_category
HAVING share_low_wage > 0.1
;

/*Mission :

    Afficher le pourcentage des diplomés travaillant à temps plein (colonne Full_time).
    Pour chaque catégorie de major, vous afficherez uniquement les résultats inférieur 
    à 60%.
*/

select Major_category, ROUND(avg(Full_time) / avg(Total), 3) as share_degree_jobs
from recent_grads
group by Major_category
having share_degree_jobs < 0.6
;

/*SESSION 2 : CALCUL DE MOYENNES
    Calcul des moyennes des colonnes population, population_growth, birth_rate, et death_rate*/

select avg(population), avg(population_growth), avg(birth_rate), avg(death_rate) from facts;

/*Calculer les valeurs minimales et maximales des colonnes population, population_growth, birth_rate et death_rate*/

select MIN(population), MIN(population_growth), MIN(birth_rate), MIN(death_rate) from facts;

select MAX(population), MAX(population_growth), MAX(birth_rate), MAX(death_rate) from facts;


/* Projet guidé 2
        
        Créations de la table cérémonies */

insert into ceremonies (Years, Host)
values (?, ?);

insert into ceremonies(Years, Host)
values (2010, "Steve Martin"),
        (2009, "Hugh Jackman"),
        (2008, "Jon Stewart"),
        (2007, "Billen DeGeneres"),
        (2006, " Jon Stewart"),
        (2005, "Chris Rock"),
        (2004, "Billy Chrystal"),
        (2003, "Steve Martin"),
        (2002, "Whoopi Goldberg"),
        (2001, "Steve Martin"),
        (2000, "Billy Chrystal");

/* Contrainte de clé externe*/
/* Pour empecher de lier des données avec des clés externes et elle permet aussi a sqlite de bien s'assurer que la clé externe est bien reférencer dans une autre table*/
/*En outre, pour éviter de lier des données avec des clés inexistantes.*/
/*Après cette requete, si elle n'est pas reférencé dans une autre table, elle retourne un message d'érreur.*/
PREGMA foreign_keys = ON;


/* Relation one-to-many avec la table nominations*/

select nominations.Category, nominations.Nominee, nominations.Movie, nominations.Character, nominations.Won, ceremonies.id from nominations inner join ceremonies on nominations.Year == ceremonies.Year;



select *
from nominations
limit 10;

select *
from nominations_two
order by ceremony_id desc
limit 10;


select *
from nominations
order by Year asc
limit 10;

/* Supprimer et renommer des tables*/

drop table nominations;

alter table nom_table_à_renommer
rename to nouveau_nom_table;


alter table nominations_two rename to nominations;

/* Créer une join table qui va lier la table movies et actors*/

create table movies_actors (
    id interger primary key,
    movie_id integer references movies(id),
    actor_id integer references actors(id)
);

/*Exécuter des requetes SQL sur psql*/

create database db_nom; /*Si on oublie le ; sur psql ça nous ramène à la ligne*/

/*Commandes spéciales postgreSQL

    *\l: liste des commandes données, à savoir: nom bd, encodage etc..begin
    *\du: liste les roles de la bd sur laquelle nous nous trouvons.
    *\dt: liste les tables présente dans une bd
    *\q: permet de fermer la bd et de la quiter.
    *\dp: liste les droits d'accès des utilisateurs 
    end;
*/

/* Changer de base de données.
    pour se connecter à une autre bd différente de celle par défaut, il suffit d'entrer le
    nom de la bd avec laquelle on souhaite se connecter.

    connectons nous, à notre bd bank_account, ensuite, créons une table deposits et des 
    colonnes(id,name et amount)
*/

/* Créer des utilisateurs. la commande est la suivante:*/

CREATE ROLE userName; /*Dans ce cas, l'utilisateur ne peut se connecter,ni effectuer des 
actions, pour y remédier, il va falloir créer un nouvel utilisateur et ajouter le login. L'on
peut aussi ajouter un mot de passe et d'autres compétences.*/

CREATE ROLE sql WITH CREATEDB CREATEROLE SUPERUSER LOGIN PASSWORD 'password';

/* Ajouter des permissions*/

GRANT SELECT, INSERT, UPDATE ON nom_table TO nom_utilisateur;

/* Il existe une commande permettant de donner tout les droits à un utilisateur.*/

GRANT ALL PRIVILEGES ON nom_table TO nom_utilisateur;

/*Retirer des permissions*/

REVOKE SELECT, UPDATE, INSERT, DELETE ON nom_table FROM nom_utilisateur;

/*On peut aussi supprimer tout les droits à l'aide d'une seule requete:*/

REVOKE ALL PRIVILEGES ON nom_table FROM nom_utilisateur;

/*Superusers*/

CREATE ROLE nom_utilisateur WITH SUPERUSER;

/*Supprimer un utilisateur, une table ou une base de données*/

DROP ROLE nom_utilisateur;


/*Utilisation de Postgresql avec Python*/

import psycopg2

connexion = psycopg2.connect(dbname="postgres", user="postgres")
cursor = connexion.cursor()
cursor.execute("create table notes(id integer primary key, body text, title text);")
connexion.close()

/* Créer une table*/

CREATE TABLE nom_table(
    cil1 datatype integer primary key,
    col2 datatype2,
    col3 datatype3,
    ...
);

/*Transactions en SQL*/

CREATE TABLE accounts(
    id integer PRIMARY KEY,
    name text,
    balance float
);
/*Supposons que nous avons Léo qui a 100 euros,Léa qui en a 200. Léa donne 100 euros a Léo.
Modélisons ceci avec des requetes sql.*/

UPDATE accounts SET balance=200 WHERE name="Léo";

UPDATE accounts SET balance=100 WHERE name="Léa";
/*A savoir, lors de l'exécution de ces 2 requetes, la première aurait fonctionné et pas la 2eme,
car, il est impossible sur Postgresql de faire 2 transactions à la fois. Dans ce cas, léo
aurait 200 euros, léa aussi aurait conserver ses 200 euros et la banque aurait perdu 100 euros, 
ce qui n'est pas du tout envisageable.
Afin de résoudre ce problème, nous devons appliquer le phénomène de transactions similaires 
avec la méthode commit()*/


/*Créer des bases de données*/

CREATE DATABASE db_nom;
    /*On peut rajouter un propriétaire de la base de données.*/
    CREATE DATABASE db_name OWNER nom_proprio;

/*Supprimer des bases de données.*/

DROP DATABASE nom_db; /*SSI l'utilisateur en a la permission.*/


/* Exploration avec DISTINCT, COUNT, GROUP BY*/

    /*Missions:
        
        -Nous voulons connaitre les différentes notes unique(colonne rating) des Etats-Unis
        (PG, PG-13, R, etc...) présente dans la table film.
        
        - Nous souhaitons aussi connaitre les différents taux de location (colonne rental_rate)
        présent dans la table film.
        
        - Compter le nombre des différents rating et rental_rate.*/

/*Solutions :*/

select distinct rating
from film;

select distinct rental_rate
from film;

select rating, count(rating)
from film
group by rating
order by rating desc;


select rental_rate, count(rental_rate)
from film
group by rental_rate
order by rental_rate desc;


/*Commande EXTRACT*/

Extract(MONTH FROM colonne), Extract(YEAR from colonne)

    /*Tout d'abord, nous allons grouper le nombre de location par mois.*/

    select rental_date, count(rental_id) as Total_rentals
    from rental 
    group by rental_date
    order by Total_rentals desc;

    /*Nous utiliserons donc la commande extract pour calculer le nombre de loc par année et mois.*/

    select extract(YEAR from rental_date), extract(MONTH from rental_date), count(rental_id) as Total_rentals
    from rental
    group by 1,2;

    /* On peut aussi déterminer la moyenne de location par location unique grace à la requete svte:*/

    select extract(YEAR from rental_date), extract(MONTH from rental_date), count(rental_id) as Total_rentals,
count(distinct customer_id) as unique_rental, 1.0 * count(rental_id) / count(distinct customer_id) as average
	from rental
	group by 1,2;


/** Exploration avec WHERE **/

         /* Mission :*/
    /*- Je viens d'ajouter à la liste de films présents dans le magasin un nouveau film qui
    pourrait plaire à 'Gloria Cook', Pouvez-vous me donner son email afin que je lui envoie 
    un message?
    
    - On m'a parlé d'un film qui se nomme 'Texas Watch' et j'aimerai savoir si ça peut me
    plaire. Pouvez-vous me fournir une description de ce film?
    
    -Un client est en retard pour rendre son film loué la semaine dernière, nous avons noté
    son adresse qui est '270 Toulon Boulevard'. Pouvez-vous trouver son numéro de téléphone
    qu'on le prévienne?*/

    select email
    from customer
    where first_name ='Gloria' and last_name ='Cook';

    select description
    from film
    where title = 'Texas Watch';

    select phone 
    from address
    where address = '270 Toulon Boulevard';


/* Commande IN : Elle peut servir à rechercher une valeur dans une liste de valeur ou dans une
sous requete.*/

where colonne in (valeur1, valeur2, ...)
where colonne1 in (select colonne2 from table)

select customer_id, rental_id, return_date 
from rental
where customer_id in (1,2)
order by return_date desc;

/* Commande LIKE: Elle permet généralement de donner des données dont on ne connait pas 
généralement la syntaxe. */

select colonne1, colonne2, ...
from nom_table
where colonne1 like 'Jen%';

    /* Missions :
    
        - Compter le nombre d'acteurs dont le nom de famille commence par P.
        
        - Compter le nombre de films qui contiennent Truman dans leur titre.
        
        - Quel est le client qui a le plus grand Customer ID et dont le prénom commence par 'E'
        et a un Adress ID inférieur à 500? */

    select count(actor_id) as nombre_actors
    from actor 
    where last_name like 'P%';


    select count(title) as nombre_films
    from film
    where title like '%Truman%';

    select first_name, last_name
    from customer
    where first_name like 'E%' and address_id < 500
    order by customer_id desc
    limit 1;

/*Challenge GROUP BY 
      Mission 1:
    - Nous avons 2 équipes différentes qu'on appelle staff_id 1 et staff_id 2. Nous 
    souhaitons donner un bonus à l'équipe qui a obtenu le plus de paiements.
    
    - Combien de paiements a réalisé chaque équipe et pour quel montant?
*/

select staff_id, count(amount), sum(amount)
from payment
group by staff_id;


    /*Mission 2: 
        -Un cabinet d'audit est en train d'auditer notre magasin et souhaiterait connaitre
         le cout moyen de remplacement(colonne replacement_cost)
          des films par lettre de notation (colonne reting. ex: R, PG, etc...)*/

          select rating, ROUND(avg(replacement_cost),2) as cout_moyen
          from film
          group by rating;

    /* Mission 3:
        -Nous voulons distribuer des coupons à nos 5 clients qui ont dépensé le plus
         d'argent dans notre magasin.
         -Obtenez les IDs de ces 5 personnes.*/

           select customer_id, sum(amount) as Total_argent
           from payment
           group by customer_id
           order by Total_argent desc
           limit 5;
         

/* Challenge HAVING : Having a pour role de filtrer les données sauf qu'à la différence de 
WHERE, elle s'applique à des colonnes virtuelles, un peu comme avg ci-dessous, qui a été
créé pendant l'exécution de la requete et s'utilise après le Group by.*/

       select rating, avg(rental_rate)
       from film
       where rating in('R', 'G', 'PG')
       group by rating 
       having avg(rental_rate) > 3;
        

        /*Mission 1:*
        
            - Nous souhaitons distribuer une carte de paiement avantageuse pour nos meilleurs
            clients. Sont éligibles à cette carte les clients qui totalisent au moins 30
            transactions de paiement (table payment).
            
            - Quels clients sont donc éligibles? (vous fournirez leurs IDs)   */

            select customer_id, count(amount)
            from payment
            group by customer_id
            having count(amount) > 30;

        /*Mission 2:
        
            - Obtenir les notations (R, PG, etc...) dont la durée de location moyenne est 
            supérieure à 5 jours.*/

            select rating, avg(rental_duration)
            from film
            group by rating
            having avg(rental_duration) > 5;

        /*Mission 3:
        
            - Obtenir les IDs des clients qui ont payés plus de 110$ à l'équipe staff 2 (table
            payment).*/

            select customer_id, sum(amount)
            from payment
            where staff_id = 2
            group by customer_id
            having sum(amount) > 110;
