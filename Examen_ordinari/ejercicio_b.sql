DROP FUNCTION IF EXISTS tarjetes_vermelles;
DELIMITER //

CREATE FUNCTION tarjetes_vermelles(jugador smallint)
returns smallint
DETERMINISTIC
READS SQL DATA
BEGIN
declare cat smallint;
set cat = (
select count(tipus) from esdeveniment
where tipus = 'TV' and id_jugador = jugador);
return cat;
END//

DELIMITER ;
# Seleccionam un id de jugador (ex:172) ---------------------------
select tarjetes_vermelles(172)