
DROP TRIGGER IF EXISTS canvi_jugador;
DELIMITER //

CREATE TRIGGER canvi_jugador
BEFORE INSERT on esdeveniment

BEGIN
declare tipus smallint;
set tipus = (
	select titular from convocat
	where id_jugador = new.id_jugador);

	if tipus = 1 then
    send mesaje = ('Esta convocat com a suplent')
    elseif tipus = 0 then
    insert into 'convocat' (titular)
    values (1)
    else 
    insert into 'convocat' (id_partit, id_jugador, titular)
    values (new.id_partit, new.id_jugador, 1)
END//

DELIMITER ;
    
    
    

