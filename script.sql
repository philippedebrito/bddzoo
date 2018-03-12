------------------------------------------------------------
-- Script Postgre
------------------------------------------------------------
------------------------------------------------------------
-- Table: employe
------------------------------------------------------------
CREATE TABLE public.employe(
id_pe SERIAL NOT NULL ,
nom VARCHAR (25) ,
prenom VARCHAR (35) NOT NULL ,
CONSTRAINT prk_constraint_employe PRIMARY KEY (id_pe)
)WITHOUT OIDS;
------------------------------------------------------------
-- Table: secteur
------------------------------------------------------------
CREATE TABLE public.secteur(
id_an SERIAL NOT NULL ,
secteur VARCHAR (45) NOT NULL ,
CONSTRAINT prk_constraint_secteur PRIMARY KEY (id_an)
)WITHOUT OIDS;
------------------------------------------------------------
-- Table: animaux
------------------------------------------------------------
CREATE TABLE public.animaux(
id_ani SERIAL NOT NULL ,
nom_com VARCHAR (40) NOT NULL ,
nom_scien VARCHAR (50) ,
nb_indi INT NOT NULL ,
id_ali INT ,
CONSTRAINT prk_constraint_animaux PRIMARY KEY (id_ani)
)WITHOUT OIDS;

------------------------------------------------------------
-- Table: alimentation
------------------------------------------------------------
CREATE TABLE public.alimentation(
id_ali SERIAL NOT NULL ,
type VARCHAR (25) NOT NULL ,
CONSTRAINT prk_constraint_alimentation PRIMARY KEY (id_ali)
)WITHOUT OIDS;
------------------------------------------------------------
-- Table: travailler
------------------------------------------------------------
CREATE TABLE public.travailler(
id_an INT NOT NULL ,
id_pe INT NOT NULL ,
CONSTRAINT prk_constraint_travailler PRIMARY KEY (id_an,id_pe)
)WITHOUT OIDS;
------------------------------------------------------------
-- Table: se situer
------------------------------------------------------------
CREATE TABLE public.se_situer(
id_an INT NOT NULL ,
id_ani INT NOT NULL ,
CONSTRAINT prk_constraint_se_situer PRIMARY KEY (id_an,id_ani)
)WITHOUT OIDS;
ALTER TABLE public.animaux ADD CONSTRAINT FK_animaux_id_ali FOREIGN KEY (id_ali)
REFERENCES public.alimentation(id_ali);
ALTER TABLE public.travailler ADD CONSTRAINT FK_travailler_id_an FOREIGN KEY
(id_an) REFERENCES public.secteur(id_an);
ALTER TABLE public.travailler ADD CONSTRAINT FK_travailler_id_pe FOREIGN KEY
(id_pe) REFERENCES public.employe(id_pe);
ALTER TABLE public.se_situer ADD CONSTRAINT FK_se_situer_id_an FOREIGN KEY
(id_an) REFERENCES public.secteur(id_an);
ALTER TABLE public.se_situer ADD CONSTRAINT FK_se_situer_id_ani FOREIGN KEY
(id_ani) REFERENCES public.animaux(id_ani);