---- De la page 192 à 217 ------
---------Manipuler les dates----------
/*
.########.....###....########..########..########.##......
.##.....##...##.##...##.....##.##.....##.##.......##......
.##.....##..##...##..##.....##.##.....##.##.......##......
.########..##.....##.########..########..######...##......
.##...##...#########.##........##........##.......##......
.##....##..##.....##.##........##........##.......##......
.##.....##.##.....##.##........##........########.########
*/
/*
Bref rappel sur les différents types de
données temporelles, qui sont au nombre de cinq : DATE, TIME, DATETIME, TIMESTAMP et YEAR
*/

    /*
    .########.....###....########.########....
    .##.....##...##.##......##....##..........
    .##.....##..##...##.....##....##..........
    .##.....##.##.....##....##....######......
    .##.....##.#########....##....##..........
    .##.....##.##.....##....##....##..........
    .########..##.....##....##....########....
    */

    /*
    On peut manipuler une date (jour, mois, année) avec le type DATE.
    Ce type représente la date sous forme de chaîne de caractère 'AAAA-MM-JJ' (A = année, M = mois, J = jour)
    Exemple 21 octobre 2011 -> '2011-10-21'

    Lorsque l'on crée une donnée de type DATE, on peut le faire avec une multitude de formats différents que MySQL convertira automatiquement. 
    Il suffit de donner l'année (en deux ou quatre chiffres), suivie du mois (deux chiffres), puis du jour (deux chiffres). 
    Avec une chaîne de caractères, n'importe quel caractère de ponctuation (ou aucun caractère) peut être utilisé pour séparer l'année du mois et le mois du jour. 
    On peut aussi utiliser un nombre entier pour initialiser une date (pour autant qu'il ait du sens en tant que date, bien sûr).

    MySQL supporte des DATE  allant de '1001-01-01'  à '9999-12-31'.
    */

    /*
    .##.....##.########.##.....##.########..########....
    .##.....##.##.......##.....##.##.....##.##..........
    .##.....##.##.......##.....##.##.....##.##..........
    .#########.######...##.....##.########..######......
    .##.....##.##.......##.....##.##...##...##..........
    .##.....##.##.......##.....##.##....##..##..........
    .##.....##.########..#######..##.....##.########....
    */
    /*
    Pour une heure ou une durée, on utilise le type TIME, 
    qui utilise également une chaîne de caractères pour représenter l'heure :
    '[H]HH:MM:SS' (H = heures, M = minustes, S = secondes).

    MySQL supporte des TIME qui peuvent aller de '-838:59:59' à '838:59:59'.
    Ce n'est pas limiter uniquement à 24 heures puisque l'on peut éaglement stocker des durées

    Pour créer un TIME, on donne d'abord les heures, puis les minutes, puis les secondes,
    avec un ':' entre chaque donnée. On peut aussi spécifier un nombre de jours avant les 
    heures (suivi cette fois d'un espace et non d'un ':') 'J HH:MM:SS'
    */
    /*
    .########.....###....########.########....########.########....##.....##.########.##.....##.########..########
    .##.....##...##.##......##....##..........##..........##.......##.....##.##.......##.....##.##.....##.##......
    .##.....##..##...##.....##....##..........##..........##.......##.....##.##.......##.....##.##.....##.##......
    .##.....##.##.....##....##....######......######......##.......#########.######...##.....##.########..######..
    .##.....##.#########....##....##..........##..........##.......##.....##.##.......##.....##.##...##...##......
    .##.....##.##.....##....##....##..........##..........##.......##.....##.##.......##.....##.##....##..##......
    .########..##.....##....##....########....########....##.......##.....##.########..#######..##.....##.########
    */ 
    /*
    DATETIME  est le type de données représentant une date et une heure, toujours stockées sous forme de chaîne de caractères : 'AAAA-MM-JJ HH:MM:SS'.
    Les heures doivent ici être comprises entre 00 et 23, puisqu'il ne peut plus s'agir d'une durée.
    Comme pour  l'important dans DATETIME  est l'ordre des données : année, mois, jour, heures, minutes, secondes. 
    Chacune comporte deux chiffres, sauf l'année pour laquelle on peut aussi donner quatre chiffres. 
    Cela peut être un nombre entier ou une chaîne de caractères, auquel cas les signes de ponctuation entre chaque partie du DATETIME importent peu.

    MySQL supporte des DATETIME qui peuvent aller de '1001-01-01 00:00:00'
    à '9999-12-31 23:59:59'
    */
    /*
    .########.####.##.....##.########..######..########....###....##.....##.########.
    ....##.....##..###...###.##.......##....##....##......##.##...###...###.##.....##
    ....##.....##..####.####.##.......##..........##.....##...##..####.####.##.....##
    ....##.....##..##.###.##.######....######.....##....##.....##.##.###.##.########.
    ....##.....##..##.....##.##.............##....##....#########.##.....##.##.......
    ....##.....##..##.....##.##.......##....##....##....##.....##.##.....##.##.......
    ....##....####.##.....##.########..######.....##....##.....##.##.....##.##.......
    */
    /*
    Le timestamp d'une date est le nombre de secondes écoulées depuis le 1er janvier 1970,
    0h 0min 0s (TUC), et la date en question (aujourd'hui par exemple)
    Mais attention, ce qui est stocké par MySQL dans une donnée de type TIMESTAMP  n'est pas ce nombre de secondes, 
    mais bien la date, sous format numérique : AAAAMMJJHHMMSS  
    (contrairement à DATE, TIME  et DATETIME  qui utilisent des chaînes de caractères).

    Un timestamp est limité aux dates allant du 1er janvier 1970 0 h 0 min 0s au 19 janvier 2038 3 h 14 min 7 s.
    */
    /*
    ....###....##....##.##....##.########.########
    ...##.##...###...##.###...##.##.......##......
    ..##...##..####..##.####..##.##.......##......
    .##.....##.##.##.##.##.##.##.######...######..
    .#########.##..####.##..####.##.......##......
    .##.....##.##...###.##...###.##.......##......
    .##.....##.##....##.##....##.########.########
    */
    /*
    Le dernier type temporel est YEAR, qui stocke une année sous forme d'entier.
    YEAR peut contenir des années comprises entre 1901 et 2155.
    */
/*
*/
-- DATE ACTUELLE
SELECT CURDATE(), CURRENT_DATE(), CURRENT_DATE;

--HEURE ACTUELLE
SELECT CURTIME(), CURRENT_TIME(), CURRENT_TIME;

--DATE ET HEURE ACTUELLE : 5 fonctions différentes
    SELECT NOW(), SYSDATE();
    SELECT LOCALTIME, CURRENT_TIMESTAMP(), LOCALTIMESTAMP;

/*
Il est tout à fait possible d'utiliser une des fonctions 
donnant l'heure et la date pour remplir une colonne de type DATE  ou de type TIME. 
MySQL convertira simplement le DATETIME  en DATE  ou en TIME, en supprimant la partie inutile.
*/

/*
Timestamp Unix
Il existe encore une fonction qui peut donner des informations sur la date et l'heure actuelles 
sous forme de timestamp Unix, 
qui est donc le nombre de secondes écoulées depuis le premier janvier 1970, à 00:00:00. 
Il s'agit de UNIX_TIMESTAMP()
*/
SELECT UNIX_TIMESTAMP();

/*
En résumé :
- La date du jour peut s'obtenir avec CURDATE()  et CURRENT_DATE().
- L'heure actuelle peut s'obtenir avec CURTIME()  et CURRENT_TIME().
- L'heure et la date actuelles peuvent s'obtenir avec NOW(), SYSDATE(), LOCALTIME(), CURRENT_TIMESTAMP(), LOCALTIMESTAMP().
- On peut insérer un DATETIME  dans une colonne DATE  ou TIME. MySQL ôtera la partie inutile.