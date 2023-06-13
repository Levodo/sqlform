# Calculer une estimation de la population en 2050

import pandas as pd  # on utilise pd lorsqu'on applique une fonction de la librairie pandas
import sqlite3
import math

connexion = sqlite3.connect("factbook.db")

a = pd.read_sql_query("select * from facts;", con=connexion)

#print(a)

# dropna() qui supprime les lignes contenues dans les colonnes ayant des valeurs vides

# N = N0*e**(rt)
# N0 = population initiale
# e = constante
# r = taux de croissance annuelle
# t = nombre d'année entre l'estimation et l'initiale

# 5000 habitants, taux de croissance t de 4% 2015 --> 2050, donc t = 35
# N = 5000 * e ** (0.04 * 35)


#def pop_growth(x):
 #   return x["population"] * math.e ** ((x["population_growth"] / 100) * 35)

# la méthode apply() de pandas permet d'appliquer une fonction sur chaque ligne ou colonne d'un dataframe

#a["pop_2050"] = a.apply(lambda row: pop_growth(row), axis=1)

#a = a.dropna(axis=0) #supprime les lignes contenues dans les colonnes ayant des valeurs vides
#a = a[(a["area_land"] > 0) & (a["population"] > 0)]


#b = a.sort_values(["pop_2050"], ascending=[False]) #sort_values trie les valeur selon l'ordre indiqué
#b = b["name"].iloc[0:9] #iloc est utilisé ici pour sélectionner les 10 première ligne de la colonne name

#print(b)

# Quels pays auront moins d'habitant en 2050?

    # On calcul la population après 35 ans à l'aide de la formule de croissance exponentielle.
        # soit la fonction "pop_growth2" prenant en paramètre un dictionnaire
        
def pop_growth2(x):
    return x['population'] * math.e ** ((x['population_growth'] / 100) * 35)

# la méthode apply() de pandas permet d'appliquer une fonction sur chaque ligne ou colonne d'un dataframe
a["pop_2050"] = a.apply(lambda row: pop_growth2(row), axis = 1)

# On supprime toutes les lignes contenant des valeurs vides dans les colonnes grace à dropna()

a = a.dropna(axis=0)
# On lui propose de traiter que des valeurs positives 
a[(a["area_land"] > 0) & (a["population"] > 0)] 

# trions maintenant les valeurs suivant l'ordre voulu
c = a.sort_values(["pop_2050"], ascending=[True])
# On sélectionne les 10 premiers pays avec la fonction iloc
c = c["name"].iloc[0:10]

print(c)
