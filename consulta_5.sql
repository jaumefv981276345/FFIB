select ar.nom as nom_arbitre, count(pa.id_arbitre) as num_partits from partit_arbitre pa
	join arbitre ar using (id_arbitre)
where pa.principal = 1 
group by ar.nom
order by num_partits desc
limit 1;