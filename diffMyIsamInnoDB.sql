/*
.88b  d88. db    db d888888b .d8888.  .d8b.  .88b  d88.
88'YbdP`88 `8b  d8'   `88'   88'  YP d8' `8b 88'YbdP`88
88  88  88  `8bd8'     88    `8bo.   88ooo88 88  88  88
88  88  88    88       88      `Y8b. 88~~~88 88  88  88
88  88  88    88      .88.   db   8D 88   88 88  88  88
YP  YP  YP    YP    Y888888P `8888Y' YP   YP YP  YP  YP


*/

/*
Avantages : 

- tres rapides pour les requetes de types SELECT ou INSERT
- supporte les index fulltext : permet d'effectuer des recherches sur des mots en se basant sur un index spécifique, accélérant ainsi les recherches
- gère les conflits d'accés : permet de verrouiller une table 
- c'est très facile à administrer
*/

/*
Inconvénients : 

- ne supporte pas les transactions
- ne supporte pas les clès étrangères

*/

/*
d888888b d8b   db d8b   db  .d88b.  d8888b. d8888b.
  `88'   888o  88 888o  88 .8P  Y8. 88  `8D 88  `8D
   88    88V8o 88 88V8o 88 88    88 88   88 88oooY'
   88    88 V8o88 88 V8o88 88    88 88   88 88~~~b.
  .88.   88  V888 88  V888 `8b  d8' 88  .8D 88   8D
Y888888P VP   V8P VP   V8P  `Y88P'  Y8888D' Y8888P'


*/

/*
Avantages:

- il supporte acid
- il gère les transactions (instructions sql BEGIN, COMMIT, ROLLBACK ...)
- il supporte les clés étrangères et les intégrités référentielles
- il possède un système de récupération automatique en cas de crash

*/

/*
Inconvénients : 
- il ne permet pas les index fulltext
- son administration est un peu plus complexe (gestion de tablespace, paramètres supplémentaires dans le my.cnf ...)
- le moteur de stockage est plus lent que d'autres et gourmand en ressources mémoires et en espace disque
*/