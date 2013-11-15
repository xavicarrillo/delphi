create procedure insertEntrada (idpp integer, quantitat integer, preu float)
returns as begin
insert into Entrada (idproducteProveidor, data, quantitat, preu) values  (:idpp, 'now', :quantitat, :preu);
suspend;
end