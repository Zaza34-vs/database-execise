/*

  ####  #####  ######   ##   ##### ######    #####    ##   #####   ##   #####    ##    ####  ######
 #    # #    # #       #  #    #   #         #    #  #  #    #    #  #  #    #  #  #  #      #
 #      #    # #####  #    #   #   #####     #    # #    #   #   #    # #####  #    #  ####  #####
 #      #####  #      ######   #   #         #    # ######   #   ###### #    # ######      # #
 #    # #   #  #      #    #   #   #         #    # #    #   #   #    # #    # #    # #    # #
  ####  #    # ###### #    #   #   ######    #####  #    #   #   #    # #####  #    #  ####  ######

*/
CREATE DATABASE ma_base 
-- SI JAMAIS UNE AUTRE BDD EXISTE
CREATE DATABASE IF NOT EXISTS ma_base
            -- PERMET DE NE PAS RETOURNER D'ERREUR
/*
 Options : 
 Dans le standard SQL la commande CREATE DATABASE n’existe normalement pas. En conséquent 
 il revient de vérifier la documentation des différents SGBD pour vérifier les syntaxes possibles pour définir des options. 
 Ces options permettent selon les cas, de définir les jeux de caractères, le propriétaire de la base ou même les limites de connexion.
 */

/*

 #####  #####   ####  #####     #####    ##   #####   ##   #####    ##    ####  ######
 #    # #    # #    # #    #    #    #  #  #    #    #  #  #    #  #  #  #      #
 #    # #    # #    # #    #    #    # #    #   #   #    # #####  #    #  ####  #####
 #    # #####  #    # #####     #    # ######   #   ###### #    # ######      # #
 #    # #   #  #    # #         #    # #    #   #   #    # #    # #    # #    # #
 #####  #    #  ####  #         #####  #    #   #   #    # #####  #    #  ####  ######

*/
-- POUR SUPPRIMER UNE BASE DE DONNEES 
DROP DATABASE ma_base -- SI JAMAIS LA BDD N'EXISTE PAS
DROP DATABASE if EXISTS ma_base
/*

  ####  #####  ######   ##   ##### ######    #####   ##   #####  #      ######
 #    # #    # #       #  #    #   #           #    #  #  #    # #      #
 #      #    # #####  #    #   #   #####       #   #    # #####  #      #####
 #      #####  #      ######   #   #           #   ###### #    # #      #
 #    # #   #  #      #    #   #   #           #   #    # #    # #      #
  ####  #    # ###### #    #   #   ######      #   #    # #####  ###### ######

*/
-- POUR CREER UNE TABLE 
CREATE TABLE nom_de_la_table { colonne1 type_donnees,
colonne2 type_donnees,
colonne3 type_donnees,
colonne4 type_donnees,
} NOT NULL -- EMPECHE D'ENREGISTRER UNE VALEUR NULLE POUR UNE COLONNE
DEFAULT -- ATTRIBUE UNE VALEUR PAR DEFAUT SI AUCUNE DONNEE N'EST INDIQUE POUR CETTE COLONNE
PRIMARY KEY -- INDIQUE SI LA COLONNE EST CONSIDEREE COMME CLE PRIMAIRE POUR UN INDEX
/*

 ##### #####  #    # #    #  ####    ##   ##### ######    #####   ##   #####  #      ######
   #   #    # #    # ##   # #    #  #  #    #   #           #    #  #  #    # #      #
   #   #    # #    # # #  # #      #    #   #   #####       #   #    # #####  #      #####
   #   #####  #    # #  # # #      ######   #   #           #   ###### #    # #      #
   #   #   #  #    # #   ## #    # #    #   #   #           #   #    # #    # #      #
   #   #    #  ####  #    #  ####  #    #   #   ######      #   #    # #####  ###### ######

*/
-- PERMET DE SUPPRIMER TOUTES LES DONNEES D'UNE TABLE SANS SUPPRIMER TOUTE LA TABLE
/*
 A noter : l’instruction TRUNCATE est semblable à l’instruction DELETE sans utilisation de WHERE. 
 Parmi les petite différences TRUNCATE est toutefois plus rapide et utilise moins de ressource. 
 Ces gains en performance se justifie notamment parce que la requête n’indiquera pas le nombre d’enregistrement supprimés 
 et qu’il n’y aura pas d’enregistrement des modifications dans le journal.
 */
TRUNCATE TABLE `table` -- EQUIVALENT
DELETE FROM `table`
/*

   ##   #      ##### ###### #####     #####   ##   #####  #      ######
  #  #  #        #   #      #    #      #    #  #  #    # #      #
 #    # #        #   #####  #    #      #   #    # #####  #      #####
 ###### #        #   #      #####       #   ###### #    # #      #
 #    # #        #   #      #   #       #   #    # #    # #      #
 #    # ######   #   ###### #    #      #   #    # #####  ###### ######

*/
    -- PERMET DE MODIFIER UNE TABLE DEJA EXISTANTE
    -- SYNTHAXE DE BASE
ALTER TABLE nom_table instruction -- designe une commande d'action
    -- POUR AJOUTER UNE COLONNE
ALTER TABLE nom_table
ADD nom_colonne type_donnees -- POUR SUPPRIMER UNE COLONNE
ALTER TABLE nom_table DROP nom_colonne -- OU
ALTER TABLE nom_table DROP COLUMN nom_colonne -- POUR MODIFIER UNE COLONNE
    -- SYNTHAXES QUI DIFFERENT DES SGBD
    -- AVEC MYSLQ
ALTER TABLE nom_table
MODIFY nom_colonne type_donnees -- AVEC POSTGRESQL
ALTER TABLE nom_table
ALTER COLUMN nom_colonne TYPE type_donnees -- POUR RENOMMER UNE COLONNE
    -- il faut indiquer l'ancien et le nouveau nom de la colonne
    -- Avec MySQL, il faut aussi indiquer le type
    ALTER TYPE nom_table CHANGE colonne_ancien_nom colonne_nouveau_nom type_donnees -- Avec PostgreSQL, la synthaxe est plus simple
ALTER TABLE nom_table
    RENAME COLUMN colonne_ancien_nom TO colonne_nouveau_nom
/*

 #####  #####   ####  #####     #####   ##   #####  #      ######
 #    # #    # #    # #    #      #    #  #  #    # #      #
 #    # #    # #    # #    #      #   #    # #####  #      #####
 #    # #####  #    # #####       #   ###### #    # #      #
 #    # #   #  #    # #           #   #    # #    # #      #
 #####  #    #  ####  #           #   #    # #####  ###### ######

*/
    -- PERMET DE SUPPRIMER UNE TABLE D'UNE BDD DE MANIERE DEFINITIVE
    -- !!!!!!! UNE FOIS SUPPRIMEE, LES DONNEES SONT PERDUES. UTILISATION DE BACKUP ET SAUVEGARDE PLUS QUE RECOMMANDE
    DROP TABLE nom_table -- * SI IL Y A DEPENDANCE AVEC UNE AUTRE TABLE, IL FAUT LES SUPPRIMER AVANT DE SUPPRIMER LA TABLE. PAR EX : LES CLES ETRANGERES
    /*
     Intérêts
     Il arrive qu’une table soit créé temporairement pour stoquer des données qui n’ont pas vocation à être ré-utiliser. La suppression d’une table non utilisée est avantageux sur plusieurs aspects :
     • Libérer de la mémoire et alléger le poids des backups
     • Éviter des erreurs dans le futur si une table porte un nom similaire ou qui porte à confusion
     • Lorsqu’un développeur ou administrateur de base de données découvre une application, il est plus rapide de comprendre le système s’il n’y a que les tables utilisées qui sont présente
     
     */