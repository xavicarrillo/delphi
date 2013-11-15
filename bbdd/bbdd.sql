// CREATE DATABASE "D:\Xavi\delphi\projectes\stock oak\bbdd\aok.gdb" USER "SYSDBA" PASSWORD "masterkey";

CONNECT "D:\Xavi\delphi\projectes\stock oak\bbdd\aok.gdb" USER "SYSDBA" PASSWORD "masterkey";


/*
CREATE TABLE producte
     (
        idproducte integer not null,
        producte varchar(40),
	codi varchar(10) not null,
        quantitat float default 0,
	primary key (idproducte)
     );
*/
CREATE TABLE proveidor
     (
	idproveidor integer not null,
	proveidor varchar(50),
	primary key (idproveidor)
     );

CREATE TABLE producteproveidor
     (
	idproducteproveidor integer not null,
	idproducte integer not null,
	idproveidor integer not null,
	primary key (idproducteproveidor)
     );

CREATE TABLE entrada /*guarda els moviments d'entrada de productes*/
     (
	identrada integer not null,
	idproducteproveidor integer not null,
	data date,
	quantitat integer not null,
	preu float, /*preu de cada unitat, no del total. Es millor pasar-la aquí en lloc de a
		     producte perque així podem cambiar el preu al sortir.*/
	primary key (identrada)
     );

CREATE TABLE sortida /*guarda els moviments de sortida de productes*/
     (
	idsortida integer not null,
	idproducte integer not null, /* el proveidor ens es igual, per aixo l'agafem d'aquí */
	data date,
	quantitat integer not null,
	preu float,
	desti varchar(1) not null,
	primary key (idsortida)
     );

/* claus forànies: */

alter table producteproveidor add foreign key(idproducte) references producte(idproducte);
alter table producteproveidor add foreign key(idproveidor) references proveidor(idproveidor);

alter table entrada add foreign key(idproducteproveidor) references producteproveidor(idproducteproveidor);

alter table sortida add foreign key(idproducte) references producte(idproducte);


//contadors pels identificadors

create generator CONT_producte;
create generator CONT_proveidor;
create generator CONT_producteproveidor;
create generator CONT_entrada;
create generator CONT_sortida;

//triggers (s'ha de posar el SET TERM davant dels procediments, i els triggers ho són)

SET TERM ^;

create trigger TRI_quantitat for entrada active after insert as
begin
//akest trigger suma la quantitat que ens posen a la taula entrada (atraves del formulari Fentradas a la quantitat existent en la taula producte
 update producte set
   quantitat=quantitat+new.quantitat; 
end^

create trigger TRI_producte for producte active before insert as
 begin
  new.idproducte=gen_id(CONT_producte,1);
 end^

/* si no rula be treure-li el ^ */

create trigger TRI_proveidor for proveidor active before insert as
 begin
  new.idproveidor=gen_id(CONT_proveidor,1);
 end^

create trigger TRI_producteproveidor for producteproveidor active before insert as
 begin
  new.idproducteproveidor=gen_id(CONT_producteproveidor,1);
 end^

create trigger TRI_entrada for entrada active before insert as
 begin
  new.identrada=gen_id(CONT_entrada,1);
 end^

create trigger TRI_sortida for sortida active before insert as
 begin
  new.idsortida=gen_id(CONT_sortida,1);
 end^

SET TERM ;^


