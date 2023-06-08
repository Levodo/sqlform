# Calculer une estimation de la population en 2050

import pandas as pd  # on utilise pd lorsqu'on applique une fonction de la librairie pandas
import sqlite3
import math

connexion = sqlite3.connect("factbook.db")

a = pd.read_sql_query("select * from facts;", con=connexion)

print(a)

# dropna() qui supprime les lignes contenues dans les colonnes ayant des valeurs vides

# N = N0*e**(rt)
# N0 = population initiale
# e = constante
# r = taux de croissance annuelle
# t = nombre d'année entre l'estimation et l'initiale

# 5000 habitants, taux de croissance t de 4% 2015 --> 2050, donc t = 35
# N = 5000 * e ** (0.04 * 35)


def pop_growth(x):
    return x["population"] * math.e ** ((x["population_growth"] / 100) * 35)


a["pop_2050"] = a.apply(lambda row: pop_growth(row), axis=1)

a = a.dropna(axis=0)
a = a[(a["area_land"] > 0) & (a["population"] > 0)]


b = a.sort_values(["pop_2050"], ascending=[False])
b = b["name"].iloc[0:9]

print(b)
