select * from proveidor where idproveidor not in (select idproveidor  from producteproveidor where idproducte=:idproducte)
