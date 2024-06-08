CREATE DATABASE FFIB;
USE FFIB;

CREATE TABLE Arbitre (
    id_arbitre TINYINT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(50) NOT NULL,
    tipus ENUM('principal', 'asistente')
);

CREATE TABLE Club (
    id_club SMALLINT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(50) NOT NULL UNIQUE,
    ubicacio VARCHAR(255),
    codigo SMALLINT UNSIGNED NOT NULL,
    pagina VARCHAR(64),
    carrer VARCHAR(255),
    codi_postal VARCHAR(5) NOT NULL,
    equipacio VARCHAR(50) NOT NULL
);

CREATE TABLE Classificacio (
    id_classificacio SMALLINT AUTO_INCREMENT PRIMARY KEY,
    pts TINYINT UNSIGNED,
    pj TINYINT UNSIGNED,
    pg TINYINT UNSIGNED,
    pe TINYINT UNSIGNED,
    pp TINYINT UNSIGNED,
    gf TINYINT UNSIGNED,
    gc TINYINT UNSIGNED,
    pen TINYINT UNSIGNED,
    ps TINYINT UNSIGNED
);

CREATE TABLE Categoria (
    id_categoria TINYINT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(100) NOT NULL
);

CREATE TABLE Subcategoria (
    id_subcategoria TINYINT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(100) NOT NULL,
    id_categoria TINYINT,
    FOREIGN KEY (id_categoria) REFERENCES Categoria(id_categoria)
);

CREATE TABLE Camp (
    id_camp SMALLINT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(50) NOT NULL UNIQUE,
    localitzacio VARCHAR(255),
    tipus ENUM('Cesped Artificial', 'Tierra', 'Goma'),
    clase ENUM('Futbol 7', 'Futbol 11', 'Futbol Sala'),
    codi_postal VARCHAR(5) NOT NULL,
    vallado ENUM('Si', 'No'),
    antidopaje ENUM('Si', 'No'),
    despatx ENUM('Si', 'No'),
    internet ENUM('Si', 'No'),
    carrer VARCHAR(255)
);

CREATE TABLE Equip (
    id_equip SMALLINT AUTO_INCREMENT PRIMARY KEY,
    nom_entrenador VARCHAR(100),
    nom VARCHAR(50) NOT NULL UNIQUE,
    id_subcategoria TINYINT,
    id_camp SMALLINT,
    id_club SMALLINT,
    id_classificacio SMALLINT,
    FOREIGN KEY (id_subcategoria) REFERENCES Subcategoria(id_subcategoria),
    FOREIGN KEY (id_camp) REFERENCES Camp(id_camp),
    FOREIGN KEY (id_club) REFERENCES Club(id_club),
    FOREIGN KEY (id_classificacio) REFERENCES Classificacio(id_classificacio)
);

CREATE TABLE Partit (
    id_partit SMALLINT AUTO_INCREMENT PRIMARY KEY,
    resultat ENUM('G', 'E', 'P'),
    transcurso ENUM('En proces', 'Acabat', 'Sense començar'),
    fecha DATE NOT NULL,
    id_equip SMALLINT,
    id_camp SMALLINT,
    visitant SMALLINT,
    FOREIGN KEY (id_equip) REFERENCES Equip(id_equip),
    FOREIGN KEY (id_camp) REFERENCES Camp(id_camp),
    FOREIGN KEY (visitant) REFERENCES Equip(id_equip)
);

CREATE TABLE arbitra (
    id_arbitre TINYINT,
    id_partit SMALLINT,
    PRIMARY KEY (id_arbitre, id_partit)
);

CREATE TABLE Jugador (
    id_jugador SMALLINT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(100) NOT NULL,
    edat TINYINT,
    dorsal TINYINT NOT NULL,
    id_equip SMALLINT,
    id_partit SMALLINT,
    FOREIGN KEY (id_equip) REFERENCES Equip(id_equip),
    FOREIGN KEY (id_partit) REFERENCES Partit(id_partit)
);

CREATE TABLE convocat (
    id_partit SMALLINT,
    id_jugador SMALLINT,
    titular ENUM('Si', 'No'),
    PRIMARY KEY (id_partit, id_jugador)
);

CREATE TABLE Esdeveniment (
    id_esdeveniment SMALLINT AUTO_INCREMENT PRIMARY KEY,
    tipus ENUM('G', 'Tg', 'Td', 'Tv', 'C'),
    minut TINYINT UNSIGNED NOT NULL,
    id_partit SMALLINT,
    id_jugador SMALLINT,
    FOREIGN KEY (id_partit) REFERENCES Partit(id_partit),
    FOREIGN KEY (id_jugador) REFERENCES Jugador(id_jugador)
);