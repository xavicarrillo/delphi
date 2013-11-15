alter procedure editaProducte (producte varchar(50), idproducte integer, codi varchar(10), idproveidor integer, idproducteproveidor integer)

 as begin
   update producte set producte=:producte,  codi=:codi where idproducte=:idproducte;
   update ProducteProveidor set idproducte=:idproducte,  idproveidor=:idproveidor where idproducteproveidor=:idproducteproveidor;
   	   	
suspend;
end

execute procedure editaProducte ('nomProducte',33,'codinou', 44, 14)