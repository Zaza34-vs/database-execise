/*
..######..########.##.......########..######..########
.##....##.##.......##.......##.......##....##....##...
.##.......##.......##.......##.......##..........##...
..######..######...##.......######...##..........##...
.......##.##.......##.......##.......##..........##...
.##....##.##.......##.......##.......##....##....##...
..######..########.########.########..######.....##...
*/
-- PERMET DE SELECTIONNER UNE OU PLUSIEURS COLONNES D'UNE TABLE
-- synthaxe
SELECT nom_champ FROM nom_tableau

-- pour obtenir plusieurs colonnes
SELECT prenom, nom FROM client

-- obtenir toutes les colonnes d'un tableau
SELECT * FROM client

-- requete select qui possède presque toutes les demandes possibles
SELECT *
FROM table
WHERE condition
GROUP BY expression
HAVING condition
{ UNION | INTERSECT | EXCEPT} 
ORDER BY expression
LIMIT count
OFFSET start

-- where s'utilise en complément à une requete select
SELECT nom_colonnes FROM nom_table WHERE condition

/*
Le select avec jointures sur plusieurs tables
*/

SELECT * FROM label INNER JOIN table2 ON table1.id = table2.fk_id

 -- EQUIVALENT
SELECT * FROM table1, table2 WHERE table1.id = table2.fk_id

/*
.####.##....##..######..########.########..########....####.##....##.########..#######.
..##..###...##.##....##.##.......##.....##....##........##..###...##....##....##.....##
..##..####..##.##.......##.......##.....##....##........##..####..##....##....##.....##
..##..##.##.##..######..######...########.....##........##..##.##.##....##....##.....##
..##..##..####.......##.##.......##...##......##........##..##..####....##....##.....##
..##..##...###.##....##.##.......##....##.....##........##..##...###....##....##.....##
.####.##....##..######..########.##.....##....##.......####.##....##....##.....#######.
*/
-- PERMET D'INSERER UNE LIGNE EN SPECIFIANT LE NMBRE DE COLONNE SOUHAITEE

-- syntaxe sur une ligne 
INSERT INTO table VALUES('value 1', 'value 2')

-- syntaxe
INSERT INTO table (nom_colonne_1, nom_colonne_2, ...) VALUES ('valeur 1', 'valeur 2', ...)

-- insertion de plusieurs lignes
INSERT INTO client (prenom, nom, ville, age) VALUES
('Rébecca', 'Armand', 'Saint-Didier-des-Bois', 24),
('Aimée', 'Hebert', 'Marigny-le-Châtel', 36),
('Marielle', 'Ribeiro', 'Maillères', 27),

('Hilaire', 'Savary', 'Conie-Molitard', 58);

/*
.##.....##.########..########.....###....########.########
.##.....##.##.....##.##.....##...##.##......##....##......
.##.....##.##.....##.##.....##..##...##.....##....##......
.##.....##.########..##.....##.##.....##....##....######..
.##.....##.##........##.....##.#########....##....##......
.##.....##.##........##.....##.##.....##....##....##......
..#######..##........########..##.....##....##....########
*/

-- permet d'effectuer des modifications sur des lignes déjà existantes
-- synthaxe
UPDATE table SET nom_colonne_1 = 'nouvelle valeur' WHERE condition

UPDATE table SET colonne_1 = 'valeur 1', colonne_2 = 'valeur 2', colonne_3 = 'valeur 3' WHERE condition


/*
.########..########.##.......########.########.########
.##.....##.##.......##.......##..........##....##......
.##.....##.##.......##.......##..........##....##......
.##.....##.######...##.......######......##....######..
.##.....##.##.......##.......##..........##....##......
.##.....##.##.......##.......##..........##....##......
.########..########.########.########....##....########
*/

-- permet de supprimer des lignes

DELETE FROM table WHERE condition

-- !!!!! s'il n'y a pas de condition where, toutes les lignes seront supprimées et la table sera vide

/* Exemple */

-- Si l’ont souhaite supprimer les utilisateurs qui se sont inscrit avant le « 10/04/2012″, il va falloir effectuer la requête suivante :

DELETE FROM utilisateur WHERE date_inscription < '2012-04-10'

/*
.########..####..######..########.####.##....##..######..########
.##.....##..##..##....##....##.....##..###...##.##....##....##...
.##.....##..##..##..........##.....##..####..##.##..........##...
.##.....##..##...######.....##.....##..##.##.##.##..........##...
.##.....##..##........##....##.....##..##..####.##..........##...
.##.....##..##..##....##....##.....##..##...###.##....##....##...
.########..####..######.....##....####.##....##..######.....##...
*/

-- PERMET DE LIRE LES DONNEES D'UNE OU PLUSIEURS COLONNES
--synthaxe
SELECT DISTINCT nom_colonne FROM nom_tableau

-- une variante existe aussi pour le SGBD oracle 
SELECT UNIQUE nom_colonne FROM nom_tableau

/*
L’utilisation de la commande DISTINCT est très pratique pour éviter les résultats en doubles. 
Cependant, pour optimiser les performances il est préférable d’utiliser 
la commande SQL GROUP BY lorsque c’est possible.
*/

/*
....###.....######.
...##.##...##....##
..##...##..##......
.##.....##..######.
.#########.......##
.##.....##.##....##
.##.....##..######.
*/
-- PERMET D'UTILISER DES ALIAS POUR RENOMMER UNE TABLE OU UNE COLONNE

/*
Alias sur une colonne
Pour renommer le nom d’une colonne dans les résultats d’une requête SQL. 
C’est pratique pour avoir un nom facilement identifiable dans une application qui doit ensuite exploiter les résultats d’une recherche.
*/

/* 
Alias sur une table
Pour attribuer un autre nom à une table dans une requête SQL. 
Cela peut aider à avoir des noms plus court, plus simple et plus facilement compréhensible. 
Ceci est particulièrement vrai lorsqu’il y a des jointures.
*/
-- synthaxe sur une colonne
SELECT colonne1 AS c1, colonne2 FROM `table`
        -- EQUIVALENT
SELECT colonne1 c1, colonne2 FROM `table` 

-- synthaxe sur une table 
SELECT * FROM `nom_table` AS t1
        -- EQUIVALENT
SELECT * FROM `nom_table` t1

/*
.##......##.##.....##.########.########..########
.##..##..##.##.....##.##.......##.....##.##......
.##..##..##.##.....##.##.......##.....##.##......
.##..##..##.#########.######...########..######..
.##..##..##.##.....##.##.......##...##...##......
.##..##..##.##.....##.##.......##....##..##......
..###..###..##.....##.########.##.....##.########
*/

-- PERMET D'EXTRAIRE DES LIGNES D'UNE BDD QUI  RESPECTENT UNE CONDITION
-- PERMET D'OBTENIR UNIQUEMENT LES INFOS RECHERCHEES

-- synthaxe en complement d'un select 
SELECT * FROM nom_table WHERE instruction 

--!!!! Il  y a quelques opérateurs qui n'existe pas dans de vieilles versions de SGBD.
--!!!! De nouveaux opérateurs non indiqués dans ce document peuvent exister dans d'autres SGBD

/*
....###....##....##.########.......####........#######..########.
...##.##...###...##.##.....##.....##..##......##.....##.##.....##
..##...##..####..##.##.....##......####.......##.....##.##.....##
.##.....##.##.##.##.##.....##.....####........##.....##.########.
.#########.##..####.##.....##....##..##.##....##.....##.##...##..
.##.....##.##...###.##.....##....##...##......##.....##.##....##.
.##.....##.##....##.########......####..##.....#######..##.....##
*/

---PERMET DE COMBINER DES CONDITIONS AU SEIN D'UNE COMMANDE WHERE

-- synthaxe des opérateurs and et or

SELECT nom_colonne FROM nom_table WHERE condition1 AND condition2
---- permet de s'assurer que la condition 1 et la condition 2 soient vraies

SELECT nom_colonne FROM nom_table WHERE condition1 OR condition2
---- permet de s'assurer que la condition 1 ou la condition 2 soient vraies

/*
Ces opérateurs peuvent être combinés à l’infini et mélangés. 
L’exemple ci-dessous filtre les résultats de la table « nom_table » 
si condition1 ET condition2 OU condition3 est vrai :
*/

SELECT nom_colonne FROM nom_table WHERE condition1 AND (condition2 OR condition3)
---!!!! il faut penser à utiliser des parenthèses lorsque c’est nécessaire. 
---!!!Cela permet d’éviter les erreurs car et ça améliore la lecture d’une requête par un humain.

---- Exemples avec les opérateurs AND et OR
SELECT * FROM produit WHERE categorie = 'informatique' AND stock < 20
SELECT * FROM produit WHERE nom = 'ordinateur' OR nom = 'clavier'
SELECT * FROM produit WHERE ( categorie = 'informatique' AND stock < 20 ) OR ( categorie = 'fourniture' AND stock < 200 )

/*
.####.##....##
..##..###...##
..##..####..##
..##..##.##.##
..##..##..####
..##..##...###
.####.##....##
*/
---S'UTILISE AVEC LE WHERE ET PERMET DE VERIFIER  SI UNE COLONNE EST
--- EGALE A UNE DES VALEURS OU UNE AUTRE ET AINSI DE SUITE SANS AVOIR
--- A UTILISER DE MULTIPLES FOIS L'OPERATEUR OR

--- syntaxe
SELECT nom_colonne FROM nom_table WHERE nom_colonne IN (valeur1, valeur2, valeur3, ...)
---** Entre parenthèses, il n'y a pas de limite du nombre d'arguments
---- Utiliser la syntaxe IN est plus simple que d'utiliser une succession d'operateur OR.

/*
.##.......####.##....##.########
.##........##..##...##..##......
.##........##..##..##...##......
.##........##..#####....######..
.##........##..##..##...##......
.##........##..##...##..##......
.########.####.##....##.########
*/

---PERMET D'EFFECTUER UNE RECHERCHE  SUR UN MODELE PARTICULIER
--- Il est possible de rechercher par exemple les enregistrements dont la valeur d'une colonne
---commence par telle ou telle lettre.

--- syntaxe
SELECT * FROM table WHERE colonne LIKE modele 

/*
Dans cet exemple le « modèle » n’a pas été défini, mais il ressemble très généralement à l’un des exemples suivants :
• LIKE ‘%a’ : le caractère « % » est un caractère joker qui remplace tous les autres caractères. 
Ainsi, ce modèle permet de rechercher toutes les chaines de caractère qui se termine par un « a ».
• LIKE ‘a%’ : ce modèle permet de rechercher toutes les lignes de « colonne » qui commence par un « a ».
• LIKE ‘%a%’ : ce modèle est utilisé pour rechercher tous les enregistrement qui utilisent le caractère « a ».
• LIKE ‘pa%on’ : ce modèle permet de rechercher les chaines qui commence par « pa » et qui se terminent par « on », comme « pantalon » ou « pardon ».
• LIKE ‘a_c’ : peu utilisé, le caractère « _ » (underscore) peut être remplacé par n’importe quel caractère, 
mais un seul caractère uniquement (alors que le symbole pourcentage « % ») 
peut être remplacé par un nombre incalculable de caractères . Ainsi, ce modèle permet de retourner les lignes « aac », « abc » ou même « azc ».
*/

/*
.####..######.....##....##.##.....##.##.......##.............##....####..######.....##....##..#######..########....##....##.##.....##.##.......##......
..##..##....##....###...##.##.....##.##.......##............##......##..##....##....###...##.##.....##....##.......###...##.##.....##.##.......##......
..##..##..........####..##.##.....##.##.......##...........##.......##..##..........####..##.##.....##....##.......####..##.##.....##.##.......##......
..##...######.....##.##.##.##.....##.##.......##..........##........##...######.....##.##.##.##.....##....##.......##.##.##.##.....##.##.......##......
..##........##....##..####.##.....##.##.......##.........##.........##........##....##..####.##.....##....##.......##..####.##.....##.##.......##......
..##..##....##....##...###.##.....##.##.......##........##..........##..##....##....##...###.##.....##....##.......##...###.##.....##.##.......##......
.####..######.....##....##..#######..########.########.##..........####..######.....##....##..#######.....##.......##....##..#######..########.########
*/

--- En SQL IS permet de filtrer les résultats qui contiennent la valeur NULL.
--- Il est indispensable car NULL est inconnu et ne peut être traité par les autres
--- opérateurs de comparaison

---syntaxe 
SELECT * FROM `table` WHERE nom_colonne IS NULL


--- A l'inverse, pour obtenir les resultats qui ne sont pas NULL 
SELECT * FROM `table` WHERE nom_colonne IS NOT NULL
/* 
---**l’opérateur IS retourne en réalité un booléen, c’est à dire une valeur TRUE si la condition est vrai ou FALSE si la condition n’est pas respectée. 
---**Cet opérateur est souvent utilisé avec la condition WHERE mais peut aussi trouvé son utilité lorsqu’une sous-requête est utilisée.

*/

/*
..######...########...#######..##.....##.########.....########..##....##
.##....##..##.....##.##.....##.##.....##.##.....##....##.....##..##..##.
.##........##.....##.##.....##.##.....##.##.....##....##.....##...####..
.##...####.########..##.....##.##.....##.########.....########.....##...
.##....##..##...##...##.....##.##.....##.##...........##.....##....##...
.##....##..##....##..##.....##.##.....##.##...........##.....##....##...
..######...##.....##..#######...#######..##...........########.....##...
*/

---PERMET DE GROUPER PLUSIEURS RESULTATS ET UTILISER UNE FONCTION
--- DE TOTAUX SUR UN GROUPE DE RESULTAT

--- syntaxe d'utilisation de GROUP BY 
SELECT colonne1, fonction(colonne2) FROM table GROUP BY colonne1

--- cette commande doit toujours s'utiliser après la commande WHERE 
--- et avant la commande HAVING

/*
--!!! Il existe plusieurs fonctions qui peuvent être utilisées pour manipuler des enregistrements
--*** Ce sont les fonctions d'agrégations statistiques
• AVG() pour calculer la moyenne d’un set de valeur. 
Permet de connaître le prix du panier moyen pour de chaque client

• COUNT() pour compter le nombre de lignes concernées. 
Permet de savoir combien d’achats a été effectué par chaque client

• MAX() pour récupérer la plus haute valeur. 
Pratique pour savoir l’achat le plus cher

• MIN() pour récupérer la plus petite valeur. 
Utile par exemple pour connaître la date du premier achat d’un client

• SUM() pour calculer la somme de plusieurs lignes.
Permet par exemple de connaître le total de tous les achats d’un client
*/

/*
.##.....##....###....##.....##.####.##....##..######..
.##.....##...##.##...##.....##..##..###...##.##....##.
.##.....##..##...##..##.....##..##..####..##.##.......
.#########.##.....##.##.....##..##..##.##.##.##...####
.##.....##.#########..##...##...##..##..####.##....##.
.##.....##.##.....##...##.##....##..##...###.##....##.
.##.....##.##.....##....###....####.##....##..######..
*/

--presque similaire à WHERE à la seule différence que 
--HAVING permet de filtrer en utilisant des fonctions 
--telles que SUM(), COUNT(), AVG(), MIN() ou MAX().

---syntaxe 
SELECT colonne1, SUM(colonne2)
FROM nom_table
GROUP BY colonne1
HAVING fonction(colonne2) operateur valeur 

--!!! HAVING est très souvent utilisé en même temps que GROUP BY, 
--!!! alors que ce n'est pas forcement obligatoire

/*
..#######..########..########..########.########.....########..##....##
.##.....##.##.....##.##.....##.##.......##.....##....##.....##..##..##.
.##.....##.##.....##.##.....##.##.......##.....##....##.....##...####..
.##.....##.########..##.....##.######...########.....########.....##...
.##.....##.##...##...##.....##.##.......##...##......##.....##....##...
.##.....##.##....##..##.....##.##.......##....##.....##.....##....##...
..#######..##.....##.########..########.##.....##....########.....##...
*/

-- PERMET DE TRIER LES LIGNES DANS UN RESULTAT D'UNE REQUETE SQL

-- syntaxe 
SELECT colonne1, colonne2 FROM table ORDER BY colonne1

-- Pour inverser l'ordre de classement, on utilise le suffixe DESC
SELECT col, col2, col3 FROM table ORDER BY col DESC, col2 ASC 

/*
.##.......####.##.....##.####.########
.##........##..###...###..##.....##...
.##........##..####.####..##.....##...
.##........##..##.###.##..##.....##...
.##........##..##.....##..##.....##...
.##........##..##.....##..##.....##...
.########.####.##.....##.####....##...
*/
-- PERMET DE SPECIFIER LE NOMBRE MX DE RESULTAT QUE L'ON SOUHAITE OBTENIR
--!!! Selon le SGBD la syntaxe ne sera pas la même 

-- syntaxe simple
SELECT * FROM table LIMIT 10;

--***La bonne pratique consiste à utiliser également ORDER BY pour s'assurer
--*** que ce soit toujours les bonnes données qui sont présentées.
--*** si le système de tri est non spécifié, alors il est en principe inconnu

------LIMIT et OFFSET  avec PostgreSQL
            --*** OFFSET est une méthode pour décaler les lignes à obtenir 
SELECT * FROM table LIMIT 10 OFFSET 5
--*** Faire OFFSET 0 revient à ne pas utiliser d'offset

------LIMIT et OFFSET avec MySQL
SELECT * FROM table LIMIT  5, 10;

--*** C'est possible avec MySQL d'utiliser la syntaxe LIMIT OFFSET
--*** C'est plus recommandé pour un meileur migration vers un autre SGBD

/*
.##.....##.##....##.####..#######..##....##
.##.....##.###...##..##..##.....##.###...##
.##.....##.####..##..##..##.....##.####..##
.##.....##.##.##.##..##..##.....##.##.##.##
.##.....##.##..####..##..##.....##.##..####
.##.....##.##...###..##..##.....##.##...###
..#######..##....##.####..#######..##....##
*/
--PERMET DE METTRE BOUT A BOUT LES RESULTATS DE PLUSIEURS REQUETES UTILISANT
--- ELLES-MEMES LA REQUETE SELECT (concatène les résultats de 2 requêtes ou +)

---Pour l'utiliser, il faut que chacune des requêtes retourne le meme nombre de colonne, le meme type de données, le même ordre

--syntaxe 
SELECT * FROM table1 UNION SELECT * FROM table2


/*
.......##..#######..####.##....##.########.##.....##.########..########..######......######...#######..##.........
.......##.##.....##..##..###...##....##....##.....##.##.....##.##.......##....##....##....##.##.....##.##.........
.......##.##.....##..##..####..##....##....##.....##.##.....##.##.......##..........##.......##.....##.##.........
.......##.##.....##..##..##.##.##....##....##.....##.########..######....######......######..##.....##.##.........
.##....##.##.....##..##..##..####....##....##.....##.##...##...##.............##..........##.##..##.##.##.........
.##....##.##.....##..##..##...###....##....##.....##.##....##..##.......##....##....##....##.##....##..##.........
..######...#######..####.##....##....##.....#######..##.....##.########..######......######...#####.##.########...
*/
---- PERMET D'ASSOCIER PLUSIEURS TABLES DANS UNE MEME REQUETE
---- On exploite la puissances des BDD relationnelles pour obtenir des résultats qui combinent les données de plusieurs tables de maniere efficace 
/* 
--***Il y a plusieurs méthodes pour associer 2 tables ensemble. Voici la liste des différentes techniques qui sont utilisées :
--***• INNER JOIN : jointure interne pour retourner les enregistrements quand la condition est vrai dans les 2 tables. C’est l’une des jointures les plus communes.
--***• CROSS JOIN : jointure croisée permettant de faire le produit cartésien de 2 tables. En d’autres mots, permet de joindre chaque lignes d’une table avec chaque lignes d’une seconde table.
--*** Attention, le nombre de résultats est en général très élevé.
--***• LEFT JOIN (ou LEFT OUTER JOIN) : jointure externe pour retourner tous les enregistrements de la table de gauche (LEFT = gauche) même si la condition n’est pas vérifié dans l’autre table.
--***• RIGHT JOIN (ou RIGHT OUTER JOIN) : jointure externe pour retourner tous les enregistrements de la table de droite (RIGHT = droite) même si la condition n’est pas vérifié dans l’autre table.
--***• FULL JOIN (ou FULL OUTER JOIN) : jointure externe pour retourner les résultats quand la condition est vrai dans au moins une des 2 tables.
--***• SELF JOIN : permet d’effectuer une jointure d’une table avec elle-même comme si c’était une autre table.
--***• NATURAL JOIN : jointure naturelle entre 2 tables s’il y a au moins une colonne qui porte le même nom entre les 2 tables SQL
--***• UNION JOIN : jointure d’union
*/ 

/*
.####.##....##.##....##.########.########...........##..#######..####.##....##...
..##..###...##.###...##.##.......##.....##..........##.##.....##..##..###...##...
..##..####..##.####..##.##.......##.....##..........##.##.....##..##..####..##...
..##..##.##.##.##.##.##.######...########...........##.##.....##..##..##.##.##...
..##..##..####.##..####.##.......##...##......##....##.##.....##..##..##..####...
..##..##...###.##...###.##.......##....##.....##....##.##.....##..##..##...###...
.####.##....##.##....##.########.##.....##.....######...#######..####.##....##...
*/

----INNER JOIN, aussi appellé EQUIJOIN, est un type de jointure très commune
----pour lier plusieurs tables entre elles

----Elle retourne les enregistrements lorsqu'il y a au moins une ligne dans chaque colonne 
----qui correspond à la condition

----syntaxe 
SELECT * FROM table1 INNER JOIN table2 ON table1.id = table2.fk_id

----on peut aussi l'écrire comme ceci
SELECT * 
FROM table1 
INNER JOIN table2
WHERE table1.id = table2.fk_id

/*
.##.......########.########.########..........##..#######..####.##....##...
.##.......##.......##..........##.............##.##.....##..##..###...##...
.##.......##.......##..........##.............##.##.....##..##..####..##...
.##.......######...######......##.............##.##.....##..##..##.##.##...
.##.......##.......##..........##.......##....##.##.....##..##..##..####...
.##.......##.......##..........##.......##....##.##.....##..##..##...###...
.########.########.##..........##........######...#######..####.##....##...
*/
--- TYPE DE JOINTURE ENTRE 2 TABLES
--- PERMET DE LISTER TOUS LES RESULTATS DE LA TABLE DE GAUCHE

--syntaxe
SELECT * FROM table1 LEFT JOIN table2 ON table1.id = table2.fk_id

-- on peut aussi l'écrire comme ceci
SELECT *
FROM table1
LEFT OUTER JOIN table2 ON table1.id = table2.fk_id

/*
Cette requête est particulièrement intéressante pour récupérer les informations de table1 tout en récupérant les données associées, 
même s’il n’y a pas de correspondance avec table2. 
A savoir, s’il n’y a pas de correspondance les colonnes de table2 vaudront toutes NULL.
*/

/*
.########..####..######...##.....##.########..........##..#######..####.##....##
.##.....##..##..##....##..##.....##....##.............##.##.....##..##..###...##
.##.....##..##..##........##.....##....##.............##.##.....##..##..####..##
.########...##..##...####.#########....##.............##.##.....##..##..##.##.##
.##...##....##..##....##..##.....##....##.......##....##.##.....##..##..##..####
.##....##...##..##....##..##.....##....##.......##....##.##.....##..##..##...###
.##.....##.####..######...##.....##....##........######...#######..####.##....##
*/ 
-- TYPE DE JOINTURE ENTRE 2 TABLES
-- PERMET DE RETOURNER TOUS LES ENREGISTREMENTS DE LA TABLE DE DROITE

-- syntaxe
SELECT * FROM table1 RIGHT JOIN table2 ON table1.id = table2.fk_id

-- on peut aussi l'écrire comme ceci
SELECT *
FROM table1
RIGHT OUTER JOIN table2 ON table1.id = table2.fk_id
/*
Attention, la valeur NULL n’est pas une chaîne de caractère. 
Pour filtrer sur ces caractères il faut utiliser la commande IS NULL. 
Par exemple, pour lister les utilisateurs qui n’ont pas effectués d’achats 
il est possible d’utiliser la requête suivante.
*/
/*
.########.##.....##.########..##..........###....####.##....##...
.##........##...##..##.....##.##.........##.##....##..###...##...
.##.........##.##...##.....##.##........##...##...##..####..##...
.######......###....########..##.......##.....##..##..##.##.##...
.##.........##.##...##........##.......#########..##..##..####...
.##........##...##..##........##.......##.....##..##..##...###...
.########.##.....##.##........########.##.....##.####.##....##...
*/
--- L'instruction explain est à utiliser juste avant un SELECT et permet 
--- d'afficher le plan d'execution d'une requête SQL 

-- Cela permet de savoir de quelle manière le SGBD va exécuter la requête et s’il va utiliser des index et lesquels.

/***
Le résultat de cette instruction est différent selon les SGBD, tel que MySQL ou PostgreSQL. 
Par ailleurs, le nom de cette instruction diffère pour certains SGBD :
--**MySQL : EXPLAIN
--**• PostgreSQL : EXPLAIN
--**• Oracle : EXPLAIN PLAN
--**• SQLite : EXPLAIN QUERY PLAN
--**• SQL Server :
--*****SET SHOWPLAN_ALL : informations estimées d’une requête SQL, affiché au format textuel détaillé
--*****SET SHOWPLAN_TEXT : informations estimées d’une requête SQL, affiché au format textuel simple
--*****SET SHOWPLAN_XML : informations estimées d’une requête SQL, affiché au format XML SET STATISTICS PROFILE : statistiques sur l’exécution d’une requête SQL, affiché au format textuel
--*****SET STATISTICS XML : statistiques sur l’exécution d’une requête SQL, affiché au format XML
--**• Firebird : SET PLANONLY ON; puis l’exécution de la requête SQL à analyser

*/

-- syntaxe
EXPLAIN SELECT * 
FROM `user`
ORDER BY `id` DESC

--- Pour l'exemple de structuration et des détails sur EXPLAIN 
-- voir le fichier : SQL_MYSQL_Instructions-v1-0.pdf