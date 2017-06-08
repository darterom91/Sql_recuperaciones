-- ejercicio2
set serveroutput on
set verify off
set echo off

accept pel_id prompt 'introduce el codigo de la pelicula'
declare 
num number;
noexiste exception;
begin
num := existeCodPel(&pel_id);
if(num=1) then
tienePeli(&pel_id);
elsif(num=0)then
raise noexiste;
end if;
exception
when noexiste then
  dbms_output.put_line('No hay los datos selecc');
when no_data_found then
  dbms_output.put_line('No hay los datos selecc: '||&pel_id);
end;

--ejercicio 3
set serveroutput on
set verify off
set echo off
accept codSoc prompt 'inserta el numero de codigo'
accept codPel prompt 'inserta el numero de codigo'
declare 
numS number;
numP number;
begin
numS:=existeSoci(&codSoc);
numP:=existePel(&codPel);
if (numS=1)and(numP=1) then
dbms_output.put_line('existe: '||&codSoc);
dbms_output.put_line('existe: '||&codPel);
insertarTener(&codSoc, &codPel);
end if;
exception
when no_data_found then
dbms_output.put_line('No existe codSoc: '||&codSoc);
dbms_output.put_line('No existe codPel: '||&codPel);
end;

-- Ejercicio 4
set serveroutput on
set verify off
set echo off

accept minimo prompt 'Introduce el minimo'
accept maximo prompt 'introduce el maximo'
declare 
noMas Exception;
begin
  if &minimo < &maximo then
    dbms_output.put_line('El valor minimo: '||&minimo||' < maximo: '||&maximo);
    insertarSoci(&minimo, &maximo);
  else
   raise noMas;
  end if;
exception
when noMas then
dbms_output.put_line('El valor minimo: '||&minimo||' > maximo: '||&maximo);
when others then
dbms_output.put_line('Es mayor min que max');
end;

-- Ejercicio 4
set serveroutput on
set verify off
set echo off
accept num prompt 'Introduce el num: '
accept nombre prompt 'introduce el nom: '
declare 
  bol number;
  noExiste Exception;
begin
  bol := existeSoci(&num);
  if (bol=1) then
    dbms_output.put_line('Existe');
    actualizarSoci(&num, '&nombre');
  else 
    raise noExiste;
  end if;
exception
  when noExiste then
dbms_output.put_line('Existe');
  when others then
    dbms_output.put_line('alcutanos mascadonsius');
end;