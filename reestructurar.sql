
ALTER TABLE `ffib`.`camp` 
CHANGE COLUMN `localitzacio` `localitzacio` VARCHAR(255) NULL DEFAULT NULL AFTER `serveis`,
CHANGE COLUMN `codi_postal` `codi_postal` VARCHAR(5) NULL DEFAULT NULL AFTER `localitzacio`;

ALTER TABLE `ffib`.`classificacio` 
CHANGE COLUMN `id_equip` `id_equip` SMALLINT NULL DEFAULT NULL AFTER `id_classificacio`;

ALTER TABLE `ffib`.`club` 
CHANGE COLUMN `delegacio` `delegacio` ENUM('Mallorca', 'Menorca', 'Eivissa - Formentera') NOT NULL AFTER `nom`,
CHANGE COLUMN `carrer` `carrer` VARCHAR(255) NULL DEFAULT NULL AFTER `municipi`,
CHANGE COLUMN `codi_postal` `codi_postal` VARCHAR(5) NULL DEFAULT NULL AFTER `escut`;

ALTER TABLE `ffib`.`equip` 
CHANGE COLUMN `id_club` `id_club` SMALLINT NULL DEFAULT NULL AFTER `id_equip`,
CHANGE COLUMN `id_camp` `id_camp` SMALLINT NULL DEFAULT NULL AFTER `id_club`,
CHANGE COLUMN `id_subcategoria` `id_subcategoria` TINYINT NULL DEFAULT NULL AFTER `id_camp`,
CHANGE COLUMN `nom` `nom` VARCHAR(50) NOT NULL AFTER `id_subcategoria`;

ALTER TABLE `ffib`.`esdeveniment` 
CHANGE COLUMN `id_partit` `id_partit` SMALLINT NULL DEFAULT NULL AFTER `id_esdeveniment`,
CHANGE COLUMN `id_jugador` `id_jugador` SMALLINT NULL DEFAULT NULL AFTER `id_partit`;

ALTER TABLE `ffib`.`jugador` 
CHANGE COLUMN `id_equip` `id_equip` SMALLINT NULL DEFAULT NULL AFTER `id_jugador`,
CHANGE COLUMN `data_naixement` `data_naixement` DATE NOT NULL AFTER `nom`;

ALTER TABLE `ffib`.`partit` 
CHANGE COLUMN `estat` `estat` ENUM('F', 'J', 'C') NULL DEFAULT NULL AFTER `id_partit`,
CHANGE COLUMN `jornada` `jornada` TINYINT NULL DEFAULT NULL AFTER `estat`,
CHANGE COLUMN `local` `local` SMALLINT NULL DEFAULT NULL AFTER `jornada`;

ALTER TABLE `ffib`.`subcategoria` 
CHANGE COLUMN `id_categoria` `id_categoria` TINYINT NULL DEFAULT NULL AFTER `id_subcategoria`;
