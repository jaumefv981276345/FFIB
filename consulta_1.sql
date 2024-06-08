
select pa.id_partit, eq.nom as nom_equip from partit pa
join equip eq on pa.local = eq.id_equip
join convocat co using (id_partit)
join jugador ju using (id_jugador)
group by pa.id_partit, eq.nom
having count(ju.id_jugador) < 11

union

select pa.id_partit, eq.nom as nom_equip from partit pa
join equip eq on pa.visitant = eq.id_equip
join convocat co using (id_partit)
join jugador ju using (id_jugador)
group by pa.id_partit, eq.nom
having count(ju.id_jugador) < 11