drop package Gesto_ventes;

create or replace package Gesto_ventes
as
procedure aumentar_com;
end;


create or replace package body Gesto_ventes
as
  procedure aumentar_com
  is
  begin
    update vendedor
    set objetivo = objetivo * 1.10
    where objetivo is not null;
      dbms_output.put_line('objetivo no null modificado');
      
    update vendedor
    set objetivo = objetivo * 1.05
    where objetivo is null;
       dbms_output.put_line('objetivos null modificado');
       
  end aumentar_com;  
end;


drop package gestion_cliente;

  create or replace package gestion_cliente
  as
  procedure aumentar_com(idCli number, dniCli number, nom varchar);
  end;


create or replace package body gestion_cliente
as
  procedure aumentar_com(idCli number, dniCli number, nom varchar)
  as
  begin
    insert into cliente(numclie, dni, nombre)
    values(idCli, dniCli, nom);
      dbms_output.put_line('cliente insertado!!');    
    exception
    when others then
      dbms_output.put_line('Erron sin sentido');
  end aumentar_com;  
end;

