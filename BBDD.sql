--Practica SQL Pedro Dominguez Dominguez

--Creamos el esquema
--Para un correcto funcionamiento cada usuario debe de 
--usar su propio authorization

create schema car authorization maznpctl;


--1.Creamos tabla Grupo empresarial de los coches

create table car.Grupo(
	IdGrupo varchar(20) not null,--PK
	NombreGrupo varchar(50) not null
);

--PK Grupo
alter table car.Grupo
add constraint Grupo_PK primary key (IdGrupo);

--2.Creamos tabla Marca de los coches

create table car.Marca(
	IdMarca varchar(20) not null,--PK
	NombreMarca varchar(50) not null,
	IdGrupo varchar(20) not null --FK
);

--PK Marca
alter table car.Marca
add constraint Marca_PK primary key (IdMarca);

--FK Marca
alter table car.Marca 
add constraint Marca_Grupo_FK foreign key (IdGrupo) 
references car.Grupo(IdGrupo);


--3.Creamos tabla Modelo de los coches

create table car.Modelo(
	IdModelo varchar(20) not null,--PK
	NombreModelo varchar(50) not null,
	IdMarca varchar(20) not null --FK
);

--PK Marca
alter table car.Modelo
add constraint Modelo_PK primary key (IdModelo);

--FK Marca
alter table car.Modelo 
add constraint Modelo_Marca_FK foreign key (IdMarca) 
references car.Marca(IdMarca);

--4.Creamos tabla Color de los coches

create table car.Color(
	IdColor varchar(20) not null,--PK
	NombreColor varchar(50) not null
);

--PK Color
alter table car.Color
add constraint Color_PK primary key (IdColor);

--5.Creamos tabla Combustible de los coches

create table car.Combustible(
	IdCombustible varchar(20) not null,--PK
	NombreCombustible varchar(50) not null
);

--PK Combustible
alter table car.Combustible
add constraint Combustible_PK primary key (IdCombustible);


--6.Creamos tabla Aseguradora de los coches

create table car.Aseguradora(
	IdAseguradora varchar(20) not null,--PK
	NombreAseguradora varchar(50) not null
);

--PK Aseguradora
alter table car.Aseguradora
add constraint Aseguradora_PK primary key (IdAseguradora);



--7.Creamos tabla coche

create table car.Coche(
	IdCoche varchar(20) not null,--PK
	IdModelo varchar(20) not null,--FK
	IdColor varchar(20) not null,--FK
	dt_Compra date not null,
	TotalKm int not null,
	IdCombustible varchar(20) not null,--FK
	Matricula varchar(20) not null,
	NumPoliza varchar(50) not null,
	IdAseguradora varchar(20) not null, --FK
	dt_Baja date not null default '4000-01-01',
	Comentario varchar(512) null default 'vacio'
);

--PK Coche
alter table car.Coche
add constraint Coche_PK primary key (IdCoche);

--FK Coche

alter table car.Coche
add constraint Coche_Modelo_FK foreign key (IdModelo) 
references car.Modelo(IdModelo);

alter table car.Coche
add constraint Coche_Color_FK foreign key (IdColor) 
references car.Color(IdColor);

alter table car.Coche
add constraint Coche_Combustible_FK foreign key (IdCombustible) 
references car.Combustible(IdCombustible);

alter table car.Coche
add constraint Coche_Aseguradora_FK foreign key (IdAseguradora) 
references car.Aseguradora(IdAseguradora);


--8.Creamos tabla Moneda

create table car.Moneda(
	IdMoneda varchar(20) not null,--PK
	NombreMoneda varchar(50) not null
);

--PK Moneda
alter table car.Moneda
add constraint Moneda_PK primary key (IdMoneda);


--9.Creamos tabla Revision

create table car.Revision(
	IdRevision varchar(20) not null,--PK
	IdCoche varchar(50) not null, --PK FK
	km int not null,
	dt_Revision date not null,
	Importe numeric(10,2) not null,
	IdMoneda varchar(20) not null, --FK
	Comentario varchar(512) null default 'vacio'
);

--PK Revision
alter table car.Revision
add constraint Revision_PK primary key (IdRevision,IdCoche);

--FK Revision

alter table car.Revision
add constraint Revision_Coche_FK foreign key (IdCoche) 
references car.Coche(IdCoche);

alter table car.Revision
add constraint Revision_Moneda_FK foreign key (IdMoneda) 
references car.Moneda(IdMoneda);



--INSERCION DE DATOS--

--1. En tabla Grupo
insert into car.Grupo( IdGrupo, NombreGrupo)  
values('01','Grupo Volkswagen');

insert into car.Grupo( IdGrupo, NombreGrupo)
values('02','Grupo Toyota');

--2. En tabla Marca
insert into car.Marca( IdMarca, NombreMarca, IdGrupo)  
values('01','Seat', '01');

insert into car.Marca( IdMarca, NombreMarca, IdGrupo)  
values('02','Audi', '01');

insert into car.Marca( IdMarca, NombreMarca, IdGrupo)  
values('03','Toyota', '02');

insert into car.Marca( IdMarca, NombreMarca, IdGrupo)  
values('04','Lexus', '02');

--3. En tabla Modelo
insert into car.Modelo( IdModelo, NombreModelo, IdMarca)  
values('01','Ibiza', '01');

insert into car.Modelo( IdModelo, NombreModelo, IdMarca)  
values('02','Arona', '01');

insert into car.Modelo( IdModelo, NombreModelo, IdMarca)  
values('03','Leon', '01');

insert into car.Modelo( IdModelo, NombreModelo, IdMarca)  
values('04','A1', '02');

insert into car.Modelo( IdModelo, NombreModelo, IdMarca)  
values('05','A3', '02');

insert into car.Modelo( IdModelo, NombreModelo, IdMarca)  
values('06','Q5', '02');

insert into car.Modelo( IdModelo, NombreModelo, IdMarca)  
values('07','Yaris', '03');

insert into car.Modelo( IdModelo, NombreModelo, IdMarca)  
values('08','Corolla', '03');

--4. En tabla Color
insert into car.Color( IdColor, NombreColor)  
values('01','Blanco');

insert into car.Color( IdColor, NombreColor)  
values('02','Negro');

insert into car.Color( IdColor, NombreColor)  
values('03','Azul');

insert into car.Color( IdColor, NombreColor)  
values('04','Rojo');

insert into car.Color( IdColor, NombreColor)  
values('05','Gris');


--5. En tabla Combustible
insert into car.Combustible( IdCombustible, NombreCombustible)  
values('01','Gasolina');

insert into car.Combustible( IdCombustible, NombreCombustible)  
values('02','Diesel');

insert into car.Combustible( IdCombustible, NombreCombustible)  
values('03','Hibrido Gasolina');

insert into car.Combustible( IdCombustible, NombreCombustible)  
values('04','Electrico');

--6. En tabla Aseguradora
insert into car.Aseguradora( IdAseguradora, NombreAseguradora)  
values('01','Generali');

insert into car.Aseguradora( IdAseguradora, NombreAseguradora)  
values('02','Mapfre');

insert into car.Aseguradora( IdAseguradora, NombreAseguradora)  
values('03','Mutua');

insert into car.Aseguradora( IdAseguradora, NombreAseguradora)  
values('04','Allianz');

--7. En tabla Coche
insert into car.Coche( IdCoche, IdModelo, IdColor, dt_Compra, TotalKm, IdCombustible, Matricula, NumPoliza, IdAseguradora)  
values('01','01','02', '2015-04-10', 125000, '02','2405JLS', '123789', '01');

insert into car.Coche( IdCoche, IdModelo, IdColor, dt_Compra, TotalKm, IdCombustible, Matricula, NumPoliza, IdAseguradora)  
values('02','01','01', '2016-03-12', 112000, '02','4015KNX', '321987', '03');

insert into car.Coche( IdCoche, IdModelo, IdColor, dt_Compra, TotalKm, IdCombustible, Matricula, NumPoliza, IdAseguradora)  
values('03','02','03', '2020-02-18', 40000, '03','2312LMN', '789123', '04');

insert into car.Coche( IdCoche, IdModelo, IdColor, dt_Compra, TotalKm, IdCombustible, Matricula, NumPoliza, IdAseguradora)  
values('04','03','05', '2018-11-15', 75000, '01','2312LJS', '987431', '03');

insert into car.Coche( IdCoche, IdModelo, IdColor, dt_Compra, TotalKm, IdCombustible, Matricula, NumPoliza, IdAseguradora, dt_Baja, Comentario)  
values('05','08','01', '2010-02-03', 230000, '02','4151BZN', '174351', '02','2021-02-03','Se dio de baja por rotura de motor');

insert into car.Coche( IdCoche, IdModelo, IdColor, dt_Compra, TotalKm, IdCombustible, Matricula, NumPoliza, IdAseguradora, Comentario)  
values('06','05','03', '2014-09-13', 160000, '01','6121BHN', '898912', '02','Coche del gerente');

insert into car.Coche( IdCoche, IdModelo, IdColor, dt_Compra, TotalKm, IdCombustible, Matricula, NumPoliza, IdAseguradora)  
values('07','05','01', '2021-09-13', 4000, '01','3232MNN', '911111', '03');

insert into car.Coche( IdCoche, IdModelo, IdColor, dt_Compra, TotalKm, IdCombustible, Matricula, NumPoliza, IdAseguradora)  
values('08','08','04', '2019-10-21', 60000, '03','3232HNB', '327111', '01');

insert into car.Coche( IdCoche, IdModelo, IdColor, dt_Compra, TotalKm, IdCombustible, Matricula, NumPoliza, IdAseguradora)  
values('09','08','04', '2019-11-21', 55000, '03','3232HNZ', '327321', '01');

insert into car.Coche( IdCoche, IdModelo, IdColor, dt_Compra, TotalKm, IdCombustible, Matricula, NumPoliza, IdAseguradora)  
values('10','01','01', '2018-07-23', 85000, '02','3232KLS', '879876', '02');

--8. En tabla Moneda
insert into car.Moneda( IdMoneda, NombreMoneda)  
values('01','Euro');

insert into car.Moneda( IdMoneda, NombreMoneda)  
values('02','Dolar');

--9. En tabla Revision
insert into car.Revision( IdCoche, IdRevision, km, dt_Revision, Importe, IdMoneda, Comentario)  
values('01','01', 10000, '2016-08-23', 500, '01', 'Primera revision');

insert into car.Revision( IdCoche, IdRevision, km, dt_Revision, Importe, IdMoneda, Comentario)  
values('01','02', 25000, '2017-08-20', 600, '01','Se le cambio el aceite');

insert into car.Revision( IdCoche, IdRevision, km, dt_Revision, Importe, IdMoneda, Comentario)   
values('01','03', 45000, '2018-08-11', 650, '01','Para la proxima revision hay que cambiar ruedas');

insert into car.Revision( IdCoche, IdRevision, km, dt_Revision, Importe, IdMoneda)  
values('02','01', 30000, '2017-11-11', 600, '01');

insert into car.Revision( IdCoche, IdRevision, km, dt_Revision, Importe, IdMoneda)  
values('02','02', 40000, '2018-09-12', 650, '01');

insert into car.Revision( IdCoche, IdRevision, km, dt_Revision, Importe, IdMoneda)  
values('02','03', 60000, '2019-08-09', 650, '01');









