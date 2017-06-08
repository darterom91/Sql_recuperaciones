
--Bloques
--buscar empleados y departamentos
set serveroutput on
set verify off
set echo off
accept id_emp prompt 'inserta un codigo de empleados'
begin
nomEmp(&id_emp);
Emp(&id_emp);
end;

--insetar departamento
set serveroutput on
set verify off
set echo off
accept id_dep prompt 'inserta un codigo de departamento'
accept nom_dep prompt 'inserta un nombre de departamento'
accept man_dep prompt 'inserta el manager id'
accept loc_dep prompt 'inserta la localizacion'
begin
dep_ins(&id_dep, '&nom_dep', &man_dep, &loc_dep);
end;

--borrar departamento
set serveroutput on
set verify off
set echo off
accept id_dep prompt 'inserta un codigo de departamento'
begin
dep_del(&id_dep);
end;

--contar empleados
set serveroutput on
set verify off
set echo off
accept id_dep prompt 'inserta un codigo de departamento'
declare
total number;
begin
total:=contar(&id_dep);
dbms_output.put_line('El numero de empleados es de: '||total);
end;

--cambiar comision
set serveroutput on
set verify off
set echo off
accept emp_id prompt 'inserta el salario'
declare
salario employees.salary%type;
comision employees.commission_pct%type;
begin
  select salary
    into salario
  from employees
    where employee_id = &emp_id;

  if salario<10000 then
    comision:= 0.1;
  elsif salario BETWEEN 10000 AND 15000 then
    comision:= 0.15;
  elsif salario >=20000 then
    comision:= 0.20;
  else
    comision:= 0;
  end if;
  
  update employees
  set COMMISSION_PCT = comision
    where employee_id = &emp_id;
    dbms_output.put_line('La comision fue cambiada a: '||comision);
end;


--procedures
--ej1
create or replace
procedure nomEmp(id_emp number)
is
empleados EMPLOYEES%ROWTYPE;
begin
select *
into empleados
from employees
where employee_id = id_emp;
dbms_output.put_line('El empleado es: '||empleados.employee_id||'  '||empleados.first_name||'  '||empleados.job_id||'  '||empleados.salary);
dep(empleados.department_id);
end;
--ej2
create or replace
procedure dep(id_dep number)
is
departamentos departments%ROWTYPE;
begin
select *
into departamentos
from departments
where department_id = id_dep;
dbms_output.put_line('El departamento es: '||departamentos.department_id||'  '||departamentos.department_name||'  '||departamentos.manager_id||'  '||departamentos.location_id);
exception
when no_data_found then
dbms_output.put_line('el id: '||id_dep||' no existe');
when others then
dbms_output.put_line('Error indeterminado... ');
end;
--ej3
create or replace
procedure dep_ins(id_dep number, nom_dep varchar, man_dep number, loc_dep number)
is
begin
insert into departments
values(id_dep, nom_dep, man_dep, loc_dep);
dbms_output.put_line('Department inserted');
end;

create or replace
procedure dep_del(id_dep number)
is
begin
delete from departments
where department_id = id_dep;
dbms_output.put_line('Department delete!!');
end;

--ej4
create or replace
procedure Emp(emp_id number)
is
cod employees.employee_id%TYPE;
nom employees.first_name%TYPE;
jobs employees.job_id%TYPE;
salario employees.salary%TYPE;
dept employees.department_id%Type;
begin
select employee_id, first_name, job_id, salary, department_id
into cod, nom, jobs, salario, dept
from employees
where employee_id = emp_id;
dbms_output.put_line(cod||'  '||nom||'  '||jobs||'  '||salario);
dep(dept);
end;

--function 

create or replace function contar(dept_id number)
return number
as
cuenta number;
begin
  select count(employee_id)
    into cuenta
  from employees
    where department_id=dept_id;
  return cuenta;
end contar;
