-- ejercicio 1 
set serveroutput on
set verify off
set echo off

accept prodId prompt 'inserta el id del producto'
accept descrip prompt 'inserta el desc del producto'
accept precio prompt 'inserta el precio del producto'
begin

insert into producto(IDPROD, DESCRIPCION, PRECIO)
values(&prodId, '&descrip', &precio);
  dbms_output.put_line('BORRADO PRODUCTO');

Exception
when no_data_found then
  dbms_output.put_line('No se encontro datos');
when others then
  dbms_output.put_line('Error no determinado');
end;
/
-- update
set serveroutput on
set verify off
set echo off

accept prodId prompt 'inserta el id del producto'
accept descrip prompt 'inserta el desc del producto'
begin
  update producto
  set DESCRIPCION = '&descrip'
  where idprod = &prodId;
    dbms_output.put_line('MODIFICADO lA DESCRIPCION');
Exception
  when no_data_found then
    dbms_output.put_line('No se encontro datos');
  when others then
    dbms_output.put_line('Error no determinado');
end;
/
-- delete
set serveroutput on
set verify off
set echo off

accept prodId prompt 'inserta el id del producto'
begin
  delete from producto
  where idprod = &prodId;
  dbms_output.put_line('BORRADO PRODUCTO');
Exception
  when no_data_found then
    dbms_output.put_line('No se encontro datos');
  when others then
    dbms_output.put_line('Error no determinado');
end;
/

-- ejercicio 2
set serveroutput on
set verify off
set echo off
accept venId prompt 'introduce el id vendedor'
accept dni prompt 'introduce el dni vendedor'
accept nom prompt 'introduce el nombre vendedor'
accept cod_ofi prompt 'introduce el cod_ofi vendedor'
--accept obj prompt 'introduce el objetivo vendedor'
begin
insert into vendedor(NUM_VENDEDOR, DNI, NOMBRE, COD_OFICINA)
values (&venId, &dni, '&nom', &cod_ofi);
end;

set serveroutput on
set verify off
set echo off
begin
GESTO_VENTES.AUMENTAR_COM();
end;

-- ejercicio 3

-- num vendedor
set serveroutput on
set verify off
set echo off
accept idVend prompt 'Introduce el num vendedor'
accept num prompt 'introduce el num nuevo'  
begin
update vendedor
set num_vendedor = &num 
where num_vendedor = &idVend;
end;
-- dni
set serveroutput on
set verify off
set echo off
accept dniV prompt 'Introduce el dni vendedor'
accept num prompt 'introduce el dni nuevo'  
begin
update vendedor
set DNI = &num 
where DNI = &dniV;
end;
-- ofi
set serveroutput on
set verify off
set echo off
accept cod_ofi prompt 'Introduce el cod ofi vendedor'
accept num prompt 'introduce el num nuevo'  
begin
update vendedor
set cod_oficina = &num 
where cod_oficina = &cod_ofi;
end;

-- ejercicio 5
set serveroutput on
set verify off
set echo off
accept idcli prompt 'Introduce el id Cliente'
accept dni prompt 'introduce el dni cliente'
accept nom prompt 'introduce el nombre cliente' 
begin
gestion_cliente.aumentar_com(&idcli, &dni, '&nom');
end;