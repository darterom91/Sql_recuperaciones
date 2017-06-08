
-- Ejercicio 2
create or replace procedure tienePeli(cod number)
is
cursor c1 is 
select cod_soc, cod_pel, fecha_dev
from tiene
where cod_pel = cod;
num number;
nombre varchar(20);
fecha varchar(30);
begin 
for var in c1 loop
    num:=var.cod_pel;

    select titulo
    into nombre
    from pelicula
    where cod_pel = num;
      dbms_output.put_line('El socio '||var.cod_soc||' tiene la peli '||nombre|| ' en la fecha: '||var.fecha_dev);         
    end loop;
end tienePeli;

create or replace function existeCodPel(cod number)
return number
is
num number;
codP tiene.cod_pel%type;
begin 
    select cod_pel
    into codP
    from pelicula
    where cod_pel = cod;
if(codP = cod ) then
  num:=1;
else
  num:=0;
end if;
return num;   
end existeCodPel;

-- Ejercicio 3
create or replace function existeSoci(cod number)
return number
is
num number;
codS socio.cod_soc%type;
begin 
    select cod_soc
    into codS
    from socio
    where cod_soc = cod;
if(codS = cod ) then
  num:=1;
else
  num:=0;
end if;
return num;   
end existeSoci;

create or replace function existePel(cod number)
return number
is
num number;
codP pelicula.cod_pel%type;
begin 
    select cod_pel
    into codP
    from pelicula
    where cod_pel = cod;
if(codP = cod ) then
  num:=1;
else
  num:=0;
end if;
return num;   
end existePel;

create or replace procedure insertarTener(codS number, codP number)
is
begin 
insert into tiene(cod_soc, cod_pel, fecha_adq)
values(codS , codP, sysdate);
dbms_output.put_line('insertado pedido de alquiler');
end insertarTener;

-- Ejercicio 4
create or replace procedure insertarSoci(minimo number, maximo number)
is
begin 
  for count1 in minimo..maximo loop
    dbms_output.put_line('insertado nuevo Socio');
    insert into socio(cod_soc)
    values(count1);
  end loop;
end insertarSoci;

create or replace procedure actualizarSoci(num number, nom varchar)
is
begin 
 update socio
 set nombre = nom
 where cod_soc= num;
 dbms_output.put_line('nombre de socio insertado');
end actualizarSoci;
