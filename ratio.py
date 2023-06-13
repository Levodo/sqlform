# Objectifs : Calculer le ratio de la surface terrestre totale sur la surface des océans totale
# appartenants aux pays de la table facts.

import sqlite3
import pandas as pd
import math

connexion = sqlite3.connect('factbook.db')

a = pd.read_sql_query('select sum(area_land), sum(area_water) from facts where area_land != "";', con = connexion)


print(a['sum(area_land)']/ a['sum(area_water)'])
# après le calcul de ce ratio, nous pouvons donc conclure qu'il ya 28 plus de terre que de mer