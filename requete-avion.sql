--------------------------- Requêtes portant sur une seule table sans regroupement   --------------------------

--1	Quels sont les pilotes dont le nom commence par « S » ?
    SELECT * 
    FROM pilote 
    WHERE nom 
    LIKE 'S%'

--2 Quels sont les pilotes dont le nom comporte le groupe de caractères « cie » ?
    SELECT * 
    FROM pilote 
    WHERE nom 
    LIKE '%cie%'

--3	Quels sont les pilotes dont la troisième lettre du nom est un « b » ?
    SELECT * 
    FROM pilote 
    WHERE nom 
    LIKE '__%b%_'

--4	Dans combien de villes distinctes sont localisés des avions ?
    SELECT COUNT(`Localisation`) 
    FROM avion

--5	Quels sont les vols au départ de Nice entre 12h et 14h ?
    SELECT * 
    FROM `vol` 
    WHERE `VilleDepart` = 'Nice' AND `VilleDepart` <= 12

--6	Quelle est la capacité moyenne des avions ?
    SELECT SUM(`Capacite`) 
    FROM avion

--7 Quels sont les salaires minimum et maximum des pilotes ? 
    SELECT MIN(`SalaireBrut`), MAX(`SalaireBrut`) 
    FROM pilote

--8 Quel est la durée du vol Moulinsart – Sydney ?
    SELECT (vol.HeureArrivee) - (vol.HeureDepart) 
    FROM vol 
    WHERE `VilleDepart` = 'Moulinsart' AND `VilleArrivee` = 'Sydney'

--9 Combien y a-t-il de vols Bastia – Paris ?
    SELECT COUNT(*) 
    FROM vol 
    WHERE `VilleDepart` = 'Bastia' AND `VilleArrivee` = 'Paris'

--10 Donner la liste des villes dans lesquelles habitent des passagers
    SELECT DISTINCT `Ville` 
    FROM `passager`


--------------------------- Requêtes portant sur une seule table avec regroupement   --------------------------

--11 Donnez pour chaque ville, le nombre de vols au départ de celle-ci. 
    SELECT `VilleDepart`, COUNT(*) 
    FROM `vol` 
    GROUP BY `VilleDepart`

--12 Donnez pour chaque ville, le nombre de vols au départ de celle-ci, 
--uniquement pour les villes dont le nombre de vols au départ de celles-ci est supérieur à 2. 
    SELECT `VilleDepart`, COUNT(*) 
    FROM `vol` 
    GROUP BY `VilleDepart` HAVING COUNT(*) >= 2

--13 Donnez pour chaque ville, le nombre et les capacités minimum et maximum des avions qui s'y trouvent. 
    SELECT `Localisation`, MIN(`Capacite`), MAX(`Capacite`) 
    FROM `avion` 
    GROUP BY `Localisation`

-- 14 Quelle est la capacité moyenne des avions pour chaque ville où sont localisés plus d’un avion ? 
    SELECT `Localisation`, AVG(`Capacite`) 
    FROM `avion`  
    GROUP BY `Localisation` HAVING COUNT(*) > 1

-- 15 Donner le nombre d’avions ayant une capacité supérieure à 100 (places) par localisation 
    SELECT`Localisation`, COUNT(*) 
    FROM `avion` 
    WHERE `Capacite`> 100 
    GROUP BY `Localisation`

--16  Combien y a t-il d'avions de chaque marques ?
    SELECT `Marque`, COUNT(*) 
    FROM `avion` 
    GROUP BY `Marque`

--17 Combien y a t-il d'avions de chaque type ?
    SELECT `TypeAvion`, COUNT(*) 
    FROM `avion`
    GROUP BY `TypeAvion`

--18 Pour chaque ville (de résidence) des passagers, donner le nombre de ceux-ci. 
    SELECT `Ville`, COUNT(*) 
    FROM `passager` 
    GROUP BY `Ville`

--19 Donner le nombre de vols au départ de chaque ville. 
    SELECT `VilleDepart` , COUNT(*) 
    FROM `vol` 
    GROUP BY `VilleDepart`

-- 20 Donner les villes (de résidence) et le salaire moyen des pilotes qui y habitent, 
--      mais uniquement si le salaire moyen de ceux-ci est supérieur à 5 000 (euros) 
--      et qu’il concerne plus d’un pilote. 
    SELECT `Ville`, AVG(`SalaireBrut`) 
    FROM `pilote` 
    GROUP BY `Ville` 
    HAVING AVG(`SalaireBrut`) > 5000 AND COUNT(*) > 1

--------------------------- Requêtes portant sur plusieurs tables  --------------------------

--21 Quelle est la capacité de l’avion assurant le vol Moulinsart – Sydney ?
    SELECT `Capacite` 
    FROM `vol`,`avion` 
    WHERE  `NumAvion` = 104 AND `Avnum` = 104

--22 Dans quelle ville habite le pilote du vol Nice – Nantes et quel est son nom ?
    SELECT `Ville`, `Nom`
    FROM `pilote`, `vol` 
    WHERE `Pilnum` = 4 AND `VilleDepart` = 'Nice' AND `VilleArrivee` = 'Nantes' 

--23 Donner les noms des pilotes ayant un vol au départ de Paris. 
    SELECT `Nom`  
    FROM `pilote`
    INNER JOIN `vol` ON pilote.Pilnum = vol.NumPilote
    WHERE `VilleDepart` = 'Paris'


--24 Donner le type des avions ayant un vol durant plus de 2 (heures).
    SELECT `TypeAvion` 
    FROM `avion`
    INNER JOIN `vol` ON avion.Avnum = vol.NumAvion
    WHERE (`HeureArrivee` - `HeureDepart`) > 2

--25 Sur quel type d’avion a volé Sophie ?
    SELECT `Prenom`, `Nom`, `TypeAvion`
    FROM `avion`
    INNER JOIN `vol` ON avion.Avnum = vol.NumAvion
    INNER JOIN `affectevol` ON vol.Volnum = affectevol.Volnum
    INNER JOIN `passager` ON affectevol.Pasnum = passager.Pasnum
    WHERE passager.Prenom = 'Sophie'

--26 Quel était le nom du pilote ayant transporté le passager habitant Nice ? 
    SELECT `Nom`
    FROM `pilote`,`vol`
    WHERE `Volnum` = 103 AND `pilnum` = 3

--27 Donnez le code et le nom des passagers qui sont affectés à un vol dont le prix de la place est supérieur à 150 €
    SELECT passager.Pasnum, passager.Prenom, passager.Nom
    FROM `passager`
    INNER JOIN `affectevol` ON passager.Pasnum = affectevol.Pasnum
    WHERE affectevol.Prix > 150

--28 Quel est le nombre de vols de chaque pilote ? 
    SELECT pilote.Nom, pilote.Pilnum, COUNT(*) 
    FROM `pilote` 
    INNER JOIN `vol` ON pilote.Pilnum = vol.NumPilote 
    GROUP BY pilote.Nom

--29 Quel est le nombre de types d'avion dfférents que conduit chaque pilote
    SELECT pilote.Nom, pilote.Pilnum, COUNT(DISTINCT avion.TypeAvion) 
    FROM `avion` 
    INNER JOIN `vol` ON avion.Avnum = vol.NumAvion
    INNER JOIN `pilote` ON vol.NumPilote = pilote.Pilnum
    GROUP BY pilote.Nom

--30 Quels sont les noms des pilotes qui habitent dans la ville de localisation d'un airbus
    SELECT pilote.Nom, pilote.Ville
    FROM `pilote`
    INNER JOIN `vol` ON pilote.Pilnum = vol.NumPilote
    INNER JOIN `avion` ON vol.NumAvion = avion.Avnum
    WHERE avion.Marque = 'Airbus'
    GROUP BY pilote.Nom

--31 Quels sont les noms des pilotes qui ont un vol sur un airbus et qui habitent dans la ville de localisation de cet airbus
    SELECT pilote.Nom
    FROM `pilote`
    INNER JOIN `vol` ON pilote.Pilnum = vol.NumPilote
    INNER JOIN `avion` ON vol.NumAvion = avion.Avnum
    WHERE avion.Marque = 'Airbus' AND pilote.Ville = avion.Localisation
    GROUP BY pilote.Nom

--32 Quels sont les noms des pilotes qui ont un vol sur un airbus et qui habitent dans la ville de localisation d'un airbus quelconque
    SELECT pilote.Nom
    FROM `pilote`
    INNER JOIN `vol` ON pilote.Pilnum = vol.NumPilote
    INNER JOIN `avion` ON vol.NumAvion = avion.Avnum
    WHERE avion.Marque ='Airbus' AND pilote.Ville 
    IN (
        SELECT avion.Localisation 
        FROM `avion` 
        WHERE avion.Marque ='Airbus'
        )
    GROUP BY pilote.Nom

--33 Quels sont les noms des pilotes qui conduisent un airbus sauf ceux qui habitent dans la ville de localisation d'un airbus
    SELECT pilote.Nom
    FROM `pilote`
    INNER JOIN `vol` ON pilote.Pilnum = vol.NumPilote
    INNER JOIN `avion` ON vol.NumAvion = avion.Avnum
    WHERE avion.Marque ='Airbus' AND pilote.Ville 
    NOT IN (
        SELECT avion.Localisation 
        FROM `avion` 
        WHERE avion.Marque ='Airbus'
        )
    GROUP BY pilote.Nom

--34 Sélectionner les numéros de pilotes qui conduisent tous les airbus a320
    SELECT pilote.Pilnum, pilote.Nom, COUNT(vol.NumAvion)
    FROM `pilote`
    INNER JOIN `vol` ON pilote.Pilnum = vol.NumPilote
    INNER JOIN `avion` ON vol.NumAvion = avion.Avnum
    WHERE avion.TypeAvion = 'A320'
    GROUP BY pilote.Pilnum
    HAVING COUNT(vol.NumAvion)=(SELECT COUNT(avion.Avnum) FROM `avion` WHERE avion.TypeAvion = 'A320')

--35 Quels sont les vols ayant un trajet identique (Ville Départ, Ville Arrivée) à ceux  assurés par Serge
    SELECT pilote.Nom, vol.VilleDepart, vol.VilleArrivee, vol.NumPilote, vol.Volnum
    FROM `vol`
    INNER JOIN `pilote` ON vol.NumPilote = pilote.Pilnum
    WHERE (vol.villeDepart, vol.villeArrivee)
    IN(
        SELECT vol.VilleDepart, vol.VilleArrivee
        FROM `vol`
        INNER JOIN `pilote` ON vol.NumPilote = pilote.Pilnum 
        WHERE (pilote.Nom='Serge')
    )
    AND(pilote.Nom!="Serge")

--36
/*
SELECT GROUP COUNT
FROM
GROUP BY
*/

--------------------------- Requêtes utilisant les fonctions intégrées de traitement des dates  --------------------------


--------------------------- Requêtes de MAJ  --------------------------

--------------------------- Requêtes d'ajout  --------------------------

--------------------------- Requêtes suppression  --------------------------

--50 Supprimer les passagers habitants Brive
DELETE FROM `passager` 
WHERE passager.Ville = 'Brive'