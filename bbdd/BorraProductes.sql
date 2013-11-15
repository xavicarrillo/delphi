//falta comprobar que no tingui cap entrada associada. (suposo que els references ja ho impediran

alter procedure BorrProductes (idproducte integer)
returns as begin
delete from producteProveidor where idproducte= :idproducte;
delete from producte where idproducte= :idproducte;
suspend;
end;