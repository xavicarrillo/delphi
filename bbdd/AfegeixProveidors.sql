begin
insert into ProducteProveidor (idproducte, idproveidor) values (:idproducte, :idproveidor);suspend;end

execute procedure AfegeixProveidors (37,44)