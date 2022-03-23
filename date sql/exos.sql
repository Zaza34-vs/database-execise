-------- FORMAT -----------

-- 1. Selectionner tous les animaux nés en juin
    SELECT * 
    FROM `animal`
    WHERE MONTH(date_naissance) = 06

--2. Sélectionner tous les animaux nés dans les huit premières semaines d'une année.
    SELECT * 
    FROM `animal`
    WHERE WEEKOFYEAR(date_naissance) = 8

--3. Afficher le jour (en chiffres) et le mois de naissance (en toutes lettres) des tortues et des chats nés avant 2007 (en deux colonnes).
    SET lc_time_names = 'fr_FR'
    SELECT DAY(date_naissance), MONTHNAME(date_naissance)
    FROM `animal`
    INNER JOIN `espece` ON animal.espece_id = espece.id
    WHERE espece.id IN (2, 3)
    AND YEAR(date_naissance) < 2007

--4. Même chose qu'à la question précédente, mais en une seule colonne.
    SET lc_time_names = 'fr_FR'
    SELECT DATE_FORMAT(date_naissance, '%e %M')
    FROM `animal`
    INNER JOIN `espece` ON animal.espece_id = espece.id
    WHERE espece.id IN (2, 3)
    AND YEAR(date_naissance) < 2007

--5. Sélectionner tous les animaux nés en avril, mais pas un 24 avril, triés par heure de naissance décroissante (heure dans le sens commun du terme, donc heure, minutes, secondes) 
   --et afficher leur date de naissance suivant le même format que l'exemple ci-dessous.
-----Format : 8 janvier, à 6h30PM, en l'an 2010 après J.C.
    SET lc_time_names = 'fr_FR'
    SELECT DATE_FORMAT(date_naissance, '%e %M, à %Hh%iPM, en l'' an %Y après J.C.')
    FROM `animal`
    WHERE MONTH(date_naissance) = 04
    AND DAY(date_naissance) <> 24
    ORDER BY TIME (date_naissance)


------ CALCUL -----------

--1. Moka était censé naître le 27 février 2008. Calculer le nombre de jours de retard de sa naissance.
    SELECT DATEDIFF(date_naissance, '2008-02-27')
    AS retard_naissance
    FROM `animal`
    WHERE animal.nom = 'Moka'

--2. Afficher la date à laquelle chaque perroquet (espece_id = 4) fêtera son 25 e anniversaire.
    SELECT DATE(ADDDATE(date_naissance, INTERVAL 25 YEAR))
    AS date_25eme_anniv
    FROM `animal`
    WHERE animal.espece_id = 4
    
--3. Sélectionner les animaux nés dans un mois contenant exactement 29 jours.
    SELECT *
    FROM `animal`
    WHERE DAY(LAST_DAY(date_naissance)) = 29
    
--4. Après douze semaines, un chaton est sevré (sauf exception bien sûr). Afficher la date à partir de
--  laquelle les chats (espece_id = 2) de l'élevage peuvent être adoptés (qu'il s'agisse d'une date dans le passé ou dans le futur).
    SELECT animal.id, animal.nom, DATE(ADDDATE(date_naissance, INTERVAL 12 WEEK))
    AS date_adoption
    FROM `animal`
    WHERE animal.espece_id = 2

--5. Rouquine, Zira, Bouli et Balou (id 13, 18, 20 et 22 respectivement) font partie de la même portée. 
--    Calculer combien de temps, en minutes, Balou est né avant Zira.
    SELECT TIMESTAMPDIFF(
        MINUTE,  
    (SELECT date_naissance FROM `animal` WHERE id = 22),
    (SELECT date_naissance FROM `animal` WHERE id = 18)
    )
    AS difference_naissance
    FROM `animal`
    WHERE id IN (18, 22)


------ ON MELANGE TOUT ---------

--1. Rouquine, Zira, Bouli et Balou (id 13, 18, 20 et 22 respectivement) font partie de la même
--   portée. Calculer combien de temps, en minutes, s'est écoulé entre le premier né et le dernier né de la portée.
    SELECT TIMESTAMPDIFF(MINUTE,  
            (
                SELECT MIN(date_naissance) 
                FROM `animal`
                WHERE id IN (13, 18, 20, 22)
            ),
            (
                SELECT MAX(date_naissance)  
                FROM `animal` 
                WHERE id IN (13, 18, 20, 22)
                )
        )  AS diff_naissance;

--2. Calculer combien d'animaux sont nés durant un mois pendant lequel les moules sont les plus consommables (c'est-à-dire les mois finissant en "bre").
    SET lc_time_names = 'fr_FR';
    SELECT COUNT(*)
    FROM Animal
    WHERE MONTHNAME(date_naissance) LIKE '%bre'

/*
3. Pour les chiens et les chats (espece_id = 1 et espece_id = 2 respectivement), afficher les
différentes dates de naissance des portées d'au moins deux individus (format JJ/MM/AAAA), ainsi
que le nombre d'individus pour chacune de ces portées. Attention, il n'est pas impossible qu'une
portée de chats soit née le même jour qu'une portée de chiens (il n'est pas non plus impossible que
deux portées de chiens naissent le même jour, mais on considère que ce n'est pas le cas).
*/
    SELECT DATE_FORMAT(date_naissance,  '%d/%m/%Y') AS date_naissance, COUNT(*) AS nb_individus
    FROM `animal`
    WHERE espece_id  IN (1, 2)
    GROUP BY DATE(date_naissance)
    HAVING date_naissance > 1

--4. Calculer combien de chiens (espece_id = 1) sont nés en moyenne chaque année entre 2006 et 2010 (sachant qu'on a eu au moins une naissance chaque année).
    SELECT COUNT(*) AS moyenneChien
    FROM animal
    WHERE  espece_id = 1
    AND YEAR(date_naissance) >= 2006
	AND YEAR(date_naissance) <= 2010
	GROUP BY YEAR(date_naissance)


--5. Afficher la date au format ISO du 5 e anniversaire des animaux dont on connaît soit le père, soit la mère.
    SELECT DATE_FORMAT(DATE_ADD(date_naissance, INTERVAL 5 YEAR),
    GET_FORMAT(DATE, 'ISO')) AS isoDate
    FROM `animal`
    WHERE pere_id IS NOT NULL
    AND mere_id IS NOT NULL