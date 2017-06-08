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