/*
        ------- CE QUE CA DOIT DONNER EN TERME DE RESULTAT --------
    SELECT vol.Volnum, vol.NumPilote, vol.VilleDepart, vol.VilleArrivee
    FROM `vol`
    INNER JOIN `pilote` ON vol.NumPilote = pilote.Pilnum
    WHERE vol.NumPilote = 5
*/
--*** DANS LE WHERE :
--*** IL FAUT COMPARER LES VALEURS DE LA TABLE VOL ENTRE ELLES POUR SELECTIONNER CELLES QUI SONT IDENTIQUES A "SERGE"
--*** LES AFFICHER DANS PHP MY ADMIN 
--*** Normalement cela va donner : 

--TODO   Volnum     Nom     VilleDepart     VilleArrivee
--TODO   111        Michel  Nice            Paris

/*
    SELECT vol.Volnum, vol.NumPilote, pilote.Nom, vol.VilleDepart, vol.VilleArrivee
    FROM `vol`
    INNER JOIN `pilote` ON vol.NumPilote = pilote.Pilnum
    WHERE (vol.villeDepart, vol.villeArrivee)
    IN(
        SELECT vol.VilleDepart, vol.VilleArrivee
        FROM vol
        INNER JOIN pilote ON vol.NumPilote = pilote.Pilnum WHERE (pilote.Nom='Serge')
    )
    AND(pilote.Nom!="Serge")
