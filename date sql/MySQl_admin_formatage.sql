---- Extraire une info précise ----
/*
Informations sur la date
Extraire la partie DATE
La fonction DATE(datetime)  permet d'extraire la partie DATE  d'une donnée de type DATETIME  (ou DATE, mais c'est moins utile…).
*/

SELECT nom, date_naissance,
        DATE(date_naissance) AS uniquementDate
FROM animal
WHERE espece_id = 4;

/*
Le jour
Les fonctions suivantes donnent des informations sur le jour :

    DAY(date)  ou DAYOFMONTH(date)  : donne le jour du mois (sous forme de nombre entier de 1 à 31).
    DAYOFWEEK(date)  : donne l'index du jour de la semaine (nombre de 1 à 7 avec 1 = dimanche, 2 = lundi… 7 = samedi).
    WEEKDAY(date)  : donne aussi l'index du jour de la semaine, de manière un peu différente (nombre de 0 à 6 avec 0 = lundi, 1 = mardi… 6 = dimanche).
    DAYNAME(date)  : donne le nom du jour de la semaine.
    DAYOFYEAR(date)  : retourne le numéro du jour par rapport à l'année (de 1 à 366 donc).
*/

SELECT nom, DATE(date_naissance) AS date_naiss, 
        DAY(date_naissance) AS jour, 
        DAYOFMONTH(date_naissance) AS jour, 
        DAYOFWEEK(date_naissance) AS jour_sem,
        WEEKDAY(date_naissance) AS jour_sem2,
        DAYNAME(date_naissance) AS nom_jour, 
        DAYOFYEAR(date_naissance) AS jour_annee
FROM Animal
WHERE espece_id = 4;

/*
La semaine
À partir d'une date, il est possible de calculer la semaine à laquelle elle correspond. S'agit-il de la première semaine de l'année ? De la quinzième ? Ceci peut être obtenu grâce à trois fonctions : WEEK(date), WEEKOFYEAR(date)  et YEARWEEK(date).

WEEK(date)  : donne uniquement le numéro de la semaine (un nombre entre 0 et 53, puisque 7 x 52 = 364, donc en un an, il y a 52 semaines et 1 ou 2 jours d'une 53e semaine).
WEEKOFYEAR(date)  : donne uniquement le numéro de la semaine (un nombre entre 1 et 53).
YEARWEEK(date)  : donne également l'année.

WEEK()  et YEARWEEK()  peuvent également accepter un deuxième argument, qui sert à spécifier si la semaine doit commencer le lundi ou le dimanche, 
et ce que l'on considère comme la première semaine de l'année. 
Selon l'option utilisée par WEEK(), le résultat de cette fonction peut donc différer de celui de WEEKOFYEAR().
*/

SELECT nom, date_naissance, WEEK(date_naissance) AS semaine, WEEKOFYEAR(date_naissance) AS semaine2, YEARWEEK(date_naissance) AS semaine_annee
FROM Animal
WHERE espece_id = 4;

/*
Le mois
Pour le mois, il existe deux fonctions : MONTH(date)  qui donne le numéro du mois (nombre de 1 à 12) et MONTHNAME(date)  qui donne le nom du mois.
*/
SELECT nom, date_naissance, MONTH(date_naissance) AS numero_mois, MONTHNAME(date_naissance) AS nom_mois
FROM Animal
WHERE espece_id = 4;

/*
L'année
Enfin, la fonction YEAR(date)  extrait l'année.
*/
SELECT nom, date_naissance, YEAR(date_naissance)
FROM Animal
WHERE espece_id = 4;

/*
Informations sur l'heure
En ce qui concerne l'heure, voici quatre fonctions intéressantes (et faciles à retenir) qui s'appliquent à une donnée de type DATETIME  ou TIME  :

TIME(datetime)  : qui extrait l'heure complète (le TIME).

HOUR(heure)  : qui extrait l'heure.

MINUTE(heure)  : qui extrait les minutes.

SECOND(heure)  : qui extrait les secondes.
*/

SELECT nom, date_naissance, 
        TIME(date_naissance) AS time_complet, 
        HOUR(date_naissance) AS heure, 
        MINUTE(date_naissance) AS minutes, 
        SECOND(date_naissance) AS secondes
FROM Animal
WHERE espece_id = 4;

---- Formater une date ----
/*
il existe une fonction qui va nous permettre de faire la même chose, en bien plus court : DATE_FORMAT(date, format).

Cette fonction DATE_FORMAT()  a donc deux paramètres :
    date : la date à formater (DATE, TIME  ou DATETIME) ;
    format : le format voulu.

*/
/*
Le format à utiliser doit être donné sous forme de chaîne de caractères. 
Cette chaîne peut contenir un ou plusieurs spécificateurs dont les plus courants sont listés dans le tableau suivant.
Spécificateur Description

%d   Jour du mois (nombre à deux chiffres, de 00 à 31)
%e   Jour du mois (nombre à un ou deux chiffres, de 0 à 31)
%D   Jour du mois, avec suffixe (1rst, 2nd,…, 31th) en anglais
%w   Numéro du jour de la semaine (dimanche = 0… samedi = 6)
%W   Nom du jour de la semaine
%a   Nom du jour de la semaine en abrégé
%m   Mois (nombre de deux chiffres, de 00 à 12)
%c   Mois (nombre de un ou deux chiffres, de 0 à 12)
%M   Nom du mois
%b   Nom du mois en abrégé
%y   Année, sur deux chiffres
%Y  Année, sur quatre chiffres
%r  Heure complète, format 12h (hh:mm:ss AM/PM)
%T  Heure complète, format 24h (hh:mm:ss)
%h  Heure sur deux chiffres et sur 12 heures (de 00 à 12)
%H  Heure sur deux chiffres et sur 24 heures (de 00 à 23)
%l  Heure sur un ou deux chiffres et sur 12 heures (de 0 à 12)
%k  Heure sur un ou deux chiffres et sur 24 heures (de 0 à 23)
%i  Minutes (de 00 à 59)
%s ou %S  Secondes (de 00 à 59)
%p  AM/PM

Tous les caractères ne faisant pas partie d'un spécificateur sont simplement recopiés tels quels.
*/

/*
Fonction supplémentaire pour l'heure

DATE_FORMAT()  peut s'utiliser sur des données de type DATE, TIME  ou DATETIME. 
Mais il existe également une fonction TIME_FORMAT(heure, format)qui ne sert qu'à formater les heures (et ne doit donc pas s'utiliser sur une DATE). 
Elle s'utilise exactement de la même manière, 
simplement, il faut y utiliser des spécificateurs ayant du sens pour une donnée TIME, sinon NULL ou 0  est renvoyé.
Si un mauvais format de TIME  ou DATETIME  est donné à TIME_FORMAT()  
(par exemple, si on lui donne une DATE), 
MySQL va tenter d'interpréter la donnée et renverra bien un résultat, 
mais celui-ci n'aura peut-être pas beaucoup de sens (pour vous du moins).
*/

-- Sur une DATETIME
SELECT TIME_FORMAT(NOW(), '%r') AS sur_datetime, 
        TIME_FORMAT(CURTIME(), '%r') AS sur_time, 
        TIME_FORMAT(NOW(), '%M %r') AS mauvais_specificateur, 
        TIME_FORMAT(CURDATE(), '%r') AS sur_date;

/*
Formats standard
Il existe un certain nombre de formats de date et d'heure standard prédéfinis, que l'on peut utiliser dans la fonction DATE_FORMAT(). 
Pour obtenir ces formats, il faut appeler la fonction GET_FORMAT(type, standard).

Le paramètre type doit être choisi entre les trois types de données : DATE, TIME  et DATETIME.

Il existe cinq formats standard :

'EUR'
'USA'
'ISO'
'JIS'
'INTERNAL'
*/
SELECT DATE_FORMAT(NOW(), GET_FORMAT(DATE, 'EUR')) AS date_eur,
        DATE_FORMAT(NOW(), GET_FORMAT(TIME, 'JIS')) AS heure_jis,
        DATE_FORMAT(NOW(), GET_FORMAT(DATETIME, 'USA')) AS date_heure_usa;

----Créer une date à partir d'un string ----
/*
Voici une dernière fonction ayant trait au format des dates : STR_TO_DATE(date, format). 
Cette fonction est l'exact contraire de DATE_FORMAT()  : elle prend une chaîne de caractères représentant une date suivant le format donné, 
et renvoie la DATETIME  correspondante.
*/
SELECT STR_TO_DATE('03/04/2011 à 09h17', '%d/%m/%Y à %Hh%i') AS StrDate,
        STR_TO_DATE('15blabla', '%Hblabla') StrTime;

--Il est bien sûr possible d'utiliser GET_FORMAT()  aussi avec STR_TO_DATE().
SELECT STR_TO_DATE('11.21.2011', GET_FORMAT(DATE, 'USA')) AS date_usa,
        STR_TO_DATE('12.34.45', GET_FORMAT(TIME, 'EUR')) AS heure_eur,
        STR_TO_DATE('20111027133056', GET_FORMAT(TIMESTAMP, 'INTERNAL')) AS date_heure_int;

/*
En résumé
De nombreuses fonctions permettent d'extraire un élément précis à partir d'une donnée temporelle : 
HOUR()  permet d'extraire l'heure, YEAR()  extrait l'année…

On peut formater une donnée temporelle facilement en utilisant DATE_FORMAT()  et TIME_FORMAT() avec des spécificateurs : "%M" représente le nom du mois, "%i" les minutes…

Il existe cinq formats de date standard : EUR, ISO, USA, JIS et INTERNAL.

Pour que les noms des jours et des mois soient donnés en français, il faut exécuter cette commande : SET lc_time_names = 'fr_FR';

Lorsque l'on a une donnée temporelle dans un format particulier, 
on peut la transformer en DATE, TIME  ou DATETIME  avec STR_TO_FORMAT(), 
qui utilise les mêmes spécificateurs que DATE_FORMAT()  et TIME_FORMAT().