--MOSTRAR USUARIO ACTUAL Y EDITAR EL ORACLE PARA ASIGNAR ROLES

SHOW USER;

ALTER SESSION SET "_ORACLE_SCRIPT"=true;



--ADMINISTRADOR DE BASE DE DATOS------------------------------------------------

CREATE ROLE ADMIN_DB;
GRANT CONNECT, RESOURCE ,CREATE SESSION, CREATE TABLE, CREATE SEQUENCE, CREATE VIEW, CREATE TRIGGER,
CREATE PROCEDURE, EXECUTE ANY PROCEDURE, CREATE USER, CREATE ROLE, DROP USER TO ADMIN_DB;
GRANT ALL PRIVILEGES TO ADMIN_DB;



--ROLE MECANICO-----------------------------------------------------------------

CREATE ROLE MECANICO;
GRANT  CONNECT TO MECANICO;
GRANT ALL ON administrador.DEH_TALLERES TO MECANICO;
GRANT ALL ON administrador.DEH_BITACORAS TO MECANICO;
GRANT ALL ON administrador.DEH_MANTENIMIENTO TO MECANICO;
GRANT SELECT ON administrador.DEH_MARCAS TO MECANICO;
GRANT SELECT ON administrador.DEH_MODELOS TO MECANICO;
GRANT SELECT ON administrador.DEH_VEHICULOS TO MECANICO;
GRANT ALL ON administrador.deh_sedes TO MECANICO;


--ROLE RECURSOS HUMANOS---------------------------------------------------------

CREATE ROLE RECURSOS_HUMANOS;
GRANT CONNECT TO RECURSOS_HUMANOS;
GRANT ALL ON ADMINISTRADOR.DEH_EMPRESA TO RECURSOS_HUMANOS;
GRANT ALL ON ADMINISTRADOR.DEH_LOCACION TO RECURSOS_HUMANOS;
GRANT ALL ON administrador.DEH_EMPLEADOS TO RECURSOS_HUMANOS;
GRANT ALL ON ADMINISTRADOR.DEH_PERSONA TO RECURSOS_HUMANOS;
GRANT ALL ON administrador.DEH_SEDES TO RECURSOS_HUMANOS;



--ROLE GERENTE_VENTAS-----------------------------------------------------------


CREATE ROLE GERENTE_VENTAS;
GRANT CONNECT TO GERENTE_VENTAS;
GRANT ALL ON administrador.DEH_FORMAS_PAGO TO GERENTE_VENTAS;
GRANT ALL ON administrador.DEH_TRANSACCION TO GERENTE_VENTAS;
GRANT SELECT ON administrador.DEH_EGRESOS TO GERENTE_VENTAS;
GRANT SELECT ON administrador.DEH_CONTRATOS TO GERENTE_VENTAS;




--ROLE GENRETE_ALIANZA_ESTRATEGIAS----------------------------------------------


CREATE ROLE GERENTE_ALIANZA_ESTRATEGIAS;
GRANT CONNECT TO GERENTE_ALIANZA_ESTRATEGIAS;
GRANT ALL ON administrador.DEH_CATALOGO_PROMOCIONES TO GERENTE_ALIANZA_ESTRATEGIAS;
GRANT ALL ON administrador.DEH_SUSCRIPCIONES_ALIANZAS TO GERENTE_ALIANZA_ESTRATEGIAS;
GRANT ALL ON administrador.DEH_EMPRESA TO GERENTE_ALIANZA_ESTRATEGIAS;
GRANT SELECT ON administrador.DEH_PROMOCIONES TO GERENTE_ALIANZA_ESTRATEGIAS;
GRANT SELECT ON administrador.DEH_PROVEEDORES TO GERENTE_ALIANZA_ESTRATEGIAS;





--USERS-------------------------------------------------------------------------

CREATE USER administrador IDENTIFIED BY administrador;
CREATE USER usuario_mecanico IDENTIFIED BY usuario1;
CREATE USER usuario_rs IDENTIFIED BY usuario2;
CREATE USER usuario_gv IDENTIFIED BY usuario3;
CREATE USER usuario_ga IDENTIFIED BY usuario4;



--ASIGNAR ROLES-----------------------------------------------------------------

GRANT ADMIN_DB TO administrador;
GRANT MECANICO TO usuario_mecanico;
GRANT RECURSOS_HUMANOS TO usuario_rs;
GRANT GERENTE_VENTAS TO usuario_gv;
GRANT GERENTE_ALIANZA_ESTRATEGIAS TO usuario_ga;



--DROP USUARIOS-----------------------------------------------------------------

DROP USER administrador;
DROP USER usuario_mecanico;
DROP USER usuario_rs;
DROP USER usuario_gv;
DROP USER usuario_ga;



--DROP ROLES--------------------------------------------------------------------

DROP ROLE ADMIN_DB;
DROP ROLE MECANICO;
DROP ROLE RECURSOS_HUMANOS;
DROP ROLE GERENTE_VENTAS;
DROP ROLE GERENTE_ALIANZA;



--PRUEBAS PARA LA DEFENSA-------------------------------------------------------

--MECANICO---------------------------------------------------

--CRUD completo-----------
select * from administrador.deh_mantenimiento;
INSERT INTO administrador.deh_mantenimiento VALUES(16, 'Cambios de la bateria de camioneta','P','se debe revisar periódicamente la batería para asegurarse de que esté en óptimas condiciones y evitar quedarse sin carga en momentos críticos.');
delete from administrador.deh_mantenimiento where man_cod = 16;

--select solamente--------
select * from administrador.deh_marcas;
select * from administrador.deh_modelos;
INSERT INTO administrador.deh_modelos VALUES(3,16, 'Ford Focus',2010);
delete from administrador.deh_marcas;


--select que no esta permitido (ejemplo)-----
select * from administrador.deh_sedes;
select * from administrador.deh_promociones;



--RECURSOS HUMANOS----------------------------------------

--CRUD completo-----------
select * from administrador.deh_sedes;
select * from administrador.deh_empleados;
delete from administrador.deh_empleados where emp_cod = 26;

--select que no esta permitido (ejemplo)-----
select * from administrador.deh_marcas;
select * from administrador.deh_modelos;



--GERENTE DE VENTAS---------------------------------------

--CRUD completo-----------
select * from administrador.DEH_FORMAS_PAGO;
INSERT INTO administrador.DEH_FROMAS_PAGO VALUES (15, SEQ_FORMA_PAGO.NEXTVAL, '09-JUN-2023', 'Tarjeta internacional', '2� forma de pago: Tarjeta internacional', administrador.deh_TRANSACCION (administrador.deh_TRANSACCION.validarMonto(10), 'd�lar estado-unidense', 'USD ($)'));
delete from administrador.DEH_FORMAS_PAGO WHERE pag_con_cod = 15;

--select solamente--------
select * from administrador.DEH_EGRESOS;
select * from administrador.DEH_CONTRATOS;
INSERT INTO administrador.DEH_EGRESOS VALUES (1, 1, 'Pago de salarios del personal administrativo', '01-MAY-2022', 'Pago de salarios del personal administrativo, correspondiente al mes de mayo del 2022.', administrador.deh_TRANSACCION(administrador.deh_TRANSACCION.validarMonto(210), 'd�lar estado-unidense', 'USD ($)'));
delete from administrador.DEH_EGRESOS WHERE egr_cod = 10;
delete from administrador.deh_contratos;

--select que no esta permitido (ejemplo)-----
select * from administrador.deh_marcas;
select * from administrador.deh_modelos; 



--GERENTE DE ALIANZA--------------------------------------------------------

--CRUD completo-----------
select * from administrador.DEH_CATALOGO_PROMOCIONES;
INSERT INTO administrador.deh_catalogo_promociones VALUES(1,5,10,10, '04-Sep-2022','20-Sep-2022');
DELETE from administrador.DEH_CATALOGO_PROMOCIONES WHERE cat_prom_cod = 10;

--select solamente--------
select * from administrador.DEH_PROMOCIONES;
select * from administrador.DEH_PROVEEDORES;
INSERT INTO administrador.deh_promociones VALUES(17, 'Descuentos en la compra de un vehículo nuevo.',10);


--select que no esta permitido (ejemplo)-----
select * from administrador.deh_marcas;
select * from administrador.deh_modelos; 





