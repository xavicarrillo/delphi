create view v_producte_proveidor as
select pp.idproducteproveidor,pp.idproducte,pp.idproveidor,prov.proveidor,prod.producte,prod.codi, prod.quantitat
from producteproveidor pp ,producte prod,proveidor prov
where pp.idproducte=prod.idproducte and pp.idproveidor=prov.idproveidor