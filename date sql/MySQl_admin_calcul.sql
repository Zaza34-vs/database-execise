----- Calculs sur les données temporelles

---- Diff entre deux dates/heures
/*
Trois fonctions permettent de calculer le temps écoulé entre deux données temporelles :

    DATEDIFF()  : qui donne un résultat en nombre de jours.
    TIMEDIFF()  : qui donne un résultat sous forme de TIME.
    TIMESTAMPDIFF()  : qui donne le résultat dans l'unité de temps souhaitée (heure, secondes, mois…).
*/

/*
.########.....###....########.########.########..####.########.########...###.###..
.##.....##...##.##......##....##.......##.....##..##..##.......##........##.....##.
.##.....##..##...##.....##....##.......##.....##..##..##.......##.......##.......##
.##.....##.##.....##....##....######...##.....##..##..######...######...##.......##
.##.....##.#########....##....##.......##.....##..##..##.......##.......##.......##
.##.....##.##.....##....##....##.......##.....##..##..##.......##........##.....##.
.########..##.....##....##....########.########..####.##.......##.........###.###..
*/
/*
DATEDIFF(date1, date2) peut s'utiliser avec des données de type DATE ou DATETIME(dans ce dernier cas, seule la partie date est utilisée).

Les trois requêtes suivantes donnent donc le même résultat. */
SELECT DATEDIFF('2011-12-25','2011-11-10') AS nb_jours;
SELECT DATEDIFF('2011-12-25 22:12:18','2011-11-10 12:15:41') AS nb_jours;
SELECT DATEDIFF('2011-12-25 22:12:18','2011-11-10') AS nb_jours;

/*
.########.####.##.....##.########.########..####.########.########...###.###..
....##.....##..###...###.##.......##.....##..##..##.......##........##.....##.
....##.....##..####.####.##.......##.....##..##..##.......##.......##.......##
....##.....##..##.###.##.######...##.....##..##..######...######...##.......##
....##.....##..##.....##.##.......##.....##..##..##.......##.......##.......##
....##.....##..##.....##.##.......##.....##..##..##.......##........##.....##.
....##....####.##.....##.########.########..####.##.......##.........###.###..
*/
-- Avec des DATETIME
SELECT '2011-10-08 12:35:45' 
AS datetime1, '2011-10-07 16:00:25' 
AS datetime2, TIMEDIFF('2011-10-08 12:35:45', '2011-10-07 16:00:25') as difference;

-- Avec des TIME
SELECT '12:35:45' 
AS time1, '00:00:25' 
AS time2, TIMEDIFF('12:35:45', '00:00:25') as difference;

/*
.########.####.##.....##.########..######..########....###....##.....##.########..########..####.########.########...###.###..
....##.....##..###...###.##.......##....##....##......##.##...###...###.##.....##.##.....##..##..##.......##........##.....##.
....##.....##..####.####.##.......##..........##.....##...##..####.####.##.....##.##.....##..##..##.......##.......##.......##
....##.....##..##.###.##.######....######.....##....##.....##.##.###.##.########..##.....##..##..######...######...##.......##
....##.....##..##.....##.##.............##....##....#########.##.....##.##........##.....##..##..##.......##.......##.......##
....##.....##..##.....##.##.......##....##....##....##.....##.##.....##.##........##.....##..##..##.......##........##.....##.
....##....####.##.....##.########..######.....##....##.....##.##.....##.##........########..####.##.......##.........###.###..
*/
/*
La fonction TIMESTAMPDIFF() prend, quant à elle, un paramètre supplémentaire : 
l'unité de temps désirée pour le résultat. 
Les unités autorisées comprennent : SECOND(secondes), MINUTE(minutes), HOUR(heures), DAY(jours), WEEK(semaines), MONTH(mois), QUARTER(trimestres) et YEAR(années).

TIMESTAMPDIFF(unite, date1, date2) s'utilise également avec des données de type DATE  ou DATETIME. 
Si vous demandez un résultat comprenant une unité inférieure au jour (heure ou minute, par exemple) 
et que l'une de vos données est de type DATE, MySQL complétera cette date avec l'heure par défaut '00:00:00'.
*/

SELECT TIMESTAMPDIFF(DAY, '2011-11-10', '2011-12-25') AS nb_jours,
        TIMESTAMPDIFF(HOUR,'2011-11-10', '2011-12-25 22:00:00') AS nb_heures_def, 
        TIMESTAMPDIFF(HOUR,'2011-11-10 14:00:00', '2011-12-25 22:00:00') AS nb_heures,
        TIMESTAMPDIFF(QUARTER,'2011-11-10 14:00:00', '2012-08-25 22:00:00') AS nb_trimestres;