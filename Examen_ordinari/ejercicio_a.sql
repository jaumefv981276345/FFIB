
DELIMITER //

CREATE PROCEDURE jugadors_convocats(in nom_equip varchar(100),in partit smallint)  -- no necessitam 2 paràmetres. De fet no en necessitam cap.
BEGIN
	select count(id_jugador) from convocat co
	join jugador using (id_jugador)
	join equip eq using (id_equip)
	join partit pa using (id_partit) -- partit no ens fa falta
	where id_jugador = null and id_patit = partit and eq.nom = nom_equip; --id_jugador no pot ser mai null.
    
END//

call jugadors_convocats ('CD IBIZA ISLAS PITIUSAS', 1)
