select ju.nom as nom_jugador, eq.nom as nom_equip, count(es.id_esdeveniment) as num_gols from jugador ju
    join equip eq using (id_equip)
    join esdeveniment es on ju.id_jugador = es.id_jugador
where es.tipus = 'G'
group by ju.id_jugador, ju.nom, eq.nom
order by num_gols desc
limit 1;