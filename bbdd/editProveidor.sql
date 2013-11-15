create procedure editaProveidor (proveidor varchar(50), idproveidor integer)

 as begin
   update proveidor set proveidor=:proveidor where    idproveidor=:idproveidor;
 suspend;
end

execute procedure edita proveidor('caca',21)