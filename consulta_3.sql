select eq.nom as nom_equip, cl.nom as nom_club, count(p.id_partit) as partits_jugats from equip eq
join club cl using (id_club)
join partit p on id_equip = local or id_equip = visitant
group by cl.nom, eq.nom
order by partits_jugats desc
limit 1;