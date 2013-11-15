//execute procedure insertproducte('producte_proba', 'codi_proba', 12)

alter procedure insertproducte(producte varchar(40), codi varchar(10))
 returns as begin
 insert into producte (producte, codi) values (:producte, :codi);
 suspend;
end

--------------
alter procedure insertproducte (producte varchar(40), codi varchar(10), idproveidor integer)
 returns (idproducte integer) as begin
 idproducte=GEN_ID(cont_producte,0) +1;
 insert into producte (producte, codi) values (:producte, :codi);
 insert into ProducteProveidor (idproducte, idproveidor) values (:idproducte, :idproveidor);
 suspend;
end

