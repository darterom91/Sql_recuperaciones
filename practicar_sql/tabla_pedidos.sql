drop table pedido;
drop table producto;
drop table vendedor;
drop table cliente;
drop table oficina;


create table vendedor
(
  Num_vendedor number(3) PRIMARY KEY,
  DNI number(8) not null,
  Nombre varchar2(20),
  Cod_oficina number(5) not null,
  Contrato  date DEFAULT SYSDATE,
  Director number(3),
  Objetivo number(9,2) check (Objetivo >0) ,
  Ventas number(9,2) check (Ventas >0)
);

create table cliente
(
  Numclie number(5) PRIMARY KEY,
  DNI number(8) not null,
  Nombre varchar2(20),
  Apellidos varchar2(80),
  Telef number(9),
  FechaNac date
);

create table producto
(
  Idprod number(4) primary key,
  Descripcion varchar2(20) not null,
  Precio number(7,2) check (Precio>0 or Precio is null)
);

create table oficina
(
  Cod_oficina number(5) primary key ,
  Direccion varchar2(25),
  Ciudad Varchar2(15) not null,
  Region varchar2(10),
  Objetivo number(9,2),
  Ventas number(9,2)
);

create table pedido
  (
    idpedido number(4,0),
    fechaped date default sysdate,
    numclie      number(5,0) not null enable,
    idprod       number(4,0) not null enable,
    num_vendedor number(3,0) not null enable,
    cantidad     number(3,0),
    check (cantidad >0) enable,
    constraint pedido_pk primary key (idpedido, fechaped),
    constraint pedido_cliente_fk foreign key (numclie) references cliente (numclie),
    constraint pedido_producto_fk foreign key (idprod) references producto (idprod),
    constraint pedido_vendedor_fk foreign key (num_vendedor) references vendedor (num_vendedor)
  );