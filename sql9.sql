#------------------------------------------------------------
#        Script MySQL.
#------------------------------------------------------------


#------------------------------------------------------------
# Table: deces
#------------------------------------------------------------

CREATE TABLE deces(
        id_deces                Int  Auto_increment  NOT NULL ,
        proprio_deces_nom       Char (100) NOT NULL ,
        proprio_deces_prenom    Char (100) NOT NULL ,
        proprio_deces_adresse   Varchar (100) NOT NULL ,
        proprio_deces_telephone Int NOT NULL
	,CONSTRAINT deces_PK PRIMARY KEY (id_deces)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: vente
#------------------------------------------------------------

CREATE TABLE vente(
        id_vente          Int  Auto_increment  NOT NULL ,
        chenil_vente      Int NOT NULL ,
        particulier_vente Int NOT NULL ,
        association_vente Int NOT NULL ,
        don_du_chien      Int NOT NULL
	,CONSTRAINT vente_PK PRIMARY KEY (id_vente)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: proprio_naissance
#------------------------------------------------------------

CREATE TABLE proprio_naissance(
        id_naissance                Int  Auto_increment  NOT NULL ,
        proprio_naissance_nom       Char (100) NOT NULL ,
        proprio_naissance_prenom    Char (100) NOT NULL ,
        proprio_naissance_adresse   Varchar (100) NOT NULL ,
        proprio_naissance_telephone Int NOT NULL
	,CONSTRAINT proprio_naissance_PK PRIMARY KEY (id_naissance)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: chien
#------------------------------------------------------------

CREATE TABLE chien(
        id_chien    Int  Auto_increment  NOT NULL ,
        nom_chien   Char (100) NOT NULL ,
        race_chien  Char (100) NOT NULL ,
        sexe_chien  Char (100) NOT NULL ,
        poids_chien Int NOT NULL
	,CONSTRAINT chien_PK PRIMARY KEY (id_chien)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: chien__proprio_naissance
#------------------------------------------------------------

CREATE TABLE chien__proprio_naissance(
        id_naissance Int NOT NULL ,
        id_chien     Int NOT NULL
	,CONSTRAINT chien__proprio_naissance_PK PRIMARY KEY (id_naissance,id_chien)

	,CONSTRAINT chien__proprio_naissance_proprio_naissance_FK FOREIGN KEY (id_naissance) REFERENCES proprio_naissance(id_naissance)
	,CONSTRAINT chien__proprio_naissance_chien0_FK FOREIGN KEY (id_chien) REFERENCES chien(id_chien)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: chien__proprio_deces
#------------------------------------------------------------

CREATE TABLE chien__proprio_deces(
        id_deces Int NOT NULL ,
        id_chien Int NOT NULL
	,CONSTRAINT chien__proprio_deces_PK PRIMARY KEY (id_deces,id_chien)

	,CONSTRAINT chien__proprio_deces_deces_FK FOREIGN KEY (id_deces) REFERENCES deces(id_deces)
	,CONSTRAINT chien__proprio_deces_chien0_FK FOREIGN KEY (id_chien) REFERENCES chien(id_chien)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: vente__chien
#------------------------------------------------------------

CREATE TABLE vente__chien(
        id_vente Int NOT NULL ,
        id_chien Int NOT NULL
	,CONSTRAINT vente__chien_PK PRIMARY KEY (id_vente,id_chien)

	,CONSTRAINT vente__chien_vente_FK FOREIGN KEY (id_vente) REFERENCES vente(id_vente)
	,CONSTRAINT vente__chien_chien0_FK FOREIGN KEY (id_chien) REFERENCES chien(id_chien)
)ENGINE=InnoDB;

