# Utiliser Python avec SQLite

import sqlite3

connexion = sqlite3.connect("factbook.db")

c = connexion.cursor()
c.execute('select * from facts order by population asc limit 10;')

# print(c.fetchall())

# . Modifier le code dans query.py afin que celui-ci sélectionne les 10 pays les moins peuplés de la 
# table facts, et afficher le résultat.
# 
# Exécuter query.py à partir de la commande python query.py.




# Les pays ayants reçu le plus d'imigrants
c.execute('select name, migration_rate from facts where migration_rate != "" order by migration_rate desc;')
print(c.fetchmany(10))


