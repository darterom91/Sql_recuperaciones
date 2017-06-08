drop trigger auditar_producte;
create or replace trigger auditar_producte
before insert or update or delete on producto
for each row
begin 
  if inserting then 
        insert into prod_audit
        values(:new.idprod, sysdate, 'I');
  end if;
  if updating then 
        insert into prod_audit
        values(:new.idprod, sysdate, 'U');
  end if;
  if Deleting then 
        insert into prod_audit
        values(:old.idprod, sysdate, 'D');
  end if;
end;
/
drop trigger update_venedor;

create or replace trigger update_venedor
before update  on vendedor
for each row
begin 
  if updating then     
    if :old.NUM_VENDEDOR != :new.NUM_VENDEDOR  then
     			RAISE_APPLICATION_ERROR(-20001,'ERROR: no se puede cambiar id vendedor!!!');
    end if;
    
    if :old.DNI != :new.DNI then
      		RAISE_APPLICATION_ERROR(-20001,'ERROR: no se puede cambiar dni vendedor!!!');
    end if;
    
    if :old.COD_OFICINA != :new.COD_OFICINA then
      		RAISE_APPLICATION_ERROR(-20001,'ERROR: no se puede cambiar cod_ofi vendedor!!!');
    end if;
  end if;
end;
/