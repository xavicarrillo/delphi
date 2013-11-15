create procedure insertproveidor(proveidor varchar(50))
 returns as begin
  insert into proveidor (producte) values (:producte);
 suspend;
end


//execute procedure insertproveidor('proveidor_proba')