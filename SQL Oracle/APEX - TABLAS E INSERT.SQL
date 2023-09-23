-- TABLA LUGARES GEOGRAFICOS

CREATE TABLE deh_lugares_geo (
    lug_cod number (4) PRIMARY KEY,
    lug_nombre varchar (30) NOT NULL,
    lug_tipo char NOT NULL,
    lug_cod_padre number (4),

 -- CLAVE FORANEA (Recursiva)
    CONSTRAINT fk_lugar FOREIGN KEY (lug_cod_padre) REFERENCES deh_lugares_geo (lug_cod) ON DELETE CASCADE,

 -- CHECK
    CONSTRAINT tipo_lugar CHECK ( lug_tipo IN ('C','E','R','P') )

);

CREATE SEQUENCE SEQ_LUGARES_GEO
    START WITH 1
    INCREMENT BY 1;

-- INSERCION LUGARES GEOGRAFICOS

INSERT INTO deh_lugares_geo VALUES(SEQ_LUGARES_GEO.nextval,'Venezuela', 'P',NULL);
INSERT INTO deh_lugares_geo VALUES(SEQ_LUGARES_GEO.nextval,'España', 'P',NULL);
INSERT INTO deh_lugares_geo VALUES(SEQ_LUGARES_GEO.nextval,'Portugal', 'P',NULL);
INSERT INTO deh_lugares_geo VALUES(SEQ_LUGARES_GEO.nextval,'Colombia', 'P',NULL);
INSERT INTO deh_lugares_geo VALUES(SEQ_LUGARES_GEO.nextval,'Estados Unidos', 'P',NULL);
INSERT INTO deh_lugares_geo VALUES(SEQ_LUGARES_GEO.nextval,'Los andres', 'R',1);
INSERT INTO deh_lugares_geo VALUES(SEQ_LUGARES_GEO.nextval,'Lago de Maracaibo', 'R',1);
INSERT INTO deh_lugares_geo VALUES(SEQ_LUGARES_GEO.nextval,'Cordillera Central', 'R',1);
INSERT INTO deh_lugares_geo VALUES(SEQ_LUGARES_GEO.nextval,'Los llanos', 'R',1);
INSERT INTO deh_lugares_geo VALUES(SEQ_LUGARES_GEO.nextval,'Sistema Coriano', 'R',1);
INSERT INTO deh_lugares_geo VALUES(SEQ_LUGARES_GEO.nextval,'Merida', 'E',6);
INSERT INTO deh_lugares_geo VALUES(SEQ_LUGARES_GEO.nextval,'Zulia', 'E',7);
INSERT INTO deh_lugares_geo VALUES(SEQ_LUGARES_GEO.nextval,'Distrito Capital', 'E',8);
INSERT INTO deh_lugares_geo VALUES(SEQ_LUGARES_GEO.nextval,'Miranda', 'E',8);
INSERT INTO deh_lugares_geo VALUES(SEQ_LUGARES_GEO.nextval,'Carabobo', 'E',8);
INSERT INTO deh_lugares_geo VALUES(SEQ_LUGARES_GEO.nextval,'Barinas', 'E',9);
INSERT INTO deh_lugares_geo VALUES(SEQ_LUGARES_GEO.nextval,'Falcon', 'E',10);
INSERT INTO deh_lugares_geo VALUES(SEQ_LUGARES_GEO.nextval,'Comunidad de Madrid', 'E',2);
INSERT INTO deh_lugares_geo VALUES(SEQ_LUGARES_GEO.nextval,'CataluÃ±a', 'E',2);
INSERT INTO deh_lugares_geo VALUES(SEQ_LUGARES_GEO.nextval,'Gran Lisboa', 'E',3);
INSERT INTO deh_lugares_geo VALUES(SEQ_LUGARES_GEO.nextval,'Cundinamarca', 'E',4);
INSERT INTO deh_lugares_geo VALUES(SEQ_LUGARES_GEO.nextval,'Florida', 'E',5);
INSERT INTO deh_lugares_geo VALUES(SEQ_LUGARES_GEO.nextval,'Caracas', 'C',13);
INSERT INTO deh_lugares_geo VALUES(SEQ_LUGARES_GEO.nextval,'Maracaibo', 'C',12);
INSERT INTO deh_lugares_geo VALUES(SEQ_LUGARES_GEO.nextval,'LosTeques', 'C',14);
INSERT INTO deh_lugares_geo VALUES(SEQ_LUGARES_GEO.nextval,'Valencia', 'C',15);
INSERT INTO deh_lugares_geo VALUES(SEQ_LUGARES_GEO.nextval,'Barinas', 'C',16);
INSERT INTO deh_lugares_geo VALUES(SEQ_LUGARES_GEO.nextval,'Coro', 'C',17);
INSERT INTO deh_lugares_geo VALUES(SEQ_LUGARES_GEO.nextval,'Madrid', 'C',18);
INSERT INTO deh_lugares_geo VALUES(SEQ_LUGARES_GEO.nextval,'Barcelona', 'C',19);
INSERT INTO deh_lugares_geo VALUES(SEQ_LUGARES_GEO.nextval,'Lisboa', 'C',20);
INSERT INTO deh_lugares_geo VALUES(SEQ_LUGARES_GEO.nextval,'Bogota', 'C',21);
INSERT INTO deh_lugares_geo VALUES(SEQ_LUGARES_GEO.nextval,'Miami', 'C',22);


-- TABLA MARCAS

CREATE TABLE deh_marcas (
    mar_cod number (3) PRIMARY KEY,
    mar_nombre varchar2 (30) UNIQUE NOT NULL
);

CREATE SEQUENCE SEQ_MARCAS
    START WITH 1
    INCREMENT BY 1;

-- INSERCION MARCAS

INSERT INTO deh_marcas VALUES(SEQ_MARCAS.nextval, 'Toyota');
INSERT INTO deh_marcas VALUES(SEQ_MARCAS.nextval, 'Chevrolet');
INSERT INTO deh_marcas VALUES(SEQ_MARCAS.nextval,'Ford');
INSERT INTO deh_marcas VALUES(SEQ_MARCAS.nextval,'Honda');
INSERT INTO deh_marcas VALUES(SEQ_MARCAS.nextval,'Nissan');
INSERT INTO deh_marcas VALUES(SEQ_MARCAS.nextval, 'BMW');
INSERT INTO deh_marcas VALUES(SEQ_MARCAS.nextval, 'Mercedes-Benz');
INSERT INTO deh_marcas VALUES(SEQ_MARCAS.nextval, 'Audi');
INSERT INTO deh_marcas VALUES(SEQ_MARCAS.nextval, 'Porsche');
INSERT INTO deh_marcas VALUES(SEQ_MARCAS.nextval, 'Harley');
INSERT INTO deh_marcas VALUES(SEQ_MARCAS.nextval, 'Yamaha');
INSERT INTO deh_marcas VALUES(SEQ_MARCAS.nextval, 'Volkswagen');
INSERT INTO deh_marcas VALUES(SEQ_MARCAS.nextval, 'Hyundai');
INSERT INTO deh_marcas VALUES(SEQ_MARCAS.nextval, 'Kia');
INSERT INTO deh_marcas VALUES(SEQ_MARCAS.nextval, 'Jeep');
INSERT INTO deh_marcas VALUES(SEQ_MARCAS.nextval, 'Tesla');       
INSERT INTO deh_marcas VALUES(SEQ_MARCAS.nextval, 'Kawasaki');

---- TABLA MANTENIMIENTOS

CREATE TABLE deh_mantenimiento (
    man_cod number (2) PRIMARY KEY,
    man_nombre varchar2 (100) UNIQUE NOT NULL,
    man_tipo char NOT NULL,
    man_descrip VARCHAR2(400),

 -- CHECK
    CONSTRAINT tipo_mantenimiento CHECK ( man_tipo IN ('C','P','E') )
);

CREATE SEQUENCE SEQ_MANTENIMIENTO
    START WITH 1
    INCREMENT BY 1;

-- INSERCION MANTENIMINETO

INSERT INTO deh_mantenimiento VALUES(SEQ_MANTENIMIENTO.nextval, 'Cambios de la baterÃ­a','P','se debe revisar periÃ³dicamente la baterÃ­a para asegurarse de que estÃ© en Ã³ptimas condiciones y evitar quedarse sin carga en momentos crÃ­ticos.');
INSERT INTO deh_mantenimiento VALUES(SEQ_MANTENIMIENTO.nextval, 'Sustitucion de neumaticos','C','se deben cambiar los neumÃ¡ticos cuando estÃ©n desgastados o daÃ±ados para garantizar la seguridad en la carretera.');
INSERT INTO deh_mantenimiento VALUES(SEQ_MANTENIMIENTO.nextval,'Cambio de las bujÃ­as','E','se recomienda cambiar las bujÃ­as periÃ³dicamente para asegurar una combustiÃ³n adecuada del combustible y mantener el motor en buenas condiciones.');
INSERT INTO deh_mantenimiento VALUES(SEQ_MANTENIMIENTO.nextval,'Cambio de la bomba de combustible','E','se recomienda cambiar la bomba de combustible periÃ³dicamente para evitar que falle y cause daÃ±os en el motor.');
INSERT INTO deh_mantenimiento VALUES(SEQ_MANTENIMIENTO.nextval,'Cambio de aceite','P','se recomienda cambiar el aceite del motor periÃ³dicamente para mantenerlo limpio y lubricado.');
INSERT INTO deh_mantenimiento VALUES(SEQ_MANTENIMIENTO.nextval, 'Cambio de filtros','P','se deben cambiar regularmente los filtros de aire, aceite y combustible para evitar que el motor se daÃ±e.');
INSERT INTO deh_mantenimiento VALUES(SEQ_MANTENIMIENTO.nextval, 'Revision de sistema de frenos','C','se debe revisar periÃ³dicamente el sistema de frenos para asegurarse de que estÃ© en Ã³ptimas condiciones y evitar accidentes.');
INSERT INTO deh_mantenimiento VALUES(SEQ_MANTENIMIENTO.nextval, 'RevisiÃ³n del sistema de suspensiÃ³n','C','se debe revisar periÃ³dicamente el sistema de suspensiÃ³n para asegurarse de que estÃ© en Ã³ptimas condiciones y evitar un desgaste prematuro de las llantas.');
INSERT INTO deh_mantenimiento VALUES(SEQ_MANTENIMIENTO.nextval, 'RevisiÃ³n del sistema elÃ©ctrico','E','se debe revisar periÃ³dicamente el sistema elÃ©ctrico para asegurarse de que todos los componentes funcionen correctamente.');
INSERT INTO deh_mantenimiento VALUES(SEQ_MANTENIMIENTO.nextval, 'Cambio de correa de distribuciÃ³n','C','se debe cambiar la correa de distribuciÃ³n periÃ³dicamente para evitar daÃ±os en el motor y otras funciones del auto.');
INSERT INTO deh_mantenimiento VALUES(SEQ_MANTENIMIENTO.nextval, 'Lavado y limpieza del automÃ³vil','P','es importante realizar un lavado y limpieza periÃ³dica del automÃ³vil para mantenerlo en buenas condiciones estÃ©ticas y evitar la acumulaciÃ³n de suciedad y Ã³xido en la carrocerÃ­a.');
INSERT INTO deh_mantenimiento VALUES(SEQ_MANTENIMIENTO.nextval, 'RevisiÃ³n del sistema de escape','C','se debe revisar periÃ³dicamente el sistema de escape para asegurarse de que no haya fugas y que el vehÃ­culo no emita gases tÃ³xicos.');
INSERT INTO deh_mantenimiento VALUES(SEQ_MANTENIMIENTO.nextval, 'RevisiÃ³n del sistema de iluminaciÃ³n','P','se debe revisar periÃ³dicamente el sistema de iluminaciÃ³n, incluyendo las luces delanteras, traseras y direccionales, para asegurarse de que estÃ©n en Ã³ptimas condiciones y garantizar la seguridad en la carretera.');
INSERT INTO deh_mantenimiento VALUES(SEQ_MANTENIMIENTO.nextval, 'RevisiÃ³n del sistema de limpiaparabrisas','P','se debe revisar periÃ³dicamente el sistema de limpiaparabrisas para asegurarse de que funcione correctamente y garantizar una buena visibilidad en caso de lluvia o nieve.');
INSERT INTO deh_mantenimiento VALUES(SEQ_MANTENIMIENTO.nextval, 'Cambio de la correa del alternador','C','se recomienda cambiar la correa del alternador periÃ³dicamente para evitar que falle y cause daÃ±os en el motor.');

-- TABLA PROMOCIONES

CREATE TABLE deh_promociones (
    prom_cod number (3) PRIMARY KEY,
    prom_descrip varchar2 (150) NOT NULL,
    prom_ptcDesc number (4) NOT NULL
);


CREATE SEQUENCE SEQ_PROMOCIONES
    START WITH 1
    INCREMENT BY 1;

-- INSERCION PROMOCIONES

INSERT INTO deh_promociones VALUES(SEQ_PROMOCIONES.NEXTVAL, 'Descuentos en la compra de un vehÃ­culo nuevo.',10);
INSERT INTO deh_promociones VALUES(SEQ_PROMOCIONES.NEXTVAL, 'Financiamiento a tasa cero para la compra de un vehÃ­culo nuevo.',5);
INSERT INTO deh_promociones VALUES(SEQ_PROMOCIONES.NEXTVAL,'Descuentos en el mantenimiento de un vehÃ­culo en concesionarios autorizados.',15);
INSERT INTO deh_promociones VALUES(SEQ_PROMOCIONES.NEXTVAL,'Descuentos en piezas y accesorios para vehÃ­culos.',10);
INSERT INTO deh_promociones VALUES(SEQ_PROMOCIONES.NEXTVAL,'Promociones de cambio de aceite y filtro gratis con la compra de un paquete de mantenimiento.',20);
INSERT INTO deh_promociones VALUES(SEQ_PROMOCIONES.NEXTVAL, 'Descuentos en servicios de lavado y detallado de vehÃ­culos.',30);
INSERT INTO deh_promociones VALUES(SEQ_PROMOCIONES.NEXTVAL, 'Ofertas de financiamiento para la compra de llantas nuevas.',15);
INSERT INTO deh_promociones VALUES(SEQ_PROMOCIONES.NEXTVAL, 'Promociones de alineaciÃ³n y balanceo de llantas gratis con la compra de cuatro llantas nuevas.',20);
INSERT INTO deh_promociones VALUES(SEQ_PROMOCIONES.NEXTVAL, 'Descuentos en servicios de reparaciÃ³n y reemplazo de parabrisas.',25);
INSERT INTO deh_promociones VALUES(SEQ_PROMOCIONES.NEXTVAL, 'Promociones de cambio de frenos gratis con la compra de un paquete de mantenimiento.',10);
INSERT INTO deh_promociones VALUES(SEQ_PROMOCIONES.NEXTVAL, 'Descuentos en servicios de cambio de aceite y filtro para flotas de vehÃ­culos.',15);
INSERT INTO deh_promociones VALUES(SEQ_PROMOCIONES.NEXTVAL, 'Descuentos en servicios de mantenimiento preventivo para vehÃ­culos de alta milla.',10);
INSERT INTO deh_promociones VALUES(SEQ_PROMOCIONES.NEXTVAL, 'Promociones de cambio de baterÃ­a gratis con la compra de una baterÃ­a nueva.',5);
INSERT INTO deh_promociones VALUES(SEQ_PROMOCIONES.NEXTVAL, 'Descuentos en servicios de reparaciÃ³n de sistemas elÃ©ctricos y electrÃ³nicos de vehÃ­culos.',10);
INSERT INTO deh_promociones VALUES(SEQ_PROMOCIONES.NEXTVAL, 'Promociones de cambio de neumÃ¡ticos gratis con la compra de cuatro neumÃ¡ticos nuevos.',15);

CREATE TABLE deh_talleres (
    tal_cod number (3) PRIMARY KEY,
    tal_nombre varchar2 (50) NOT NULL,
    tal_logo BLOB DEFAULT EMPTY_BLOB() NOT NULL,
    tal_empresa deh_EMPRESA,
    tal_locacion deh_LOCACION
);

CREATE SEQUENCE SEQ_TALLERES
    START WITH 1
    INCREMENT BY 1;
    
-- INSERCION TALLERES

CREATE OR REPLACE DIRECTORY TALLERES_LOB AS 'D:\imagenes\talleres';

DECLARE
    V_TEMP BLOB;
    V_BFILE BFILE;
    V_NOMBRE_FOTO VARCHAR(20);
    
BEGIN
    INSERT INTO DEH_TALLERES VALUES (SEQ_TALLERES.NEXTVAL,'Taller Mecanico Pantera Negra',EMPTY_BLOB(),deh_EMPRESA(deh_EMPRESA.formatoTelefono('0212-3426581'),deh_EMPRESA.validarRIF('J-873209456'),deh_EMPRESA.formatocorreo('panteranegra@gmail.com')),deh_locacion(deh_locacion.validarCodigoPostal(1050),deh_locacion.validarLatitud(10.50399453957918),deh_locacion.validarLongitud(-66.87148332813548),'Avenida Nilvado')) RETURNING TAL_LOGO INTO V_TEMP;
    V_NOMBRE_FOTO := 'TALLER_1.PNG';
    V_BFILE := BFILENAME('TALLERES_LOB',V_NOMBRE_FOTO);
    DBMS_LOB.OPEN(V_BFILE, DBMS_LOB.LOB_READONLY);
    DBMS_LOB.LOADFROMFILE(V_TEMP,V_BFILE,DBMS_LOB.GETLENGTH(V_BFILE));
    DBMS_LOB.CLOSE(V_BFILE);
    
    INSERT INTO DEH_TALLERES VALUES (SEQ_TALLERES.NEXTVAL,'Servicio Automotriz ETM',EMPTY_BLOB(),deh_EMPRESA(deh_EMPRESA.formatoTelefono('0212-5642187'),deh_EMPRESA.validarRIF('J-654381729'),deh_EMPRESA.formatocorreo('etm@gmail.com')),deh_locacion(deh_locacion.validarCodigoPostal(1073),deh_locacion.validarLatitud(10.47870292856363),deh_locacion.validarLongitud(-66.81522058330137),'Calle Carmen')) RETURNING TAL_LOGO INTO V_TEMP;
    V_NOMBRE_FOTO := 'TALLER_2.PNG';
    V_BFILE := BFILENAME('TALLERES_LOB',V_NOMBRE_FOTO);
    DBMS_LOB.OPEN(V_BFILE, DBMS_LOB.LOB_READONLY);
    DBMS_LOB.LOADFROMFILE(V_TEMP,V_BFILE,DBMS_LOB.GETLENGTH(V_BFILE));
    DBMS_LOB.CLOSE(V_BFILE);
    
    INSERT INTO DEH_TALLERES VALUES (SEQ_TALLERES.NEXTVAL,'Taller Normandie',EMPTY_BLOB(),deh_EMPRESA(deh_EMPRESA.formatoTelefono('0212-7809312'),deh_EMPRESA.validarRIF('J-921847036'),deh_EMPRESA.formatocorreo('normandie@outlook.com')),deh_locacion(deh_locacion.validarCodigoPostal(1011),deh_locacion.validarLatitud(10.50676628857784),deh_locacion.validarLongitud(-66.90070528514737),'Avenida La Extrella')) RETURNING TAL_LOGO INTO V_TEMP;
    V_NOMBRE_FOTO := 'TALLER_3.PNG';
    V_BFILE := BFILENAME('TALLERES_LOB',V_NOMBRE_FOTO);
    DBMS_LOB.OPEN(V_BFILE, DBMS_LOB.LOB_READONLY);
    DBMS_LOB.LOADFROMFILE(V_TEMP,V_BFILE,DBMS_LOB.GETLENGTH(V_BFILE));
    DBMS_LOB.CLOSE(V_BFILE);
    
    INSERT INTO DEH_TALLERES VALUES (SEQ_TALLERES.NEXTVAL,'Automotriz Pollycars C.A.',EMPTY_BLOB(),deh_EMPRESA(deh_EMPRESA.formatoTelefono('0212-1265798'),deh_EMPRESA.validarRIF('J-387510294'),deh_EMPRESA.formatocorreo('pollycars@yahoo.com')),deh_locacion(deh_locacion.validarCodigoPostal(1071),deh_locacion.validarLatitud(10.496915060793807),deh_locacion.validarLongitud(-66.82030937892891),'Calle Vargas')) RETURNING TAL_LOGO INTO V_TEMP;
    V_NOMBRE_FOTO := 'TALLER_4.PNG';
    V_BFILE := BFILENAME('TALLERES_LOB',V_NOMBRE_FOTO);
    DBMS_LOB.OPEN(V_BFILE, DBMS_LOB.LOB_READONLY);
    DBMS_LOB.LOADFROMFILE(V_TEMP,V_BFILE,DBMS_LOB.GETLENGTH(V_BFILE));
    DBMS_LOB.CLOSE(V_BFILE);
    
    INSERT INTO DEH_TALLERES VALUES (SEQ_TALLERES.NEXTVAL,'Talleres El Drago',EMPTY_BLOB(),deh_EMPRESA(deh_EMPRESA.formatoTelefono('0212-2674622'),deh_EMPRESA.validarRIF('J-746982513'),deh_EMPRESA.formatocorreo('eldrago.soporte@yandex.com')),deh_locacion(deh_locacion.validarCodigoPostal(1060),deh_locacion.validarLatitud(10.491177184990608),deh_locacion.validarLongitud(-66.85243356950504),'Ave Libertador')) RETURNING TAL_LOGO INTO V_TEMP;
    V_NOMBRE_FOTO := 'TALLER_5.PNG';
    V_BFILE := BFILENAME('TALLERES_LOB',V_NOMBRE_FOTO);
    DBMS_LOB.OPEN(V_BFILE, DBMS_LOB.LOB_READONLY);
    DBMS_LOB.LOADFROMFILE(V_TEMP,V_BFILE,DBMS_LOB.GETLENGTH(V_BFILE));
    DBMS_LOB.CLOSE(V_BFILE);
    
    INSERT INTO DEH_TALLERES VALUES (SEQ_TALLERES.NEXTVAL,'Taller Mecanico Martinez',EMPTY_BLOB(),deh_EMPRESA(deh_EMPRESA.formatoTelefono('0212-6578912'),deh_EMPRESA.validarRIF('J-503219478'),deh_EMPRESA.formatocorreo('martinez.contacto@gmail.com')),deh_locacion(deh_locacion.validarCodigoPostal(4001),deh_locacion.validarLatitud(10.650250280279238),deh_locacion.validarLongitud(-71.64105445153396),'Calle 91')) RETURNING TAL_LOGO INTO V_TEMP;
    V_NOMBRE_FOTO := 'TALLER_6.PNG';
    V_BFILE := BFILENAME('TALLERES_LOB',V_NOMBRE_FOTO);
    DBMS_LOB.OPEN(V_BFILE, DBMS_LOB.LOB_READONLY);
    DBMS_LOB.LOADFROMFILE(V_TEMP,V_BFILE,DBMS_LOB.GETLENGTH(V_BFILE));
    DBMS_LOB.CLOSE(V_BFILE);
    
    INSERT INTO DEH_TALLERES VALUES (SEQ_TALLERES.NEXTVAL,'Taller Moronta',EMPTY_BLOB(),deh_EMPRESA(deh_EMPRESA.formatoTelefono('0212-2190783'),deh_EMPRESA.validarRIF('J-982465130'),deh_EMPRESA.formatocorreo('moronta.servicioalcliente@protonmail.com')),deh_locacion(deh_locacion.validarCodigoPostal(4001),deh_locacion.validarLatitud(10.656013410666015),deh_locacion.validarLongitud(-71.62067164910013),'AVE LIBERTADOR, CHACAO')) RETURNING TAL_LOGO INTO V_TEMP;
    V_NOMBRE_FOTO := 'TALLER_7.PNG';
    V_BFILE := BFILENAME('TALLERES_LOB',V_NOMBRE_FOTO);
    DBMS_LOB.OPEN(V_BFILE, DBMS_LOB.LOB_READONLY);
    DBMS_LOB.LOADFROMFILE(V_TEMP,V_BFILE,DBMS_LOB.GETLENGTH(V_BFILE));
    DBMS_LOB.CLOSE(V_BFILE);
    
    INSERT INTO DEH_TALLERES VALUES (SEQ_TALLERES.NEXTVAL,'Multiservicios Navarrocar C.A',EMPTY_BLOB(),deh_EMPRESA(deh_EMPRESA.formatoTelefono('0212-7865432'),deh_EMPRESA.validarRIF('J-185732946'),deh_EMPRESA.formatocorreo('navarrocar.atencion@outlook.com')),deh_locacion(deh_locacion.validarCodigoPostal(1201),deh_locacion.validarLatitud(10.349899392324065),deh_locacion.validarLongitud(-67.0461946546934),'Calle Guaicaipuro')) RETURNING TAL_LOGO INTO V_TEMP;
    V_NOMBRE_FOTO := 'TALLER_8.PNG';
    V_BFILE := BFILENAME('TALLERES_LOB',V_NOMBRE_FOTO);
    DBMS_LOB.OPEN(V_BFILE, DBMS_LOB.LOB_READONLY);
    DBMS_LOB.LOADFROMFILE(V_TEMP,V_BFILE,DBMS_LOB.GETLENGTH(V_BFILE));
    DBMS_LOB.CLOSE(V_BFILE);
    
    INSERT INTO DEH_TALLERES VALUES (SEQ_TALLERES.NEXTVAL,'Centro Automotriz Zeocar C.A',EMPTY_BLOB(),deh_EMPRESA(deh_EMPRESA.formatoTelefono('0212-6789012'),deh_EMPRESA.validarRIF('J-618204753'),deh_EMPRESA.formatocorreo('zeocar.soporte@zoho.com')),deh_locacion(deh_locacion.validarCodigoPostal(1201),deh_locacion.validarLatitud(10.351286923354069),deh_locacion.validarLongitud(-67.02910705255),'Zona industrial El Tambor')) RETURNING TAL_LOGO INTO V_TEMP;
    V_NOMBRE_FOTO := 'TALLER_9.PNG';
    V_BFILE := BFILENAME('TALLERES_LOB',V_NOMBRE_FOTO);
    DBMS_LOB.OPEN(V_BFILE, DBMS_LOB.LOB_READONLY);
    DBMS_LOB.LOADFROMFILE(V_TEMP,V_BFILE,DBMS_LOB.GETLENGTH(V_BFILE));
    DBMS_LOB.CLOSE(V_BFILE);
    
    INSERT INTO DEH_TALLERES VALUES (SEQ_TALLERES.NEXTVAL,'Taller de mecanica general',EMPTY_BLOB(),deh_EMPRESA(deh_EMPRESA.formatoTelefono('0212-6958712'),deh_EMPRESA.validarRIF('J-294863501'),deh_EMPRESA.formatocorreo('mecanicageneral.serviciotecnico@yahoo.com')),deh_locacion(deh_locacion.validarCodigoPostal(2001),deh_locacion.validarLatitud(10.170524839799906),deh_locacion.validarLongitud(-68.0075477477462),'Calle 86 Sucre')) RETURNING TAL_LOGO INTO V_TEMP;
    V_NOMBRE_FOTO := 'TALLER_10.PNG';
    V_BFILE := BFILENAME('TALLERES_LOB',V_NOMBRE_FOTO);
    DBMS_LOB.OPEN(V_BFILE, DBMS_LOB.LOB_READONLY);
    DBMS_LOB.LOADFROMFILE(V_TEMP,V_BFILE,DBMS_LOB.GETLENGTH(V_BFILE));
    DBMS_LOB.CLOSE(V_BFILE);
    
    INSERT INTO DEH_TALLERES VALUES (SEQ_TALLERES.NEXTVAL,'Taller Mecanico El Cale',EMPTY_BLOB(),deh_EMPRESA(deh_EMPRESA.formatoTelefono('0212-8385932'),deh_EMPRESA.validarRIF('J-735190246'),deh_EMPRESA.formatocorreo('elcale.ventas@gmail.com')),deh_locacion(deh_locacion.validarCodigoPostal(2001),deh_locacion.validarLatitud(10.184928245930054),deh_locacion.validarLongitud(-67.9967930945769),'Avenida 92 Branger')) RETURNING TAL_LOGO INTO V_TEMP;
    V_NOMBRE_FOTO := 'TALLER_11.PNG';
    V_BFILE := BFILENAME('TALLERES_LOB',V_NOMBRE_FOTO);
    DBMS_LOB.OPEN(V_BFILE, DBMS_LOB.LOB_READONLY);
    DBMS_LOB.LOADFROMFILE(V_TEMP,V_BFILE,DBMS_LOB.GETLENGTH(V_BFILE));
    DBMS_LOB.CLOSE(V_BFILE);
    
    INSERT INTO DEH_TALLERES VALUES (SEQ_TALLERES.NEXTVAL,'Multiservicios Falconia',EMPTY_BLOB(),deh_EMPRESA(deh_EMPRESA.formatoTelefono('0212-3952421'),deh_EMPRESA.validarRIF('J-420986371'),deh_EMPRESA.formatocorreo('federacion.servicioalcliente@hotmail.com')),deh_locacion(deh_locacion.validarCodigoPostal(5201),deh_locacion.validarLatitud(8.620303329636656),deh_locacion.validarLongitud(-70.22635813568003),'Avenida 12 de Octubre')) RETURNING TAL_LOGO INTO V_TEMP;
    V_NOMBRE_FOTO := 'TALLER_12.PNG';
    V_BFILE := BFILENAME('TALLERES_LOB',V_NOMBRE_FOTO);
    DBMS_LOB.OPEN(V_BFILE, DBMS_LOB.LOB_READONLY);
    DBMS_LOB.LOADFROMFILE(V_TEMP,V_BFILE,DBMS_LOB.GETLENGTH(V_BFILE));
    DBMS_LOB.CLOSE(V_BFILE);
    
    INSERT INTO DEH_TALLERES VALUES (SEQ_TALLERES.NEXTVAL,'Multiservicios y Repuestos Quijada C.A',EMPTY_BLOB(),deh_EMPRESA(deh_EMPRESA.formatoTelefono('0212-5039217'),deh_EMPRESA.validarRIF('J-139586702'),deh_EMPRESA.formatocorreo('quijada.contacto@outlook.com')),deh_locacion(deh_locacion.validarCodigoPostal(5201),deh_locacion.validarLatitud(8.631195326654723),deh_locacion.validarLongitud( -70.21947318241264),'Avenida Escobar')) RETURNING TAL_LOGO INTO V_TEMP;
    V_NOMBRE_FOTO := 'TALLER_13.PNG';
    V_BFILE := BFILENAME('TALLERES_LOB',V_NOMBRE_FOTO);
    DBMS_LOB.OPEN(V_BFILE, DBMS_LOB.LOB_READONLY);
    DBMS_LOB.LOADFROMFILE(V_TEMP,V_BFILE,DBMS_LOB.GETLENGTH(V_BFILE));
    DBMS_LOB.CLOSE(V_BFILE);
    
    INSERT INTO DEH_TALLERES VALUES (SEQ_TALLERES.NEXTVAL,'Taller mecanico Richard',EMPTY_BLOB(),deh_EMPRESA(deh_EMPRESA.formatoTelefono('0212-4430294'),deh_EMPRESA.validarRIF('J-802746195'),deh_EMPRESA.formatocorreo('richard.serviciotecnico@gmail.com')),deh_locacion(deh_locacion.validarCodigoPostal(4101),deh_locacion.validarLatitud(11.411802938435766),deh_locacion.validarLongitud(-69.66297293289045),'Calle Purupuche')) RETURNING TAL_LOGO INTO V_TEMP;
    V_NOMBRE_FOTO := 'TALLER_14.PNG';
    V_BFILE := BFILENAME('TALLERES_LOB',V_NOMBRE_FOTO);
    DBMS_LOB.OPEN(V_BFILE, DBMS_LOB.LOB_READONLY);
    DBMS_LOB.LOADFROMFILE(V_TEMP,V_BFILE,DBMS_LOB.GETLENGTH(V_BFILE));
    DBMS_LOB.CLOSE(V_BFILE);
    
    INSERT INTO DEH_TALLERES VALUES (SEQ_TALLERES.NEXTVAL,'Centro Frenos Occidente',EMPTY_BLOB(),deh_EMPRESA(deh_EMPRESA.formatoTelefono('0212-3048491'),deh_EMPRESA.validarRIF('J-567314829'),deh_EMPRESA.formatocorreo('frenosoccidente.soporteonline@protonmail.com')),deh_locacion(deh_locacion.validarCodigoPostal(4101),deh_locacion.validarLatitud(11.387196758875435),deh_locacion.validarLongitud(-69.70377474181801),'Autopista Variante Norte')) RETURNING TAL_LOGO INTO V_TEMP;
    V_NOMBRE_FOTO := 'TALLER_15.PNG';
    V_BFILE := BFILENAME('TALLERES_LOB',V_NOMBRE_FOTO);
    DBMS_LOB.OPEN(V_BFILE, DBMS_LOB.LOB_READONLY);
    DBMS_LOB.LOADFROMFILE(V_TEMP,V_BFILE,DBMS_LOB.GETLENGTH(V_BFILE));
    DBMS_LOB.CLOSE(V_BFILE);
    
END;

-- TABLA PROVEEDORES

CREATE TABLE deh_proveedores (
    prov_cod number (3) PRIMARY KEY,
    prov_nombre varchar2 (30) NOT NULL,
    prov_logo BLOB DEFAULT EMPTY_BLOB() NOT NULL,
    tal_empresa deh_EMPRESA
);

CREATE SEQUENCE SEQ_PROVEEDORES
    START WITH 1
    INCREMENT BY 1;
    
CREATE OR REPLACE DIRECTORY PROVEEDORES_LOB AS 'D:\imagenes\proveedores';

DECLARE
    V_TEMP BLOB;
    V_BFILE BFILE;
    V_NOMBRE_FOTO VARCHAR(20);
    
BEGIN
    INSERT INTO DEH_PROVEEDORES VALUES (SEQ_PROVEEDORES.NEXTVAL,'ProcuraWeb', EMPTY_BLOB(),deh_EMPRESA(deh_EMPRESA.formatoTelefono('0212-8234065'),deh_EMPRESA.validarRIF('J-376241958'),deh_EMPRESA.formatocorreo('contacto@procura-web.net'))) RETURNING PROV_LOGO INTO V_TEMP;
    V_NOMBRE_FOTO := 'PROVEEDOR_1.PNG';
    V_BFILE := BFILENAME('PROVEEDORES_LOB',V_NOMBRE_FOTO);
    DBMS_LOB.OPEN(V_BFILE, DBMS_LOB.LOB_READONLY);
    DBMS_LOB.LOADFROMFILE(V_TEMP,V_BFILE,DBMS_LOB.GETLENGTH(V_BFILE));
    DBMS_LOB.CLOSE(V_BFILE);
    
    INSERT INTO DEH_PROVEEDORES VALUES (SEQ_PROVEEDORES.NEXTVAL,'Michelin', EMPTY_BLOB(),deh_EMPRESA(deh_EMPRESA.formatoTelefono('0212-1758394'),deh_EMPRESA.validarRIF('J-594238671'),deh_EMPRESA.formatocorreo('soporte@michelin-inc.org'))) RETURNING PROV_LOGO INTO V_TEMP;
    V_NOMBRE_FOTO := 'PROVEEDOR_2.PNG';
    V_BFILE := BFILENAME('PROVEEDORES_LOB',V_NOMBRE_FOTO);
    DBMS_LOB.OPEN(V_BFILE, DBMS_LOB.LOB_READONLY);
    DBMS_LOB.LOADFROMFILE(V_TEMP,V_BFILE,DBMS_LOB.GETLENGTH(V_BFILE));
    DBMS_LOB.CLOSE(V_BFILE);
    
    INSERT INTO DEH_PROVEEDORES VALUES (SEQ_PROVEEDORES.NEXTVAL,'Bosch', EMPTY_BLOB(), deh_EMPRESA(deh_EMPRESA.formatoTelefono('0212-6548271'),deh_EMPRESA.validarRIF('J-186972534'),deh_EMPRESA.formatocorreo('atencion-clientes@bosch-sa.com'))) RETURNING PROV_LOGO INTO V_TEMP;
    V_NOMBRE_FOTO := 'PROVEEDOR_3.PNG';
    V_BFILE := BFILENAME('PROVEEDORES_LOB',V_NOMBRE_FOTO);
    DBMS_LOB.OPEN(V_BFILE, DBMS_LOB.LOB_READONLY);
    DBMS_LOB.LOADFROMFILE(V_TEMP,V_BFILE,DBMS_LOB.GETLENGTH(V_BFILE));
    DBMS_LOB.CLOSE(V_BFILE);
  
    INSERT INTO DEH_PROVEEDORES VALUES (SEQ_PROVEEDORES.NEXTVAL,'ExxonMobil',EMPTY_BLOB(),deh_EMPRESA(deh_EMPRESA.formatoTelefono('0212-9874315'),deh_EMPRESA.validarRIF('J-413529678'),deh_EMPRESA.formatocorreo('info@exxonmobil-inc.net'))) RETURNING PROV_LOGO INTO V_TEMP;
    V_NOMBRE_FOTO := 'PROVEEDOR_4.PNG';
    V_BFILE := BFILENAME('PROVEEDORES_LOB',V_NOMBRE_FOTO);
    DBMS_LOB.OPEN(V_BFILE, DBMS_LOB.LOB_READONLY);
    DBMS_LOB.LOADFROMFILE(V_TEMP,V_BFILE,DBMS_LOB.GETLENGTH(V_BFILE));
    DBMS_LOB.CLOSE(V_BFILE);
    
    INSERT INTO DEH_PROVEEDORES VALUES (SEQ_PROVEEDORES.NEXTVAL,'ZF Friedrichshafen',EMPTY_BLOB(),deh_EMPRESA(deh_EMPRESA.formatoTelefono('0212-2387649'),deh_EMPRESA.validarRIF('J-928136745'),deh_EMPRESA.formatocorreo('ayuda@zf-group.org'))) RETURNING PROV_LOGO INTO V_TEMP;
    V_NOMBRE_FOTO := 'PROVEEDOR_5.PNG';
    V_BFILE := BFILENAME('PROVEEDORES_LOB',V_NOMBRE_FOTO);
    DBMS_LOB.OPEN(V_BFILE, DBMS_LOB.LOB_READONLY);
    DBMS_LOB.LOADFROMFILE(V_TEMP,V_BFILE,DBMS_LOB.GETLENGTH(V_BFILE));
    DBMS_LOB.CLOSE(V_BFILE);
    
    INSERT INTO DEH_PROVEEDORES VALUES (SEQ_PROVEEDORES.NEXTVAL,'Denso',EMPTY_BLOB(),deh_EMPRESA(deh_EMPRESA.formatoTelefono('0212-6938572'),deh_EMPRESA.validarRIF('J-632187594'),deh_EMPRESA.formatocorreo('soporte@denso-solutions.net'))) RETURNING PROV_LOGO INTO V_TEMP;
    V_NOMBRE_FOTO := 'PROVEEDOR_6.PNG';
    V_BFILE := BFILENAME('PROVEEDORES_LOB',V_NOMBRE_FOTO);
    DBMS_LOB.OPEN(V_BFILE, DBMS_LOB.LOB_READONLY);
    DBMS_LOB.LOADFROMFILE(V_TEMP,V_BFILE,DBMS_LOB.GETLENGTH(V_BFILE));
    DBMS_LOB.CLOSE(V_BFILE);
    
    INSERT INTO DEH_PROVEEDORES VALUES (SEQ_PROVEEDORES.NEXTVAL,'Valeo',EMPTY_BLOB(),deh_EMPRESA(deh_EMPRESA.formatoTelefono('0212-4102938'),deh_EMPRESA.validarRIF('J-763295184'),deh_EMPRESA.formatocorreo('informacion@valeo-corp.com'))) RETURNING PROV_LOGO INTO V_TEMP;
    V_NOMBRE_FOTO := 'PROVEEDOR_7.PNG';
    V_BFILE := BFILENAME('PROVEEDORES_LOB',V_NOMBRE_FOTO);
    DBMS_LOB.OPEN(V_BFILE, DBMS_LOB.LOB_READONLY);
    DBMS_LOB.LOADFROMFILE(V_TEMP,V_BFILE,DBMS_LOB.GETLENGTH(V_BFILE));
    DBMS_LOB.CLOSE(V_BFILE);
    
    INSERT INTO DEH_PROVEEDORES VALUES (SEQ_PROVEEDORES.NEXTVAL,'Delphi Technologies',EMPTY_BLOB(),deh_EMPRESA(deh_EMPRESA.formatoTelefono('0212-1209845'),deh_EMPRESA.validarRIF('J-841562739'),deh_EMPRESA.formatocorreo('atencion@delphi-tech.org'))) RETURNING PROV_LOGO INTO V_TEMP;
    V_NOMBRE_FOTO := 'PROVEEDOR_8.PNG';
    V_BFILE := BFILENAME('PROVEEDORES_LOB',V_NOMBRE_FOTO);
    DBMS_LOB.OPEN(V_BFILE, DBMS_LOB.LOB_READONLY);
    DBMS_LOB.LOADFROMFILE(V_TEMP,V_BFILE,DBMS_LOB.GETLENGTH(V_BFILE));
    DBMS_LOB.CLOSE(V_BFILE);
    
    INSERT INTO DEH_PROVEEDORES VALUES (SEQ_PROVEEDORES.NEXTVAL,'Hella',EMPTY_BLOB(),deh_EMPRESA(deh_EMPRESA.formatoTelefono('0212-7456921'),deh_EMPRESA.validarRIF('J-238615794'),deh_EMPRESA.formatocorreo('contacto@hella-group.com'))) RETURNING PROV_LOGO INTO V_TEMP;
    V_NOMBRE_FOTO := 'PROVEEDOR_9.PNG';
    V_BFILE := BFILENAME('PROVEEDORES_LOB',V_NOMBRE_FOTO);
    DBMS_LOB.OPEN(V_BFILE, DBMS_LOB.LOB_READONLY);
    DBMS_LOB.LOADFROMFILE(V_TEMP,V_BFILE,DBMS_LOB.GETLENGTH(V_BFILE));
    DBMS_LOB.CLOSE(V_BFILE);
    
    INSERT INTO DEH_PROVEEDORES VALUES (SEQ_PROVEEDORES.NEXTVAL,'Magna International',EMPTY_BLOB(),deh_EMPRESA(deh_EMPRESA.formatoTelefono('0212-5398726'),deh_EMPRESA.validarRIF('J-157842693'),deh_EMPRESA.formatocorreo('soporte@magna-group.org'))) RETURNING PROV_LOGO INTO V_TEMP;
    V_NOMBRE_FOTO := 'PROVEEDOR_10.PNG';
    V_BFILE := BFILENAME('PROVEEDORES_LOB',V_NOMBRE_FOTO);
    DBMS_LOB.OPEN(V_BFILE, DBMS_LOB.LOB_READONLY);
    DBMS_LOB.LOADFROMFILE(V_TEMP,V_BFILE,DBMS_LOB.GETLENGTH(V_BFILE));
    DBMS_LOB.CLOSE(V_BFILE);
    
    INSERT INTO DEH_PROVEEDORES VALUES (SEQ_PROVEEDORES.NEXTVAL,'Aisin Seiki',EMPTY_BLOB(),deh_EMPRESA(deh_EMPRESA.formatoTelefono('0212-2876543'),deh_EMPRESA.validarRIF('J-519287346'),deh_EMPRESA.formatocorreo('pnfo@aisin-corporation.com'))) RETURNING PROV_LOGO INTO V_TEMP;
    V_NOMBRE_FOTO := 'PROVEEDOR_11.PNG';
    V_BFILE := BFILENAME('PROVEEDORES_LOB',V_NOMBRE_FOTO);
    DBMS_LOB.OPEN(V_BFILE, DBMS_LOB.LOB_READONLY);
    DBMS_LOB.LOADFROMFILE(V_TEMP,V_BFILE,DBMS_LOB.GETLENGTH(V_BFILE));
    DBMS_LOB.CLOSE(V_BFILE);
    
    INSERT INTO DEH_PROVEEDORES VALUES (SEQ_PROVEEDORES.NEXTVAL,'Johnson Controls',EMPTY_BLOB(),deh_EMPRESA(deh_EMPRESA.formatoTelefono('0212-9108765'),deh_EMPRESA.validarRIF('J-274935618'),deh_EMPRESA.formatocorreo('patencioncliente@jci-group.com'))) RETURNING PROV_LOGO INTO V_TEMP;
    V_NOMBRE_FOTO := 'PROVEEDOR_12.PNG';
    V_BFILE := BFILENAME('PROVEEDORES_LOB',V_NOMBRE_FOTO);
    DBMS_LOB.OPEN(V_BFILE, DBMS_LOB.LOB_READONLY);
    DBMS_LOB.LOADFROMFILE(V_TEMP,V_BFILE,DBMS_LOB.GETLENGTH(V_BFILE));
    DBMS_LOB.CLOSE(V_BFILE);
    
    INSERT INTO DEH_PROVEEDORES VALUES (SEQ_PROVEEDORES.NEXTVAL,'TRW Automotive',EMPTY_BLOB(),deh_EMPRESA(deh_EMPRESA.formatoTelefono('0212-3652948'),deh_EMPRESA.validarRIF('J-462379581'),deh_EMPRESA.formatocorreo('ayuda@trw-automotive.net'))) RETURNING PROV_LOGO INTO V_TEMP;
    V_NOMBRE_FOTO := 'PROVEEDOR_13.PNG';
    V_BFILE := BFILENAME('PROVEEDORES_LOB',V_NOMBRE_FOTO);
    DBMS_LOB.OPEN(V_BFILE, DBMS_LOB.LOB_READONLY);
    DBMS_LOB.LOADFROMFILE(V_TEMP,V_BFILE,DBMS_LOB.GETLENGTH(V_BFILE));
    DBMS_LOB.CLOSE(V_BFILE);
    
    INSERT INTO DEH_PROVEEDORES VALUES (SEQ_PROVEEDORES.NEXTVAL,'Bridgestone',EMPTY_BLOB(),deh_EMPRESA(deh_EMPRESA.formatoTelefono('0212-6723401'),deh_EMPRESA.validarRIF('J-935864172'),deh_EMPRESA.formatocorreo('pinformacion@bridgestone-group.org'))) RETURNING PROV_LOGO INTO V_TEMP;
    V_NOMBRE_FOTO := 'PROVEEDOR_14.PNG';
    V_BFILE := BFILENAME('PROVEEDORES_LOB',V_NOMBRE_FOTO);
    DBMS_LOB.OPEN(V_BFILE, DBMS_LOB.LOB_READONLY);
    DBMS_LOB.LOADFROMFILE(V_TEMP,V_BFILE,DBMS_LOB.GETLENGTH(V_BFILE));
    DBMS_LOB.CLOSE(V_BFILE);
    
    INSERT INTO DEH_PROVEEDORES VALUES (SEQ_PROVEEDORES.NEXTVAL,'Faurecia',EMPTY_BLOB(),deh_EMPRESA(deh_EMPRESA.formatoTelefono('0212-4829371'),deh_EMPRESA.validarRIF('J-781236594'),deh_EMPRESA.formatocorreo('ayuda@faurecia-llc.net'))) RETURNING PROV_LOGO INTO V_TEMP;
    V_NOMBRE_FOTO := 'PROVEEDOR_15.PNG';
    V_BFILE := BFILENAME('PROVEEDORES_LOB',V_NOMBRE_FOTO);
    DBMS_LOB.OPEN(V_BFILE, DBMS_LOB.LOB_READONLY);
    DBMS_LOB.LOADFROMFILE(V_TEMP,V_BFILE,DBMS_LOB.GETLENGTH(V_BFILE));
    DBMS_LOB.CLOSE(V_BFILE);
    COMMIT;
END;


-- TABLA MODELOS

CREATE TABLE deh_modelos (
    mod_mar_cod number (3) NOT NULL,
    mod_cod number (3) NOT NULL,
    mod_nombre varchar2 (30) UNIQUE NOT NULL,
    mod_anio number(5) NOT NULL,

-- CLAVE PRIMARIA
    CONSTRAINT pk_modelos PRIMARY KEY (mod_mar_cod, mod_cod),

-- CLAVE FORANEA
    CONSTRAINT fk_mod_mar FOREIGN KEY (mod_mar_cod) REFERENCES deh_marcas (mar_cod)
);


CREATE SEQUENCE SEQ_MODELOS
    START WITH 1
    INCREMENT BY 1;

-- INSERCION MODELOS

INSERT INTO deh_modelos VALUES(3,SEQ_MODELOS.NEXTVAL, 'Ford Focus',2010);
INSERT INTO deh_modelos VALUES(3,SEQ_MODELOS.NEXTVAL, 'Ford Explorer',2011);
INSERT INTO deh_modelos VALUES(4,SEQ_MODELOS.NEXTVAL,'Honda Civic',2011);
INSERT INTO deh_modelos VALUES(4,SEQ_MODELOS.NEXTVAL,'Honda CR-V',2012);
INSERT INTO deh_modelos VALUES(1,SEQ_MODELOS.NEXTVAL,'Toyota Camry',2011);
INSERT INTO deh_modelos VALUES(1,SEQ_MODELOS.NEXTVAL, 'Toyota RAV4',2012);
INSERT INTO deh_modelos VALUES(12,SEQ_MODELOS.NEXTVAL, 'Volkswagen Golf',2012);
INSERT INTO deh_modelos VALUES(12,SEQ_MODELOS.NEXTVAL, 'Volkswagen Tiguan',2016);
INSERT INTO deh_modelos VALUES(7,SEQ_MODELOS.NEXTVAL, 'Mercedes-Benz S-Class',2013);
INSERT INTO deh_modelos VALUES(7,SEQ_MODELOS.NEXTVAL, 'Mercedes-Benz GLC-Class',2015);
INSERT INTO deh_modelos VALUES(11,SEQ_MODELOS.NEXTVAL, 'Yamaha YZF-R1',2016);
INSERT INTO deh_modelos VALUES(11,SEQ_MODELOS.NEXTVAL, 'Yamaha MT-09',2013);
INSERT INTO deh_modelos VALUES(14,SEQ_MODELOS.NEXTVAL, 'Kia Sportage',2015);
INSERT INTO deh_modelos VALUES(15,SEQ_MODELOS.NEXTVAL, 'Jeep Wrangler',2017);
INSERT INTO deh_modelos VALUES(13,SEQ_MODELOS.NEXTVAL, 'Hyundai Sonata',2019);
INSERT INTO deh_modelos VALUES(10,SEQ_MODELOS.NEXTVAL, 'Harley-Davidson Road Glide',2015);
INSERT INTO deh_modelos VALUES(10,SEQ_MODELOS.NEXTVAL, 'Harley-Davidson Street Rod',2017);
INSERT INTO deh_modelos VALUES(8,SEQ_MODELOS.NEXTVAL, 'Audi e-tron',2019);
INSERT INTO deh_modelos VALUES(8,SEQ_MODELOS.NEXTVAL, 'Audi RS Q8',2020);
INSERT INTO deh_modelos VALUES(2,SEQ_MODELOS.NEXTVAL, 'Chevrolet Silverado 2500HD',2019);
INSERT INTO deh_modelos VALUES(5,SEQ_MODELOS.NEXTVAL, 'Nissan Altima SR',2020);
INSERT INTO deh_modelos VALUES(9,SEQ_MODELOS.NEXTVAL, 'Porsche 911 GT3',2018);
INSERT INTO deh_modelos VALUES(6,SEQ_MODELOS.NEXTVAL, 'BMW Serie 3',2018);
INSERT INTO deh_modelos VALUES(16,SEQ_MODELOS.NEXTVAL, 'Tesla Model S', 2012);
INSERT INTO deh_modelos VALUES(16,SEQ_MODELOS.NEXTVAL, 'Tesla Model 3', 2017);
INSERT INTO deh_modelos VALUES(16,SEQ_MODELOS.NEXTVAL, 'Tesla Model X', 2015);
INSERT INTO deh_modelos VALUES(16,SEQ_MODELOS.NEXTVAL, 'Tesla Model Y', 2020);
INSERT INTO deh_modelos VALUES(17,SEQ_MODELOS.NEXTVAL, 'Kawasaki Vulcan 1700 Voyager', 2022);


-- TABLA VEHICULO

CREATE TABLE deh_vehiculos (
    veh_mar_cod number (3) NOT NULL,
    veh_mod_cod number (3) NOT NULL,
    veh_cod number (6) NOT NULL,
    veh_tipo varchar2 (10) NOT NULL,
    veh_mat varchar2 (15) UNIQUE NOT NULL,
    veh_cond char NOT NULL,
    veh_foto BLOB DEFAULT EMPTY_BLOB() NOT NULL,
    veh_kmR number (6),
    veh_transaccion deh_TRANSACCION,

 -- Clave primaria
    CONSTRAINT pk_vehiculos PRIMARY KEY (veh_mar_cod, veh_mod_cod, veh_cod),

 -- Claves forÃ¡neas
    CONSTRAINT fk_veh FOREIGN KEY (veh_mar_cod, veh_mod_cod) REFERENCES deh_modelos (mod_mar_cod, mod_cod),

 -- Checks
    CONSTRAINT tipo_veh CHECK ( veh_tipo IN ('Carro','Moto','Camioneta') ),
    CONSTRAINT tipo_cond CHECK ( veh_cond IN ('N','U') )
);

CREATE SEQUENCE SEQ_VEHICULOS
    START WITH 1
    INCREMENT BY 1;
    
    
-- INSERCION VEHICULOS

CREATE OR REPLACE DIRECTORY VEHICULOS_LOB AS 'D:\imagenes\vehiculos';

DECLARE
    V_TEMP BLOB;
    V_BFILE BFILE;
    V_NOMBRE_FOTO VARCHAR(20);

BEGIN
    INSERT INTO deh_vehiculos VALUES(3,1,SEQ_VEHICULOS.NEXTVAL,'Carro','QTF-827','N',EMPTY_BLOB(),NULL,deh_transaccion(deh_transaccion.validarMonto(146),'Dolares','$')) RETURNING VEH_FOTO INTO V_TEMP;
    V_NOMBRE_FOTO := 'VEHICULO_1.PNG';
    V_BFILE := BFILENAME('VEHICULOS_LOB',V_NOMBRE_FOTO);
    DBMS_LOB.OPEN(V_BFILE, DBMS_LOB.LOB_READONLY);
    DBMS_LOB.LOADFROMFILE(V_TEMP,V_BFILE,DBMS_LOB.GETLENGTH(V_BFILE));
    DBMS_LOB.CLOSE(V_BFILE);

    INSERT INTO deh_vehiculos VALUES(3,1,SEQ_VEHICULOS.NEXTVAL,'Carro','ZYP-195','U',EMPTY_BLOB(),25563,deh_transaccion(deh_transaccion.validarMonto(174),'Dolares','$')) RETURNING VEH_FOTO INTO V_TEMP;
    V_NOMBRE_FOTO := 'VEHICULO_1.PNG';
    V_BFILE := BFILENAME('VEHICULOS_LOB',V_NOMBRE_FOTO);
    DBMS_LOB.OPEN(V_BFILE, DBMS_LOB.LOB_READONLY);
    DBMS_LOB.LOADFROMFILE(V_TEMP,V_BFILE,DBMS_LOB.GETLENGTH(V_BFILE));
    DBMS_LOB.CLOSE(V_BFILE);
    
    INSERT INTO deh_vehiculos VALUES(3,2,SEQ_VEHICULOS.NEXTVAL,'Camioneta','MNO-672','N',EMPTY_BLOB(),NULL, deh_transaccion(deh_transaccion.validarMonto(117),'Dolares','$')) RETURNING VEH_FOTO INTO V_TEMP;
    V_NOMBRE_FOTO := 'VEHICULO_2.PNG';
    V_BFILE := BFILENAME('VEHICULOS_LOB',V_NOMBRE_FOTO);
    DBMS_LOB.OPEN(V_BFILE, DBMS_LOB.LOB_READONLY);
    DBMS_LOB.LOADFROMFILE(V_TEMP,V_BFILE,DBMS_LOB.GETLENGTH(V_BFILE));
    DBMS_LOB.CLOSE(V_BFILE);
    
    INSERT INTO deh_vehiculos VALUES(3,2,SEQ_VEHICULOS.NEXTVAL,'Camioneta','KLM-432','U',EMPTY_BLOB(),16788, deh_transaccion(deh_transaccion.validarMonto(195),'Dolares','$')) RETURNING VEH_FOTO INTO V_TEMP;
    V_NOMBRE_FOTO := 'VEHICULO_2.PNG';
    V_BFILE := BFILENAME('VEHICULOS_LOB',V_NOMBRE_FOTO);
    DBMS_LOB.OPEN(V_BFILE, DBMS_LOB.LOB_READONLY);
    DBMS_LOB.LOADFROMFILE(V_TEMP,V_BFILE,DBMS_LOB.GETLENGTH(V_BFILE));
    DBMS_LOB.CLOSE(V_BFILE);
    
    INSERT INTO deh_vehiculos VALUES(4,3,SEQ_VEHICULOS.NEXTVAL,'Carro','RST-618','N',EMPTY_BLOB(),NULL, deh_transaccion(deh_transaccion.validarMonto(143),'Dolares','$')) RETURNING VEH_FOTO INTO V_TEMP;
    V_NOMBRE_FOTO := 'VEHICULO_3.PNG';
    V_BFILE := BFILENAME('VEHICULOS_LOB',V_NOMBRE_FOTO);
    DBMS_LOB.OPEN(V_BFILE, DBMS_LOB.LOB_READONLY);
    DBMS_LOB.LOADFROMFILE(V_TEMP,V_BFILE,DBMS_LOB.GETLENGTH(V_BFILE));
    DBMS_LOB.CLOSE(V_BFILE);
    
    INSERT INTO deh_vehiculos VALUES(4,3,SEQ_VEHICULOS.NEXTVAL,'Carro','JKL-212','U',EMPTY_BLOB(),17911, deh_transaccion(deh_transaccion.validarMonto(125),'Dolares','$')) RETURNING VEH_FOTO INTO V_TEMP;
    V_NOMBRE_FOTO := 'VEHICULO_3.PNG';
    V_BFILE := BFILENAME('VEHICULOS_LOB',V_NOMBRE_FOTO);
    DBMS_LOB.OPEN(V_BFILE, DBMS_LOB.LOB_READONLY);
    DBMS_LOB.LOADFROMFILE(V_TEMP,V_BFILE,DBMS_LOB.GETLENGTH(V_BFILE));
    DBMS_LOB.CLOSE(V_BFILE);
    
    INSERT INTO deh_vehiculos VALUES(4,4,SEQ_VEHICULOS.NEXTVAL,'Camioneta','ABC-754','N',EMPTY_BLOB(),NULL, deh_transaccion(deh_transaccion.validarMonto(135),'Dolares','$')) RETURNING VEH_FOTO INTO V_TEMP;
    V_NOMBRE_FOTO := 'VEHICULO_4.PNG';
    V_BFILE := BFILENAME('VEHICULOS_LOB',V_NOMBRE_FOTO);
    DBMS_LOB.OPEN(V_BFILE, DBMS_LOB.LOB_READONLY);
    DBMS_LOB.LOADFROMFILE(V_TEMP,V_BFILE,DBMS_LOB.GETLENGTH(V_BFILE));
    DBMS_LOB.CLOSE(V_BFILE);
    
    INSERT INTO deh_vehiculos VALUES(4,4,SEQ_VEHICULOS.NEXTVAL,'Camioneta','XYZ-923','U',EMPTY_BLOB(),18432, deh_transaccion(deh_transaccion.validarMonto(184),'Dolares','$')) RETURNING VEH_FOTO INTO V_TEMP;
    V_NOMBRE_FOTO := 'VEHICULO_4.PNG';
    V_BFILE := BFILENAME('VEHICULOS_LOB',V_NOMBRE_FOTO);
    DBMS_LOB.OPEN(V_BFILE, DBMS_LOB.LOB_READONLY);
    DBMS_LOB.LOADFROMFILE(V_TEMP,V_BFILE,DBMS_LOB.GETLENGTH(V_BFILE));
    DBMS_LOB.CLOSE(V_BFILE);
    
    INSERT INTO deh_vehiculos VALUES(1,5,SEQ_VEHICULOS.NEXTVAL,'Carro','FGH-881','N',EMPTY_BLOB(),NULL, deh_transaccion(deh_transaccion.validarMonto(132),'Dolares','$')) RETURNING VEH_FOTO INTO V_TEMP;
    V_NOMBRE_FOTO := 'VEHICULO_5.PNG';
    V_BFILE := BFILENAME('VEHICULOS_LOB',V_NOMBRE_FOTO);
    DBMS_LOB.OPEN(V_BFILE, DBMS_LOB.LOB_READONLY);
    DBMS_LOB.LOADFROMFILE(V_TEMP,V_BFILE,DBMS_LOB.GETLENGTH(V_BFILE));
    DBMS_LOB.CLOSE(V_BFILE);
    
    INSERT INTO deh_vehiculos VALUES(1,5,SEQ_VEHICULOS.NEXTVAL,'Carro','PQR-456','U',EMPTY_BLOB(),21876, deh_transaccion(deh_transaccion.validarMonto(184),'Dolares','$')) RETURNING VEH_FOTO INTO V_TEMP;
    V_NOMBRE_FOTO := 'VEHICULO_5.PNG';
    V_BFILE := BFILENAME('VEHICULOS_LOB',V_NOMBRE_FOTO);
    DBMS_LOB.OPEN(V_BFILE, DBMS_LOB.LOB_READONLY);
    DBMS_LOB.LOADFROMFILE(V_TEMP,V_BFILE,DBMS_LOB.GETLENGTH(V_BFILE));
    DBMS_LOB.CLOSE(V_BFILE);
    
    INSERT INTO deh_vehiculos VALUES(1,6,SEQ_VEHICULOS.NEXTVAL,'Camioneta','VWX-789','N',EMPTY_BLOB(),NULL, deh_transaccion(deh_transaccion.validarMonto(108),'Dolares','$')) RETURNING VEH_FOTO INTO V_TEMP;
    V_NOMBRE_FOTO := 'VEHICULO_6.PNG';
    V_BFILE := BFILENAME('VEHICULOS_LOB',V_NOMBRE_FOTO);
    DBMS_LOB.OPEN(V_BFILE, DBMS_LOB.LOB_READONLY);
    DBMS_LOB.LOADFROMFILE(V_TEMP,V_BFILE,DBMS_LOB.GETLENGTH(V_BFILE));
    DBMS_LOB.CLOSE(V_BFILE);
    
    INSERT INTO deh_vehiculos VALUES(1,6,SEQ_VEHICULOS.NEXTVAL,'Camioneta','DEF-321','U',EMPTY_BLOB(),12567, deh_transaccion(deh_transaccion.validarMonto(176),'Dolares','$')) RETURNING VEH_FOTO INTO V_TEMP;
    V_NOMBRE_FOTO := 'VEHICULO_6.PNG';
    V_BFILE := BFILENAME('VEHICULOS_LOB',V_NOMBRE_FOTO);
    DBMS_LOB.OPEN(V_BFILE, DBMS_LOB.LOB_READONLY);
    DBMS_LOB.LOADFROMFILE(V_TEMP,V_BFILE,DBMS_LOB.GETLENGTH(V_BFILE));
    DBMS_LOB.CLOSE(V_BFILE);

    INSERT INTO deh_vehiculos VALUES(12,7,SEQ_VEHICULOS.NEXTVAL,'Carro','TUV-987','N',EMPTY_BLOB(),NULL, deh_transaccion(deh_transaccion.validarMonto(194),'Dolares','$')) RETURNING VEH_FOTO INTO V_TEMP;
    V_NOMBRE_FOTO := 'VEHICULO_7.PNG';
    V_BFILE := BFILENAME('VEHICULOS_LOB',V_NOMBRE_FOTO);
    DBMS_LOB.OPEN(V_BFILE, DBMS_LOB.LOB_READONLY);
    DBMS_LOB.LOADFROMFILE(V_TEMP,V_BFILE,DBMS_LOB.GETLENGTH(V_BFILE));
    DBMS_LOB.CLOSE(V_BFILE);
    
    INSERT INTO deh_vehiculos VALUES(12,7,SEQ_VEHICULOS.NEXTVAL,'Carro','NOP-543','U',EMPTY_BLOB(),23387, deh_transaccion(deh_transaccion.validarMonto(148),'Dolares','$')) RETURNING VEH_FOTO INTO V_TEMP;
    V_NOMBRE_FOTO := 'VEHICULO_7.PNG';
    V_BFILE := BFILENAME('VEHICULOS_LOB',V_NOMBRE_FOTO);
    DBMS_LOB.OPEN(V_BFILE, DBMS_LOB.LOB_READONLY);
    DBMS_LOB.LOADFROMFILE(V_TEMP,V_BFILE,DBMS_LOB.GETLENGTH(V_BFILE));
    DBMS_LOB.CLOSE(V_BFILE);
    
    INSERT INTO deh_vehiculos VALUES(12,8,SEQ_VEHICULOS.NEXTVAL,'Camioneta','IJK-098','N',EMPTY_BLOB(),NULL, deh_transaccion(deh_transaccion.validarMonto(137),'Dolares','$')) RETURNING VEH_FOTO INTO V_TEMP;
    V_NOMBRE_FOTO := 'VEHICULO_8.PNG';
    V_BFILE := BFILENAME('VEHICULOS_LOB',V_NOMBRE_FOTO);
    DBMS_LOB.OPEN(V_BFILE, DBMS_LOB.LOB_READONLY);
    DBMS_LOB.LOADFROMFILE(V_TEMP,V_BFILE,DBMS_LOB.GETLENGTH(V_BFILE));
    DBMS_LOB.CLOSE(V_BFILE);
    
    INSERT INTO deh_vehiculos VALUES(12,8,SEQ_VEHICULOS.NEXTVAL,'Camioneta','HGF-765','U',EMPTY_BLOB(),28376, deh_transaccion(deh_transaccion.validarMonto(105),'Dolares','$')) RETURNING VEH_FOTO INTO V_TEMP;
    V_NOMBRE_FOTO := 'VEHICULO_8.PNG';
    V_BFILE := BFILENAME('VEHICULOS_LOB',V_NOMBRE_FOTO);
    DBMS_LOB.OPEN(V_BFILE, DBMS_LOB.LOB_READONLY);
    DBMS_LOB.LOADFROMFILE(V_TEMP,V_BFILE,DBMS_LOB.GETLENGTH(V_BFILE));
    DBMS_LOB.CLOSE(V_BFILE);
    
    INSERT INTO deh_vehiculos VALUES(7,9,SEQ_VEHICULOS.NEXTVAL,'Carro','QWE-246','N',EMPTY_BLOB(),NULL, deh_transaccion(deh_transaccion.validarMonto(170),'Dolares','$')) RETURNING VEH_FOTO INTO V_TEMP;
    V_NOMBRE_FOTO := 'VEHICULO_9.PNG';
    V_BFILE := BFILENAME('VEHICULOS_LOB',V_NOMBRE_FOTO);
    DBMS_LOB.OPEN(V_BFILE, DBMS_LOB.LOB_READONLY);
    DBMS_LOB.LOADFROMFILE(V_TEMP,V_BFILE,DBMS_LOB.GETLENGTH(V_BFILE));
    DBMS_LOB.CLOSE(V_BFILE);
    
    INSERT INTO deh_vehiculos VALUES(7,9,SEQ_VEHICULOS.NEXTVAL,'Carro','ZXC-135','U',EMPTY_BLOB(),29223, deh_transaccion(deh_transaccion.validarMonto(163),'Dolares','$')) RETURNING VEH_FOTO INTO V_TEMP;
    V_NOMBRE_FOTO := 'VEHICULO_9.PNG';
    V_BFILE := BFILENAME('VEHICULOS_LOB',V_NOMBRE_FOTO);
    DBMS_LOB.OPEN(V_BFILE, DBMS_LOB.LOB_READONLY);
    DBMS_LOB.LOADFROMFILE(V_TEMP,V_BFILE,DBMS_LOB.GETLENGTH(V_BFILE));
    DBMS_LOB.CLOSE(V_BFILE);
    
    INSERT INTO deh_vehiculos VALUES(7,10,SEQ_VEHICULOS.NEXTVAL,'Camioneta','RTY-369','N',EMPTY_BLOB(),NULL, deh_transaccion(deh_transaccion.validarMonto(173),'Dolares','$')) RETURNING VEH_FOTO INTO V_TEMP;
    V_NOMBRE_FOTO := 'VEHICULO_10.PNG';
    V_BFILE := BFILENAME('VEHICULOS_LOB',V_NOMBRE_FOTO);
    DBMS_LOB.OPEN(V_BFILE, DBMS_LOB.LOB_READONLY);
    DBMS_LOB.LOADFROMFILE(V_TEMP,V_BFILE,DBMS_LOB.GETLENGTH(V_BFILE));
    DBMS_LOB.CLOSE(V_BFILE);
    
    INSERT INTO deh_vehiculos VALUES(7,10,SEQ_VEHICULOS.NEXTVAL,'Camioneta','BNM-134','U',EMPTY_BLOB(),18119, deh_transaccion(deh_transaccion.validarMonto(116),'Dolares','$')) RETURNING VEH_FOTO INTO V_TEMP;
    V_NOMBRE_FOTO := 'VEHICULO_10.PNG';
    V_BFILE := BFILENAME('VEHICULOS_LOB',V_NOMBRE_FOTO);
    DBMS_LOB.OPEN(V_BFILE, DBMS_LOB.LOB_READONLY);
    DBMS_LOB.LOADFROMFILE(V_TEMP,V_BFILE,DBMS_LOB.GETLENGTH(V_BFILE));
    DBMS_LOB.CLOSE(V_BFILE);
    
    INSERT INTO deh_vehiculos VALUES(11,11,SEQ_VEHICULOS.NEXTVAL,'Moto','ASD-567','N',EMPTY_BLOB(),NULL, deh_transaccion(deh_transaccion.validarMonto(188),'Dolares','$')) RETURNING VEH_FOTO INTO V_TEMP;
    V_NOMBRE_FOTO := 'VEHICULO_11.PNG';
    V_BFILE := BFILENAME('VEHICULOS_LOB',V_NOMBRE_FOTO);
    DBMS_LOB.OPEN(V_BFILE, DBMS_LOB.LOB_READONLY);
    DBMS_LOB.LOADFROMFILE(V_TEMP,V_BFILE,DBMS_LOB.GETLENGTH(V_BFILE));
    DBMS_LOB.CLOSE(V_BFILE);
    
    INSERT INTO deh_vehiculos VALUES(11,11,SEQ_VEHICULOS.NEXTVAL,'Moto','UIO-890','U',EMPTY_BLOB(),12132, deh_transaccion(deh_transaccion.validarMonto(127),'Dolares','$')) RETURNING VEH_FOTO INTO V_TEMP;
    V_NOMBRE_FOTO := 'VEHICULO_11.PNG';
    V_BFILE := BFILENAME('VEHICULOS_LOB',V_NOMBRE_FOTO);
    DBMS_LOB.OPEN(V_BFILE, DBMS_LOB.LOB_READONLY);
    DBMS_LOB.LOADFROMFILE(V_TEMP,V_BFILE,DBMS_LOB.GETLENGTH(V_BFILE));
    DBMS_LOB.CLOSE(V_BFILE);
    
    INSERT INTO deh_vehiculos VALUES(11,12,SEQ_VEHICULOS.NEXTVAL,'Moto','JHG-432','N',EMPTY_BLOB(),NULL, deh_transaccion(deh_transaccion.validarMonto(152),'Dolares','$')) RETURNING VEH_FOTO INTO V_TEMP;
    V_NOMBRE_FOTO := 'VEHICULO_12.PNG';
    V_BFILE := BFILENAME('VEHICULOS_LOB',V_NOMBRE_FOTO);
    DBMS_LOB.OPEN(V_BFILE, DBMS_LOB.LOB_READONLY);
    DBMS_LOB.LOADFROMFILE(V_TEMP,V_BFILE,DBMS_LOB.GETLENGTH(V_BFILE));
    DBMS_LOB.CLOSE(V_BFILE);
    
    INSERT INTO deh_vehiculos VALUES(11,12,SEQ_VEHICULOS.NEXTVAL,'Moto','YHN-987','U',EMPTY_BLOB(),22789, deh_transaccion(deh_transaccion.validarMonto(107),'Dolares','$')) RETURNING VEH_FOTO INTO V_TEMP;
    V_NOMBRE_FOTO := 'VEHICULO_12.PNG';
    V_BFILE := BFILENAME('VEHICULOS_LOB',V_NOMBRE_FOTO);
    DBMS_LOB.OPEN(V_BFILE, DBMS_LOB.LOB_READONLY);
    DBMS_LOB.LOADFROMFILE(V_TEMP,V_BFILE,DBMS_LOB.GETLENGTH(V_BFILE));
    DBMS_LOB.CLOSE(V_BFILE);

    
    INSERT INTO deh_vehiculos VALUES(14,13,SEQ_VEHICULOS.NEXTVAL,'Camioneta','KJI-123','N',EMPTY_BLOB(),NULL, deh_transaccion(deh_transaccion.validarMonto(157),'Dolares','$')) RETURNING VEH_FOTO INTO V_TEMP;
    V_NOMBRE_FOTO := 'VEHICULO_13.PNG';
    V_BFILE := BFILENAME('VEHICULOS_LOB',V_NOMBRE_FOTO);
    DBMS_LOB.OPEN(V_BFILE, DBMS_LOB.LOB_READONLY);
    DBMS_LOB.LOADFROMFILE(V_TEMP,V_BFILE,DBMS_LOB.GETLENGTH(V_BFILE));
    DBMS_LOB.CLOSE(V_BFILE);
    
    INSERT INTO deh_vehiculos VALUES(14,13,SEQ_VEHICULOS.NEXTVAL,'Camioneta','LOP-456','N',EMPTY_BLOB(),NULL, deh_transaccion(deh_transaccion.validarMonto(194),'Dolares','$')) RETURNING VEH_FOTO INTO V_TEMP;
    V_NOMBRE_FOTO := 'VEHICULO_13.PNG';
    V_BFILE := BFILENAME('VEHICULOS_LOB',V_NOMBRE_FOTO);
    DBMS_LOB.OPEN(V_BFILE, DBMS_LOB.LOB_READONLY);
    DBMS_LOB.LOADFROMFILE(V_TEMP,V_BFILE,DBMS_LOB.GETLENGTH(V_BFILE));
    DBMS_LOB.CLOSE(V_BFILE);
    
    INSERT INTO deh_vehiculos VALUES(15,14,SEQ_VEHICULOS.NEXTVAL,'Camioneta','GHJ-789','N',EMPTY_BLOB(),NULL, deh_transaccion(deh_transaccion.validarMonto(113),'Dolares','$')) RETURNING VEH_FOTO INTO V_TEMP;
    V_NOMBRE_FOTO := 'VEHICULO_14.PNG';
    V_BFILE := BFILENAME('VEHICULOS_LOB',V_NOMBRE_FOTO);
    DBMS_LOB.OPEN(V_BFILE, DBMS_LOB.LOB_READONLY);
    DBMS_LOB.LOADFROMFILE(V_TEMP,V_BFILE,DBMS_LOB.GETLENGTH(V_BFILE));
    DBMS_LOB.CLOSE(V_BFILE);
    
    INSERT INTO deh_vehiculos VALUES(15,14,SEQ_VEHICULOS.NEXTVAL,'Camioneta','QAZ-321','U',EMPTY_BLOB(),29001, deh_transaccion(deh_transaccion.validarMonto(191),'Dolares','$')) RETURNING VEH_FOTO INTO V_TEMP;
    V_NOMBRE_FOTO := 'VEHICULO_14.PNG';
    V_BFILE := BFILENAME('VEHICULOS_LOB',V_NOMBRE_FOTO);
    DBMS_LOB.OPEN(V_BFILE, DBMS_LOB.LOB_READONLY);
    DBMS_LOB.LOADFROMFILE(V_TEMP,V_BFILE,DBMS_LOB.GETLENGTH(V_BFILE));
    DBMS_LOB.CLOSE(V_BFILE);
    
    INSERT INTO deh_vehiculos VALUES(13,15,SEQ_VEHICULOS.NEXTVAL,'Carro','WSX-654','N',EMPTY_BLOB(),NULL, deh_transaccion(deh_transaccion.validarMonto(144),'Dolares','$')) RETURNING VEH_FOTO INTO V_TEMP;
    V_NOMBRE_FOTO := 'VEHICULO_15.PNG';
    V_BFILE := BFILENAME('VEHICULOS_LOB',V_NOMBRE_FOTO);
    DBMS_LOB.OPEN(V_BFILE, DBMS_LOB.LOB_READONLY);
    DBMS_LOB.LOADFROMFILE(V_TEMP,V_BFILE,DBMS_LOB.GETLENGTH(V_BFILE));
    DBMS_LOB.CLOSE(V_BFILE);
    
    INSERT INTO deh_vehiculos VALUES(13,15,SEQ_VEHICULOS.NEXTVAL,'Carro','EDC-987','U',EMPTY_BLOB(),17234, deh_transaccion(deh_transaccion.validarMonto(114),'Dolares','$')) RETURNING VEH_FOTO INTO V_TEMP;
    V_NOMBRE_FOTO := 'VEHICULO_15.PNG';
    V_BFILE := BFILENAME('VEHICULOS_LOB',V_NOMBRE_FOTO);
    DBMS_LOB.OPEN(V_BFILE, DBMS_LOB.LOB_READONLY);
    DBMS_LOB.LOADFROMFILE(V_TEMP,V_BFILE,DBMS_LOB.GETLENGTH(V_BFILE));
    DBMS_LOB.CLOSE(V_BFILE);
    
    INSERT INTO deh_vehiculos VALUES(10,16,SEQ_VEHICULOS.NEXTVAL,'Moto','TGB-123','N',EMPTY_BLOB(),NULL, deh_transaccion(deh_transaccion.validarMonto(154),'Dolares','$')) RETURNING VEH_FOTO INTO V_TEMP;
    V_NOMBRE_FOTO := 'VEHICULO_16.PNG';
    V_BFILE := BFILENAME('VEHICULOS_LOB',V_NOMBRE_FOTO);
    DBMS_LOB.OPEN(V_BFILE, DBMS_LOB.LOB_READONLY);
    DBMS_LOB.LOADFROMFILE(V_TEMP,V_BFILE,DBMS_LOB.GETLENGTH(V_BFILE));
    DBMS_LOB.CLOSE(V_BFILE);
    
    INSERT INTO deh_vehiculos VALUES(10,16,SEQ_VEHICULOS.NEXTVAL,'Moto','YHN-789','U',EMPTY_BLOB(),21111, deh_transaccion(deh_transaccion.validarMonto(177),'Dolares','$')) RETURNING VEH_FOTO INTO V_TEMP;
    V_NOMBRE_FOTO := 'VEHICULO_16.PNG';
    V_BFILE := BFILENAME('VEHICULOS_LOB',V_NOMBRE_FOTO);
    DBMS_LOB.OPEN(V_BFILE, DBMS_LOB.LOB_READONLY);
    DBMS_LOB.LOADFROMFILE(V_TEMP,V_BFILE,DBMS_LOB.GETLENGTH(V_BFILE));
    DBMS_LOB.CLOSE(V_BFILE);
    
    INSERT INTO deh_vehiculos VALUES(10,17,SEQ_VEHICULOS.NEXTVAL,'Moto','UJM-246','N',EMPTY_BLOB(),NULL, deh_transaccion(deh_transaccion.validarMonto(118),'Dolares','$')) RETURNING VEH_FOTO INTO V_TEMP;
    V_NOMBRE_FOTO := 'VEHICULO_17.PNG';
    V_BFILE := BFILENAME('VEHICULOS_LOB',V_NOMBRE_FOTO);
    DBMS_LOB.OPEN(V_BFILE, DBMS_LOB.LOB_READONLY);
    DBMS_LOB.LOADFROMFILE(V_TEMP,V_BFILE,DBMS_LOB.GETLENGTH(V_BFILE));
    DBMS_LOB.CLOSE(V_BFILE);
    
    INSERT INTO deh_vehiculos VALUES(10,17,SEQ_VEHICULOS.NEXTVAL,'Moto','IKM-135','U',EMPTY_BLOB(),20667, deh_transaccion(deh_transaccion.validarMonto(131),'Dolares','$')) RETURNING VEH_FOTO INTO V_TEMP;
    V_NOMBRE_FOTO := 'VEHICULO_17.PNG';
    V_BFILE := BFILENAME('VEHICULOS_LOB',V_NOMBRE_FOTO);
    DBMS_LOB.OPEN(V_BFILE, DBMS_LOB.LOB_READONLY);
    DBMS_LOB.LOADFROMFILE(V_TEMP,V_BFILE,DBMS_LOB.GETLENGTH(V_BFILE));
    DBMS_LOB.CLOSE(V_BFILE);
    
    INSERT INTO deh_vehiculos VALUES(8,18,SEQ_VEHICULOS.NEXTVAL,'Carro','PLK-369','N',EMPTY_BLOB(),NULL, deh_transaccion(deh_transaccion.validarMonto(154),'Dolares','$')) RETURNING VEH_FOTO INTO V_TEMP;
    V_NOMBRE_FOTO := 'VEHICULO_18.PNG';
    V_BFILE := BFILENAME('VEHICULOS_LOB',V_NOMBRE_FOTO);
    DBMS_LOB.OPEN(V_BFILE, DBMS_LOB.LOB_READONLY);
    DBMS_LOB.LOADFROMFILE(V_TEMP,V_BFILE,DBMS_LOB.GETLENGTH(V_BFILE));
    DBMS_LOB.CLOSE(V_BFILE);
    
    INSERT INTO deh_vehiculos VALUES(8,18,SEQ_VEHICULOS.NEXTVAL,'Carro','OIU-134','U',EMPTY_BLOB(),14789, deh_transaccion(deh_transaccion.validarMonto(171),'Dolares','$')) RETURNING VEH_FOTO INTO V_TEMP;
    V_NOMBRE_FOTO := 'VEHICULO_18.PNG';
    V_BFILE := BFILENAME('VEHICULOS_LOB',V_NOMBRE_FOTO);
    DBMS_LOB.OPEN(V_BFILE, DBMS_LOB.LOB_READONLY);
    DBMS_LOB.LOADFROMFILE(V_TEMP,V_BFILE,DBMS_LOB.GETLENGTH(V_BFILE));
    DBMS_LOB.CLOSE(V_BFILE);
    
    INSERT INTO deh_vehiculos VALUES(8,19,SEQ_VEHICULOS.NEXTVAL,'Carro','NHT-567','N',EMPTY_BLOB(),NULL, deh_transaccion(deh_transaccion.validarMonto(139),'Dolares','$')) RETURNING VEH_FOTO INTO V_TEMP;
    V_NOMBRE_FOTO := 'VEHICULO_19.PNG';
    V_BFILE := BFILENAME('VEHICULOS_LOB',V_NOMBRE_FOTO);
    DBMS_LOB.OPEN(V_BFILE, DBMS_LOB.LOB_READONLY);
    DBMS_LOB.LOADFROMFILE(V_TEMP,V_BFILE,DBMS_LOB.GETLENGTH(V_BFILE));
    DBMS_LOB.CLOSE(V_BFILE);
    
    INSERT INTO deh_vehiculos VALUES(8,19,SEQ_VEHICULOS.NEXTVAL,'Carro','BVC-890','U',EMPTY_BLOB(),27543, deh_transaccion(deh_transaccion.validarMonto(107),'Dolares','$')) RETURNING VEH_FOTO INTO V_TEMP;
    V_NOMBRE_FOTO := 'VEHICULO_19.PNG';
    V_BFILE := BFILENAME('VEHICULOS_LOB',V_NOMBRE_FOTO);
    DBMS_LOB.OPEN(V_BFILE, DBMS_LOB.LOB_READONLY);
    DBMS_LOB.LOADFROMFILE(V_TEMP,V_BFILE,DBMS_LOB.GETLENGTH(V_BFILE));
    DBMS_LOB.CLOSE(V_BFILE);

    INSERT INTO deh_vehiculos VALUES(2,20,SEQ_VEHICULOS.NEXTVAL,'Camioneta','ASW-432','N',EMPTY_BLOB(),NULL, deh_transaccion(deh_transaccion.validarMonto(167),'Dolares','$')) RETURNING VEH_FOTO INTO V_TEMP;
    V_NOMBRE_FOTO := 'VEHICULO_20.PNG';
    V_BFILE := BFILENAME('VEHICULOS_LOB',V_NOMBRE_FOTO);
    DBMS_LOB.OPEN(V_BFILE, DBMS_LOB.LOB_READONLY);
    DBMS_LOB.LOADFROMFILE(V_TEMP,V_BFILE,DBMS_LOB.GETLENGTH(V_BFILE));
    DBMS_LOB.CLOSE(V_BFILE);
    
    INSERT INTO deh_vehiculos VALUES(5,21,SEQ_VEHICULOS.NEXTVAL,'Carro','XCF-987','U',EMPTY_BLOB(),16876, deh_transaccion(deh_transaccion.validarMonto(129),'Dolares','$')) RETURNING VEH_FOTO INTO V_TEMP;
    V_NOMBRE_FOTO := 'VEHICULO_21.PNG';
    V_BFILE := BFILENAME('VEHICULOS_LOB',V_NOMBRE_FOTO);
    DBMS_LOB.OPEN(V_BFILE, DBMS_LOB.LOB_READONLY);
    DBMS_LOB.LOADFROMFILE(V_TEMP,V_BFILE,DBMS_LOB.GETLENGTH(V_BFILE));
    DBMS_LOB.CLOSE(V_BFILE);
    
    INSERT INTO deh_vehiculos VALUES(9,22,SEQ_VEHICULOS.NEXTVAL,'Carro','ZVB-123','N',EMPTY_BLOB(),NULL, deh_transaccion(deh_transaccion.validarMonto(120),'Dolares','$')) RETURNING VEH_FOTO INTO V_TEMP;
    V_NOMBRE_FOTO := 'VEHICULO_22.PNG';
    V_BFILE := BFILENAME('VEHICULOS_LOB',V_NOMBRE_FOTO);
    DBMS_LOB.OPEN(V_BFILE, DBMS_LOB.LOB_READONLY);
    DBMS_LOB.LOADFROMFILE(V_TEMP,V_BFILE,DBMS_LOB.GETLENGTH(V_BFILE));
    DBMS_LOB.CLOSE(V_BFILE);
    
    INSERT INTO deh_vehiculos VALUES(6,23,SEQ_VEHICULOS.NEXTVAL,'Carro','LKM-456','U',EMPTY_BLOB(),25678, deh_transaccion(deh_transaccion.validarMonto(102),'Dolares','$')) RETURNING VEH_FOTO INTO V_TEMP;
    V_NOMBRE_FOTO := 'VEHICULO_23.PNG';
    V_BFILE := BFILENAME('VEHICULOS_LOB',V_NOMBRE_FOTO);
    DBMS_LOB.OPEN(V_BFILE, DBMS_LOB.LOB_READONLY);
    DBMS_LOB.LOADFROMFILE(V_TEMP,V_BFILE,DBMS_LOB.GETLENGTH(V_BFILE));
    DBMS_LOB.CLOSE(V_BFILE);
    
    INSERT INTO deh_vehiculos VALUES(16,24,SEQ_VEHICULOS.NEXTVAL,'Carro','AND-494','U',EMPTY_BLOB(),11000, deh_transaccion(deh_transaccion.validarMonto(118),'dólar estado-unidense','USD ($)')) RETURNING VEH_FOTO INTO V_TEMP;
    V_NOMBRE_FOTO := 'VEHICULO_24.PNG';
    V_BFILE := BFILENAME('VEHICULOS_LOB',V_NOMBRE_FOTO);
    DBMS_LOB.OPEN(V_BFILE, DBMS_LOB.LOB_READONLY);
    DBMS_LOB.LOADFROMFILE(V_TEMP,V_BFILE,DBMS_LOB.GETLENGTH(V_BFILE));
    DBMS_LOB.CLOSE(V_BFILE);

    INSERT INTO deh_vehiculos VALUES(16,25,SEQ_VEHICULOS.NEXTVAL,'Carro','RES-567','N',EMPTY_BLOB(),NULL, deh_transaccion(deh_transaccion.validarMonto(202),'dólar estado-unidense','USD ($)')) RETURNING VEH_FOTO INTO V_TEMP;
    V_NOMBRE_FOTO := 'VEHICULO_25.PNG';
    V_BFILE := BFILENAME('VEHICULOS_LOB',V_NOMBRE_FOTO);
    DBMS_LOB.OPEN(V_BFILE, DBMS_LOB.LOB_READONLY);
    DBMS_LOB.LOADFROMFILE(V_TEMP,V_BFILE,DBMS_LOB.GETLENGTH(V_BFILE));
    DBMS_LOB.CLOSE(V_BFILE);

    INSERT INTO deh_vehiculos VALUES(16,26,SEQ_VEHICULOS.NEXTVAL,'Carro','EST-959','U',EMPTY_BLOB(),6500, deh_transaccion(deh_transaccion.validarMonto(156),'dólar estado-unidense','USD ($)')) RETURNING VEH_FOTO INTO V_TEMP;
    V_NOMBRE_FOTO := 'VEHICULO_26.PNG';
    V_BFILE := BFILENAME('VEHICULOS_LOB',V_NOMBRE_FOTO);
    DBMS_LOB.OPEN(V_BFILE, DBMS_LOB.LOB_READONLY);
    DBMS_LOB.LOADFROMFILE(V_TEMP,V_BFILE,DBMS_LOB.GETLENGTH(V_BFILE));
    DBMS_LOB.CLOSE(V_BFILE);
    
    INSERT INTO deh_vehiculos VALUES(16,27,SEQ_VEHICULOS.NEXTVAL,'Carro','GEI-303','N',EMPTY_BLOB(),NULL, deh_transaccion(deh_transaccion.validarMonto(180),'dólar estado-unidense','USD ($)')) RETURNING VEH_FOTO INTO V_TEMP;
    V_NOMBRE_FOTO := 'VEHICULO_27.PNG';
    V_BFILE := BFILENAME('VEHICULOS_LOB',V_NOMBRE_FOTO);
    DBMS_LOB.OPEN(V_BFILE, DBMS_LOB.LOB_READONLY);
    DBMS_LOB.LOADFROMFILE(V_TEMP,V_BFILE,DBMS_LOB.GETLENGTH(V_BFILE));
    DBMS_LOB.CLOSE(V_BFILE);

    INSERT INTO deh_vehiculos VALUES(17,28,SEQ_VEHICULOS.NEXTVAL,'Moto','PUS-404','N',EMPTY_BLOB(),NULL, deh_transaccion(deh_transaccion.validarMonto(250),'dólar estado-unidense','USD ($)')) RETURNING VEH_FOTO INTO V_TEMP;
    V_NOMBRE_FOTO := 'VEHICULO_28.PNG';
    V_BFILE := BFILENAME('VEHICULOS_LOB',V_NOMBRE_FOTO);
    DBMS_LOB.OPEN(V_BFILE, DBMS_LOB.LOB_READONLY);
    DBMS_LOB.LOADFROMFILE(V_TEMP,V_BFILE,DBMS_LOB.GETLENGTH(V_BFILE));
    DBMS_LOB.CLOSE(V_BFILE);
    
    COMMIT;
END;

-- TABLA BITACORA

CREATE TABLE deh_bitacoras (
    bit_mar_cod number (3) NOT NULL,
    bit_mod_cod number (3) NOT NULL,
    bit_veh_cod number (6) NOT NULL,
    bit_man_cod number (2) NOT NULL,
    bit_tal_cod number (3) NOT NULL,
    bit_fechaMan date NOT NULL,
    bit_fechaFin date NOT NULL,
    bit_fechaProx date NOT NULL,
    bit_estatus varchar2 (6) NOT NULL,
    bit_descrip varchar2 (200) NOT NULL,
    
    -- Clave primaria
    CONSTRAINT pk_bitacoras PRIMARY KEY (bit_mar_cod, bit_mod_cod, bit_veh_cod, bit_man_cod, bit_tal_cod, bit_fechaMan),
    
    -- Claves foraneas
    CONSTRAINT fk_bit_veh FOREIGN KEY (bit_mar_cod, bit_mod_cod, bit_veh_cod) REFERENCES deh_vehiculos (veh_mar_cod, veh_mod_cod, veh_cod),
    CONSTRAINT fk_bit_man FOREIGN KEY (bit_man_cod) REFERENCES deh_mantenimiento (man_cod),
    CONSTRAINT fk_bit_tal FOREIGN KEY (bit_tal_cod) REFERENCES deh_talleres (tal_cod),
    -- Check
    CONSTRAINT tipo_estatus CHECK ( bit_estatus IN ('TRUE','FALSE') )
);

--INSERCION BITACORA

INSERT INTO deh_bitacoras VALUES(3,1,1,8,2,'19-Dec-2020','24-Dec-2020','01-Jan-2021','TRUE','No se encontraron problemas en la revisiones, el vehiculo esta listo para estar operativo en la sede.');
INSERT INTO deh_bitacoras VALUES(3,1,2,3,14,'7-mar-2022','11-mar-2022','22-mar-2022','TRUE','No se encontraron problemas en la revisiones, el vehiculo esta listo para estar operativo en la sede.');
INSERT INTO deh_bitacoras VALUES(3,2,3,12,6,'11-Jan-2023','13-Jan-2023','20-Jan-2023','TRUE','No se encontraron problemas en la revisiones, el vehiculo esta listo para estar operativo en la sede.');
INSERT INTO deh_bitacoras VALUES(3,2,4,6,11,'01-Sep-2020','08-Sep-2020','16-Sep-2020','FALSE','Se hizo un cambio de filtros en el vehiculo, para su cambio se dedico una semana y generar un diagnostico final de su revision.');
INSERT INTO deh_bitacoras VALUES(4,3,5,8,4,'25-Aug-2022','28-Aug-2022','01-Sep-2022','FALSE','El vehiculo tenia ciertos problemas con el sistema de suspension que no funcionaba correctamente, se le dedico una semana para su arreglo.');
INSERT INTO deh_bitacoras VALUES(4,3,6,14,12,'12-oct-2020','15-oct-2020','18-oct-2020','TRUE','No se encontraron problemas en la revisiones, el vehiculo esta listo para estar operativo en la sede.');
INSERT INTO deh_bitacoras VALUES(4,4,7,9,7,'22-Apr-2023','24-Apr-2023','27-Apr-2023','FALSE','El automovil presento problemas en el sistema de frenos, se mantuvo en el taller durante un periodo de 10 dias para solventar dicha falla.');
INSERT INTO deh_bitacoras VALUES(4,4,8,1,3,'15-may-2022','17-may-2022','19-may-2022','TRUE','No se encontraron problemas en la revisiones, el vehiculo esta listo para estar operativo en la sede.');
INSERT INTO deh_bitacoras VALUES(1,5,9,5,8,'28-jul-2021','01-Aug-2021','06-Aug-2021','TRUE','No se encontraron problemas en la revisiones, el vehiculo esta listo para estar operativo en la sede.');
INSERT INTO deh_bitacoras VALUES(1,5,10,11,15,'29-nov-2020','1-Dec-2020','04-Dec-2020','TRUE','No se encontraron problemas en la revisiones, el vehiculo esta listo para estar operativo en la sede.');
INSERT INTO deh_bitacoras VALUES(1,6,11,2,13,'14-feb-2022','17-feb-2022','21-feb-2022','TRUE','No se encontraron problemas en la revisiones, el vehiculo esta listo para estar operativo en la sede.');
INSERT INTO deh_bitacoras VALUES(1,6,12,10,1,'29-Jan-2021','02-feb-2021','04-feb-2021','TRUE','No se encontraron problemas en la revisiones, el vehiculo esta listo para estar operativo en la sede.');
INSERT INTO deh_bitacoras VALUES(12,7,13,7,12,'10-jun-2023','15-jun-2023','20-jun-2023','TRUE','No se encontraron problemas en la revisiones, el vehiculo esta listo para estar operativo en la sede.');
INSERT INTO deh_bitacoras VALUES(12,7,14,13,8,'21-jul-2020','22-jul-2020','25-jul-2020','FALSE','El vehiculo se le hizo una revision en el sistema de iluminacion, se dedico una semana para poder tener el carro nuevamente operativo.');
INSERT INTO deh_bitacoras VALUES(12,8,15,4,5,'06-mar-2023','08-mar-2023','11-mar-2023','TRUE','No se encontraron problemas en la revisiones, el vehiculo esta listo para estar operativo en la sede.');
INSERT INTO deh_bitacoras VALUES(12,8,16,11,7,'23-Dec-2021','25-Dec-2021','02-Jan-2024','TRUE','No se encontraron problemas en la revisiones, el vehiculo esta listo para estar operativo en la sede.');
INSERT INTO deh_bitacoras VALUES(7,9,17,7,2,'05-Apr-2021','07-Apr-2021','10-Apr-2021','FALSE','El automovil presento problemas en el sistema de frenos, se mantuvo en el taller durante un periodo de 10 dias para solventar dicha falla.');
INSERT INTO deh_bitacoras VALUES(7,9,18,15,9,'28-Sep-2022','29-Sep-2022','05-oct-2022','TRUE','No se encontraron problemas en la revisiones, el vehiculo esta listo para estar operativo en la sede.');
INSERT INTO deh_bitacoras VALUES(7,10,19,3,11,'11-may-2023','14-may-2023','19-may-2023','FALSE','El carro presento problemas con las bujias al momento de encenderlo, se realizo un mantenimiento de 10 dias para detectar la falla y su posterior arreglo.');
INSERT INTO deh_bitacoras VALUES(7,10,20,6,6,'14-Aug-2020','17-Aug-2020','20-Aug-2020','TRUE','No se encontraron problemas en la revisiones, el vehiculo esta listo para estar operativo en la sede.');
INSERT INTO deh_bitacoras VALUES(11,11,21,9,3,'17-feb-2023','19-feb-2023','23-feb-2023','TRUE','No se encontraron problemas en la revisiones, el vehiculo esta listo para estar operativo en la sede.');
INSERT INTO deh_bitacoras VALUES(11,11,22,10,14,'03-oct-2021','05-oct-2021','06-oct-2021','TRUE','No se encontraron problemas en la revisiones, el vehiculo esta listo para estar operativo en la sede.');
INSERT INTO deh_bitacoras VALUES(11,12,23,12,10,'01-Dec-2020','02-Dec-2020','06-Dec-2020','TRUE','No se encontraron problemas en la revisiones, el vehiculo esta listo para estar operativo en la sede.');
INSERT INTO deh_bitacoras VALUES(11,12,24,4,13,'14-jun-2022','15-jun-2022','18-jun-2022','FALSE','El vehiculo presento fallas en la bomba de combustible, se dedico una semana para su diagnostico y revision antes de dejarlo operativo nuevamente.');
INSERT INTO deh_bitacoras VALUES(14,13,25,1,1,'07-mar-2021','09-mar-2021','13-mar-2021','TRUE','No se encontraron problemas en la revisiones, el vehiculo esta listo para estar operativo en la sede.');
INSERT INTO deh_bitacoras VALUES(14,13,26,13,5,'22-Aug-2023','24-Aug-2023','26-Aug-2023','FALSE','El vehiculo se le hizo una revision en el sistema de iluminacion, se dedico una semana para poder tener el carro nuevamente operativo.');
INSERT INTO deh_bitacoras VALUES(15,14,27,2,15,'13-Jan-2022','14-Jan-2022','16-Jan-2022','TRUE','No se encontraron problemas en la revisiones, el vehiculo esta listo para estar operativo en la sede.');
INSERT INTO deh_bitacoras VALUES(15,14,28,5,4,'15-nov-2020','17-nov-2020','21-nov-2020','FALSE','El vehiculo presento problemas debido a la falta de aceite en el motor, se hizo una revision de una semana para un cambio de aceite y limpieza general.');
INSERT INTO deh_bitacoras VALUES(13,15,29,14,9,'05-Apr-2023','07-Apr-2023','10-Apr-2023','TRUE','No se encontraron problemas en la revisiones, el vehiculo esta listo para estar operativo en la sede.');
INSERT INTO deh_bitacoras VALUES(13,15,30,12,10,'27-jun-2021','28-jun-2021','01-jul-2021','TRUE','No se encontraron problemas en la revisiones, el vehiculo esta listo para estar operativo en la sede.');
INSERT INTO deh_bitacoras VALUES(10,16,31,1,8,'08-Dec-2022','09-Dec-2022','18-Dec-2022','TRUE','No se encontraron problemas en la revisiones, el vehiculo esta listo para estar operativo en la sede.');
INSERT INTO deh_bitacoras VALUES(10,16,32,7,6,'24-Sep-2020','26-Sep-2020','28-Sep-2020','TRUE','No se encontraron problemas en la revisiones, el vehiculo esta listo para estar operativo en la sede.');
INSERT INTO deh_bitacoras VALUES(10,17,33,13,11,'03-Aug-2022','05-Aug-2022','12-Aug-2022','FALSE','El vehiculo se le hizo una revision en el sistema de iluminacion, se dedico una semana para poder tener el carro nuevamente operativo.');
INSERT INTO deh_bitacoras VALUES(10,17,34,10,7,'21-Jan-2023','23-Jan-2023','27-Jan-2023','TRUE','No se encontraron problemas en la revisiones, el vehiculo esta listo para estar operativo en la sede.');
INSERT INTO deh_bitacoras VALUES(8,18,35,9,12,'12-jun-2020','14-jun-2020','17-jun-2020','TRUE','No se encontraron problemas en la revisiones, el vehiculo esta listo para estar operativo en la sede.');
INSERT INTO deh_bitacoras VALUES(8,18,36,4,3,'01-mar-2023','04-mar-2023','05-mar-2023','TRUE','No se encontraron problemas en la revisiones, el vehiculo esta listo para estar operativo en la sede.');
INSERT INTO deh_bitacoras VALUES(8,19,37,3,13,'09-nov-2021','11-nov-2021','17-nov-2021','FALSE','El carro presento problemas con las bujias al momento de encenderlo, se realizo un mantenimiento de 10 dias para detectar la falla y su posterior arreglo.');
INSERT INTO deh_bitacoras VALUES(8,19,38,6,2,'02-may-2022','03-may-2022','07-may-2022','FALSE','Se hizo un cambio de filtros en el vehiculo, para su cambio se dedico una semana y generar un diagnostico final de su revision.');
INSERT INTO deh_bitacoras VALUES(2,20,39,11,14,'08-Dec-2020','10-Dec-2020','15-Dec-2020','TRUE','No se encontraron problemas en la revisiones, el vehiculo esta listo para estar operativo en la sede.');
INSERT INTO deh_bitacoras VALUES(5,21,40,5,5,'14-jul-2023','15-jul-2023','23-jul-2023','TRUE','No se encontraron problemas en la revisiones, el vehiculo esta listo para estar operativo en la sede.');
INSERT INTO deh_bitacoras VALUES(9,22,41,8,9,'16-feb-2021','18-feb-2021','22-feb-2021','TRUE','No se encontraron problemas en la revisiones, el vehiculo esta listo para estar operativo en la sede.');
INSERT INTO deh_bitacoras VALUES(6,23,42,15,1,'19-oct-2022','20-oct-2022','22-oct-2022','TRUE','No se encontraron problemas en la revisiones, el vehiculo esta listo para estar operativo en la sede.');

--TABLA CATALOGO_PROMOCIONES

CREATE TABLE deh_catalogo_promociones (
    cat_mar_cod number (3) NOT NULL,
    cat_mod_cod number (3) NOT NULL,
    cat_veh_cod number (6) NOT NULL,
    cat_prom_cod number (3) NOT NULL,
    cat_fechaIni date NOT NULL,
    cat_fechaFin date,

  -- Clave primaria
    CONSTRAINT pk_catalogo PRIMARY KEY (cat_mar_cod, cat_mod_cod, cat_veh_cod, cat_prom_cod, cat_fechaIni),

  -- Claves forÃ¡neas
    CONSTRAINT fk_cat_veh FOREIGN KEY (cat_mar_cod, cat_mod_cod, cat_veh_cod) REFERENCES deh_vehiculos (veh_mar_cod, veh_mod_cod, veh_cod),
    CONSTRAINT fk_cat_prom FOREIGN KEY (cat_prom_cod) REFERENCES deh_promociones (prom_cod)
);

--INSERCION CATALOGO_PROMOCIONES

INSERT INTO deh_catalogo_promociones VALUES(1,5,10,9, '04-Sep-2022','20-Sep-2022');
INSERT INTO deh_catalogo_promociones VALUES(4,3,5,11, '10-jul-2021','20-Aug-2021');
INSERT INTO deh_catalogo_promociones VALUES(3,2,4,1,'20-may-2022','03-jun-2022');
INSERT INTO deh_catalogo_promociones VALUES(4,4,7,5,'12-Dec-2021','27-Dec-2021');
INSERT INTO deh_catalogo_promociones VALUES(1,5,9,9,'16-oct-2022','06-nov-2022');
INSERT INTO deh_catalogo_promociones VALUES(3,1,1,11, '09-Aug-2022','28-Aug-2022');
INSERT INTO deh_catalogo_promociones VALUES(3,2,3,12, '12-nov-2021','27-nov-2021');
INSERT INTO deh_catalogo_promociones VALUES(1,5,9,3, '23-Apr-2022','30-Apr-2022');
INSERT INTO deh_catalogo_promociones VALUES(1,6,12,11, '19-Jan-2023', NULL);
INSERT INTO deh_catalogo_promociones VALUES(1,6,11,7, '22-may-2023',NULL);
INSERT INTO deh_catalogo_promociones VALUES(3,1,1,7, '01-jul-2020','20-jul-2020');
INSERT INTO deh_catalogo_promociones VALUES(4,4,8,1, '25-nov-2022','09-Dec-2022');
INSERT INTO deh_catalogo_promociones VALUES(4,4,8,8, '14-Apr-2021','09-may-2021');
INSERT INTO deh_catalogo_promociones VALUES(12,7,13,10, '18-Dec-2021','05-Jan-2022');
INSERT INTO deh_catalogo_promociones VALUES(15,14,28,8, '11-feb-2022','18-feb-2022');
INSERT INTO deh_catalogo_promociones VALUES(11,12,24,4, '05-jul-2021','17-jul-2021');
INSERT INTO deh_catalogo_promociones VALUES(11,11,22,4, '07-mar-2022','23-mar-2022');
INSERT INTO deh_catalogo_promociones VALUES(7,9,17,5, '08-Aug-2021','19-Aug-2021');
INSERT INTO deh_catalogo_promociones VALUES(2,20,39,4, '02-oct-2020','24-oct-2020');
INSERT INTO deh_catalogo_promociones VALUES(11,12,23,10, '16-Jan-2022','01-feb-2022');
INSERT INTO deh_catalogo_promociones VALUES(8,18,35,1, '28-Apr-2021','10-may-2021');
INSERT INTO deh_catalogo_promociones VALUES(10,17,34,13, '22-Sep-2022','14-oct-2022');
INSERT INTO deh_catalogo_promociones VALUES(10,16,32,9, '16-nov-2020','06-Dec-2020');
INSERT INTO deh_catalogo_promociones VALUES(15,14,27,9, '10-Dec-2021','23-Dec-2021');
INSERT INTO deh_catalogo_promociones VALUES(7,10,20,11, '27-Jan-2022','09-feb-2022');
INSERT INTO deh_catalogo_promociones VALUES(10,16,31,14, '08-jun-2022','21-jun-2022');
INSERT INTO deh_catalogo_promociones VALUES(8,18,36,11, '01-feb-2021','13-feb-2021');
INSERT INTO deh_catalogo_promociones VALUES(13,15,29,5, '09-Sep-2020','25-Sep-2020');
INSERT INTO deh_catalogo_promociones VALUES(7,10,19,7, '20-mar-2023',NULL);
INSERT INTO deh_catalogo_promociones VALUES(10,17,33,7, '13-oct-2021','27-oct-2021');
INSERT INTO deh_catalogo_promociones VALUES(7,10,19,12, '15-Sep-2022','19-Sep-2022');
INSERT INTO deh_catalogo_promociones VALUES(14,13,26,7, '26-may-2021','06-jun-2021');
INSERT INTO deh_catalogo_promociones VALUES(8,19,38,6, '11-Apr-2023','27-Apr-2023');
INSERT INTO deh_catalogo_promociones VALUES(7,9,18,1, '17-Dec-2022','31-Dec-2022');
INSERT INTO deh_catalogo_promociones VALUES(13,15,30,14, '21-feb-2023','');
INSERT INTO deh_catalogo_promociones VALUES(11,12,23,1, '30-jul-2020','16-Aug-2020');
INSERT INTO deh_catalogo_promociones VALUES(10,16,31,13, '07-Jan-2023',NULL);
INSERT INTO deh_catalogo_promociones VALUES(10,17,33,7, '29-oct-2021','15-nov-2021');
INSERT INTO deh_catalogo_promociones VALUES(13,15,30,3, '02-Apr-2021','18-Apr-2021');
INSERT INTO deh_catalogo_promociones VALUES(12,8,16,14, '22-jul-2023',NULL);
INSERT INTO deh_catalogo_promociones VALUES(7,9,17,3, '19-feb-2022','28-feb-2022');
INSERT INTO deh_catalogo_promociones VALUES(14,13,25,9, '26-Dec-2020','06-Jan-2021');
INSERT INTO deh_catalogo_promociones VALUES(8,18,36,13, '12-jun-2022','22-jun-2022');
INSERT INTO deh_catalogo_promociones VALUES(11,11,21,4, '23-Aug-2021','01-Sep-2021');
INSERT INTO deh_catalogo_promociones VALUES(8,19,37,12, '14-Sep-2022','24-Sep-2022');
INSERT INTO deh_catalogo_promociones VALUES(12,8,16,13, '03-mar-2022','15-mar-2022');
INSERT INTO deh_catalogo_promociones VALUES(15,14,27,7, '17-may-2021','31-may-2021');
INSERT INTO deh_catalogo_promociones VALUES(7,10,19,3, '28-jun-2022','12-jul-2022');
INSERT INTO deh_catalogo_promociones VALUES(8,19,38,14, '18-nov-2020','07-Dec-2020');
INSERT INTO deh_catalogo_promociones VALUES(11,11,21,1, '06-Sep-2021','17-Sep-2021');

--TABLA CLIENTES

CREATE TABLE deh_clientes (
    cli_cod number (9) PRIMARY KEY,
    cli_ced number (9) UNIQUE NOT NULL,
    cli_correo varchar2 (50) UNIQUE NOT NULL,
    cli_tlf varchar2 (30) UNIQUE NOT NULL,
    cli_tipo varchar2 (30) NOT NULL,
    cli_foto BLOB DEFAULT EMPTY_BLOB(),
    cli_ciu_cod number (4) NOT NULL,
    cli_persona deh_PERSONA,
    cli_locacion deh_LOCACION,

 -- Clave forÃ¡nea
    CONSTRAINT fk_cli_ciu FOREIGN KEY (cli_ciu_cod) REFERENCES deh_lugares_geo (lug_cod),

 -- Checks
    CONSTRAINT tipo_client CHECK ( cli_tipo IN ('Ocasional','Frecuente','Premium') )
);

CREATE SEQUENCE SEQ_CLIENTES
    start with 1
    increment by 1;
    
-- INSERCION CLIENTES

CREATE OR REPLACE DIRECTORY CLIENTES_LOB AS 'D:\imagenes\clientes';

DECLARE
    V_TEMP BLOB;
    V_BFILE BFILE;
    V_NOMBRE_FOTO VARCHAR(100);

BEGIN
    INSERT INTO deh_clientes VALUES (SEQ_CLIENTES.NEXTVAL,29577500,'cesargg@ucab.edu.ve','+58 414 3722626', 'Premium' , EMPTY_BLOB(), 23 , deh_PERSONA(deh_PERSONA.validarNombre('Cesar'),deh_PERSONA.validarApellido('Garcia'),deh_PERSONA.validarGenero('Hombre'),deh_PERSONA.validarFechaNac('15-MAY-2001')),deh_locacion(deh_locacion.validarCodigoPostal(1060),deh_locacion.validarLatitud(10.491358313063788),deh_locacion.validarLongitud(-66.85341484987889),'Ave Jose Felix Sosa'))RETURNING CLI_FOTO INTO V_TEMP;
    V_NOMBRE_FOTO := 'CLIENTE_1.PNG';
    V_BFILE := BFILENAME('CLIENTES_LOB',V_NOMBRE_FOTO);
    DBMS_LOB.OPEN(V_BFILE, DBMS_LOB.LOB_READONLY);
    DBMS_LOB.LOADFROMFILE(V_TEMP,V_BFILE,DBMS_LOB.GETLENGTH(V_BFILE));
    DBMS_LOB.CLOSE(V_BFILE);

    INSERT INTO deh_clientes VALUES (SEQ_CLIENTES.NEXTVAL,24854174,'alvin.yashitori_456@gmail.com','+81 3 5555 1234','Ocasional',EMPTY_BLOB(), 23 , deh_PERSONA(deh_PERSONA.validarNombre('Alvin'),deh_PERSONA.validarApellido('Yashitori'),deh_PERSONA.validarGenero('Hombre'),deh_PERSONA.validarFechaNac('25-JUL-1991')),deh_locacion(deh_locacion.validarCodigoPostal(1060),deh_locacion.validarLatitud(10.491148238275395),deh_locacion.validarLongitud(-66.8549209087505),'Ave Libertador'))RETURNING CLI_FOTO INTO V_TEMP;
    V_NOMBRE_FOTO := 'CLIENTE_2.PNG';
    V_BFILE := BFILENAME('CLIENTES_LOB',V_NOMBRE_FOTO);
    DBMS_LOB.OPEN(V_BFILE, DBMS_LOB.LOB_READONLY);
    DBMS_LOB.LOADFROMFILE(V_TEMP,V_BFILE,DBMS_LOB.GETLENGTH(V_BFILE));
    DBMS_LOB.CLOSE(V_BFILE);
    
    INSERT INTO deh_clientes VALUES (SEQ_CLIENTES.NEXTVAL,23456896, 'mmlopez@gmail.com' ,'+34 91 890 1234','Ocasional', EMPTY_BLOB(),30,deh_PERSONA(deh_PERSONA.validarNombre('Marco'),deh_PERSONA.validarApellido('Lopez'),deh_PERSONA.validarGenero('Hombre'),deh_PERSONA.validarFechaNac('13-NOV-1998')),deh_locacion(deh_locacion.validarCodigoPostal(1060),deh_locacion.validarLatitud(10.49901558023973),deh_locacion.validarLongitud(-66.84754919202658),'Ave Francisco de Miranda'))RETURNING CLI_FOTO INTO V_TEMP;
    V_NOMBRE_FOTO := 'CLIENTE_3.PNG';
    V_BFILE := BFILENAME('CLIENTES_LOB',V_NOMBRE_FOTO);
    DBMS_LOB.OPEN(V_BFILE, DBMS_LOB.LOB_READONLY);
    DBMS_LOB.LOADFROMFILE(V_TEMP,V_BFILE,DBMS_LOB.GETLENGTH(V_BFILE));
    DBMS_LOB.CLOSE(V_BFILE);
    
    INSERT INTO deh_clientes VALUES (SEQ_CLIENTES.NEXTVAL,7336580, 'bryant.deg12@gmail.com', '+58 414 3080630', 'Frecuente',EMPTY_BLOB(),23,deh_PERSONA(deh_PERSONA.validarNombre('Bryant'),deh_PERSONA.validarApellido('Delgado'),deh_PERSONA.validarGenero('Hombre'),deh_PERSONA.validarFechaNac('20-FEB-1987')),deh_locacion(deh_locacion.validarCodigoPostal(1061),deh_locacion.validarLatitud(10.472079473223346),deh_locacion.validarLongitud(-66.84826572995523),'Calle Sofia Sur'))RETURNING CLI_FOTO INTO V_TEMP;
    V_NOMBRE_FOTO := 'CLIENTE_4.PNG';
    V_BFILE := BFILENAME('CLIENTES_LOB',V_NOMBRE_FOTO);
    DBMS_LOB.OPEN(V_BFILE, DBMS_LOB.LOB_READONLY);
    DBMS_LOB.LOADFROMFILE(V_TEMP,V_BFILE,DBMS_LOB.GETLENGTH(V_BFILE));
    DBMS_LOB.CLOSE(V_BFILE);
    
    INSERT INTO deh_clientes VALUES (SEQ_CLIENTES.NEXTVAL,20439944,'joaocarvalho@gmail.com','+55 11 5555 1234','Frecuente',EMPTY_BLOB(),31,deh_PERSONA(deh_PERSONA.validarNombre('Joao'),deh_PERSONA.validarApellido('Carvalho'),deh_PERSONA.validarGenero('Hombre'),deh_PERSONA.validarFechaNac('10-SEP-1991')),deh_locacion(deh_locacion.validarCodigoPostal(1070),deh_locacion.validarLatitud(10.497088524602644),deh_locacion.validarLongitud(-66.85169973435512),'Calle Eugenio Mendoza'))RETURNING CLI_FOTO INTO V_TEMP;
    V_NOMBRE_FOTO := 'CLIENTE_5.PNG';
    V_BFILE := BFILENAME('CLIENTES_LOB',V_NOMBRE_FOTO);
    DBMS_LOB.OPEN(V_BFILE, DBMS_LOB.LOB_READONLY);
    DBMS_LOB.LOADFROMFILE(V_TEMP,V_BFILE,DBMS_LOB.GETLENGTH(V_BFILE));
    DBMS_LOB.CLOSE(V_BFILE);
    
    INSERT INTO deh_clientes VALUES (SEQ_CLIENTES.NEXTVAL,8456143, 'mmorales@gmail.com' ,'+52 55 7890 1234','Frecuente',EMPTY_BLOB(),32,deh_PERSONA(deh_PERSONA.validarNombre('Moisés'),deh_PERSONA.validarApellido('Morales'),deh_PERSONA.validarGenero('Hombre'),deh_PERSONA.validarFechaNac('18-MAR-1970')),deh_locacion(deh_locacion.validarCodigoPostal(1062),deh_locacion.validarLatitud(10.48268983448182),deh_locacion.validarLongitud(-66.85015536319104),'Calle La Guairita'))RETURNING CLI_FOTO INTO V_TEMP;
    V_NOMBRE_FOTO := 'CLIENTE_6.PNG';
    V_BFILE := BFILENAME('CLIENTES_LOB',V_NOMBRE_FOTO);
    DBMS_LOB.OPEN(V_BFILE, DBMS_LOB.LOB_READONLY);
    DBMS_LOB.LOADFROMFILE(V_TEMP,V_BFILE,DBMS_LOB.GETLENGTH(V_BFILE));
    DBMS_LOB.CLOSE(V_BFILE);
    
    INSERT INTO deh_clientes VALUES (SEQ_CLIENTES.NEXTVAL,28573052,'raarteaga@ucab.edu.ve','+58 424 1413488','Premium',EMPTY_BLOB(),23,deh_PERSONA(deh_PERSONA.validarNombre('Raymond'),deh_PERSONA.validarApellido('Arteaga'),deh_PERSONA.validarGenero('Hombre'),deh_PERSONA.validarFechaNac('12-OCT-2001')),deh_locacion(deh_locacion.validarCodigoPostal(1050),deh_locacion.validarLatitud(10.467872294194953),deh_locacion.validarLongitud(-66.87430340284054),'Ave Jose Maria Vargas'))RETURNING CLI_FOTO INTO V_TEMP;
    V_NOMBRE_FOTO := 'CLIENTE_7.PNG';
    V_BFILE := BFILENAME('CLIENTES_LOB',V_NOMBRE_FOTO);
    DBMS_LOB.OPEN(V_BFILE, DBMS_LOB.LOB_READONLY);
    DBMS_LOB.LOADFROMFILE(V_TEMP,V_BFILE,DBMS_LOB.GETLENGTH(V_BFILE));
    DBMS_LOB.CLOSE(V_BFILE);
    
    INSERT INTO deh_clientes VALUES (SEQ_CLIENTES.NEXTVAL,10143434,'glsenior@gmail.com','+39 02 5678 9012','Premium',EMPTY_BLOB(),23,deh_PERSONA(deh_PERSONA.validarNombre('Gladys'),deh_PERSONA.validarApellido('Senior'),deh_PERSONA.validarGenero('Mujer'),deh_PERSONA.validarFechaNac('27-APR-1980')),deh_locacion(deh_locacion.validarCodigoPostal(1030),deh_locacion.validarLatitud(10.514910087108543),deh_locacion.validarLongitud(-66.96250911251131),'Calle Isaia Medina Angarita'))RETURNING CLI_FOTO INTO V_TEMP;
    V_NOMBRE_FOTO := 'CLIENTE_8.PNG';
    V_BFILE := BFILENAME('CLIENTES_LOB',V_NOMBRE_FOTO);
    DBMS_LOB.OPEN(V_BFILE, DBMS_LOB.LOB_READONLY);
    DBMS_LOB.LOADFROMFILE(V_TEMP,V_BFILE,DBMS_LOB.GETLENGTH(V_BFILE));
    DBMS_LOB.CLOSE(V_BFILE);
    
    INSERT INTO deh_clientes VALUES (SEQ_CLIENTES.NEXTVAL,27333452, 'jessicolmenares@gmail.com' ,'+58 414 1208962','Frecuente',EMPTY_BLOB(),24,deh_PERSONA(deh_PERSONA.validarNombre('Jessica'),deh_PERSONA.validarApellido('Colmenares'),deh_PERSONA.validarGenero('Mujer'),deh_PERSONA.validarFechaNac('01-JAN-2000')),deh_locacion(deh_locacion.validarCodigoPostal(4003),deh_locacion.validarLatitud(10.671266889540984),deh_locacion.validarLongitud(-71.61703104105513),'Calle 70'))RETURNING CLI_FOTO INTO V_TEMP;
    V_NOMBRE_FOTO := 'CLIENTE_9.PNG';
    V_BFILE := BFILENAME('CLIENTES_LOB',V_NOMBRE_FOTO);
    DBMS_LOB.OPEN(V_BFILE, DBMS_LOB.LOB_READONLY);
    DBMS_LOB.LOADFROMFILE(V_TEMP,V_BFILE,DBMS_LOB.GETLENGTH(V_BFILE));
    DBMS_LOB.CLOSE(V_BFILE);
    
    INSERT INTO deh_clientes VALUES (SEQ_CLIENTES.NEXTVAL,21434343,'marta_frndez@gmail.com' ,'58 414 2318019','Frecuente',EMPTY_BLOB(),25,deh_PERSONA(deh_PERSONA.validarNombre('Marta'),deh_PERSONA.validarApellido('Fernandez'),deh_PERSONA.validarGenero('Mujer'),deh_PERSONA.validarFechaNac('30-AUG-1992')),deh_locacion(deh_locacion.validarCodigoPostal(1204),deh_locacion.validarLatitud(10.378395079344157),deh_locacion.validarLongitud(-66.95691315303158),'Calle Belverede'))RETURNING CLI_FOTO INTO V_TEMP;
    V_NOMBRE_FOTO := 'CLIENTE_10.PNG';
    V_BFILE := BFILENAME('CLIENTES_LOB',V_NOMBRE_FOTO);
    DBMS_LOB.OPEN(V_BFILE, DBMS_LOB.LOB_READONLY);
    DBMS_LOB.LOADFROMFILE(V_TEMP,V_BFILE,DBMS_LOB.GETLENGTH(V_BFILE));
    DBMS_LOB.CLOSE(V_BFILE);
    
    INSERT INTO deh_clientes VALUES (SEQ_CLIENTES.NEXTVAL,23256977,'annie.brown_95@gmail.com','+61 10 2345 6789','Ocasional',EMPTY_BLOB(),24,deh_PERSONA(deh_PERSONA.validarNombre('Annie'),deh_PERSONA.validarApellido('Brown'),deh_PERSONA.validarGenero('Mujer'),deh_PERSONA.validarFechaNac('11-JUL-1995')),deh_locacion(deh_locacion.validarCodigoPostal(4005),deh_locacion.validarLatitud(10.695995771038767),deh_locacion.validarLongitud(-71.63514221945087),'Troncal 16'))RETURNING CLI_FOTO INTO V_TEMP;
    V_NOMBRE_FOTO := 'CLIENTE_11.PNG';
    V_BFILE := BFILENAME('CLIENTES_LOB',V_NOMBRE_FOTO);
    DBMS_LOB.OPEN(V_BFILE, DBMS_LOB.LOB_READONLY);
    DBMS_LOB.LOADFROMFILE(V_TEMP,V_BFILE,DBMS_LOB.GETLENGTH(V_BFILE));
    DBMS_LOB.CLOSE(V_BFILE);
    
    INSERT INTO deh_clientes VALUES (SEQ_CLIENTES.NEXTVAL,20578456, 'mvburen@gmail.com','+31 20 5555 1214', 'Ocasional',EMPTY_BLOB(),23,deh_PERSONA(deh_PERSONA.validarNombre('Monique'),deh_PERSONA.validarApellido('Van Buren'),deh_PERSONA.validarGenero('Mujer'),deh_PERSONA.validarFechaNac('09-AUG-1991')),deh_locacion(deh_locacion.validarCodigoPostal(1041),deh_locacion.validarLatitud(10.44485396916514),deh_locacion.validarLongitud(-66.8556812998511),'Calle del Topo'))RETURNING CLI_FOTO INTO V_TEMP;
    V_NOMBRE_FOTO := 'CLIENTE_12.PNG';
    V_BFILE := BFILENAME('CLIENTES_LOB',V_NOMBRE_FOTO);
    DBMS_LOB.OPEN(V_BFILE, DBMS_LOB.LOB_READONLY);
    DBMS_LOB.LOADFROMFILE(V_TEMP,V_BFILE,DBMS_LOB.GETLENGTH(V_BFILE));
    DBMS_LOB.CLOSE(V_BFILE);
    
    INSERT INTO deh_clientes VALUES (SEQ_CLIENTES.NEXTVAL,18970345,'eli_gelbert@gmail.com','+1 416 715 5638','Ocasional',EMPTY_BLOB(),23,deh_PERSONA(deh_PERSONA.validarNombre('Elizabeth'),deh_PERSONA.validarApellido('Gelbert'),deh_PERSONA.validarGenero('Mujer'),deh_PERSONA.validarFechaNac('30-APR-1985')),deh_locacion(deh_locacion.validarCodigoPostal(1042),deh_locacion.validarLatitud(10.479630318235092),deh_locacion.validarLongitud( -66.79009223093126),'Calle Vistas Altas'))RETURNING CLI_FOTO INTO V_TEMP;
    V_NOMBRE_FOTO := 'CLIENTE_13.PNG';
    V_BFILE := BFILENAME('CLIENTES_LOB',V_NOMBRE_FOTO);
    DBMS_LOB.OPEN(V_BFILE, DBMS_LOB.LOB_READONLY);
    DBMS_LOB.LOADFROMFILE(V_TEMP,V_BFILE,DBMS_LOB.GETLENGTH(V_BFILE));
    DBMS_LOB.CLOSE(V_BFILE);
    
    INSERT INTO deh_clientes VALUES (SEQ_CLIENTES.NEXTVAL,27455890,'eagil@ucab.edu.ve','+58 412 6347179','Premium',EMPTY_BLOB(),23,deh_PERSONA(deh_PERSONA.validarNombre('Eleazar'),deh_PERSONA.validarApellido('Gil'),deh_PERSONA.validarGenero('Hombre'),deh_PERSONA.validarFechaNac('21-MAR-2001')),deh_locacion(deh_locacion.validarCodigoPostal(1020),deh_locacion.validarLatitud(10.487379669609913),deh_locacion.validarLongitud(-66.93966377035159),'Avenida Washington'))RETURNING CLI_FOTO INTO V_TEMP;
    V_NOMBRE_FOTO := 'CLIENTE_14.PNG';
    V_BFILE := BFILENAME('CLIENTES_LOB',V_NOMBRE_FOTO);
    DBMS_LOB.OPEN(V_BFILE, DBMS_LOB.LOB_READONLY);
    DBMS_LOB.LOADFROMFILE(V_TEMP,V_BFILE,DBMS_LOB.GETLENGTH(V_BFILE));
    DBMS_LOB.CLOSE(V_BFILE);
    
    INSERT INTO deh_clientes VALUES (SEQ_CLIENTES.NEXTVAL,28301361,'imvisconit@ucab.edu.ve','+58 412 9064831','Premium',EMPTY_BLOB(),23,deh_PERSONA(deh_PERSONA.validarNombre('Italo'),deh_PERSONA.validarApellido('Visconti'),deh_PERSONA.validarGenero('Hombre'),deh_PERSONA.validarFechaNac('14-DEC-2010')),deh_locacion(deh_locacion.validarCodigoPostal(1041),deh_locacion.validarLatitud(10.48430939620237),deh_locacion.validarLongitud(-66.89215590568561),'Calle Ventuari'))RETURNING CLI_FOTO INTO V_TEMP;
    V_NOMBRE_FOTO := 'CLIENTE_15.PNG';
    V_BFILE := BFILENAME('CLIENTES_LOB',V_NOMBRE_FOTO);
    DBMS_LOB.OPEN(V_BFILE, DBMS_LOB.LOB_READONLY);
    DBMS_LOB.LOADFROMFILE(V_TEMP,V_BFILE,DBMS_LOB.GETLENGTH(V_BFILE));
    DBMS_LOB.CLOSE(V_BFILE);

END;

-- TABLA SEDES

CREATE TABLE deh_sedes (
    sed_cod number (2) PRIMARY KEY,
    sed_ciu_cod number (4) NOT NULL,
    sed_empresa deh_EMPRESA,
    sed_locacion deh_LOCACION,

 -- Clave forÃ¡nea
    CONSTRAINT fk_sed_ciu FOREIGN KEY (sed_ciu_cod) REFERENCES deh_lugares_geo (lug_cod)
);

CREATE SEQUENCE SEQ_SEDES
    START WITH 1
    INCREMENT BY 1;

--INSERCION SEDES

INSERT INTO deh_sedes VALUES (SEQ_SEDES.NEXTVAL, 23, deh_EMPRESA(deh_EMPRESA.formatoTelefono('0212-5551234'), deh_EMPRESA.validarRIF('J-846295713'), deh_EMPRESA.formatoCorreo('apex_ccs@gmail.com.ve')), deh_LOCACION(deh_LOCACION.validarCodigoPostal(1060), deh_LOCACION.validarLatitud(10.504397624460937), deh_LOCACION.validarLongitud(-66.87185167850703), 'Calle Ávila'));
INSERT INTO deh_sedes VALUES (SEQ_SEDES.NEXTVAL, 23, deh_EMPRESA(deh_EMPRESA.formatoTelefono('0214-3453452'), deh_EMPRESA.validarRIF('J-527108364'), deh_EMPRESA.formatoCorreo('apex_ccs@gmail.com.ve')), deh_LOCACION(deh_LOCACION.validarCodigoPostal(1071), deh_LOCACION.validarLatitud(10.474200547779837), deh_LOCACION.validarLongitud(-66.81635609143808), 'Calle Sta.Margarita'));
INSERT INTO deh_sedes VALUES (SEQ_SEDES.NEXTVAL, 23, deh_EMPRESA(deh_EMPRESA.formatoTelefono('0216-8324951'), deh_EMPRESA.validarRIF('J-936471825'), deh_EMPRESA.formatoCorreo('apex_ccs@gmail.com.ve')), deh_LOCACION(deh_LOCACION.validarCodigoPostal(1011), deh_LOCACION.validarLatitud(10.502088669058118), deh_LOCACION.validarLongitud(-66.90461204718008), 'Avenida Universidad'));
INSERT INTO deh_sedes VALUES (SEQ_SEDES.NEXTVAL, 23, deh_EMPRESA(deh_EMPRESA.formatoTelefono('0212-9998876'), deh_EMPRESA.validarRIF('J-215638479'), deh_EMPRESA.formatoCorreo('apex_ccs@gmail.com.ve')), deh_LOCACION(deh_LOCACION.validarCodigoPostal(1071), deh_LOCACION.validarLatitud(10.490434444161137), deh_LOCACION.validarLongitud(-66.81555956102447), 'Calle Carapa'));
INSERT INTO deh_sedes VALUES (SEQ_SEDES.NEXTVAL, 23, deh_EMPRESA(deh_EMPRESA.formatoTelefono('0212-4023958'), deh_EMPRESA.validarRIF('J-794503186'), deh_EMPRESA.formatoCorreo('apex_ccs@gmail.com.ve')), deh_LOCACION(deh_LOCACION.validarCodigoPostal(1060), deh_LOCACION.validarLatitud(10.491016462965362), deh_LOCACION.validarLongitud(-66.84927116776237), 'Avenida Sur Altamira'));
INSERT INTO deh_sedes VALUES (SEQ_SEDES.NEXTVAL, 24, deh_EMPRESA(deh_EMPRESA.formatoTelefono('0212-1495945'), deh_EMPRESA.validarRIF('J-683951027'), deh_EMPRESA.formatoCorreo('apex_mcbo@gmail.com.ve')), deh_LOCACION(deh_LOCACION.validarCodigoPostal(4001), deh_LOCACION.validarLatitud(10.642856089980317), deh_LOCACION.validarLongitud(-71.64151273771449), 'Barrio Canada Honda'));
INSERT INTO deh_sedes VALUES (SEQ_SEDES.NEXTVAL, 24, deh_EMPRESA(deh_EMPRESA.formatoTelefono('0214-3058285'), deh_EMPRESA.validarRIF('J-372846915'), deh_EMPRESA.formatoCorreo('apex_mcbo@gmail.com.ve')), deh_LOCACION(deh_LOCACION.validarCodigoPostal(4001), deh_LOCACION.validarLatitud(10.628027069075248), deh_LOCACION.validarLongitud(-71.64609725572744), 'Calle 100'));
INSERT INTO deh_sedes VALUES (SEQ_SEDES.NEXTVAL, 25, deh_EMPRESA(deh_EMPRESA.formatoTelefono('0214-1831576'), deh_EMPRESA.validarRIF('J-410276538'), deh_EMPRESA.formatoCorreo('apex_val@gmail.com.ve')), deh_LOCACION(deh_LOCACION.validarCodigoPostal(1201), deh_LOCACION.validarLatitud(10.339422937620164), deh_LOCACION.validarLongitud(-67.0430242764328), 'Avenida Jose Arvelo'));
INSERT INTO deh_sedes VALUES (SEQ_SEDES.NEXTVAL, 25, deh_EMPRESA(deh_EMPRESA.formatoTelefono('0212-2496283'), deh_EMPRESA.validarRIF('J-598317642'), deh_EMPRESA.formatoCorreo('apex_val@gmail.com.ve')), deh_LOCACION(deh_LOCACION.validarCodigoPostal(1201), deh_LOCACION.validarLatitud(10.354775114807254), deh_LOCACION.validarLongitud(-67.02913287315808), 'Avenida Pérez Pisanti'));
INSERT INTO deh_sedes VALUES (SEQ_SEDES.NEXTVAL, 26, deh_EMPRESA(deh_EMPRESA.formatoTelefono('0216-3192495'), deh_EMPRESA.validarRIF('J-127495836'), deh_EMPRESA.formatoCorreo('apex_lts@gmail.com.ve')), deh_LOCACION(deh_LOCACION.validarCodigoPostal(2001), deh_LOCACION.validarLatitud(10.15546003440582), deh_LOCACION.validarLongitud(-68.02736372335144), 'Calle 53'));
INSERT INTO deh_sedes VALUES (SEQ_SEDES.NEXTVAL, 26, deh_EMPRESA(deh_EMPRESA.formatoTelefono('0424-5821053'), deh_EMPRESA.validarRIF('J-364802597'), deh_EMPRESA.formatoCorreo('apex_lts@gmail.com.ve')), deh_LOCACION(deh_LOCACION.validarCodigoPostal(2001), deh_LOCACION.validarLatitud(10.164399404539083), deh_LOCACION.validarLongitud(-68.00045503412188), 'Avenida 100 Bolívar Sur'));
INSERT INTO deh_sedes VALUES (SEQ_SEDES.NEXTVAL, 27, deh_EMPRESA(deh_EMPRESA.formatoTelefono('0212-8593533'), deh_EMPRESA.validarRIF('J-781629304'), deh_EMPRESA.formatoCorreo('apex_cor@gmail.com.ve')), deh_LOCACION(deh_LOCACION.validarCodigoPostal(5201), deh_LOCACION.validarLatitud(8.617981237003134), deh_LOCACION.validarLongitud(-70.22880406087555), 'Calle Atahualpa'));
INSERT INTO deh_sedes VALUES (SEQ_SEDES.NEXTVAL, 27, deh_EMPRESA(deh_EMPRESA.formatoTelefono('0216-2314506'), deh_EMPRESA.validarRIF('J-439258716'), deh_EMPRESA.formatoCorreo('apex_cor@gmail.com.ve')), deh_LOCACION(deh_LOCACION.validarCodigoPostal(5201), deh_LOCACION.validarLatitud(8.630868815510855), deh_LOCACION.validarLongitud(-70.21798521880073), 'Avenida San Luis'));
INSERT INTO deh_sedes VALUES (SEQ_SEDES.NEXTVAL, 28, deh_EMPRESA(deh_EMPRESA.formatoTelefono('0424-6030492'), deh_EMPRESA.validarRIF('J-652147389'), deh_EMPRESA.formatoCorreo('apex_bar@gmail.com.ve')), deh_LOCACION(deh_LOCACION.validarCodigoPostal(4101), deh_LOCACION.validarLatitud(11.409202892142043), deh_LOCACION.validarLongitud(-69.66774312196041), 'Calle Purupeche'));
INSERT INTO deh_sedes VALUES (SEQ_SEDES.NEXTVAL, 28, deh_EMPRESA(deh_EMPRESA.formatoTelefono('0424-1042055'), deh_EMPRESA.validarRIF('J-918563027'), deh_EMPRESA.formatoCorreo('apex_bar@gmail.com.ve')), deh_LOCACION(deh_LOCACION.validarCodigoPostal(4101), deh_LOCACION.validarLatitud(11.38769159965619), deh_LOCACION.validarLongitud(-69.70362090507793), 'Autopista Variante Norte'));

-- TABLA EMPLEADOS

CREATE TABLE deh_empleados (
    emp_cod number (5) PRIMARY KEY,
    emp_cargo varchar2 (30) NOT NULL,
    emp_sed_cod number (2) NOT NULL,
    emp_persona deh_PERSONA,

 -- Clave forÃ¡nea
    CONSTRAINT fk_emp_sed FOREIGN KEY (emp_sed_cod) REFERENCES deh_sedes (sed_cod)
);

CREATE SEQUENCE SEQ_EMPLEADOS
    START WITH 1
    INCREMENT BY 1;
-- INSERCION EMPLEADOS

INSERT INTO deh_empleados VALUES (SEQ_EMPLEADOS.NEXTVAL, 'Gerente', 1, deh_PERSONA(deh_PERSONA.validarNombre('Carlos'), deh_PERSONA.validarApellido('Morón'), deh_PERSONA.validarGenero('Hombre'), deh_PERSONA.validarFechaNac('13-DEC-2001')));
INSERT INTO deh_empleados VALUES (SEQ_EMPLEADOS.NEXTVAL, 'Coordinador de ventas', 1, deh_PERSONA(deh_PERSONA.validarNombre('Diego'), deh_PERSONA.validarApellido('Aragott'), deh_PERSONA.validarGenero('Hombre'), deh_PERSONA.validarFechaNac('27-FEB-1994')));
INSERT INTO deh_empleados VALUES (SEQ_EMPLEADOS.NEXTVAL, 'Mecánico', 1, deh_PERSONA(deh_PERSONA.validarNombre('María Fernanda'), deh_PERSONA.validarApellido('Torres'), deh_PERSONA.validarGenero('Mujer'), deh_PERSONA.validarFechaNac('01-APR-1990')));
INSERT INTO deh_empleados VALUES (SEQ_EMPLEADOS.NEXTVAL, 'Mecánico', 1, deh_PERSONA(deh_PERSONA.validarNombre('Luis'), deh_PERSONA.validarApellido('Aparicio'), deh_PERSONA.validarGenero('Hombre'), deh_PERSONA.validarFechaNac('08-JUL-1982')));
INSERT INTO deh_empleados VALUES (SEQ_EMPLEADOS.NEXTVAL, 'Gerente', 2, deh_PERSONA(deh_PERSONA.validarNombre('Nicolás'), deh_PERSONA.validarApellido('Setién'), deh_PERSONA.validarGenero('Hombre'), deh_PERSONA.validarFechaNac('02-SEP-1988')));
INSERT INTO deh_empleados VALUES (SEQ_EMPLEADOS.NEXTVAL, 'Coordinador de ventas', 2, deh_PERSONA(deh_PERSONA.validarNombre('Hernan'), deh_PERSONA.validarApellido('Oropeza'), deh_PERSONA.validarGenero('Hombre'), deh_PERSONA.validarFechaNac('24-JAN-1981')));
INSERT INTO deh_empleados VALUES (SEQ_EMPLEADOS.NEXTVAL, 'Mecánico', 2, deh_PERSONA(deh_PERSONA.validarNombre('Mayra'), deh_PERSONA.validarApellido('Figueroa'), deh_PERSONA.validarGenero('Mujer'), deh_PERSONA.validarFechaNac('19-MAR-1987')));
INSERT INTO deh_empleados VALUES (SEQ_EMPLEADOS.NEXTVAL, 'Mecánico', 2, deh_PERSONA(deh_PERSONA.validarNombre('Gonzalo'), deh_PERSONA.validarApellido('Giraldo'), deh_PERSONA.validarGenero('Hombre'), deh_PERSONA.validarFechaNac('25-JUN-1996')));
INSERT INTO deh_empleados VALUES (SEQ_EMPLEADOS.NEXTVAL, 'Gerente', 3, deh_PERSONA(deh_PERSONA.validarNombre('Amanda'), deh_PERSONA.validarApellido('El Asmar'), deh_PERSONA.validarGenero('Mujer'), deh_PERSONA.validarFechaNac('20-AUG-1985')));
INSERT INTO deh_empleados VALUES (SEQ_EMPLEADOS.NEXTVAL, 'Coordinador de ventas', 3, deh_PERSONA(deh_PERSONA.validarNombre('Kelly'), deh_PERSONA.validarApellido('López'), deh_PERSONA.validarGenero('Mujer'), deh_PERSONA.validarFechaNac('07-FEB-1984')));
INSERT INTO deh_empleados VALUES (SEQ_EMPLEADOS.NEXTVAL, 'Gerente', 3, deh_PERSONA(deh_PERSONA.validarNombre('Katherine'), deh_PERSONA.validarApellido('Mendible'), deh_PERSONA.validarGenero('Mujer'), deh_PERSONA.validarFechaNac('16-AUG-1986')));
INSERT INTO deh_empleados VALUES (SEQ_EMPLEADOS.NEXTVAL, 'Coordinador de ventas', 3, deh_PERSONA(deh_PERSONA.validarNombre('Jorge'), deh_PERSONA.validarApellido('León'), deh_PERSONA.validarGenero('Hombre'), deh_PERSONA.validarFechaNac('02-SEP-1988')));
INSERT INTO deh_empleados VALUES (SEQ_EMPLEADOS.NEXTVAL, 'Mecánico', 4, deh_PERSONA(deh_PERSONA.validarNombre('Francisca'), deh_PERSONA.validarApellido('Bonaparte'), deh_PERSONA.validarGenero('Mujer'), deh_PERSONA.validarFechaNac('14-OCT-1991')));
INSERT INTO deh_empleados VALUES (SEQ_EMPLEADOS.NEXTVAL, 'Mecánico', 4, deh_PERSONA(deh_PERSONA.validarNombre('Ricardo'), deh_PERSONA.validarApellido('Salvatorelli'), deh_PERSONA.validarGenero('Hombre'), deh_PERSONA.validarFechaNac('29-NOV-1993')));
INSERT INTO deh_empleados VALUES (SEQ_EMPLEADOS.NEXTVAL, 'Gerente', 4, deh_PERSONA(deh_PERSONA.validarNombre('Aytor'), deh_PERSONA.validarApellido('Parilla'), deh_PERSONA.validarGenero('Hombre'), deh_PERSONA.validarFechaNac('12-JUN-2000')));
INSERT INTO deh_empleados VALUES (SEQ_EMPLEADOS.NEXTVAL, 'Coordinador de ventas', 4, deh_PERSONA(deh_PERSONA.validarNombre('Jessica'), deh_PERSONA.validarApellido('Rodríguez'), deh_PERSONA.validarGenero('Mujer'), deh_PERSONA.validarFechaNac('05-FEB-1995')));
INSERT INTO deh_empleados VALUES (SEQ_EMPLEADOS.NEXTVAL, 'Mecánico', 5, deh_PERSONA(deh_PERSONA.validarNombre('Luis'), deh_PERSONA.validarApellido('Gómez'), deh_PERSONA.validarGenero('Hombre'), deh_PERSONA.validarFechaNac('20-SEP-1986')));
INSERT INTO deh_empleados VALUES (SEQ_EMPLEADOS.NEXTVAL, 'Mecánico', 5, deh_PERSONA(deh_PERSONA.validarNombre('María'), deh_PERSONA.validarApellido('Torres'), deh_PERSONA.validarGenero('Mujer'), deh_PERSONA.validarFechaNac('14-JUL-1983')));
INSERT INTO deh_empleados VALUES (SEQ_EMPLEADOS.NEXTVAL, 'Gerente', 5, deh_PERSONA(deh_PERSONA.validarNombre('Blase'), deh_PERSONA.validarApellido('Galindo'), deh_PERSONA.validarGenero('Hombre'), deh_PERSONA.validarFechaNac('28-DEC-1998')));
INSERT INTO deh_empleados VALUES (SEQ_EMPLEADOS.NEXTVAL, 'Coordinador de ventas', 5, deh_PERSONA(deh_PERSONA.validarNombre('Ana'), deh_PERSONA.validarApellido('López'), deh_PERSONA.validarGenero ('Mujer'), deh_PERSONA.validarFechaNac('17-MAR-1991')));
INSERT INTO deh_empleados VALUES (SEQ_EMPLEADOS.NEXTVAL, 'Gerente', 6, deh_PERSONA(deh_PERSONA.validarNombre('Carlos'), deh_PERSONA.validarApellido('González'), deh_PERSONA.validarGenero('Hombre'), deh_PERSONA.validarFechaNac('10-MAY-1984')));
INSERT INTO deh_empleados VALUES (SEQ_EMPLEADOS.NEXTVAL, 'Coordinador de ventas', 6, deh_PERSONA(deh_PERSONA.validarNombre('Laura'), deh_PERSONA.validarApellido('Martínez'), deh_PERSONA.validarGenero('Mujer'), deh_PERSONA.validarFechaNac('23-JUN-1997')));
INSERT INTO deh_empleados VALUES (SEQ_EMPLEADOS.NEXTVAL, 'Mecánico', 6, deh_PERSONA(deh_PERSONA.validarNombre('Juan'), deh_PERSONA.validarApellido('Rodríguez'), deh_PERSONA.validarGenero('Hombre'), deh_PERSONA.validarFechaNac('09-JAN-1989')));
INSERT INTO deh_empleados VALUES (SEQ_EMPLEADOS.NEXTVAL, 'Mecánico', 6, deh_PERSONA(deh_PERSONA.validarNombre('Andrea'), deh_PERSONA.validarApellido('Hernández'), deh_PERSONA.validarGenero('Mujer'), deh_PERSONA.validarFechaNac('03-AUG-1992')));
INSERT INTO deh_empleados VALUES (SEQ_EMPLEADOS.NEXTVAL, 'Gerente', 7, deh_PERSONA(deh_PERSONA.validarNombre('Alejandro'), deh_PERSONA.validarApellido('Pérez'), deh_PERSONA.validarGenero('Hombre'), deh_PERSONA.validarFechaNac('12-OCT-1987')));
INSERT INTO deh_empleados VALUES (SEQ_EMPLEADOS.NEXTVAL, 'Coordinador de ventas', 7, deh_PERSONA(deh_PERSONA.validarNombre('Valentina'), deh_PERSONA.validarApellido('García'), deh_PERSONA.validarGenero('Mujer'), deh_PERSONA.validarFechaNac('31-JAN-1996')));
INSERT INTO deh_empleados VALUES (SEQ_EMPLEADOS.NEXTVAL, 'Mecánico', 7, deh_PERSONA(deh_PERSONA.validarNombre('Miguel'), deh_PERSONA.validarApellido('Sánchez'), deh_PERSONA.validarGenero('Hombre'), deh_PERSONA.validarFechaNac('07-NOV-1981')));
INSERT INTO deh_empleados VALUES (SEQ_EMPLEADOS.NEXTVAL, 'Mecánico', 7, deh_PERSONA(deh_PERSONA.validarNombre('Camila'), deh_PERSONA.validarApellido('Ramírez'), deh_PERSONA.validarGenero('Mujer'), deh_PERSONA.validarFechaNac('26-APR-1993')));
INSERT INTO deh_empleados VALUES (SEQ_EMPLEADOS.NEXTVAL, 'Gerente', 8, deh_PERSONA(deh_PERSONA.validarNombre('Rafael'), deh_PERSONA.validarApellido('Flores'), deh_PERSONA.validarGenero('Hombre'), deh_PERSONA.validarFechaNac('19-MAY-1980')));
INSERT INTO deh_empleados VALUES (SEQ_EMPLEADOS.NEXTVAL, 'Coordinador de ventas', 8, deh_PERSONA(deh_PERSONA.validarNombre('Gabriela'), deh_PERSONA.validarApellido('Jiménez'), deh_PERSONA.validarGenero('Mujer'), deh_PERSONA.validarFechaNac('02-JUL-1999')));
INSERT INTO deh_empleados VALUES (SEQ_EMPLEADOS.NEXTVAL, 'Mecánico', 8, deh_PERSONA(deh_PERSONA.validarNombre('Fernando'), deh_PERSONA.validarApellido('Romero'), deh_PERSONA.validarGenero('Hombre'), deh_PERSONA.validarFechaNac('15-MAR-1985')));
INSERT INTO deh_empleados VALUES (SEQ_EMPLEADOS.NEXTVAL, 'Mecánico', 8, deh_PERSONA(deh_PERSONA.validarNombre('Sofía'), deh_PERSONA.validarApellido('Díaz'), deh_PERSONA.validarGenero('Mujer'), deh_PERSONA.validarFechaNac('28-SEP-2000')));
INSERT INTO deh_empleados VALUES (SEQ_EMPLEADOS.NEXTVAL, 'Gerente', 9, deh_PERSONA(deh_PERSONA.validarNombre('Andrés'), deh_PERSONA.validarApellido('Moreno'), deh_PERSONA.validarGenero('Hombre'), deh_PERSONA.validarFechaNac('11-FEB-1997')));
INSERT INTO deh_empleados VALUES (SEQ_EMPLEADOS.NEXTVAL, 'Coordinador de ventas', 9, deh_PERSONA(deh_PERSONA.validarNombre('Isabella'), deh_PERSONA.validarApellido('Muñoz'), deh_PERSONA.validarGenero('Mujer'), deh_PERSONA.validarFechaNac('24-JUL-1982')));
INSERT INTO deh_empleados VALUES (SEQ_EMPLEADOS.NEXTVAL, 'Mecánico', 9, deh_PERSONA(deh_PERSONA.validarNombre('Javier'), deh_PERSONA.validarApellido('Álvarez'), deh_PERSONA.validarGenero('Hombre'), deh_PERSONA.validarFechaNac('06-DEC-1994')));
INSERT INTO deh_empleados VALUES (SEQ_EMPLEADOS.NEXTVAL, 'Mecánico', 9, deh_PERSONA(deh_PERSONA.validarNombre('Daniel'), deh_PERSONA.validarApellido('Vargas'), deh_PERSONA.validarGenero('Hombre'), deh_PERSONA.validarFechaNac('18-APR-1988')));
INSERT INTO deh_empleados VALUES (SEQ_EMPLEADOS.NEXTVAL, 'Gerente', 10, deh_PERSONA(deh_PERSONA.validarNombre('Lucía'), deh_PERSONA.validarApellido('Pérez'), deh_PERSONA.validarGenero('Mujer'), deh_PERSONA.validarFechaNac('01-JUN-2001')));
INSERT INTO deh_empleados VALUES (SEQ_EMPLEADOS.NEXTVAL, 'Coordinador de ventas', 10, deh_PERSONA(deh_PERSONA.validarNombre('Emilio'), deh_PERSONA.validarApellido('González'), deh_PERSONA.validarGenero('Hombre'), deh_PERSONA.validarFechaNac('14-JAN-1990')));
INSERT INTO deh_empleados VALUES (SEQ_EMPLEADOS.NEXTVAL, 'Mecánico', 10, deh_PERSONA(deh_PERSONA.validarNombre('Paula'), deh_PERSONA.validarApellido('Sánchez'), deh_PERSONA.validarGenero('Mujer'), deh_PERSONA.validarFechaNac('27-AUG-1983')));
INSERT INTO deh_empleados VALUES (SEQ_EMPLEADOS.NEXTVAL, 'Mecánico', 10, deh_PERSONA(deh_PERSONA.validarNombre('Diego'), deh_PERSONA.validarApellido('Hernández'), deh_PERSONA.validarGenero('Hombre'), deh_PERSONA.validarFechaNac('09-OCT-1995')));
INSERT INTO deh_empleados VALUES (SEQ_EMPLEADOS.NEXTVAL, 'Gerente', 11, deh_PERSONA(deh_PERSONA.validarNombre('Valeria'), deh_PERSONA.validarApellido('Suik'), deh_PERSONA.validarGenero('Mujer'), deh_PERSONA.validarFechaNac('20-MAR-1986')));
INSERT INTO deh_empleados VALUES (SEQ_EMPLEADOS.NEXTVAL, 'Coordinador de ventas', 11, deh_PERSONA(deh_PERSONA.validarNombre('Héctor'), deh_PERSONA.validarApellido('Gómez'), deh_PERSONA.validarGenero('Hombre'), deh_PERSONA.validarFechaNac('04-JUL-1998')));
INSERT INTO deh_empleados VALUES (SEQ_EMPLEADOS.NEXTVAL, 'Mecánico', 11, deh_PERSONA(deh_PERSONA.validarNombre('Natalia'), deh_PERSONA.validarApellido('López'), deh_PERSONA.validarGenero('Mujer'), deh_PERSONA.validarFechaNac('17-MAY-1991')));
INSERT INTO deh_empleados VALUES (SEQ_EMPLEADOS.NEXTVAL, 'Mecánico', 11, deh_PERSONA(deh_PERSONA.validarNombre('Sebastián'), deh_PERSONA.validarApellido('Rodríguez'), deh_PERSONA.validarGenero('Hombre'), deh_PERSONA.validarFechaNac('30-JAN-1984')));
INSERT INTO deh_empleados VALUES (SEQ_EMPLEADOS.NEXTVAL, 'Gerente', 12, deh_PERSONA(deh_PERSONA.validarNombre('Carolina'), deh_PERSONA.validarApellido('Martínez'), deh_PERSONA.validarGenero('Mujer'), deh_PERSONA.validarFechaNac('11-NOV-1996')));
INSERT INTO deh_empleados VALUES (SEQ_EMPLEADOS.NEXTVAL, 'Coordinador de ventas', 12, deh_PERSONA(deh_PERSONA.validarNombre('Gonzalo'), deh_PERSONA.validarApellido('Torres'), deh_PERSONA.validarGenero('Hombre'), deh_PERSONA.validarFechaNac('25-APR-1981')));
INSERT INTO deh_empleados VALUES (SEQ_EMPLEADOS.NEXTVAL, 'Mecánico', 12, deh_PERSONA(deh_PERSONA.validarNombre('Martina'), deh_PERSONA.validarApellido('Ramírez'), deh_PERSONA.validarGenero('Mujer'), deh_PERSONA.validarFechaNac('08-JUN-1993')));
INSERT INTO deh_empleados VALUES (SEQ_EMPLEADOS.NEXTVAL, 'Mecánico', 12, deh_PERSONA(deh_PERSONA.validarNombre('Roberto'), deh_PERSONA.validarApellido('Flores'), deh_PERSONA.validarGenero('Hombre'), deh_PERSONA.validarFechaNac('20-FEB-1994')));
INSERT INTO deh_empleados VALUES (SEQ_EMPLEADOS.NEXTVAL, 'Gerente', 13, deh_PERSONA(deh_PERSONA.validarNombre('Armen'), deh_PERSONA.validarApellido('Djenanian'), deh_PERSONA.validarGenero('Hombre'), deh_PERSONA.validarFechaNac('08-JUN-1992')));
INSERT INTO deh_empleados VALUES (SEQ_EMPLEADOS.NEXTVAL, 'Coordinador de ventas', 13, deh_PERSONA(deh_PERSONA.validarNombre('Pedro'), deh_PERSONA.validarApellido('Romero'), deh_PERSONA.validarGenero('Hombre'), deh_PERSONA.validarFechaNac('18-DEC-1999')));
INSERT INTO deh_empleados VALUES (SEQ_EMPLEADOS.NEXTVAL, 'Mecánico', 13, deh_PERSONA(deh_PERSONA.validarNombre('Catalina'), deh_PERSONA.validarApellido('Díaz'), deh_PERSONA.validarGenero('Mujer'), deh_PERSONA.validarFechaNac('02-JAN-1982')));
INSERT INTO deh_empleados VALUES (SEQ_EMPLEADOS.NEXTVAL, 'Mecánico', 13, deh_PERSONA(deh_PERSONA.validarNombre('Sergio'), deh_PERSONA.validarApellido('Moreno'), deh_PERSONA.validarGenero('Hombre'), deh_PERSONA.validarFechaNac('13-MAR-1995')));
INSERT INTO deh_empleados VALUES (SEQ_EMPLEADOS.NEXTVAL, 'Gerente', 14, deh_PERSONA(deh_PERSONA.validarNombre('Marcela'), deh_PERSONA.validarApellido('Muñoz'), deh_PERSONA.validarGenero('Mujer'), deh_PERSONA.validarFechaNac('25-SEP-1986')));
INSERT INTO deh_empleados VALUES (SEQ_EMPLEADOS.NEXTVAL, 'Coordinador de ventas', 14, deh_PERSONA(deh_PERSONA.validarNombre('Hugo'), deh_PERSONA.validarApellido('Álvarez'), deh_PERSONA.validarGenero('Hombre'), deh_PERSONA.validarFechaNac('07-JUL-1983')));
INSERT INTO deh_empleados VALUES (SEQ_EMPLEADOS.NEXTVAL, 'Mecánico', 14, deh_PERSONA(deh_PERSONA.validarNombre('Juliana'), deh_PERSONA.validarApellido('Vargas'), deh_PERSONA.validarGenero('Mujer'), deh_PERSONA.validarFechaNac('20-DEC-1998')));
INSERT INTO deh_empleados VALUES (SEQ_EMPLEADOS.NEXTVAL, 'Mecánico', 14, deh_PERSONA(deh_PERSONA.validarNombre('Rafael'), deh_PERSONA.validarApellido('Zappala'), deh_PERSONA.validarGenero('Hombre'), deh_PERSONA.validarFechaNac('13-FEB-2002')));
INSERT INTO deh_empleados VALUES (SEQ_EMPLEADOS.NEXTVAL, 'Gerente', 15, deh_PERSONA(deh_PERSONA.validarNombre('Ana Karina'), deh_PERSONA.validarApellido('Fernández'), deh_PERSONA.validarGenero('Mujer'), deh_PERSONA.validarFechaNac('16-MAY-1987')));
INSERT INTO deh_empleados VALUES (SEQ_EMPLEADOS.NEXTVAL, 'Coordinador de ventas', 15, deh_PERSONA(deh_PERSONA.validarNombre('Antonietta'), deh_PERSONA.validarApellido('Mendoza'), deh_PERSONA.validarGenero('Mujer'), deh_PERSONA.validarFechaNac('04-JUL-1997')));
INSERT INTO deh_empleados VALUES (SEQ_EMPLEADOS.NEXTVAL, 'Mecánico', 15, deh_PERSONA(deh_PERSONA.validarNombre('Jorge'), deh_PERSONA.validarApellido('Eclasans'), deh_PERSONA.validarGenero('Hombre'), deh_PERSONA.validarFechaNac('17-JAN-1989')));
INSERT INTO deh_empleados VALUES (SEQ_EMPLEADOS.NEXTVAL, 'Mecánico', 15, deh_PERSONA(deh_PERSONA.validarNombre('Raúl'), deh_PERSONA.validarApellido('Camacho'), deh_PERSONA.validarGenero('Hombre'), deh_PERSONA.validarFechaNac('31-AUG-1992')));

-- TABLA RESERVA

CREATE TABLE deh_reservas (
    res_cod number (2) PRIMARY KEY,
    res_tipoEnt varchar2 (10) NOT NULL,
    res_fechaRes date NOT NULL,

 -- Check
    CONSTRAINT tipo_Entrega CHECK ( res_tipoEnt IN ('Sede','Delivery') )
);

CREATE SEQUENCE SEQ_RESERVAS
    START WITH 1
    INCREMENT BY 1;


-- INSERCION RESERVAS

INSERT INTO deh_reservas VALUES (SEQ_RESERVAS.NEXTVAL, 'Sede', '03-DEC-2022');
INSERT INTO deh_reservas VALUES (SEQ_RESERVAS.NEXTVAL, 'Delivery', '02-JAN-2023');
INSERT INTO deh_reservas VALUES (SEQ_RESERVAS.NEXTVAL, 'Sede', '01-FEB-2023');
INSERT INTO deh_reservas VALUES (SEQ_RESERVAS.NEXTVAL, 'Sede', '19-FEB-2023');
INSERT INTO deh_reservas VALUES (SEQ_RESERVAS.NEXTVAL, 'Delivery', '03-MAR-2023');
INSERT INTO deh_reservas VALUES (SEQ_RESERVAS.NEXTVAL, 'Sede', '21-MAR-2023');
INSERT INTO deh_reservas VALUES (SEQ_RESERVAS.NEXTVAL, 'Sede', '08-APR-2023');
INSERT INTO deh_reservas VALUES (SEQ_RESERVAS.NEXTVAL, 'Sede', '20-APR-2023');
INSERT INTO deh_reservas VALUES (SEQ_RESERVAS.NEXTVAL, 'Sede', '02-MAY-2023');
INSERT INTO deh_reservas VALUES (SEQ_RESERVAS.NEXTVAL, 'Delivery', '08-MAY-2023');
INSERT INTO deh_reservas VALUES (SEQ_RESERVAS.NEXTVAL, 'Delivery', '14-MAY-2023');
INSERT INTO deh_reservas VALUES (SEQ_RESERVAS.NEXTVAL, 'Sede', '20-MAY-2023');
INSERT INTO deh_reservas VALUES (SEQ_RESERVAS.NEXTVAL, 'Sede', '25-FEB-2023');
INSERT INTO deh_reservas VALUES (SEQ_RESERVAS.NEXTVAL, 'Delivery', '09-MAR-2023');
INSERT INTO deh_reservas VALUES (SEQ_RESERVAS.NEXTVAL, 'Sede', '15-MAR-2023');

-- TABLA EVALUACIONES

CREATE TABLE deh_evaluaciones (
    eva_cod number (4) PRIMARY KEY,
    eva_calif number (1) NOT NULL,
    eva_icon BLOB DEFAULT EMPTY_BLOB() NOT NULL,
    eva_mar_cod number (3) NOT NULL,
    eva_mod_cod number (3) NOT NULL,
    eva_veh_cod number (6) NOT NULL,
    eva_cli_cod number (3),
    eva_sed_cod number (3),

 -- Claves forÃ¡neas
    CONSTRAINT fk_eva_veh FOREIGN KEY (eva_mar_cod, eva_mod_cod, eva_veh_cod) REFERENCES deh_vehiculos (veh_mar_cod, veh_mod_cod, veh_cod),
    CONSTRAINT fk_eva_cli FOREIGN KEY (eva_cli_cod) REFERENCES deh_clientes (cli_cod),
    CONSTRAINT fk_eva_sed FOREIGN KEY (eva_sed_cod) REFERENCES deh_sedes (sed_cod),

 -- Checks
    CONSTRAINT tipo_calif CHECK (eva_calif IN (1,2,3,4,5))
);

CREATE SEQUENCE SEQ_EVALUACIONES
    START WITH 1
    INCREMENT BY 1;

-- INSERCION EVALUCIONES

CREATE OR REPLACE DIRECTORY EVALUACIONES_LOB AS 'D:\imagenes\calificaciones';

DECLARE
    V_TEMP BLOB;
    V_BFILE BFILE;
    V_NOMBRE_FOTO VARCHAR(100);
    
BEGIN
    INSERT INTO deh_evaluaciones VALUES(SEQ_EVALUACIONES.NEXTVAL,4,EMPTY_BLOB(),1,5,10,5,NULL) RETURNING eva_icon INTO V_TEMP;
    V_NOMBRE_FOTO := 'CALIFICACIONES_4.PNG';
    V_BFILE := BFILENAME('EVALUACIONES_LOB',V_NOMBRE_FOTO);
    DBMS_LOB.OPEN(V_BFILE, DBMS_LOB.LOB_READONLY);
    DBMS_LOB.LOADFROMFILE(V_TEMP,V_BFILE,DBMS_LOB.GETLENGTH(V_BFILE));
    DBMS_LOB.CLOSE(V_BFILE);
    
    INSERT INTO deh_evaluaciones VALUES(SEQ_EVALUACIONES.NEXTVAL,1,EMPTY_BLOB(),4,3,5,11,NULL) RETURNING eva_icon INTO V_TEMP;
    V_NOMBRE_FOTO := 'CALIFICACIONES_1.PNG';
    V_BFILE := BFILENAME('EVALUACIONES_LOB',V_NOMBRE_FOTO);
    DBMS_LOB.OPEN(V_BFILE, DBMS_LOB.LOB_READONLY);
    DBMS_LOB.LOADFROMFILE(V_TEMP,V_BFILE,DBMS_LOB.GETLENGTH(V_BFILE));
    DBMS_LOB.CLOSE(V_BFILE);
    
    INSERT INTO deh_evaluaciones VALUES(SEQ_EVALUACIONES.NEXTVAL,1,EMPTY_BLOB(),3,2,4,14,NULL) RETURNING eva_icon INTO V_TEMP;
    V_NOMBRE_FOTO := 'CALIFICACIONES_1.PNG';
    V_BFILE := BFILENAME('EVALUACIONES_LOB',V_NOMBRE_FOTO);
    DBMS_LOB.OPEN(V_BFILE, DBMS_LOB.LOB_READONLY);
    DBMS_LOB.LOADFROMFILE(V_TEMP,V_BFILE,DBMS_LOB.GETLENGTH(V_BFILE));
    DBMS_LOB.CLOSE(V_BFILE);
    
    INSERT INTO deh_evaluaciones VALUES(SEQ_EVALUACIONES.NEXTVAL,5,EMPTY_BLOB(),4,4,7,3,NULL) RETURNING eva_icon INTO V_TEMP;
    V_NOMBRE_FOTO := 'CALIFICACIONES_5.PNG';
    V_BFILE := BFILENAME('EVALUACIONES_LOB',V_NOMBRE_FOTO);
    DBMS_LOB.OPEN(V_BFILE, DBMS_LOB.LOB_READONLY);
    DBMS_LOB.LOADFROMFILE(V_TEMP,V_BFILE,DBMS_LOB.GETLENGTH(V_BFILE));
    DBMS_LOB.CLOSE(V_BFILE);
    
    INSERT INTO deh_evaluaciones VALUES(SEQ_EVALUACIONES.NEXTVAL,3,EMPTY_BLOB(),1,5,9,7,NULL) RETURNING eva_icon INTO V_TEMP;
    V_NOMBRE_FOTO := 'CALIFICACIONES_3.PNG';
    V_BFILE := BFILENAME('EVALUACIONES_LOB',V_NOMBRE_FOTO);
    DBMS_LOB.OPEN(V_BFILE, DBMS_LOB.LOB_READONLY);
    DBMS_LOB.LOADFROMFILE(V_TEMP,V_BFILE,DBMS_LOB.GETLENGTH(V_BFILE));
    DBMS_LOB.CLOSE(V_BFILE);
    
    INSERT INTO deh_evaluaciones VALUES(SEQ_EVALUACIONES.NEXTVAL,3,EMPTY_BLOB(),3,1,1,8,NULL) RETURNING eva_icon INTO V_TEMP;
    V_NOMBRE_FOTO := 'CALIFICACIONES_3.PNG';
    V_BFILE := BFILENAME('EVALUACIONES_LOB',V_NOMBRE_FOTO);
    DBMS_LOB.OPEN(V_BFILE, DBMS_LOB.LOB_READONLY);
    DBMS_LOB.LOADFROMFILE(V_TEMP,V_BFILE,DBMS_LOB.GETLENGTH(V_BFILE));
    DBMS_LOB.CLOSE(V_BFILE);
    
    INSERT INTO deh_evaluaciones VALUES(SEQ_EVALUACIONES.NEXTVAL,4,EMPTY_BLOB(),3,2,3,6,NULL) RETURNING eva_icon INTO V_TEMP;
    V_NOMBRE_FOTO := 'CALIFICACIONES_4.PNG';
    V_BFILE := BFILENAME('EVALUACIONES_LOB',V_NOMBRE_FOTO);
    DBMS_LOB.OPEN(V_BFILE, DBMS_LOB.LOB_READONLY);
    DBMS_LOB.LOADFROMFILE(V_TEMP,V_BFILE,DBMS_LOB.GETLENGTH(V_BFILE));
    DBMS_LOB.CLOSE(V_BFILE);
    
    INSERT INTO deh_evaluaciones VALUES(SEQ_EVALUACIONES.NEXTVAL,3,EMPTY_BLOB(),1,5,9,5,NULL) RETURNING eva_icon INTO V_TEMP;
    V_NOMBRE_FOTO := 'CALIFICACIONES_3.PNG';
    V_BFILE := BFILENAME('EVALUACIONES_LOB',V_NOMBRE_FOTO);
    DBMS_LOB.OPEN(V_BFILE, DBMS_LOB.LOB_READONLY);
    DBMS_LOB.LOADFROMFILE(V_TEMP,V_BFILE,DBMS_LOB.GETLENGTH(V_BFILE));
    DBMS_LOB.CLOSE(V_BFILE);
    
    INSERT INTO deh_evaluaciones VALUES(SEQ_EVALUACIONES.NEXTVAL,2,EMPTY_BLOB(),1,6,12,1,NULL) RETURNING eva_icon INTO V_TEMP;
    V_NOMBRE_FOTO := 'CALIFICACIONES_2.PNG';
    V_BFILE := BFILENAME('EVALUACIONES_LOB',V_NOMBRE_FOTO);
    DBMS_LOB.OPEN(V_BFILE, DBMS_LOB.LOB_READONLY);
    DBMS_LOB.LOADFROMFILE(V_TEMP,V_BFILE,DBMS_LOB.GETLENGTH(V_BFILE));
    DBMS_LOB.CLOSE(V_BFILE);
    
    INSERT INTO deh_evaluaciones VALUES(SEQ_EVALUACIONES.NEXTVAL,2,EMPTY_BLOB(),1,6,11,10,NULL) RETURNING eva_icon INTO V_TEMP;
    V_NOMBRE_FOTO := 'CALIFICACIONES_2.PNG';
    V_BFILE := BFILENAME('EVALUACIONES_LOB',V_NOMBRE_FOTO);
    DBMS_LOB.OPEN(V_BFILE, DBMS_LOB.LOB_READONLY);
    DBMS_LOB.LOADFROMFILE(V_TEMP,V_BFILE,DBMS_LOB.GETLENGTH(V_BFILE));
    DBMS_LOB.CLOSE(V_BFILE);
    
    INSERT INTO deh_evaluaciones VALUES(SEQ_EVALUACIONES.NEXTVAL,2,EMPTY_BLOB(),3,1,1,8,NULL) RETURNING eva_icon INTO V_TEMP;
    V_NOMBRE_FOTO := 'CALIFICACIONES_2.PNG';
    V_BFILE := BFILENAME('EVALUACIONES_LOB',V_NOMBRE_FOTO);
    DBMS_LOB.OPEN(V_BFILE, DBMS_LOB.LOB_READONLY);
    DBMS_LOB.LOADFROMFILE(V_TEMP,V_BFILE,DBMS_LOB.GETLENGTH(V_BFILE));
    DBMS_LOB.CLOSE(V_BFILE);
    
    INSERT INTO deh_evaluaciones VALUES(SEQ_EVALUACIONES.NEXTVAL,4,EMPTY_BLOB(),4,4,8,1,NULL) RETURNING eva_icon INTO V_TEMP;
    V_NOMBRE_FOTO := 'CALIFICACIONES_4.PNG';
    V_BFILE := BFILENAME('EVALUACIONES_LOB',V_NOMBRE_FOTO);
    DBMS_LOB.OPEN(V_BFILE, DBMS_LOB.LOB_READONLY);
    DBMS_LOB.LOADFROMFILE(V_TEMP,V_BFILE,DBMS_LOB.GETLENGTH(V_BFILE));
    DBMS_LOB.CLOSE(V_BFILE);
    
    INSERT INTO deh_evaluaciones VALUES(SEQ_EVALUACIONES.NEXTVAL,2,EMPTY_BLOB(),4,4,8,3,NULL) RETURNING eva_icon INTO V_TEMP;
    V_NOMBRE_FOTO := 'CALIFICACIONES_2.PNG';
    V_BFILE := BFILENAME('EVALUACIONES_LOB',V_NOMBRE_FOTO);
    DBMS_LOB.OPEN(V_BFILE, DBMS_LOB.LOB_READONLY);
    DBMS_LOB.LOADFROMFILE(V_TEMP,V_BFILE,DBMS_LOB.GETLENGTH(V_BFILE));
    DBMS_LOB.CLOSE(V_BFILE);
    
    INSERT INTO deh_evaluaciones VALUES(SEQ_EVALUACIONES.NEXTVAL,1,EMPTY_BLOB(),12,7,13,14,NULL) RETURNING eva_icon INTO V_TEMP;
    V_NOMBRE_FOTO := 'CALIFICACIONES_1.PNG';
    V_BFILE := BFILENAME('EVALUACIONES_LOB',V_NOMBRE_FOTO);
    DBMS_LOB.OPEN(V_BFILE, DBMS_LOB.LOB_READONLY);
    DBMS_LOB.LOADFROMFILE(V_TEMP,V_BFILE,DBMS_LOB.GETLENGTH(V_BFILE));
    DBMS_LOB.CLOSE(V_BFILE);
    
    INSERT INTO deh_evaluaciones VALUES(SEQ_EVALUACIONES.NEXTVAL,5,EMPTY_BLOB(),15,14,28,NULL,9) RETURNING eva_icon INTO V_TEMP;
    V_NOMBRE_FOTO := 'CALIFICACIONES_5.PNG';
    V_BFILE := BFILENAME('EVALUACIONES_LOB',V_NOMBRE_FOTO);
    DBMS_LOB.OPEN(V_BFILE, DBMS_LOB.LOB_READONLY);
    DBMS_LOB.LOADFROMFILE(V_TEMP,V_BFILE,DBMS_LOB.GETLENGTH(V_BFILE));
    DBMS_LOB.CLOSE(V_BFILE);
    
    INSERT INTO deh_evaluaciones VALUES(SEQ_EVALUACIONES.NEXTVAL,1,EMPTY_BLOB(),11,12,24,NULL,13) RETURNING eva_icon INTO V_TEMP;
    V_NOMBRE_FOTO := 'CALIFICACIONES_1.PNG';
    V_BFILE := BFILENAME('EVALUACIONES_LOB',V_NOMBRE_FOTO);
    DBMS_LOB.OPEN(V_BFILE, DBMS_LOB.LOB_READONLY);
    DBMS_LOB.LOADFROMFILE(V_TEMP,V_BFILE,DBMS_LOB.GETLENGTH(V_BFILE));
    DBMS_LOB.CLOSE(V_BFILE);
    
    INSERT INTO deh_evaluaciones VALUES(SEQ_EVALUACIONES.NEXTVAL,5,EMPTY_BLOB(),11,11,22,NULL,2) RETURNING eva_icon INTO V_TEMP;
    V_NOMBRE_FOTO := 'CALIFICACIONES_5.PNG';
    V_BFILE := BFILENAME('EVALUACIONES_LOB',V_NOMBRE_FOTO);
    DBMS_LOB.OPEN(V_BFILE, DBMS_LOB.LOB_READONLY);
    DBMS_LOB.LOADFROMFILE(V_TEMP,V_BFILE,DBMS_LOB.GETLENGTH(V_BFILE));
    DBMS_LOB.CLOSE(V_BFILE);
    
    INSERT INTO deh_evaluaciones VALUES(SEQ_EVALUACIONES.NEXTVAL,1,EMPTY_BLOB(),7,9,17,NULL,4) RETURNING eva_icon INTO V_TEMP;
    V_NOMBRE_FOTO := 'CALIFICACIONES_1.PNG';
    V_BFILE := BFILENAME('EVALUACIONES_LOB',V_NOMBRE_FOTO);
    DBMS_LOB.OPEN(V_BFILE, DBMS_LOB.LOB_READONLY);
    DBMS_LOB.LOADFROMFILE(V_TEMP,V_BFILE,DBMS_LOB.GETLENGTH(V_BFILE));
    DBMS_LOB.CLOSE(V_BFILE);
    
    INSERT INTO deh_evaluaciones VALUES(SEQ_EVALUACIONES.NEXTVAL,4,EMPTY_BLOB(),2,20,39,NULL,12) RETURNING eva_icon INTO V_TEMP;
    V_NOMBRE_FOTO := 'CALIFICACIONES_4.PNG';
    V_BFILE := BFILENAME('EVALUACIONES_LOB',V_NOMBRE_FOTO);
    DBMS_LOB.OPEN(V_BFILE, DBMS_LOB.LOB_READONLY);
    DBMS_LOB.LOADFROMFILE(V_TEMP,V_BFILE,DBMS_LOB.GETLENGTH(V_BFILE));
    DBMS_LOB.CLOSE(V_BFILE);
    
    INSERT INTO deh_evaluaciones VALUES(SEQ_EVALUACIONES.NEXTVAL,1,EMPTY_BLOB(),11,12,23,NULL,7) RETURNING eva_icon INTO V_TEMP;
    V_NOMBRE_FOTO := 'CALIFICACIONES_1.PNG';
    V_BFILE := BFILENAME('EVALUACIONES_LOB',V_NOMBRE_FOTO);
    DBMS_LOB.OPEN(V_BFILE, DBMS_LOB.LOB_READONLY);
    DBMS_LOB.LOADFROMFILE(V_TEMP,V_BFILE,DBMS_LOB.GETLENGTH(V_BFILE));
    DBMS_LOB.CLOSE(V_BFILE);
    
    INSERT INTO deh_evaluaciones VALUES(SEQ_EVALUACIONES.NEXTVAL,3,EMPTY_BLOB(),8,18,35,NULL,6) RETURNING eva_icon INTO V_TEMP;
    V_NOMBRE_FOTO := 'CALIFICACIONES_3.PNG';
    V_BFILE := BFILENAME('EVALUACIONES_LOB',V_NOMBRE_FOTO);
    DBMS_LOB.OPEN(V_BFILE, DBMS_LOB.LOB_READONLY);
    DBMS_LOB.LOADFROMFILE(V_TEMP,V_BFILE,DBMS_LOB.GETLENGTH(V_BFILE));
    DBMS_LOB.CLOSE(V_BFILE);
    
    INSERT INTO deh_evaluaciones VALUES(SEQ_EVALUACIONES.NEXTVAL,2,EMPTY_BLOB(),10,17,34,NULL,15) RETURNING eva_icon INTO V_TEMP;
    V_NOMBRE_FOTO := 'CALIFICACIONES_2.PNG';
    V_BFILE := BFILENAME('EVALUACIONES_LOB',V_NOMBRE_FOTO);
    DBMS_LOB.OPEN(V_BFILE, DBMS_LOB.LOB_READONLY);
    DBMS_LOB.LOADFROMFILE(V_TEMP,V_BFILE,DBMS_LOB.GETLENGTH(V_BFILE));
    DBMS_LOB.CLOSE(V_BFILE);
    
    INSERT INTO deh_evaluaciones VALUES(SEQ_EVALUACIONES.NEXTVAL,5,EMPTY_BLOB(),10,16,32,NULL,12) RETURNING eva_icon INTO V_TEMP;
    V_NOMBRE_FOTO := 'CALIFICACIONES_5.PNG';
    V_BFILE := BFILENAME('EVALUACIONES_LOB',V_NOMBRE_FOTO);
    DBMS_LOB.OPEN(V_BFILE, DBMS_LOB.LOB_READONLY);
    DBMS_LOB.LOADFROMFILE(V_TEMP,V_BFILE,DBMS_LOB.GETLENGTH(V_BFILE));
    DBMS_LOB.CLOSE(V_BFILE);
    
    INSERT INTO deh_evaluaciones VALUES(SEQ_EVALUACIONES.NEXTVAL,3,EMPTY_BLOB(),15,14,27,NULL,3) RETURNING eva_icon INTO V_TEMP;
    V_NOMBRE_FOTO := 'CALIFICACIONES_3.PNG';
    V_BFILE := BFILENAME('EVALUACIONES_LOB',V_NOMBRE_FOTO);
    DBMS_LOB.OPEN(V_BFILE, DBMS_LOB.LOB_READONLY);
    DBMS_LOB.LOADFROMFILE(V_TEMP,V_BFILE,DBMS_LOB.GETLENGTH(V_BFILE));
    DBMS_LOB.CLOSE(V_BFILE);
    
    INSERT INTO deh_evaluaciones VALUES(SEQ_EVALUACIONES.NEXTVAL,4,EMPTY_BLOB(),14,13,25,NULL,6) RETURNING eva_icon INTO V_TEMP;
    V_NOMBRE_FOTO := 'CALIFICACIONES_4.PNG';
    V_BFILE := BFILENAME('EVALUACIONES_LOB',V_NOMBRE_FOTO);
    DBMS_LOB.OPEN(V_BFILE, DBMS_LOB.LOB_READONLY);
    DBMS_LOB.LOADFROMFILE(V_TEMP,V_BFILE,DBMS_LOB.GETLENGTH(V_BFILE));
    DBMS_LOB.CLOSE(V_BFILE);
    
END;

--TABLA OBSERVACIONES
CREATE TABLE deh_observaciones (
    obs_cod number (5) NOT NULL,
    obs_descrip varchar2 (300) NOT NULL,
    obs_eva_cod number (4) NOT NULL,

 -- Clave foránea
    CONSTRAINT fk_obs_eva FOREIGN KEY (obs_eva_cod) REFERENCES deh_evaluaciones (eva_cod)
);

CREATE SEQUENCE SEQ_OBSERVACIONES
    START WITH 1
    INCREMENT BY 1;
    
-- INSERCION OBSERVACIONES

INSERT INTO deh_observaciones VALUES(SEQ_OBSERVACIONES.NEXTVAL,'El servicio al cliente fue excelente, pero el coche no estaba en las mejores condiciones.',1);
INSERT INTO deh_observaciones VALUES(SEQ_OBSERVACIONES.NEXTVAL,'El proceso de alquiler fue r?pido y f?cil, y el personal fue muy amable.',1);
INSERT INTO deh_observaciones VALUES(SEQ_OBSERVACIONES.NEXTVAL,'El sistema de navegaci?n no funcionaba correctamente y nos perdimos varias veces.',2);
INSERT INTO deh_observaciones VALUES(SEQ_OBSERVACIONES.NEXTVAL,'Tuvimos un problema con una de las llantas y no pudimos encontrar la herramienta para cambiarla en el maletero.',2);
INSERT INTO deh_observaciones VALUES(SEQ_OBSERVACIONES.NEXTVAL,'El coche no ten?a suficiente potencia para subir las colinas empinadas de la zona.',3);
INSERT INTO deh_observaciones VALUES(SEQ_OBSERVACIONES.NEXTVAL,'Tuvimos un problema con la bater?a del coche que nos retras? en el camino.',3);
INSERT INTO deh_observaciones VALUES(SEQ_OBSERVACIONES.NEXTVAL,'El proceso de devoluci?n del coche fue f?cil y r?pido.',4);
INSERT INTO deh_observaciones VALUES(SEQ_OBSERVACIONES.NEXTVAL,'El personal de la empresa de alquiler de coches fue muy amable y servicial durante todo el proceso.',4);
INSERT INTO deh_observaciones VALUES(SEQ_OBSERVACIONES.NEXTVAL,'El coche estaba limpio y en buenas condiciones, pero no ten?a suficiente espacio para nuestro equipaje.',5);
INSERT INTO deh_observaciones VALUES(SEQ_OBSERVACIONES.NEXTVAL,'El coche funcionaba bien, pero la radio no funcionaba correctamente.',5);
INSERT INTO deh_observaciones VALUES(SEQ_OBSERVACIONES.NEXTVAL,'Nos sorprendi? que el coche no tuviera un puerto USB para cargar nuestros dispositivos.',5);
INSERT INTO deh_observaciones VALUES(SEQ_OBSERVACIONES.NEXTVAL,'El coche ten?a un motor ruidoso que nos molest? durante todo el viaje.',6);
INSERT INTO deh_observaciones VALUES(SEQ_OBSERVACIONES.NEXTVAL,'El coche ten?a un asiento inc?modo que nos caus? dolor de espalda durante el viaje.',6);
INSERT INTO deh_observaciones VALUES(SEQ_OBSERVACIONES.NEXTVAL,'El personal de la empresa de alquiler de coches fue muy servicial al ayudarnos a cambiar nuestra reserva.',7);
INSERT INTO deh_observaciones VALUES(SEQ_OBSERVACIONES.NEXTVAL,'El proceso de devoluci?n del coche fue f?cil y r?pido.',7);
INSERT INTO deh_observaciones VALUES(SEQ_OBSERVACIONES.NEXTVAL,'El coche estaba limpio y en buenas condiciones, pero no ten?a suficiente espacio para nuestro equipaje.',7);
INSERT INTO deh_observaciones VALUES(SEQ_OBSERVACIONES.NEXTVAL,'El veh?culo ten?a un olor extra?o cuando lo recogimos.',8);
INSERT INTO deh_observaciones VALUES(SEQ_OBSERVACIONES.NEXTVAL,'El coche funcionaba bien, pero la radio no funcionaba correctamente.',8);
INSERT INTO deh_observaciones VALUES(SEQ_OBSERVACIONES.NEXTVAL,'El coche ten?a algunos problemas mec?nicos que nos preocuparon durante todo el viaje.',9);
INSERT INTO deh_observaciones VALUES(SEQ_OBSERVACIONES.NEXTVAL,'El coche ten?a algunos raspones y abolladuras que no estaban registrados en el contrato de alquiler.',9);
INSERT INTO deh_observaciones VALUES(SEQ_OBSERVACIONES.NEXTVAL,'Tuvimos un problema con una de las llantas y no pudimos encontrar la herramienta para cambiarla en el maletero.',10);
INSERT INTO deh_observaciones VALUES(SEQ_OBSERVACIONES.NEXTVAL,'El coche ten?a algunos problemas mec?nicos que nos preocuparon durante todo el viaje.',10);
INSERT INTO deh_observaciones VALUES(SEQ_OBSERVACIONES.NEXTVAL,'El coche no ten?a un sistema de aire acondicionado eficiente y pasamos mucho calor durante el viaje.',11);
INSERT INTO deh_observaciones VALUES(SEQ_OBSERVACIONES.NEXTVAL,'Tuvimos un problema con la bater?a del coche que nos retras? en el camino.',11);
INSERT INTO deh_observaciones VALUES(SEQ_OBSERVACIONES.NEXTVAL,'El coche estaba sucio cuando lo recogimos y tuvimos que limpiarlo nosotros mismos.',11);
INSERT INTO deh_observaciones VALUES(SEQ_OBSERVACIONES.NEXTVAL,'El coche ten?a un sistema de aire acondicionado muy eficiente que nos mantuvo frescos durante todo el viaje.',12);
INSERT INTO deh_observaciones VALUES(SEQ_OBSERVACIONES.NEXTVAL,'El coche ten?a una suspensi?n muy suave que hizo que el viaje fuera m?s c?modo.',12);
INSERT INTO deh_observaciones VALUES(SEQ_OBSERVACIONES.NEXTVAL,'Tuvimos un problema con el sistema de calefacci?n del coche que no funcionaba correctamente en d?as fr?os.',13);
INSERT INTO deh_observaciones VALUES(SEQ_OBSERVACIONES.NEXTVAL,'El coche ten?a algunos problemas de frenos que nos preocuparon durante todo el viaje.',13);
INSERT INTO deh_observaciones VALUES(SEQ_OBSERVACIONES.NEXTVAL,'El coche ten?a algunos raspones y abolladuras que no estaban registrados en el contrato de alquiler.',14);
INSERT INTO deh_observaciones VALUES(SEQ_OBSERVACIONES.NEXTVAL,'El sistema de navegaci?n no funcionaba correctamente y nos perdimos varias veces.',14);
INSERT INTO deh_observaciones VALUES(SEQ_OBSERVACIONES.NEXTVAL,'El coche ten?a un alto consumo de combustible y tuvimos que ir a la gasolinera con m?s frecuencia de lo que esper?bamos.',14);
INSERT INTO deh_observaciones VALUES(SEQ_OBSERVACIONES.NEXTVAL,'El coche ten?a un sistema de seguridad moderno que nos hizo sentir seguros mientras conduc?amos.',15);
INSERT INTO deh_observaciones VALUES(SEQ_OBSERVACIONES.NEXTVAL,'El coche ten?a un sistema de aire acondicionado muy eficiente que nos mantuvo frescos durante todo el viaje.',15);
INSERT INTO deh_observaciones VALUES(SEQ_OBSERVACIONES.NEXTVAL,'El coche ten?a algunos raspones y abolladuras que no estaban registrados en el contrato de alquiler.',16);
INSERT INTO deh_observaciones VALUES(SEQ_OBSERVACIONES.NEXTVAL,'El coche ten?a algunos problemas mec?nicos que nos preocuparon durante todo el viaje.',16);
INSERT INTO deh_observaciones VALUES(SEQ_OBSERVACIONES.NEXTVAL,'El personal de la empresa de alquiler de coches fue muy servicial al ayudarnos a cambiar nuestra reserva.',17);
INSERT INTO deh_observaciones VALUES(SEQ_OBSERVACIONES.NEXTVAL,'El coche ten?a un sistema de navegaci?n muy ?til que nos ayud? a encontrar nuestro camino en una ciudad desconocida.',17);
INSERT INTO deh_observaciones VALUES(SEQ_OBSERVACIONES.NEXTVAL,'El coche no ten?a suficiente potencia para subir las colinas empinadas de la zona.',18);
INSERT INTO deh_observaciones VALUES(SEQ_OBSERVACIONES.NEXTVAL,'El sistema de navegaci?n no funcionaba correctamente y nos perdimos varias veces.',18);
INSERT INTO deh_observaciones VALUES(SEQ_OBSERVACIONES.NEXTVAL,'El personal de la empresa de alquiler de coches fue muy servicial al ayudarnos a cambiar nuestra reserva.',19);
INSERT INTO deh_observaciones VALUES(SEQ_OBSERVACIONES.NEXTVAL,'El coche funcionaba bien, pero la radio no funcionaba correctamente.',19);
INSERT INTO deh_observaciones VALUES(SEQ_OBSERVACIONES.NEXTVAL,'El coche ten?a un motor ruidoso que nos molest? durante todo el viaje.',20);
INSERT INTO deh_observaciones VALUES(SEQ_OBSERVACIONES.NEXTVAL,'El coche ten?a algunos raspones y abolladuras que no estaban registrados en el contrato de alquiler.',20);
INSERT INTO deh_observaciones VALUES(SEQ_OBSERVACIONES.NEXTVAL,'El coche estaba limpio y en buenas condiciones, pero no ten?a suficiente espacio para nuestro equipaje.',21);
INSERT INTO deh_observaciones VALUES(SEQ_OBSERVACIONES.NEXTVAL,'Nos sorprendi? que el coche no tuviera un puerto USB para cargar nuestros dispositivos.',21);
INSERT INTO deh_observaciones VALUES(SEQ_OBSERVACIONES.NEXTVAL,'El coche ten?a un asiento inc?modo que nos caus? dolor de espalda durante el viaje.',22);
INSERT INTO deh_observaciones VALUES(SEQ_OBSERVACIONES.NEXTVAL,'El servicio al cliente fue excelente, pero el coche no estaba en las mejores condiciones.',22);
INSERT INTO deh_observaciones VALUES(SEQ_OBSERVACIONES.NEXTVAL,'El personal de la empresa de alquiler de coches fue muy amable y servicial durante todo el proceso.',23);
INSERT INTO deh_observaciones VALUES(SEQ_OBSERVACIONES.NEXTVAL,'Tuvimos un pinchazo en el camino y el servicio de asistencia en carretera fue muy ?til.',23);
INSERT INTO deh_observaciones VALUES(SEQ_OBSERVACIONES.NEXTVAL,'El servicio al cliente fue excelente, pero el coche no estaba en las mejores condiciones.',24);
INSERT INTO deh_observaciones VALUES(SEQ_OBSERVACIONES.NEXTVAL,'El proceso de alquiler fue r?pido y f?cil, pero el personal no fue muy amable.',24);
INSERT INTO deh_observaciones VALUES(SEQ_OBSERVACIONES.NEXTVAL,'El coche estaba limpio y en buenas condiciones, pero no ten?a suficiente espacio para nuestro equipaje.',25);
INSERT INTO deh_observaciones VALUES(SEQ_OBSERVACIONES.NEXTVAL,'El coche ten?a un sistema de aire acondicionado muy eficiente que nos mantuvo frescos durante todo el viaje.',25);

--TABLA SUSCRIPCIONES-ALIANZA

CREATE TABLE deh_suscripciones_alianzas (
    ali_sed_cod number (2) NOT NULL,
    ali_fechaIni date NOT NULL,
    ali_detSev varchar2 (300) NOT NULL,
    ali_fechaFin date,
    ali_prov_cod number (3),
    ali_tal_cod number (3),

 -- Clave primaria
    CONSTRAINT pk_ali PRIMARY KEY (ali_sed_cod, ali_fechaIni),

 -- Claves foráneas
    CONSTRAINT fk_ali_sed FOREIGN KEY (ali_sed_cod) REFERENCES deh_sedes (sed_cod),
    CONSTRAINT fk_ali_prov FOREIGN KEY (ali_prov_cod) REFERENCES deh_proveedores (prov_cod),
    CONSTRAINT fk_ali_tal FOREIGN KEY (ali_tal_cod) REFERENCES deh_talleres (tal_cod)
);


--INSERCION SUSCRIPCIONES-ALIANZA

INSERT INTO deh_suscripciones_alianzas VALUES (1, '03-MAR-2023', 'Todos los vehículos de la compañía de alquiler cuentan con una suscripción de la compañía ProcuraWeb', '06-MAR-2024', 1, NULL);
INSERT INTO deh_suscripciones_alianzas VALUES (1, '15-APR-2022', 'Todos los vehículos de la compañía de alquiler cuentan con una suscripción de la compañía Johnson Controls', '08-SEP-2025', 12, NULL);
INSERT INTO deh_suscripciones_alianzas VALUES (1, '18-SEP-2022', 'Todos los vehículos de la compañía de alquiler cuentan con una suscripción de la compañía Multiservicios Navarrocar, C.A', '20-NOV-2025', NULL, 8);
INSERT INTO deh_suscripciones_alianzas VALUES (1, '30-JAN-2023', 'Todos los vehículos de la compañía de alquiler cuentan con una suscripción de la compañía ExxonMobil', '09-AUG-2023', 4, NULL);
INSERT INTO deh_suscripciones_alianzas VALUES (2, '12-JUN-2022', 'Todos los vehículos de la compañía de alquiler cuentan con una suscripción de la compañía Centro Automotriz Zeocar C.A', '25-AUG-2025', NULL, 9);
INSERT INTO deh_suscripciones_alianzas VALUES (2, '01-NOV-2022', 'Todos los vehículos de la compañía de alquiler cuentan con una suscripción de la compañía Valeo', '02-JAN-2025', 7, NULL);
INSERT INTO deh_suscripciones_alianzas VALUES (2, '22-MAY-2023', 'Todos los vehículos de la compañía de alquiler cuentan con una suscripción de la compañía Taller Normandie', '26-JUL-2023', NULL, 3);
INSERT INTO deh_suscripciones_alianzas VALUES (2, '07-JAN-2022', 'Todos los vehículos de la compañía de alquiler cuentan con una suscripción de la compañía Faurecia', '24-DEC-2023', 15, NULL);
INSERT INTO deh_suscripciones_alianzas VALUES (3, '09-FEB-2023', 'Todos los vehículos de la compañía de alquiler cuentan con una suscripción de la compañía Taller Mecanico Martinez', '04-JUL-2023', NULL, 6);
INSERT INTO deh_suscripciones_alianzas VALUES (3, '26-JUL-2022', 'Todos los vehículos de la compañía de alquiler cuentan con una suscripción de la compañía Magna International', '15-AUG-2023', 10, NULL);
INSERT INTO deh_suscripciones_alianzas VALUES (3, '19-JUL-2022', 'Todos los vehículos de la compañía de alquiler cuentan con una suscripción de la compañía Talleres El Drago', '13-AUG-2025', NULL, 5);
INSERT INTO deh_suscripciones_alianzas VALUES (3, '20-MAR-2023', 'Todos los vehículos de la compañía de alquiler cuentan con una suscripción de la compañía Servicio Automotriz ETM', '29-NOV-2025', NULL, 2);
INSERT INTO deh_suscripciones_alianzas VALUES (4, '08-APR-2022', 'Todos los vehículos de la compañía de alquiler cuentan con una suscripción de la compañía TRW Automotive', '20-FEB-2026', 13, NULL);
INSERT INTO deh_suscripciones_alianzas VALUES (4, '25-NOV-2022', 'Todos los vehículos de la compañía de alquiler cuentan con una suscripción de la compañía Aisin Seiki', '06-FEB-2026', 11, NULL);
INSERT INTO deh_suscripciones_alianzas VALUES (4, '06-SEP-2022', 'Todos los vehículos de la compañía de alquiler cuentan con una suscripción de la compañía Taller mecánico Richard', '10-OCT-2024', NULL, 14);
INSERT INTO deh_suscripciones_alianzas VALUES (4, '31-JAN-2022', 'Todos los vehículos de la compañía de alquiler cuentan con una suscripción de la compañía Hella', '18-AUG-2025', 9, NULL);
INSERT INTO deh_suscripciones_alianzas VALUES (5, '13-MAY-2022', 'Todos los vehículos de la compañía de alquiler cuentan con una suscripción de la compañía Delphi Technologies', '18-NOV-2025', 8, NULL);
INSERT INTO deh_suscripciones_alianzas VALUES (5, '04-APR-2022', 'Todos los vehículos de la compañía de alquiler cuentan con una suscripción de la compañía Taller Mecanico Pantera Negra', '11-FEB-2026', NULL, 1);
INSERT INTO deh_suscripciones_alianzas VALUES (5, '09-DEC-2022', 'Todos los vehículos de la compañía de alquiler cuentan con una suscripción de la compañía Taller Moronta', '20-JAN-2026', NULL, 7);
INSERT INTO deh_suscripciones_alianzas VALUES (5, '17-JUN-2023', 'Todos los vehículos de la compañía de alquiler cuentan con una suscripción de la compañía Centro Frenos Occidente', '01-OCT-2023', NULL, 15);
INSERT INTO deh_suscripciones_alianzas VALUES (6, '02-FEB-2023', 'Todos los vehículos de la compañía de alquiler cuentan con una suscripción de la compañía Bosch', '12-DEC-2023', 3, NULL);
INSERT INTO deh_suscripciones_alianzas VALUES (6, '11-MAY-2022', 'Todos los vehículos de la compañía de alquiler cuentan con una suscripción de la compañía Denso', '20-NOV-2023', 6, NULL);
INSERT INTO deh_suscripciones_alianzas VALUES (6, '23-JUL-2022', 'Todos los vehículos de la compañía de alquiler cuentan con una suscripción de la compañía ExxonMobil', '17-NOV-2025', 4, NULL);
INSERT INTO deh_suscripciones_alianzas VALUES (6, '29-SEP-2022', 'Todos los vehículos de la compañía de alquiler cuentan con una suscripción de la compañía Multiservicios Federación', '15-FEB-2026', NULL, 12);
INSERT INTO deh_suscripciones_alianzas VALUES (7, '14-NOV-2022', 'Todos los vehículos de la compañía de alquiler cuentan con una suscripción de la compañía Michelin', '21-MAR-2024', 2, NULL);
INSERT INTO deh_suscripciones_alianzas VALUES (7, '21-FEB-2022', 'Todos los vehículos de la compañía de alquiler cuentan con una suscripción de la compañía Aisin Seiki', '06-JAN-2025', 11, NULL);
INSERT INTO deh_suscripciones_alianzas VALUES (7, '02-MAR-2023', 'Todos los vehículos de la compañía de alquiler cuentan con una suscripción de la compañía TRW Automotive', '08-JUN-2023', 13, NULL);
INSERT INTO deh_suscripciones_alianzas VALUES (7, '28-MAR-2022', 'Todos los vehículos de la compañía de alquiler cuentan con una suscripción de la compañía Taller de mecánica general', '03-APR-2026', NULL, 10);
INSERT INTO deh_suscripciones_alianzas VALUES (8, '26-MAR-2023', 'Todos los vehículos de la compañía de alquiler cuentan con una suscripción de la compañía ZF Friedrichshafen', '13-APR-2025', 5, NULL);
INSERT INTO deh_suscripciones_alianzas VALUES (8, '10-APR-2022', 'Todos los vehículos de la compañía de alquiler cuentan con una suscripción de la compañía Bridgestone', '06-MAR-2024', 14, NULL);
INSERT INTO deh_suscripciones_alianzas VALUES (8, '20-JAN-2022', 'Todos los vehículos de la compañía de alquiler cuentan con una suscripción de la compañía Taller Mecanico Pantera Negra', '08-SEP-2025', NULL, 1);
INSERT INTO deh_suscripciones_alianzas VALUES (8, '17-MAR-2023', 'Todos los vehículos de la compañía de alquiler cuentan con una suscripción de la compañía Multiservicios Federación', '20-NOV-2025', NULL, 12);
INSERT INTO deh_suscripciones_alianzas VALUES (9, '05-JUN-2022', 'Todos los vehículos de la compañía de alquiler cuentan con una suscripción de la compañía Delphi Technologies', '09-AUG-2023', 8, NULL);
INSERT INTO deh_suscripciones_alianzas VALUES (9, '16-APR-2023', 'Todos los vehículos de la compañía de alquiler cuentan con una suscripción de la compañía ExxonMobil', '25-AUG-2025', 4, NULL);
INSERT INTO deh_suscripciones_alianzas VALUES (9, '15-JAN-2022', 'Todos los vehículos de la compañía de alquiler cuentan con una suscripción de la compañía Centro Automotriz Zeocar C.A', '02-JAN-2025', NULL, 9);
INSERT INTO deh_suscripciones_alianzas VALUES (9, '07-FEB-2022', 'Todos los vehículos de la compañía de alquiler cuentan con una suscripción de la compañía Taller Moronta', '26-JUL-2023', NULL, 7);
INSERT INTO deh_suscripciones_alianzas VALUES (10, '30-MAR-2023', 'Todos los vehículos de la compañía de alquiler cuentan con una suscripción de la compañía Taller Normandie', '06-MAR-2024', NULL, 3);
INSERT INTO deh_suscripciones_alianzas VALUES (10, '23-JUN-2023', 'Todos los vehículos de la compañía de alquiler cuentan con una suscripción de la compañía Centro Frenos Occidente', '08-SEP-2025', NULL, 15);
INSERT INTO deh_suscripciones_alianzas VALUES (10, '11-SEP-2022', 'Todos los vehículos de la compañía de alquiler cuentan con una suscripción de la compañía Denso', '20-NOV-2025', 6, NULL);
INSERT INTO deh_suscripciones_alianzas VALUES (10, '21-JAN-2023', 'Todos los vehículos de la compañía de alquiler cuentan con una suscripción de la compañía Taller de mecánica general', '09-AUG-2023', NULL, 10);
INSERT INTO deh_suscripciones_alianzas VALUES (11, '22-NOV-2022', 'Todos los vehículos de la compañía de alquiler cuentan con una suscripción de la compañía Talleres El Drago', '25-AUG-2025', NULL, 5);
INSERT INTO deh_suscripciones_alianzas VALUES (11, '27-APR-2023', 'Todos los vehículos de la compañía de alquiler cuentan con una suscripción de la compañía Michelin', '02-JAN-2025', 2, NULL);
INSERT INTO deh_suscripciones_alianzas VALUES (11, '14-FEB-2022', 'Todos los vehículos de la compañía de alquiler cuentan con una suscripción de la compañía Multiservicios y Repuestos Quijada C.A', '26-JUL-2023', NULL, 13);
INSERT INTO deh_suscripciones_alianzas VALUES (11, '25-JUN-2022', 'Todos los vehículos de la compañía de alquiler cuentan con una suscripción de la compañía Aisin Seiki', '24-DEC-2023', 11, NULL);
INSERT INTO deh_suscripciones_alianzas VALUES (12, '05-JUL-2022', 'Todos los vehículos de la compañía de alquiler cuentan con una suscripción de la compañía Taller mecánico Richard', '04-JUL-2023', NULL, 14);
INSERT INTO deh_suscripciones_alianzas VALUES (12, '06-MAR-2023', 'Todos los vehículos de la compañía de alquiler cuentan con una suscripción de la compañía Centro Automotriz Zeocar C.A', '15-AUG-2023', NULL, 9);
INSERT INTO deh_suscripciones_alianzas VALUES (12, '27-JAN-2023', 'Todos los vehículos de la compañía de alquiler cuentan con una suscripción de la compañía Delphi Technologies', '13-AUG-2025', 8, NULL);
INSERT INTO deh_suscripciones_alianzas VALUES (12, '17-SEP-2022', 'Todos los vehículos de la compañía de alquiler cuentan con una suscripción de la compañía ProcuraWeb', '29-NOV-2025', 1, NULL);
INSERT INTO deh_suscripciones_alianzas VALUES (13, '04-JAN-2023', 'Todos los vehículos de la compañía de alquiler cuentan con una suscripción de la compañía Taller Moronta', '20-FEB-2026', NULL, 7);
INSERT INTO deh_suscripciones_alianzas VALUES (13, '29-MAR-2022', 'Todos los vehículos de la compañía de alquiler cuentan con una suscripción de la compañía Faurecia', '06-FEB-2026', 15, NULL);
INSERT INTO deh_suscripciones_alianzas VALUES (13, '13-JUN-2023', 'Todos los vehículos de la compañía de alquiler cuentan con una suscripción de la compañía Taller Normandie', '10-OCT-2024', NULL, 3);
INSERT INTO deh_suscripciones_alianzas VALUES (13, '10-MAY-2023', 'Todos los vehículos de la compañía de alquiler cuentan con una suscripción de la compañía Taller Mecanico Martinez', '18-AUG-2025', NULL, 6);
INSERT INTO deh_suscripciones_alianzas VALUES (14, '24-MAR-2023', 'Todos los vehículos de la compañía de alquiler cuentan con una suscripción de la compañía Automotriz Pollycars C.A.', '18-NOV-2025', NULL, 4);
INSERT INTO deh_suscripciones_alianzas VALUES (14, '16-MAR-2022', 'Todos los vehículos de la compañía de alquiler cuentan con una suscripción de la compañía Michelin', '11-FEB-2026', 2, NULL);
INSERT INTO deh_suscripciones_alianzas VALUES (14, '30-MAY-2022', 'Todos los vehículos de la compañía de alquiler cuentan con una suscripción de la compañía Magna International', '20-JAN-2026', 10, NULL);
INSERT INTO deh_suscripciones_alianzas VALUES (14, '18-FEB-2023', 'Todos los vehículos de la compañía de alquiler cuentan con una suscripción de la compañía Multiservicios Navarrocar, C.A', '01-OCT-2023', NULL, 8);
INSERT INTO deh_suscripciones_alianzas VALUES (15, '08-FEB-2022', 'Todos los vehículos de la compañía de alquiler cuentan con una suscripción de la compañía Taller Mecanico El Cale', '12-DEC-2023', NULL, 11);
INSERT INTO deh_suscripciones_alianzas VALUES (15, '12-MAY-2022', 'Todos los vehículos de la compañía de alquiler cuentan con una suscripción de la compañía Johnson Controls', '20-NOV-2023', 12, NULL);
INSERT INTO deh_suscripciones_alianzas VALUES (15, '12-APR-2022', 'Todos los vehículos de la compañía de alquiler cuentan con una suscripción de la compañía Taller Mecanico Martinez', '17-NOV-2025', NULL, 6);
INSERT INTO deh_suscripciones_alianzas VALUES (15, '09-JAN-2022', 'Todos los vehículos de la compañía de alquiler cuentan con una suscripción de la compañía TRW Automotive', '15-FEB-2026', 13, NULL);


--TABLA COLECCION VEHICULOS

CREATE TABLE deh_colecciones_vehiculos (
    col_mar_cod number (3) NOT NULL,
    col_mod_cod number (3) NOT NULL,
    col_veh_cod number (6) NOT NULL,
    col_sed_cod number (2) NOT NULL,
    col_cod number (5) NOT NULL,
    col_fechaReg date NOT NULL,
    col_descrip varchar2 (50),

  -- Clave primaria
    CONSTRAINT pk_colecciones PRIMARY KEY (col_mar_cod, col_mod_cod, col_veh_cod, col_sed_cod, col_cod),

  -- Claves forÃ¡neas
    CONSTRAINT fk_col_veh FOREIGN KEY (col_mar_cod, col_mod_cod, col_veh_cod) REFERENCES deh_vehiculos (veh_mar_cod, veh_mod_cod, veh_cod),
    CONSTRAINT fk_col_sed FOREIGN KEY (col_sed_cod) REFERENCES deh_sedes (sed_cod)
);

CREATE SEQUENCE SEQ_COLECCION
    START WITH 1
    INCREMENT BY 1;

--INSERCION COLECCION VEHICULOS

INSERT INTO deh_colecciones_vehiculos VALUES (3, 1, 1, 15, SEQ_COLECCION.nextval, '10-JUL-2022', NULL);
INSERT INTO deh_colecciones_vehiculos VALUES (3, 1, 2, 15, SEQ_COLECCION.nextval, '17-JUL-2022', NULL);
INSERT INTO deh_colecciones_vehiculos VALUES (3, 2, 3, 15, SEQ_COLECCION.nextval, '24-JUL-2022', NULL);
INSERT INTO deh_colecciones_vehiculos VALUES (3, 2, 4, 2, SEQ_COLECCION.nextval, '31-JUL-2022', NULL);
INSERT INTO deh_colecciones_vehiculos VALUES (4, 3, 5, 2, SEQ_COLECCION.nextval, '07-AUG-2022', NULL);
INSERT INTO deh_colecciones_vehiculos VALUES (4, 3, 6, 2, SEQ_COLECCION.nextval, '14-AUG-2022', NULL);
INSERT INTO deh_colecciones_vehiculos VALUES (4, 4, 7, 3, SEQ_COLECCION.nextval, '21-AUG-2022', NULL);
INSERT INTO deh_colecciones_vehiculos VALUES (4, 4, 8, 3, SEQ_COLECCION.nextval, '28-AUG-2022', NULL);
INSERT INTO deh_colecciones_vehiculos VALUES (1, 5, 9, 3, SEQ_COLECCION.nextval, '04-SEP-2022', NULL);
INSERT INTO deh_colecciones_vehiculos VALUES (1, 5, 10, 4, SEQ_COLECCION.nextval, '11-SEP-2022', NULL);
INSERT INTO deh_colecciones_vehiculos VALUES (1, 6, 11, 4, SEQ_COLECCION.nextval, '18-SEP-2022', NULL);
INSERT INTO deh_colecciones_vehiculos VALUES (1, 6, 12, 4, SEQ_COLECCION.nextval, '25-SEP-2022', NULL);
INSERT INTO deh_colecciones_vehiculos VALUES (12, 7, 13, 5, SEQ_COLECCION.nextval, '02-OCT-2022', NULL);
INSERT INTO deh_colecciones_vehiculos VALUES (12, 7, 14, 5, SEQ_COLECCION.nextval, '09-OCT-2022', NULL);
INSERT INTO deh_colecciones_vehiculos VALUES (12, 8, 15, 5, SEQ_COLECCION.nextval, '16-OCT-2022', NULL);
INSERT INTO deh_colecciones_vehiculos VALUES (12, 8, 16, 6, SEQ_COLECCION.nextval, '23-OCT-2022', NULL);
INSERT INTO deh_colecciones_vehiculos VALUES (7, 9, 17, 6, SEQ_COLECCION.nextval, '30-OCT-2022', NULL);
INSERT INTO deh_colecciones_vehiculos VALUES (7, 9, 18, 6, SEQ_COLECCION.nextval, '06-NOV-2022', NULL);
INSERT INTO deh_colecciones_vehiculos VALUES (7, 10, 19, 7, SEQ_COLECCION.nextval, '13-NOV-2022', NULL);
INSERT INTO deh_colecciones_vehiculos VALUES (7, 10, 20, 7, SEQ_COLECCION.nextval, '20-NOV-2022', NULL);
INSERT INTO deh_colecciones_vehiculos VALUES (11, 11, 21, 7, SEQ_COLECCION.nextval, '27-NOV-2022', NULL);
INSERT INTO deh_colecciones_vehiculos VALUES (11, 11, 22, 8, SEQ_COLECCION.nextval, '04-DEC-2022', NULL);
INSERT INTO deh_colecciones_vehiculos VALUES (11, 12, 23, 8, SEQ_COLECCION.nextval, '11-DEC-2022', NULL);
INSERT INTO deh_colecciones_vehiculos VALUES (11, 12, 24, 8, SEQ_COLECCION.nextval, '18-DEC-2022', NULL);
INSERT INTO deh_colecciones_vehiculos VALUES (14, 13, 25, 9, SEQ_COLECCION.nextval, '25-DEC-2022', NULL);
INSERT INTO deh_colecciones_vehiculos VALUES (14, 13, 26, 9, SEQ_COLECCION.nextval, '01-JAN-2023', NULL);
INSERT INTO deh_colecciones_vehiculos VALUES (15, 14, 27, 9, SEQ_COLECCION.nextval, '08-JAN-2023', NULL);
INSERT INTO deh_colecciones_vehiculos VALUES (15, 14, 28, 10, SEQ_COLECCION.nextval, '15-JAN-2023', NULL);
INSERT INTO deh_colecciones_vehiculos VALUES (13, 15, 29, 10, SEQ_COLECCION.nextval, '22-JAN-2023', NULL);
INSERT INTO deh_colecciones_vehiculos VALUES (13, 15, 30, 10, SEQ_COLECCION.nextval, '29-JAN-2023', NULL);
INSERT INTO deh_colecciones_vehiculos VALUES (10, 16, 31, 11, SEQ_COLECCION.nextval, '05-FEB-2023', NULL);
INSERT INTO deh_colecciones_vehiculos VALUES (10, 16, 32, 11, SEQ_COLECCION.nextval, '12-FEB-2023', NULL);
INSERT INTO deh_colecciones_vehiculos VALUES (10, 17, 33, 11, SEQ_COLECCION.nextval, '19-FEB-2023', NULL);
INSERT INTO deh_colecciones_vehiculos VALUES (10, 17, 34, 12, SEQ_COLECCION.nextval, '26-FEB-2023', NULL);
INSERT INTO deh_colecciones_vehiculos VALUES (8, 18, 35, 12, SEQ_COLECCION.nextval, '05-MAR-2023', NULL);
INSERT INTO deh_colecciones_vehiculos VALUES (8, 18, 36, 12, SEQ_COLECCION.nextval, '12-MAR-2023', NULL);
INSERT INTO deh_colecciones_vehiculos VALUES (8, 19, 37, 13, SEQ_COLECCION.nextval, '19-MAR-2023', NULL);
INSERT INTO deh_colecciones_vehiculos VALUES (8, 19, 38, 13, SEQ_COLECCION.nextval, '26-MAR-2023', NULL);
INSERT INTO deh_colecciones_vehiculos VALUES (2, 20, 39, 13, SEQ_COLECCION.nextval, '02-APR-2023', NULL);
INSERT INTO deh_colecciones_vehiculos VALUES (5, 21, 40, 14, SEQ_COLECCION.nextval, '09-APR-2023', NULL);
INSERT INTO deh_colecciones_vehiculos VALUES (9, 22, 41, 14, SEQ_COLECCION.nextval, '16-APR-2023', NULL);
INSERT INTO deh_colecciones_vehiculos VALUES (6, 23, 42, 14, SEQ_COLECCION.nextval, '23-APR-2023', 'Parte de la colección de modelos TESLA S3XY');
INSERT INTO deh_colecciones_vehiculos VALUES (16, 24, 43, 1, SEQ_COLECCION.nextval, '07-MAY-2023', 'Parte de la colección de modelos TESLA S3XY');
INSERT INTO deh_colecciones_vehiculos VALUES (16, 25, 44, 1, SEQ_COLECCION.nextval, '14-MAY-2023', 'Parte de la colección de modelos TESLA S3XY');
INSERT INTO deh_colecciones_vehiculos VALUES (16, 26, 45, 1, SEQ_COLECCION.nextval, '21-MAY-2023', 'Parte de la colección de modelos TESLA S3XY');
INSERT INTO deh_colecciones_vehiculos VALUES (16, 27, 46, 1, SEQ_COLECCION.nextval, '21-MAR-2023', 'Parte de la colección de modelos TESLA S3XY');
INSERT INTO deh_colecciones_vehiculos VALUES (17, 28, 47, 1, SEQ_COLECCION.nextval, '11-MAY-2023', NULL);

-- TABLA EGRESOS

CREATE TABLE DEH_EGRESOS (
    egr_sed_cod number (2) NOT NULL,
    egr_cod number (3) NOT NULL,
    egr_nombre varchar2 (70) NOT NULL,
    egr_fechaEgr date NOT NULL,
    egr_descrip varchar2 (200),
    egr_transaccion deh_TRANSACCION,

 -- Clave primaria
    CONSTRAINT pk_egresos PRIMARY KEY (egr_sed_cod, egr_cod),

 -- Clave forÃ¡nea
    CONSTRAINT fk_egr_sed FOREIGN KEY (egr_sed_cod) REFERENCES deh_sedes (sed_cod)
);

--INSERCION EGRESOS

INSERT INTO deh_egresos VALUES (1, 1, 'Pago de salarios del personal administrativo', '01-MAY-2022', 'Pago de salarios del personal administrativo, correspondiente al mes de mayo del 2022.', deh_TRANSACCION(deh_TRANSACCION.validarMonto(210), 'dólar estado-unidense', 'USD ($)'));
INSERT INTO deh_egresos VALUES (1, 2, 'Compra de repuestos para el mantenimiento de la flota', '08-MAY-2022', 'Compra de repuestos necesarios para el mantenimiento de la flota de vehículos de la compañía.', deh_TRANSACCION(deh_TRANSACCION.validarMonto(210), 'dólar estado-unidense', 'USD ($)'));
INSERT INTO deh_egresos VALUES (1, 3, 'Pago de servicios de limpieza y mantenimiento de las sedes', '15-MAY-2022', 'Pago de servicios de limpieza y mantenimiento de las sedes de la compañía en diferentes ubicaciones a nivel nacional.', deh_TRANSACCION(deh_TRANSACCION.validarMonto(210), 'dólar estado-unidense', 'USD ($)'));
INSERT INTO deh_egresos VALUES (2, 4, 'Adquisición de software de gestión de alquiler de vehículos', '22-MAY-2022', 'Adquisición de un nuevo software de gestión de alquiler de vehículos para mejorar la eficiencia operativa.', deh_TRANSACCION(deh_TRANSACCION.validarMonto(210), 'dólar estado-unidense', 'USD ($)'));
INSERT INTO deh_egresos VALUES (2, 5, 'Pago de impuestos municipales', '29-MAY-2022', 'Pago de impuestos municipales correspondientes al periodo fiscal actual.', deh_TRANSACCION(deh_TRANSACCION.validarMonto(210), 'dólar estado-unidense', 'USD ($)'));
INSERT INTO deh_egresos VALUES (2, 6, 'Compra de combustible para los vehículos', '05-JUN-2022', 'Compra de combustible para abastecer los vehículos de la flota de la compañía.', deh_TRANSACCION(deh_TRANSACCION.validarMonto(210), 'dólar estado-unidense', 'USD ($)'));
INSERT INTO deh_egresos VALUES (3, 7, 'Gastos de publicidad y marketing', '12-JUN-2022', 'Gastos de publicidad y marketing para promocionar los servicios de alquiler de vehículos de la compañía.', deh_TRANSACCION(deh_TRANSACCION.validarMonto(210), 'dólar estado-unidense', 'USD ($)'));
INSERT INTO deh_egresos VALUES (3, 8, 'Pago de servicios de telefonía e internet', '19-JUN-2022', 'Pago de servicios de telefonía e internet para asegurar la comunicación en todas las sedes de la compañía.', deh_TRANSACCION(deh_TRANSACCION.validarMonto(210), 'dólar estado-unidense', 'USD ($)'));
INSERT INTO deh_egresos VALUES (3, 9, 'Pago de servicios de seguridad privada', '26-JUN-2022', 'Pago de servicios de seguridad privada para garantizar la protección de las sedes y los vehículos.', deh_TRANSACCION(deh_TRANSACCION.validarMonto(210), 'dólar estado-unidense', 'USD ($)'));
INSERT INTO deh_egresos VALUES (4, 10, 'Compra de neumáticos y llantas', '03-JUL-2022', 'Compra de neumáticos y llantas para el reemplazo de los desgastados en la flota de vehículos.', deh_TRANSACCION(deh_TRANSACCION.validarMonto(210), 'dólar estado-unidense', 'USD ($)'));
INSERT INTO deh_egresos VALUES (4, 11, 'Gastos de transporte y logística', '10-JUL-2022', 'Gastos de transporte y logística relacionados con el traslado de vehículos entre sedes y clientes.', deh_TRANSACCION(deh_TRANSACCION.validarMonto(210), 'dólar estado-unidense', 'USD ($)'));
INSERT INTO deh_egresos VALUES (4, 12, 'Pago de servicios legales y contables', '17-JUL-2022', 'Pago de servicios legales y contables para cumplir con las obligaciones fiscales y laborales.', deh_TRANSACCION(deh_TRANSACCION.validarMonto(210), 'dólar estado-unidense', 'USD ($)'));
INSERT INTO deh_egresos VALUES (5, 13, 'Compra de equipos de oficina', '24-JUL-2022', 'Compra de equipos de oficina para mejorar la productividad y el confort en las sedes de la compañía.', deh_TRANSACCION(deh_TRANSACCION.validarMonto(210), 'dólar estado-unidense', 'USD ($)'));
INSERT INTO deh_egresos VALUES (5, 14, 'Pago de seguros de los vehículos', '31-JUL-2022', 'Pago de seguros de los vehículos de la flota para protegerlos ante posibles eventualidades.', deh_TRANSACCION(deh_TRANSACCION.validarMonto(210), 'dólar estado-unidense', 'USD ($)'));
INSERT INTO deh_egresos VALUES (5, 15, 'Gastos de reparación de averías en los vehículos', '07-AUG-2022', 'Gastos de reparación de averías en los vehículos para mantenerlos en óptimas condiciones de funcionamiento.', deh_TRANSACCION(deh_TRANSACCION.validarMonto(210), 'dólar estado-unidense', 'USD ($)'));
INSERT INTO deh_egresos VALUES (6, 16, 'Pago de servicios de mantenimiento de sedes', '14-AUG-2022', 'Pago de servicios de mantenimiento de las sedes de la compañía para conservar su buen estado.', deh_TRANSACCION(deh_TRANSACCION.validarMonto(210), 'dólar estado-unidense', 'USD ($)'));
INSERT INTO deh_egresos VALUES (6, 17, 'Compra de uniformes para el personal', '21-AUG-2022', 'Compra de uniformes para el personal de la compañía, identificándolos como miembros del equipo.', deh_TRANSACCION(deh_TRANSACCION.validarMonto(210), 'dólar estado-unidense', 'USD ($)'));
INSERT INTO deh_egresos VALUES (6, 18, 'Gastos de capacitación y formación del personal', '28-AUG-2022', 'Gastos de capacitación y formación del personal para mejorar sus habilidades y conocimientos.', deh_TRANSACCION(deh_TRANSACCION.validarMonto(210), 'dólar estado-unidense', 'USD ($)'));
INSERT INTO deh_egresos VALUES (7, 19, 'Pago de servicios de vigilancia', '04-SEP-2022', 'Pago de servicios de vigilancia para garantizar la seguridad en las sedes y proteger los vehículos.', deh_TRANSACCION(deh_TRANSACCION.validarMonto(210), 'dólar estado-unidense', 'USD ($)'));
INSERT INTO deh_egresos VALUES (7, 20, 'Compra de accesorios para los vehículos', '11-SEP-2022', 'Compra de accesorios para los vehículos de la flota, como portaequipajes y soportes para bicicletas.', deh_TRANSACCION(deh_TRANSACCION.validarMonto(210), 'dólar estado-unidense', 'USD ($)'));
INSERT INTO deh_egresos VALUES (7, 21, 'Gastos de promoción en ferias y eventos', '18-SEP-2022', 'Gastos de promoción en ferias y eventos relacionados con el sector automotriz y turístico.', deh_TRANSACCION(deh_TRANSACCION.validarMonto(210), 'dólar estado-unidense', 'USD ($)'));
INSERT INTO deh_egresos VALUES (8, 22, 'Pago de servicios de consultoría', '25-SEP-2022', 'Pago de servicios de consultoría para obtener asesoramiento especializado en áreas estratégicas de la compañía.', deh_TRANSACCION(deh_TRANSACCION.validarMonto(210), 'dólar estado-unidense', 'USD ($)'));
INSERT INTO deh_egresos VALUES (8, 23, 'Compra de herramientas para el taller', '02-OCT-2022', 'Compra de herramientas para el taller de mantenimiento de la flota de vehículos.', deh_TRANSACCION(deh_TRANSACCION.validarMonto(210), 'dólar estado-unidense', 'USD ($)'));
INSERT INTO deh_egresos VALUES (8, 24, 'Gastos de viaje y hospedaje', '09-OCT-2022', 'Gastos de viaje y hospedaje para el personal que deba desplazarse a otras sedes o realizar gestiones externas.', deh_TRANSACCION(deh_TRANSACCION.validarMonto(210),'dólar estado-unidense', 'USD ($)'));
INSERT INTO deh_egresos VALUES (9, 25, 'Pago de servicios de limpieza de vehículos', '16-OCT-2022', 'Pago de servicios de limpieza de vehículos, asegurando que estén impecables para los clientes.', deh_TRANSACCION(deh_TRANSACCION.validarMonto(210), 'dólar estado-unidense', 'USD ($)'));
INSERT INTO deh_egresos VALUES (9, 26, 'Compra de mobiliario para las sedes', '23-OCT-2022', 'Compra de mobiliario para las sedes de la compañía, brindando espacios cómodos y funcionales.', deh_TRANSACCION(deh_TRANSACCION.validarMonto(210), 'dólar estado-unidense', 'USD ($)'));
INSERT INTO deh_egresos VALUES (9, 27, 'Gastos de suministros de oficina', '30-OCT-2022', 'Gastos de suministros de oficina, como papel, bolígrafos y otros materiales necesarios.', deh_TRANSACCION(deh_TRANSACCION.validarMonto(210), 'dólar estado-unidense', 'USD ($)'));
INSERT INTO deh_egresos VALUES (10, 28, 'Pago de servicios de mensajería y paquetería', '06-NOV-2022', 'Pago de servicios de mensajería y paquetería para el envío de documentos y paquetes importantes.', deh_TRANSACCION(deh_TRANSACCION.validarMonto(210), 'dólar estado-unidense', 'USD ($)'));
INSERT INTO deh_egresos VALUES (10, 29, 'Compra de sistemas de seguridad para las sedes', '13-NOV-2022', 'Compra de sistemas de seguridad para las sedes, como cámaras de vigilancia y alarmas.', deh_TRANSACCION(deh_TRANSACCION.validarMonto(210), 'dólar estado-unidense', 'USD ($)'));
INSERT INTO deh_egresos VALUES (10, 30, 'Gastos de mantenimiento de jardines y áreas verdes', '20-NOV-2022', 'Gastos de mantenimiento de jardines y áreas verdes en las sedes, creando entornos agradables.', deh_TRANSACCION(deh_TRANSACCION.validarMonto(210), 'dólar estado-unidense', 'USD ($)'));
INSERT INTO deh_egresos VALUES (11, 31, 'Pago de servicios de asesoría legal', '27-NOV-2022', 'Pago de servicios de asesoría legal para recibir orientación en temas legales y regulatorios.', deh_TRANSACCION(deh_TRANSACCION.validarMonto(210), 'dólar estado-unidense', 'USD ($)'));
INSERT INTO deh_egresos VALUES (11, 32, 'Compra de equipos de comunicación', '04-DEC-2022', 'Compra de equipos de comunicación, como radios y teléfonos móviles para el personal.', deh_TRANSACCION(deh_TRANSACCION.validarMonto(210), 'dólar estado-unidense', 'USD ($)'));
INSERT INTO deh_egresos VALUES (11, 33, 'Gastos de remodelación de las sedes', '11-DEC-2022', 'Gastos de remodelación de las sedes para actualizar su imagen y mejorar la experiencia de los clientes.', deh_TRANSACCION(deh_TRANSACCION.validarMonto(210), 'dólar estado-unidense', 'USD ($)'));
INSERT INTO deh_egresos VALUES (12, 34, 'Pago de servicios de mantenimiento de equipos', '18-DEC-2022', 'Pago de servicios de mantenimiento de equipos, como computadoras y equipos de oficina.', deh_TRANSACCION(deh_TRANSACCION.validarMonto(210), 'dólar estado-unidense', 'USD ($)'));
INSERT INTO deh_egresos VALUES (12, 35, 'Compra de material de papelería', '25-DEC-2022', 'Compra de material de papelería, como hojas, carpetas y sobres para la gestión administrativa.', deh_TRANSACCION(deh_TRANSACCION.validarMonto(210), 'dólar estado-unidense', 'USD ($)'));
INSERT INTO deh_egresos VALUES (12, 36, 'Gastos de promoción en medios de comunicación', '01-JAN-2023', 'Gastos de promoción en medios de comunicación, como anuncios en prensa, radio y televisión.', deh_TRANSACCION(deh_TRANSACCION.validarMonto(210), 'dólar estado-unidense', 'USD ($)'));
INSERT INTO deh_egresos VALUES (13, 37, 'Pago de servicios de transporte de vehículos', '08-JAN-2023', 'Pago de servicios de transporte de vehículos para movilizarlos entre sedes o entregarlos a clientes.', deh_TRANSACCION(deh_TRANSACCION.validarMonto(210), 'dólar estado-unidense', 'USD ($)'));
INSERT INTO deh_egresos VALUES (13, 38, 'Compra de equipos de protección personal', '15-JAN-2023', 'Compra de equipos de protección personal para el personal de la compañía.', deh_TRANSACCION(deh_TRANSACCION.validarMonto(210), 'dólar estado-unidense', 'USD ($)'));
INSERT INTO deh_egresos VALUES (13, 39, 'Gastos de donaciones y patrocinios', '22-JAN-2023', 'Gastos de donaciones y patrocinios en proyectos comunitarios y eventos sociales.', deh_TRANSACCION(deh_TRANSACCION.validarMonto(210), 'dólar estado-unidense', 'USD ($)'));
INSERT INTO deh_egresos VALUES (14, 40, 'Pago de servicios de limpieza de sedes', '29-JAN-2023', 'Pago de servicios de limpieza de las sedes, asegurando un ambiente limpio y ordenado.', deh_TRANSACCION(deh_TRANSACCION.validarMonto(210), 'dólar estado-unidense', 'USD ($)'));
INSERT INTO deh_egresos VALUES (14, 41, 'Compra de equipos de monitoreo GPS', '05-FEB-2023', 'Compra de equipos de monitoreo GPS para mejorar la seguridad y el control de los vehículos.', deh_TRANSACCION(deh_TRANSACCION.validarMonto(210), 'dólar estado-unidense', 'USD ($)'));
INSERT INTO deh_egresos VALUES (14, 42, 'Gastos de almacenamiento de repuestos', '12-FEB-2023', 'Gastos de almacenamiento de repuestos, asegurando un inventario adecuado para la reparación de vehículos.', deh_TRANSACCION(deh_TRANSACCION.validarMonto(210), 'dólar estado-unidense', 'USD ($)'));
INSERT INTO deh_egresos VALUES (15, 43, 'Pago de servicios de capacitación del personal', '19-FEB-2023', 'Pago de servicios de capacitación del personal para mejorar sus habilidades y conocimientos específicos.', deh_TRANSACCION(deh_TRANSACCION.validarMonto(210), 'dólar estado-unidense', 'USD ($)'));
INSERT INTO deh_egresos VALUES (15, 44, 'Compra de equipos de audio y video para las sedes', '26-FEB-2023', 'Compra de equipos de audio y video para las sedes, brindando un ambiente ameno para los clientes.', deh_TRANSACCION(deh_TRANSACCION.validarMonto(210), 'dólar estado-unidense', 'USD ($)'));
INSERT INTO deh_egresos VALUES (15, 45, 'Gastos de traducción de documentos varios', '05-MAR-2023', 'Gastos de traducción de documentos necesarios para la operación de la compañía.', deh_TRANSACCION(deh_TRANSACCION.validarMonto(210), 'dólar estado-unidense', 'USD ($)'));

-- TABLA CONTRATO

CREATE TABLE deh_contratos(
    con_cod number (6) PRIMARY KEY,
    con_fechaIni date NOT NULL,
    con_fechaFin date NOT NULL,
    con_descrip varchar2 (100),
    con_mar_cod number (3) NOT NULL,
    con_mod_cod number (3) NOT NULL,
    con_veh_cod number (6) NOT NULL,
    con_cli_cod number (9) NOT NULL,
    con_res_cod number (2),
    con_transaccion deh_TRANSACCION,

 -- Claves forÃ¡neas
    CONSTRAINT fk_con_veh FOREIGN KEY (con_mar_cod, con_mod_cod, con_veh_cod) REFERENCES deh_vehiculos (veh_mar_cod, veh_mod_cod, veh_cod),
    CONSTRAINT fk_con_cli FOREIGN KEY (con_cli_cod) REFERENCES deh_clientes (cli_cod),
    CONSTRAINT fk_con_res FOREIGN KEY (con_res_cod) REFERENCES deh_reservas (res_cod)
);

CREATE SEQUENCE SEQ_CONTRATOS
    START WITH 1
    INCREMENT BY 1;

--INSERCION CONTRATO

INSERT INTO deh_contratos VALUES (SEQ_CONTRATOS.NEXTVAL, '06-DEC-2022', '20-DEC-2022', 'Contrato con reserva anticipada para período decembrino/Navidades', 3, 1, 1, 1, 1, deh_TRANSACCION(deh_TRANSACCION.validarMonto(210), 'dólar estado-unidense', 'USD ($)'));
INSERT INTO deh_contratos VALUES (SEQ_CONTRATOS.NEXTVAL, '12-JAN-2023', '27-JUN-2023', NULL, 4, 4, 8, 2, NULL, deh_TRANSACCION(deh_TRANSACCION.validarMonto(270), 'dólar estado-unidense', 'USD ($)'));
INSERT INTO deh_contratos VALUES (SEQ_CONTRATOS.NEXTVAL, '03-FEB-2023', '17-JUN-2023', 'Contrato con reserva anticipada', 1, 5, 10, 3, 3, deh_TRANSACCION(deh_TRANSACCION.validarMonto(282), 'dólar estado-unidense', 'USD ($)'));
INSERT INTO deh_contratos VALUES (SEQ_CONTRATOS.NEXTVAL, '14-FEB-2023', '01-JUN-2023', NULL, 12, 8, 16, 4, NULL, deh_TRANSACCION(deh_TRANSACCION.validarMonto(300), 'dólar estado-unidense', 'USD ($)'));
INSERT INTO deh_contratos VALUES (SEQ_CONTRATOS.NEXTVAL, '23-MAR-2023', '06-JUN-2023', NULL, 7, 9, 17, 5, NULL, deh_TRANSACCION(deh_TRANSACCION.validarMonto(224), 'dólar estado-unidense', 'USD ($)'));
INSERT INTO deh_contratos VALUES (SEQ_CONTRATOS.NEXTVAL, '24-MAR-2023', '08-APR-2023', 'Contrato con reserva anticipada para Semana Santa', 11, 11, 21, 6, 6, deh_TRANSACCION(deh_TRANSACCION.validarMonto(265), 'dólar estado-unidense', 'USD ($)'));
INSERT INTO deh_contratos VALUES (SEQ_CONTRATOS.NEXTVAL, '08-MAY-2023', '22-JUN-2023', NULL, 14, 13, 25, 7, NULL, deh_TRANSACCION(deh_TRANSACCION.validarMonto(280), 'dólar estado-unidense', 'USD ($)'));
INSERT INTO deh_contratos VALUES (SEQ_CONTRATOS.NEXTVAL, '15-APR-2023', '01-MAY-2023', NULL, 15, 14, 28, 8, NULL, deh_TRANSACCION(deh_TRANSACCION.validarMonto(240), 'dólar estado-unidense', 'USD ($)'));
INSERT INTO deh_contratos VALUES (SEQ_CONTRATOS.NEXTVAL, '30-APR-2023', '15-MAY-2023', NULL, 13, 15, 29, 9, NULL, deh_TRANSACCION(deh_TRANSACCION.validarMonto(270), 'dólar estado-unidense', 'USD ($)'));
INSERT INTO deh_contratos VALUES (SEQ_CONTRATOS.NEXTVAL, '11-MAY-2023', '26-JUN-2023', 'Contrato con reserva anticipada', 10, 17, 33, 10, 10, deh_TRANSACCION(deh_TRANSACCION.validarMonto(415), 'dólar estado-unidense', 'USD ($)'));
INSERT INTO deh_contratos VALUES (SEQ_CONTRATOS.NEXTVAL, '17-MAY-2023', '02-JUN-2023', 'Contrato con reserva anticipada', 8, 18, 35, 11, 11, deh_TRANSACCION(deh_TRANSACCION.validarMonto(256), 'dólar estado-unidense', 'USD ($)'));
INSERT INTO deh_contratos VALUES (SEQ_CONTRATOS.NEXTVAL, '14-MAY-2023', '29-MAY-2023', NULL, 2, 20, 39, 12, NULL, deh_TRANSACCION(deh_TRANSACCION.validarMonto(300), 'dólar estado-unidense', 'USD ($)'));
INSERT INTO deh_contratos VALUES (SEQ_CONTRATOS.NEXTVAL, '05-FEB-2023', '19-JUN-2023', NULL, 5, 21, 40, 13, NULL, deh_TRANSACCION(deh_TRANSACCION.validarMonto(254), 'dólar estado-unidense', 'USD ($)'));
INSERT INTO deh_contratos VALUES (SEQ_CONTRATOS.NEXTVAL, '10-MAR-2023', '24-MAR-2023', 'Contrato con reserva anticipada', 9, 22, 41, 14, 14, deh_TRANSACCION(deh_TRANSACCION.validarMonto(252), 'dólar estado-unidense', 'USD ($)'));
INSERT INTO deh_contratos VALUES (SEQ_CONTRATOS.NEXTVAL, '27-MAY-2023', '11-JUN-2023', NULL, 17, 28, 47, 15, NULL, deh_TRANSACCION(deh_TRANSACCION.validarMonto(395), 'dólar estado-unidense', 'USD ($)'));
INSERT INTO deh_contratos VALUES (SEQ_CONTRATOS.NEXTVAL, '07-DEC-2022', '20-DEC-2022', 'Contrato con reserva anticipada para período decembrino/Navidades', 3, 1, 1, 1, 1, deh_TRANSACCION(deh_TRANSACCION.validarMonto(210), 'dólar estado-unidense', 'USD ($)'));
INSERT INTO deh_contratos VALUES (SEQ_CONTRATOS.NEXTVAL, '08-DEC-2022', '20-DEC-2022', 'Contrato con reserva anticipada para período decembrino/Navidades', 3, 1, 1, 1, 1, deh_TRANSACCION(deh_TRANSACCION.validarMonto(210), 'dólar estado-unidense', 'USD ($)'));
INSERT INTO deh_contratos VALUES (SEQ_CONTRATOS.NEXTVAL, '07-DEC-2022', '20-DEC-2022', NULL, 4, 4, 8, 2, NULL, deh_TRANSACCION(deh_TRANSACCION.validarMonto(270), 'dólar estado-unidense', 'USD ($)'));
INSERT INTO deh_contratos VALUES (SEQ_CONTRATOS.NEXTVAL, '09-DEC-2022', '20-DEC-2022', 'Contrato con reserva anticipada', 8, 18, 35, 11, 11, deh_TRANSACCION(deh_TRANSACCION.validarMonto(256), 'dólar estado-unidense', 'USD ($)'));
INSERT INTO deh_contratos VALUES (SEQ_CONTRATOS.NEXTVAL, '05-DEC-2022', '20-DEC-2022', 'Contrato con reserva anticipada', 8, 18, 35, 11, 11, deh_TRANSACCION(deh_TRANSACCION.validarMonto(256), 'dólar estado-unidense', 'USD ($)'));
INSERT INTO deh_contratos VALUES (SEQ_CONTRATOS.NEXTVAL, '10-DEC-2022', '20-DEC-2022', NULL, 13, 15, 29, 9, NULL, deh_TRANSACCION(deh_TRANSACCION.validarMonto(270), 'dólar estado-unidense', 'USD ($)'));
INSERT INTO deh_contratos VALUES (SEQ_CONTRATOS.NEXTVAL, '11-DEC-2022', '20-DEC-2022', 'Contrato con reserva anticipada para período decembrino/Navidades', 3, 1, 1, 1, 1, deh_TRANSACCION(deh_TRANSACCION.validarMonto(210), 'dólar estado-unidense', 'USD ($)'));


CREATE TABLE deh_formas_pago (
    pag_con_cod number (6) NOT NULL,
    pag_cod number (5) NOT NULL,
    pag_fechaIng date NOT NULL,
    pag_metPag varchar2 (30) NOT NULL,
    pag_descrip varchar2 (50),
    pag_transaccion deh_TRANSACCION,

  -- Clave primaria
    CONSTRAINT pk_pagos PRIMARY KEY (pag_con_cod, pag_cod),

  -- Clave forÃ¡nea
    CONSTRAINT fk_pag_con FOREIGN KEY (pag_con_cod) REFERENCES deh_contratos (con_cod),

  -- Checks
    CONSTRAINT tipo_pago CHECK ( pag_metPag IN ('Efectivo','Transferencia','Pago movil','Tarjeta internacional','Criptomoneda') )
);

CREATE SEQUENCE SEQ_FORMA_PAGO
    START WITH 1
    INCREMENT BY 1;

--INSERCION FORMA_PAGO

INSERT INTO deh_formas_pago VALUES (1, SEQ_FORMA_PAGO.NEXTVAL, '03-DEC-2022', 'Criptomoneda', '1° de pago: Criptomonedas (BTC)', deh_TRANSACCION (deh_TRANSACCION.validarMonto(405), 'bitcoin', 'BTC'));
INSERT INTO deh_formas_pago VALUES (1, SEQ_FORMA_PAGO.NEXTVAL, '03-DEC-2023', 'Transferencia', '2° forma de pago: Transferencia', deh_TRANSACCION (deh_TRANSACCION.validarMonto(10), 'dólar estado-unidense', 'USD ($)'));
INSERT INTO deh_formas_pago VALUES (3, SEQ_FORMA_PAGO.NEXTVAL, '10-FEB-2023', 'Efectivo', NULL, deh_TRANSACCION (deh_TRANSACCION.validarMonto(200), 'dólar estado-unidense', 'USD ($)'));
INSERT INTO deh_formas_pago VALUES (4, SEQ_FORMA_PAGO.NEXTVAL, '24-FEB-2023', 'Pago movil', NULL, deh_TRANSACCION (deh_TRANSACCION.validarMonto(305), 'dólar estado-unidense', 'USD ($)'));
INSERT INTO deh_formas_pago VALUES (5, SEQ_FORMA_PAGO.NEXTVAL, '01-APR-2023', 'Pago movil', NULL, deh_TRANSACCION (deh_TRANSACCION.validarMonto(124), 'dólar estado-unidense', 'USD ($)'));
INSERT INTO deh_formas_pago VALUES (6, SEQ_FORMA_PAGO.NEXTVAL, '21-MAR-2023', 'Efectivo', '1° de pago: Efectivo ($)', deh_TRANSACCION (deh_TRANSACCION.validarMonto(200), 'dólar estado-unidense', 'USD ($)'));
INSERT INTO deh_formas_pago VALUES (6, SEQ_FORMA_PAGO.NEXTVAL, '22-MAR-2023', 'Transferencia', '2° forma de pago: Transferencia', deh_TRANSACCION (deh_TRANSACCION.validarMonto(135), 'dólar estado-unidense', 'USD ($)'));
INSERT INTO deh_formas_pago VALUES (8, SEQ_FORMA_PAGO.NEXTVAL, '30-APR-2023', 'Tarjeta internacional', NULL, deh_TRANSACCION (deh_TRANSACCION.validarMonto(140), 'dólar estado-unidense', 'USD ($)'));
INSERT INTO deh_formas_pago VALUES (9, SEQ_FORMA_PAGO.NEXTVAL, '15-MAY-2023', 'Pago movil', NULL, deh_TRANSACCION (deh_TRANSACCION.validarMonto(170), 'dólar estado-unidense', 'USD ($)'));
INSERT INTO deh_formas_pago VALUES (10, SEQ_FORMA_PAGO.NEXTVAL, '08-MAY-2023', 'Transferencia', NULL, deh_TRANSACCION (deh_TRANSACCION.validarMonto(315), 'dólar estado-unidense', 'USD ($)'));
INSERT INTO deh_formas_pago VALUES (11, SEQ_FORMA_PAGO.NEXTVAL, '14-MAY-2023', 'Efectivo', NULL, deh_TRANSACCION (deh_TRANSACCION.validarMonto(156), 'dólar estado-unidense', 'USD ($)'));
INSERT INTO deh_formas_pago VALUES (12, SEQ_FORMA_PAGO.NEXTVAL, '28-MAY-2023', 'Criptomoneda', NULL, deh_TRANSACCION (deh_TRANSACCION.validarMonto(304), 'bitcoin', 'BTC'));
INSERT INTO deh_formas_pago VALUES (13, SEQ_FORMA_PAGO.NEXTVAL, '16-FEB-2023', 'Criptomoneda', NULL, deh_TRANSACCION (deh_TRANSACCION.validarMonto(154), 'tether', 'USDT ($)'));
INSERT INTO deh_formas_pago VALUES (15, SEQ_FORMA_PAGO.NEXTVAL, '06-JUN-2023', 'Pago movil', '1° de pago: Pago móvil', deh_TRANSACCION (deh_TRANSACCION.validarMonto(95), 'dólar estado-unidense', 'USD ($)'));
INSERT INTO deh_formas_pago VALUES (15, SEQ_FORMA_PAGO.NEXTVAL, '09-JUN-2023', 'Tarjeta internacional', '2° forma de pago: Tarjeta internacional', deh_TRANSACCION (deh_TRANSACCION.validarMonto(10), 'dólar estado-unidense', 'USD ($)'));
