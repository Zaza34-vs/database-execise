CREATE TABLE utilisateur (
id_utilisateur INT NOT NULL auto_increment, nom VARCHAR(100),
prenom VARCHAR(100), email VARCHAR(255),
date_naissance DATE, pays VARCHAR(255), ville VARCHAR(255),
code_postal VARCHAR(5), nombre_achat INT, PRIMARY KEY (id_utilisateur)
) ENGINE = MYISAM;

/*
id_utilisateur : identifiant unique qui est utilisé comme clé primaire et qui n’est pas nulle et dont l'id s'auto incrémente de 1 à chaque nouvel enregistrement.
• nom : nom de l’utilisateur dans une colonne de type VARCHAR avec un maximum de 100 caractères au maximum
• prenom : idem mais pour le prénom
• email : adresse email enregistré sous 255 caractères au maximum
• date_naissance : date de naissance enregistré au format AAAA-MM-JJ (exemple : 1973-11- 17)
• pays : nom du pays de l’utilisateur sous 255 caractères au maximum
• ville : idem pour la ville
• code_postal : 5 caractères du code postal
• nombre_achat : nombre d’achat de cet utilisateur sur le site
• PRIMARY KEY (id_utilisateur) : indique que id_utilisateur est la clé primaire
• ENGINE = MYISAM : voir chapitre 7
*/

-- exemple alter table
ALTER TABLE utilisateur
ADD adresse_rue VARCHAR(255)


-- exemple drop table
DROP TABLE client_2009

/* afficher les commandes associés aux utilisateurs*/
SELECT id, prenom, nom, date_achat, num_facture, prix_total FROM utilisateur INNER JOIN commande ON utilisateur.id = commande.utilisateur_id

-- equivalent
SELECT id, prenom, nom, date_achat, num_facture, prix_total FROM utilisateur, commande where utilisateur.id = commande.utilisateur_id

-- sql as
/*
Cas concrets d’utilisations sur une colonne :
• Une colonne qui s’appelle normalement c_iso_3166 peut être renommée « code_pays » (cf. le code ISO 3166 correspond au code des pays), 
ce qui est plus simple à comprendre dans le reste du code par un développeur.
• Une requête qui utilise la commande UNION sur des champs aux noms différents peut être ambigu pour un développeur. 
En renommant les champs avec un même nom il est plus simple de traiter les résultats.
• Lorsqu’une fonction est utilisé, le nom d’une colonne peut-être un peu complexe.
 Il est ainsi possible de renommer la colonne sur laquelle il y a une fonction SQL. 
 Exemple : SELECT COUNT(*) AS nombre_de_resultats FROM `table`.
• Lorsque plusieurs colonnes sont combinées il est plus simple de renommer la nouvelle colonne qui est une concaténation de plusieurs champs.
*/

---sql left join    
/*
Pour lister tous les utilisateurs avec leurs commandes et afficher également les utilisateurs qui n’ont pas effectuées d’achats, il est possible d’utiliser la requête suivante :
*/

SELECT * 
FROM utilisateur
LEFT JOIN commande ON utilisateur.id = commande.utilisateur_id

-------- filtrer sur la valeur NULL
/* --
Attention, la valeur NULL n’est pas une chaîne de caractère. 
Pour filtrer sur ces caractères il faut utiliser la commande IS NULL. Par exemple, pour lister les utilisateurs qui n’ont pas effectués d’achats il est possible d’utiliser la requête suivante.
*/

SELECT id, prenom, nom, utilisateur_id 
FROM utilisateur
LEFT JOIN commande ON utilisateur.id = commande.utilisateur_id
WHERE utilisateur_id IS NULL

-- sql right join  
/*
Pour afficher toutes les commandes avec le nom de l’utilisateur correspondant il est normalement d’habitude d’utiliser INNER JOIN en SQL. 
Malheureusement, si l’utilisateur a été supprimé de la table, alors ça ne retourne pas l’achat. L’utilisation de RIGHT JOIN permet de retourner tous les achats et d’afficher le nom de l’utilisateur s’il existe. 
Pour cela il convient d’utiliser cette requête :  
*/

SELECT id, prenom, nom, utilisateur_id, date_achat, num_facture 
FROM utilisateur
RIGHT JOIN commande ON utilisateur.id = commande.utilisateur_id