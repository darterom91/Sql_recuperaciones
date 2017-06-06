set serveroutput on
set verify off
set echo off
accept id_emp prompt 'inserta un codigo de empleados'
begin
nomEmp(&id_emp);
Emp(&id_emp);
end;

set serveroutput on
set verify off
set echo off
accept id_dep prompt 'inserta un codigo de departamento'
accept nom_dep prompt 'inserta un nombre de departamento'
accept man_dep prompt 'inserta el manager id'
accept loc_dep prompt 'inserta la localizacion'
begin
dep_ins(&id_dep, '&nom_dep', &man_dep, '&loc_dep');
end;

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