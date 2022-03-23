/*

#      ######  ####      ####  #      ######  ####     ###### ##### #####    ##   #    #  ####  ###### #####  ######  ####
#      #      #         #    # #      #      #         #        #   #    #  #  #  ##   # #    # #      #    # #      #
#      #####   ####     #      #      #####   ####     #####    #   #    # #    # # #  # #      #####  #    # #####   ####
#      #           #    #      #      #           #    #        #   #####  ###### #  # # #  ### #      #####  #           #
#      #      #    #    #    # #      #      #    #    #        #   #   #  #    # #   ## #    # #      #   #  #      #    #
###### ######  ####      ####  ###### ######  ####     ######   #   #    # #    # #    #  ####  ###### #    # ######  ####

*/

/*
Synthaxe qui doit être écrite pour faire
relation entre 2 tables quand une table
possède une clé étrangère
*/

ALTER TABLE table_1 ADD CONSTRAINT FK_Table_1_Table_2 FOREIGN KEY (id_table_2) REFERENCES table_2 (id_table_2);

/*
Exemple : 
*/
ALTER TABLE utilisateur ADD CONSTRAINT FK_Client_Fonction FOREIGN KEY (id_fonction) REFERENCES fonction (id_fonction);

    FK_Table_1_Table_2 -- : nom de la relation

/*
Exemple de script complet de création d'une base de donnée (après avoir réalisé l'instruction CREATE DATABASE nom_db;) : 
*/


/*==============================================================*/
/* DBMS name: MySQL 5.0 */
/* Created on: 28/06/2016 11:11:11 */
/*==============================================================*/

DROP TABLE IF EXISTS utilisateur;
DROP TABLE IF EXISTS fonction;

/*==============================================================*/
/* Table: utilisateur */
/*==============================================================*/
CREATE TABLE utilisateur (
    id_utilisateur          INT NOT NULL auto_increment,
    nom_utilisateur         VARCHAR(100),
    prenom_utilisateur      VARCHAR(100),
    email                   VARCHAR(255),
    date_naissance          DATE,
    pays                    VARCHAR(255),
    ville                   VARCHAR(255),
    code_postal             VARCHAR(5),
    nombre_achat            INT,
    PRIMARY KEY(id_utilisateur)
) ENGINE = MYISAM;

/*==============================================================*/
/* Table: fonction */
/*==============================================================*/

CREATE TABLE fonction
(
    id_fonction             INT NOT NULL auto_increment,
    nom_fonction            VARCHAR(100),
    PRIMARY KEY(id_fonction)
); ENGINE = MYISAM;

ALTER TABLE utilisateur ADD CONSTRAINT FK_Client_Fonction FOREIGN KEY (id_fonction) REFERENCES fonction(id_fonction)