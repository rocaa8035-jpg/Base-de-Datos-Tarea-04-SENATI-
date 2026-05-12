create database bdvet;
use bdvet;

-- 2. Implementación en SQL
create table cliente(
id int primary key auto_increment,
nombre varchar(100) not null,
direccion varchar(255) not null,
telefono varchar(20));

create table mascota(
id int primary key auto_increment,
nombre varchar(100),
especie varchar(100),
raza varchar(100),
fecNacimiento date,
idCliente int,
foreign key (idCliente) references cliente (id));

create table veterinario(
id int primary key auto_increment,
nombre varchar(100) not null);

create table consulta(
id int primary key auto_increment,
fecAtencion date not null,
idMascota int,
idVeterinario int,
foreign key (idMascota) references mascota (id),
foreign key (idVeterinario) references veterinario (id));

create table diagnostico(
id int primary key auto_increment,
descripcion text not null,
idConsulta int,
foreign key (idConsulta) references consulta (id));

create table tratamiento(
id int primary key auto_increment,
medicamento varchar(255),
dosis varchar(100),
duracion varchar(100),
observacion text,
idDiagnostico int,
foreign key (idDiagnostico) references diagnostico (id));

-- 3. Registro de datos
insert into cliente (nombre,direccion,telefono) values ('Mario Reyes','Calle Los Helechos 425','987123456');
insert into cliente (nombre,direccion,telefono) values ('Sofia Espinoza','Avenida Ricardo Palma 812','999456123');
insert into cliente (nombre,direccion,telefono) values ('Arturo Silva','Calle Narciso de la Colina 315','912345678');
-- mascota
insert into mascota (nombre,especie,raza,fecNacimiento,idCliente) values ('Dowi','Perro','Border Collie','2020-2-14',1);
insert into mascota (nombre,especie,raza,fecNacimiento,idCliente) values ('Draco','Perro','Chihuahua','2019-2-18',2);
insert into mascota (nombre,especie,raza,fecNacimiento,idCliente) values ('Kira','Gato','Burmés','2024-2-26',2);
insert into mascota (nombre,especie,raza,fecNacimiento,idCliente) values ('Nanami','Gato','Siamés','2017-3-15',3);
insert into mascota (nombre,especie,raza,fecNacimiento,idCliente) values ('Firulais','Perro','Gran Danés','2018-3-17',3);
-- veterinario
insert into veterinario (nombre) values ('Ricardo Montoya');
insert into veterinario (nombre) values ('Vanesa Sideral');
-- consulta
insert into consulta (fecAtencion,idMascota,idVeterinario) values ('2026-1-11',1,2);
insert into consulta (fecAtencion,idMascota,idVeterinario) values ('2026-1-15',1,2);
insert into consulta (fecAtencion,idMascota,idVeterinario) values ('2026-1-13',2,1);
insert into consulta (fecAtencion,idMascota,idVeterinario) values ('2026-1-17',2,1);
insert into consulta (fecAtencion,idMascota,idVeterinario) values ('2026-1-18',3,2);
insert into consulta (fecAtencion,idMascota,idVeterinario) values ('2026-1-22',3,2);
insert into consulta (fecAtencion,idMascota,idVeterinario) values ('2026-1-20',4,1);
insert into consulta (fecAtencion,idMascota,idVeterinario) values ('2026-1-24',4,1);
insert into consulta (fecAtencion,idMascota,idVeterinario) values ('2026-1-19',5,2);
insert into consulta (fecAtencion,idMascota,idVeterinario) values ('2026-1-23',5,2);
-- diagnostico
insert into diagnostico (descripcion,idConsulta) values ('Osteoartritis incipiente en articulación coxofemoral',1);
insert into diagnostico (descripcion,idConsulta) values ('Enfermedad Periodontal Grado III',2);
insert into diagnostico (descripcion,idConsulta) values ('Dermatitis Alérgica por Picadura de Pulga (DAPP)',3);
insert into diagnostico (descripcion,idConsulta) values ('Insuficiencia Renal Crónica (Estadio IRIS 2)',4);
insert into diagnostico (descripcion,idConsulta) values ('Cardiomiopatía Dilatada (CMD)',5);
insert into diagnostico (descripcion,idConsulta) values ('Paciente presenta claudicación intermitente en miembro posterior derecho',6);
insert into diagnostico (descripcion,idConsulta) values ('Se observa recesión gingival evidente en caninos superiores',7);
insert into diagnostico (descripcion,idConsulta) values ('La paciente manifiesta prurito intenso y lamido excesivo',8);
insert into diagnostico (descripcion,idConsulta) values ('Los niveles de creatinina y SDMA se encuentran ligeramente elevados',9);
insert into diagnostico (descripcion,idConsulta) values ('El paciente muestra signos de intolerancia al ejercicio y fatiga temprana',10);
-- tratamiento
insert into tratamiento (medicamento,dosis,duracion,observacion,idDiagnostico) values ('Carprofeno','4.4 mg/kg (24h)','7 días','Antiinflamatorio para el dolor agudo.',1);
insert into tratamiento (medicamento,dosis,duracion,observacion,idDiagnostico) values ('Condroitina + Glucosamina','Según peso (24h)','Permanente','Suplemento para regeneración articular.',1);
insert into tratamiento (medicamento,dosis,duracion,observacion,idDiagnostico) values ('Clindamicina','11 mg/kg (12h)','10 días','Antibiótico para la infección gingival.',2);
insert into tratamiento (medicamento,dosis,duracion,observacion,idDiagnostico) values ('Selamectina (Pipeta)','Dosis única','Mensual','Control de la causa (pulgas).',3);
insert into tratamiento (medicamento,dosis,duracion,observacion,idDiagnostico) values ('Benazepril','0.5 mg/kg (24h)','De por vida','Protege el riñón bajando la presión.',4);
insert into tratamiento (medicamento,dosis,duracion,observacion,idDiagnostico) values ('Pimobendan','0.25 mg/kg (12h)','De por vida','Mejora la fuerza de contracción del corazón.',5);
insert into tratamiento (medicamento,dosis,duracion,observacion,idDiagnostico) values ('Furosemida','2 mg/kg (12h)','5 días','Diurético para evitar edema pulmonar.',5);
insert into tratamiento (medicamento,dosis,duracion,observacion,idDiagnostico) values ('Clorhexidina (Gel)','Aplicación tópica','(12h) / 15 días','Antiséptico local para reducir placa.',6);
insert into tratamiento (medicamento,dosis,duracion,observacion,idDiagnostico) values ('Prednisolona','1 mg/kg (24h)','5 días','Para cortar el ciclo de picor e inflamación.',7);
insert into tratamiento (medicamento,dosis,duracion,observacion,idDiagnostico) values ('Ácidos Grasos (Omega 3/6)','1 cápsula (24h)','30 días','Para restaurar la barrera de la piel.',8);
insert into tratamiento (medicamento,dosis,duracion,observacion,idDiagnostico) values ('Quelante de Fósforo','Mezclado en comida','De por vida','Evita que el fósforo dañe más la nefrona.',9);
insert into tratamiento (medicamento,dosis,duracion,observacion,idDiagnostico) values ('Mirtazapina','1.8 mg/gato (48h)','Según necesidad','Estimulante del apetito si hay náuseas.',10);

-- 4. Generación de reportes y SQL de consulta 
-- a. Historia clínica de cada mascota
select m.nombre as mascota, m.especie, m.raza, cli.nombre as cliente, con.fecAtencion, 
       v.nombre as veterinario, d.descripcion as diagnostico, t.medicamento, t.dosis, t.duracion, t.observacion
from 
tratamiento t inner join diagnostico d
on t.idDiagnostico = d.id
inner join consulta con
on d.idConsulta = con.id
inner join veterinario v
on con.idVeterinario = v.id
inner join mascota m
on con.idMascota = m.id
inner join cliente cli
on m.idCliente = cli.id;

-- b. Listado de mascotas por cliente
select cli.nombre as cliente, m.nombre as mascota
from mascota m inner join cliente cli
on m.idCliente = cli.id
order by cliente, mascota;

-- c. Consultas realizadas por cada mascota
select m.nombre as mascota, count(*) as consultas
from consulta inner join mascota m
on consulta.idMascota = m.id
group by mascota;

-- d. Consultas atendidas por cada veterinario
select v.nombre as veterinario, count(consulta.id) as consultas
from consulta inner join veterinario v
on consulta.idVeterinario = v.id
group by veterinario;

-- e. Diagnósticos registrados por mascota
select d.descripcion as detalle, m.nombre as mascota, con.fecAtencion as fecAtencion, v.nombre as veterinario
from diagnostico d inner join consulta con
on d.idConsulta = con.id
inner join mascota m
on con.idMascota = m.id
inner join veterinario v
on con.idVeterinario = v.id;

-- f. Tratamientos prescritos por diagnóstico
select d.descripcion as descripcion, t.medicamento as medicamento, t.dosis as dosis, t.duracion as duracion, t.observacion as observacion
from tratamiento t inner join diagnostico d
on t.idDiagnostico = d.id;

-- g. Mascotas filtradas por especie
select * from mascota
where especie = 'perro';

-- h. Mascotas filtradas por nombre (Firulais)
select * from mascota
where nombre like '_iru%';

-- i. Consultas realizadas en un rango de fechas
select cli.nombre as cliente, m.nombre as mascota, v.nombre as veterinario, con.fecAtencion as fechaConsulta
from cliente cli inner join mascota m
on m.idCliente = cli.id
inner join consulta con
on con.idMascota = m.id
inner join veterinario v
on con.idVeterinario = v.id
where (fecAtencion between '2026-1-20' and '2026-1-24');

-- j. Mascotas que tengan al menos 2 consultas
select m.nombre as mascota, count(*) as consultas
from consulta con inner join mascota m
on con.idMascota = m.id
group by mascota having count(*) >= 2;

-- k. Cliente con mayor cantidad de mascotas
select cli.nombre as cliente, count(*) as maxMascotas
from mascota m inner join cliente cli
on m.idCliente = cli.id
group by cliente 
having maxMascotas = (select count(*) from mascota 
					  group by idCliente 
                      order by count(*) desc
                      limit 1);

-- l. Veterinario con mayor cantidad de consultas atendidas
select v.nombre as veterinario, count(*) as maxConsultas
from consulta con inner join veterinario v
on con.idVeterinario = v.id
group by veterinario
having maxConsultas = (select count(*) from consulta
					   group by idVeterinario
                       order by count(*) desc
                       limit 1);

-- m. Resumen de atención usando funciones incorporadas
select concat(m.nombre,' - ',cli.nombre,' - ',v.nombre,' - ',con.fecAtencion) as 'Resumen textual de cada consulta'
from consulta con inner join mascota m
on con.idMascota = m.id
inner join cliente cli
on m.idCliente = cli.id
inner join veterinario v
on con.idVeterinario = v.id;

-- 5. Funciones definidas por el usuario
-- a. Función para obtener el nombre y especie de una mascota
delimiter //
create function nomEsp(valorId int)
returns varchar(255)
begin
	declare resultado varchar(255);
    set resultado = (select concat(nombre,' - ',especie) from mascota where id=valorId);
    return resultado;
end //
delimiter ;

select id,nomEsp(id) as mascota,raza,fecNacimiento,idCliente
from mascota;

-- b. Función para obtener el nombre del cliente propietario de una mascota
delimiter //
create function dueño(valorId int)
returns varchar(255)
deterministic
begin
	declare resultado varchar(255);
    set resultado = (select cli.nombre 
					from mascota m inner join cliente cli 
					on m.idCliente = cli.id where m.id=valorId);
	return resultado;
end //
delimiter ;

select nombre as mascota, dueño(id) as dueño
from mascota;

-- c. Función para calcular la edad de una mascota
delimiter //
create function edad(valorId int)
returns int
begin
	declare resultado int;
    set resultado = (select timestampdiff(year,fecNacimiento,curdate()) 
					 from mascota where id=valorId);
	return resultado;
end //
delimiter ;

select nombre, especie, edad(id) as edad
from mascota;

-- d. Función para contar la cantidad de consultas de una mascota
delimiter //
create function consultas(valorId int)
returns int
deterministic
begin
	declare resultado int;
    set resultado = (select count(*) from consulta
					 group by idMascota having idMascota=valorId);
	return resultado;
end //
delimiter ;

select distinct m.nombre as mascota, consultas(idMascota) as consultas
from consulta con inner join mascota m
on con.idMascota = m.id;

-- e. Función para obtener un resumen del tratamiento
delimiter //
create function tratamiento(valorId int)
returns varchar(255)
begin
	declare resultado varchar(255);
    set resultado = (select concat(medicamento,' - ',dosis,' - ',duracion)
					 from tratamiento where id=valorId);
	return resultado;
end //
delimiter ;

select d.descripcion as diagnostico, tratamiento(t.id) as 'tratamientos prescritos'
from tratamiento t inner join diagnostico d
on t.idDiagnostico = d.id;







