create procedure TreuProveidors (idproducte integer, idproveidor integer)
returns as begin
delete from ProducteProveidor where idproveidor=:idproveidor and idproducte=:idproducte;
suspend;
end;

execute procedure TreuProveidors (33,44)