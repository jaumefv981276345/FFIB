
use ffib;

# Equip ----------------------

ALTER TABLE Equip 
DROP FOREIGN KEY equip_ibfk_4;

ALTER TABLE Equip 
DROP COLUMN id_classificacio;

ALTER TABLE Equip 
DROP INDEX nom;

# Classificacio ----------------------

ALTER TABLE Classificacio 
ADD id_equip SMALLINT;

ALTER TABLE Classificacio
ADD FOREIGN KEY (id_equip) REFERENCES Equip(id_equip);

# Camp -----------------------

ALTER TABLE Camp 
MODIFY COLUMN tipus ENUM('Herba sintètica', 'Gespa natural', 'Gespa artificial', 'Terra/Terreny', 'Sorra', 'Mixt (híbrid)', 'Grava');

ALTER TABLE Camp
DROP COLUMN vallado,
DROP COLUMN antidopaje,
DROP COLUMN despatx,
DROP COLUMN internet;

ALTER TABLE Camp 
MODIFY COLUMN codi_postal VARCHAR(5) NULL;

ALTER TABLE Camp
ADD serveis SET('Vallat', 'Sala antidopatge', 'Despatx Arbitral', 'Internet');

# Club ------------------------

ALTER TABLE Club
DROP COLUMN ubicacio,
DROP COLUMN codigo,
DROP COLUMN pagina;

ALTER TABLE Club 
MODIFY codi_postal VARCHAR(5) NULL;

ALTER TABLE Club
ADD COLUMN municipi VARCHAR(100),
ADD COLUMN delegacio ENUM('Mallorca', 'Menorca', 'Eivissa - Formentera') NOT NULL,
ADD COLUMN escut VARCHAR(30);

# Jugador -------------------

ALTER TABLE Jugador
ADD COLUMN data_naixement DATE NOT NULL;

ALTER TABLE Jugador 
DROP COLUMN edat;

ALTER TABLE Jugador 
DROP FOREIGN KEY jugador_ibfk_2;

ALTER TABLE Jugador 
DROP COLUMN id_partit;

# Partit ---------------------

ALTER TABLE Partit 
DROP FOREIGN KEY partit_ibfk_1,
DROP FOREIGN KEY partit_ibfk_2;

ALTER TABLE Partit
DROP COLUMN id_equip, 
DROP COLUMN id_camp,
DROP COLUMN resultat, 
DROP COLUMN transcurso, 
DROP COLUMN fecha;

ALTER TABLE Partit
ADD jornada TINYINT UNSIGNED,
ADD data DATE,
ADD hora TIME,
ADD estat ENUM('F', 'J', 'C'),
ADD local SMALLINT;

ALTER TABLE Partit
ADD FOREIGN KEY (local) REFERENCES Equip(id_equip);

# Convocat

ALTER TABLE Convocat 
MODIFY titular BOOL;

ALTER TABLE convocat
ADD FOREIGN KEY (id_partit) REFERENCES partit(id_partit),
ADD FOREIGN KEY (id_jugador) REFERENCES jugador(id_jugador);

# Arbitre

ALTER TABLE Arbitre
DROP COLUMN tipus;

# Arbitra

RENAME TABLE arbitra TO partit_arbitre;

ALTER TABLE partit_arbitre
ADD COLUMN principal BOOL;

ALTER TABLE partit_arbitre
ADD FOREIGN KEY (id_arbitre) REFERENCES arbitre(id_arbitre),
ADD FOREIGN KEY (id_partit) REFERENCES partit(id_partit);

# Esdeveniment

ALTER TABLE Esdeveniment
MODIFY COLUMN tipus ENUM('CV', 'G', 'P', 'PP', 'TG', 'TV');

ALTER TABLE Esdeveniment
ADD COLUMN jugador_canvi SMALLINT,
ADD FOREIGN KEY (jugador_canvi) REFERENCES Jugador(id_jugador);