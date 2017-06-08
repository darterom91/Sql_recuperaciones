create or replace function areaCirculo(radi number)
return number
is
radio number;
pi number;
res number;
begin
  radio:=radi;
  res:=radio*radio;
  pi:=3.1416;
  res:=res*pi;
return res;
end areaCirculo;


set serveroutput on
set verify off
set echo off

accept radi prompt 'inserta el radio: '
declare
res number;
nocontieneA EXCEPTION;
begin

if (&radi>0) then
dbms_output.put_line('El resultado es: '||res);
res:=areacirculo(&radi);
else 
dbms_output.put_line('es negativo: '||&radi);
end if;
end;