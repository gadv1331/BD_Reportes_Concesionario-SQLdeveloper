--------------------------------- Simulacion 8(LISTO) ---------------------------------

--Funcion para obtener una sede aleatoria

create or replace function obtenerSede return deh_sedes%rowtype
is sede deh_sedes%rowtype;
   rand_num number;
   num_max number;
begin
    select count(*) into num_max from deh_sedes;
    rand_num := round(dbms_random.value(1,num_max));
    select * into sede from deh_sedes where sed_cod = rand_num;
    DBMS_OUTPUT.PUT_LINE('Informacion de la sede: '||CHR(10)||
                          ' Localizacion: '||sede.sed_locacion.calle||CHR(10)||
                          ' Codigo postal:'||sede.sed_locacion.codigoPostal||CHR(10)||
                          ' Telefono: '||sede.sed_empresa.lineaTlf||CHR(10));
    return sede;
end;


CREATE OR REPLACE FUNCTION obtener_Vehiculo_Mantenimiento(id_sede number)
RETURN deh_vehiculos%ROWTYPE
IS cursor cvehiculos is
   SELECT v.* FROM deh_sedes s
   JOIN deh_colecciones_vehiculos cv ON s.sed_cod = cv.col_sed_cod
   JOIN deh_vehiculos v ON cv.col_veh_cod = v.veh_cod
   WHERE s.sed_cod = id_sede ;
    
   vehiculos deh_vehiculos%ROWTYPE;
   cont number;
BEGIN
  open cvehiculos;
  fetch cvehiculos into vehiculos;
  while cvehiculos%found loop
    select count(*) into cont from deh_bitacoras where bit_veh_cod = vehiculos.veh_cod and bit_fechaFin > TRUNC(SYSDATE); 
        IF cont = 0 then
            EXIT;
        end if;
    fetch cvehiculos into vehiculos;
  end loop;
  close cvehiculos;
  return vehiculos;
END;

CREATE OR REPLACE FUNCTION verificar_Mantenimiento_Vehiculos(id_sede number)
RETURN boolean
IS cursor cvehiculos is
   SELECT v.* FROM deh_sedes s
   JOIN deh_colecciones_vehiculos cv ON s.sed_cod = cv.col_sed_cod
   JOIN deh_vehiculos v ON cv.col_veh_cod = v.veh_cod
   WHERE s.sed_cod = id_sede ;
    
   vehiculos deh_vehiculos%ROWTYPE;
   cont number;
   booleano boolean;
BEGIN
  open cvehiculos;
  fetch cvehiculos into vehiculos;
  booleano := false;
  while cvehiculos%found loop
    select count(*) into cont from deh_bitacoras where bit_veh_cod = vehiculos.veh_cod and bit_fechaFin > TRUNC(SYSDATE); 
    DBMS_OUTPUT.PUT_LINE('Informacion del vehiculo seleccionado para hacer un mantenimiento: '||CHR(10)||
                          ' Tipo de vehiculo:'||vehiculos.veh_tipo||CHR(10)||
                          ' Matricula: '||vehiculos.veh_mat||CHR(10)||   
                          ' Kilometraje:'||vehiculos.veh_kmR||CHR(10));
        IF cont = 0 then
            booleano := true;
            EXIT;
        else 
            DBMS_OUTPUT.PUT_LINE('ERROR: El vehículo seleccionado ya se encuentra en mantenimiento'||CHR(10));    
        end if;
    fetch cvehiculos into vehiculos;
  end loop;
  close cvehiculos;
  return booleano;
END;


CREATE OR REPLACE FUNCTION obtenerTaller RETURN VARCHAR2
IS rand_num NUMBER;
   num_max NUMBER;
   taller deh_talleres%rowtype;
BEGIN
   SELECT COUNT(*) INTO num_max FROM deh_talleres;
   rand_num := ROUND(DBMS_RANDOM.VALUE(1,num_max));
   SELECT * INTO taller FROM deh_talleres WHERE tal_cod = rand_num;
   DBMS_OUTPUT.PUT_LINE('Taller seleccionado que realizara el mantenimiento:'||CHR(10));
   DBMS_OUTPUT.PUT_LINE('   Nombre del taller: '||taller.tal_nombre);
   DBMS_OUTPUT.PUT_LINE('   Calle: '||taller.tal_locacion.calle);
   DBMS_OUTPUT.PUT_LINE('   Codigo postal: '||taller.tal_locacion.codigoPostal);
   DBMS_OUTPUT.PUT_LINE('   Telefono: '||taller.tal_empresa.lineaTlf||CHR(10));
   RETURN taller.tal_cod;
END;



CREATE OR REPLACE FUNCTION obtenerMantenimiento RETURN VARCHAR2
is rand_num NUMBER;
   num_max NUMBER;
   mantenimiento deh_mantenimiento%rowtype;
BEGIN
   SELECT COUNT(*) INTO num_max FROM deh_mantenimiento;
   rand_num := ROUND(DBMS_RANDOM.VALUE(1,num_max));
   SELECT * INTO mantenimiento FROM deh_mantenimiento WHERE man_cod = rand_num;
   DBMS_OUTPUT.PUT_LINE('Mantenimiento que se va realizar'||CHR(10));
   DBMS_OUTPUT.PUT_LINE('   Nombre del mantenimiento: '||mantenimiento.man_nombre);
   DBMS_OUTPUT.PUT_LINE('   Tipo mantenimiento: '||mantenimiento.man_tipo);
   DBMS_OUTPUT.PUT_LINE('   Detalle del mantenimiento: '||mantenimiento.man_descrip||CHR(10));
   RETURN mantenimiento.man_cod;
END;


CREATE OR REPLACE FUNCTION obtenerDetalleMantenimiento RETURN VARCHAR2
IS
  detalle VARCHAR2(100);
  rand_num NUMBER;
BEGIN
  rand_num := ROUND(DBMS_RANDOM.VALUE(1,3));
  IF rand_num = 1 THEN
    detalle := 'Mantenimiento de emergencia del vehiculo';
  ELSIF rand_num = 2 THEN
    detalle := 'Mantenimiento de rutina del vehiculo';
  ELSE
    detalle := 'Mantenimiento para la seguridad de los empleados';
  END IF;
        
  RETURN detalle;
END;

CREATE OR REPLACE FUNCTION obtenerEstatus RETURN VARCHAR2
IS
  detalle VARCHAR2(10);
  rand_num NUMBER;
BEGIN
  rand_num := ROUND(DBMS_RANDOM.VALUE(1,2));
  IF rand_num = 1 THEN
    detalle := 'TRUE';
  ELSE
    detalle := 'FALSE';
  END IF;  
  RETURN detalle;
END;


Create or replace procedure realizarMantenimiento(ciclos number) 
is cont number;
   sede deh_sedes%rowtype;
   vehiculo deh_vehiculos%rowtype;
   booleano boolean;
   rand_num number;
   rand_num2 number;
   fechaInicio date;
   fechaFin date;
   fechaProxima date;
begin
    cont := 1;
    DBMS_OUTPUT.PUT_LINE(' SIMULACION REALIZAR MANTENIMIENTO');
    while cont <= ciclos loop
        DBMS_OUTPUT.PUT_LINE('-------- '||'CICLO: '||cont||' --------');
        booleano := true;
            while (booleano = true) loop
                DBMS_OUTPUT.PUT_LINE('----* SELECCIONANDO SEDE *----'||CHR(10));
                sede := obtenerSede;
                DBMS_OUTPUT.PUT_LINE('----* SELECCIONANDO VEHICULO DE LA SEDE *----'||CHR(10));
                if verificar_Mantenimiento_Vehiculos(sede.sed_cod) then 
                    DBMS_OUTPUT.PUT_LINE('----* VEHICULO SELECCIONADO CON EXITO *----'||CHR(10));
                    rand_num := ROUND(DBMS_RANDOM.VALUE(1,10));
                    rand_num2 := ROUND(DBMS_RANDOM.VALUE(15,25));
                    vehiculo := obtener_Vehiculo_Mantenimiento(sede.sed_cod);
                    
                   -- NOTA DECIDIR SI SE VA A PONER FECHA CUALQUIERA O SE EMPIEZA DESDE LA FECHA DEL PROXIMO MANTENIMIENTO QUE SALE EN LA BITACORA
                   -- select bit_fechaProx into fechaProxima from deh_bitacoras where bit_veh_cod = vehiculo.veh_cod; 
                          
                     insert into deh_bitacoras values (vehiculo.veh_mar_cod,vehiculo.veh_mod_cod,vehiculo.veh_cod,obtenerMantenimiento,obtenerTaller,TRUNC(SYSDATE),TRUNC(SYSDATE+rand_num),TRUNC(SYSDATE+rand_num2), obtenerEstatus ,obtenerDetalleMantenimiento);
                    
                     DBMS_OUTPUT.PUT_LINE('Fecha de inicio de mantenimiento: '||TRUNC(SYSDATE));
                     DBMS_OUTPUT.PUT_LINE('Fecha de fin del mantenimiento: '||TRUNC(SYSDATE+rand_num));
                     DBMS_OUTPUT.PUT_LINE('Fecha de proximo del mantenimiento: '||TRUNC(SYSDATE+rand_num2)||CHR(10));
                     DBMS_OUTPUT.PUT_LINE('-------- *FIN DEL CICLO '||cont||'* --------');
                     booleano := false;
                else
                    DBMS_OUTPUT.PUT_LINE('ERROR: La sede seleccionada posee todos sus vehiculos en mantenimientos'||CHR(10));
                end if;
            end loop;
        cont := cont + 1;
    end loop;
end;

EXECUTE realizarMantenimiento(2);

---------------------------------------Simulacion 4(LISTO)-----------------------------
create table deh_empleado_auxiliar(
    emp_codigo number primary key,
    emp_cargo varchar2(20), 
    emp_persona deh_persona
);

CREATE SEQUENCE SEQ_EMPLEADOS_AUXILIARES
    START WITH 1
    INCREMENT BY 1;


insert into deh_empleado_auxiliar values (SEQ_EMPLEADOS_AUXILIARES.nextval,'Secretaria',deh_PERSONA('Gomez','Maria','Mujer','11-MAY-1956'));
insert into deh_empleado_auxiliar values (SEQ_EMPLEADOS_AUXILIARES.nextval,'Mecanico',deh_PERSONA('Delgado','Gabriel','Hombre','24-SEP-2000'));
insert into deh_empleado_auxiliar values (SEQ_EMPLEADOS_AUXILIARES.nextval,'Recepcionista',deh_PERSONA('Lopez','Maria','Mujer','3-MAY-1996'));
insert into deh_empleado_auxiliar values (SEQ_EMPLEADOS_AUXILIARES.nextval,'Recepcionista',deh_PERSONA('Fung','Carlo','Hombre','9-JUN-2006'));
insert into deh_empleado_auxiliar values (SEQ_EMPLEADOS_AUXILIARES.nextval,'Asesor de Servicio',deh_PERSONA('Balde','Estafny','Mujer','20-FEB-2009'));
insert into deh_empleado_auxiliar values (SEQ_EMPLEADOS_AUXILIARES.nextval,'Gerente de Servicio',deh_PERSONA('Villa','Carla','Mujer','1-DEC-1956'));
insert into deh_empleado_auxiliar values (SEQ_EMPLEADOS_AUXILIARES.nextval,'Gerente de Servicio',deh_PERSONA('Gomez','Maria','Mujer','14-AUG-1956'));



--Funcion para obtener los datos de un empleado a contratar
create or replace function obtenerEmpleado return deh_empleado_auxiliar%rowtype
is empleado deh_empleado_auxiliar%rowtype;
   rand_num number;
   num_max number;
begin
    select count(*) into num_max from deh_empleado_auxiliar;
    rand_num := round(dbms_random.value(1,num_max));
    select * into empleado from deh_empleado_auxiliar where emp_codigo = rand_num;
    
    DBMS_OUTPUT.PUT_LINE('Informacion del empleado que se va a contratar'||CHR(10)||
                          ' Primer nombre: '||empleado.emp_persona.primerNombre||CHR(10)||
                          ' Apellido: '||empleado.emp_persona.primerApellido||CHR(10)||
                          ' Genero: '||empleado.emp_persona.genero||CHR(10)||
                          ' Fecha de nacimiento: '||empleado.emp_persona.fechaNac||CHR(10)||
                          ' Cargo que se le va asignar: '||empleado.emp_cargo||CHR(10));
    return empleado;
end;

--Funcion para saber si un empleado es mayor de edad
CREATE OR REPLACE FUNCTION esMayorEdad(fechaNacimiento DATE) RETURN boolean
IS
  fechaActual DATE := SYSDATE;
  edad NUMBER;
BEGIN
  edad := TRUNC(MONTHS_BETWEEN(fechaActual, fechaNacimiento) / 12);
  IF edad >= 18 THEN
    RETURN true;
  ELSE
    RETURN false;
  END IF;
END;

--Procedimiento para contratar un empleado 
Create or replace procedure contratarEmpleado(ciclos number) 
is cont number;
   sede deh_sedes%rowtype;
   empleado deh_empleado_auxiliar%rowtype;
   booleano boolean;
   var_sec number;
begin
    cont := 1;
    DBMS_OUTPUT.PUT_LINE('SIMULACION CONTRATAR EMPLEADO');
    while cont <= ciclos loop
        DBMS_OUTPUT.PUT_LINE('-------- '||'CICLO: '||cont||' --------');
        DBMS_OUTPUT.PUT_LINE('----* SELECCIONANDO SEDE *----'||CHR(10));
        sede := obtenerSede;
        booleano := true;
            while (booleano = true) loop
                DBMS_OUTPUT.PUT_LINE('----* SELECCIONANDO POSIBLE EMPLEADO *----'||CHR(10));
                empleado := obtenerEmpleado;
                if esMayorEdad(empleado.emp_persona.fechaNac) then 
                    DBMS_OUTPUT.PUT_LINE('----* EMPLEADO SELECCIONADO CON EXITO *----'||CHR(10));
                    var_sec := SEQ_EMPLEADOS.NEXTVAL; 
                    
                    insert into deh_empleados values (var_sec,empleado.emp_cargo,sede.sed_cod,empleado.emp_persona);
                    
                    DBMS_OUTPUT.PUT_LINE('Empleado contratado con exito.');
                    DBMS_OUTPUT.PUT_LINE('-------- *FIN DEL CICLO '||cont||'* --------');
                    booleano := false;
                else
                    DBMS_OUTPUT.PUT_LINE('ERROR; No ha sido posible registrar la contratación del empleado, dado que su edad es menor a 18 años'||CHR(10));
                end if;
            end loop;
        cont := cont + 1;
    end loop;
end;

---------------------------------------Simulacion 2(LISTO)-----------------------------
CREATE TABLE deh_promociones_auxiliares(
    prom_cod number (3) PRIMARY KEY,
    prom_descrip varchar2 (100) NOT NULL,
    prom_ptcDesc number (4) NOT NULL
);


CREATE SEQUENCE SEQ_PROMOCIONES_AUXILIARES
    START WITH 1
    INCREMENT BY 1;

INSERT INTO deh_promociones_auxiliares VALUES (SEQ_PROMOCIONES_AUXILIARES.NEXTVAL, 'Descuento por reserva anticipada', 10);
INSERT INTO deh_promociones_auxiliares VALUES (SEQ_PROMOCIONES_AUXILIARES.NEXTVAL, 'Promoción de fin de semana', 20);
INSERT INTO deh_promociones_auxiliares VALUES (SEQ_PROMOCIONES_AUXILIARES.NEXTVAL, 'Descuento por alquiler prolongado', 15);
INSERT INTO deh_promociones_auxiliares VALUES (SEQ_PROMOCIONES_AUXILIARES.NEXTVAL, 'Oferta para clientes frecuentes', 25);
INSERT INTO deh_promociones_auxiliares VALUES (SEQ_PROMOCIONES_AUXILIARES.NEXTVAL, 'Descuento por pago en efectivo', 12);
INSERT INTO deh_promociones_auxiliares VALUES (SEQ_PROMOCIONES_AUXILIARES.NEXTVAL, 'Promoción de temporada baja', 30);
INSERT INTO deh_promociones_auxiliares VALUES (SEQ_PROMOCIONES_AUXILIARES.NEXTVAL, 'Segundo conductor gratis', 20);
INSERT INTO deh_promociones_auxiliares VALUES (SEQ_PROMOCIONES_AUXILIARES.NEXTVAL, 'Seguro a todo riesgo incluido', 25);
INSERT INTO deh_promociones_auxiliares VALUES (SEQ_PROMOCIONES_AUXILIARES.NEXTVAL, 'Entrega y recogida en diferentes ubicacionessin costo adicional', 35);
INSERT INTO deh_promociones_auxiliares VALUES (SEQ_PROMOCIONES_AUXILIARES.NEXTVAL, 'Oferta en vehículos familiares', 15);
INSERT INTO deh_promociones_auxiliares VALUES (SEQ_PROMOCIONES_AUXILIARES.NEXTVAL, 'Descuento en vehículos deportivos', 20);
INSERT INTO deh_promociones_auxiliares VALUES (SEQ_PROMOCIONES_AUXILIARES.NEXTVAL, 'Promoción de vehículos de lujo', 30);
INSERT INTO deh_promociones_auxiliares VALUES (SEQ_PROMOCIONES_AUXILIARES.NEXTVAL, 'Descuento de última hora', 10);
INSERT INTO deh_promociones_auxiliares VALUES (SEQ_PROMOCIONES_AUXILIARES.NEXTVAL, 'Oferta en vehículos compactos', 18);
INSERT INTO deh_promociones_auxiliares VALUES (SEQ_PROMOCIONES_AUXILIARES.NEXTVAL, 'Descuento en alquileres recurrentes', 25);

--Funcion para seleccionar un vehiculo
create or replace function obtenerVehiculo return deh_vehiculos%rowtype
is  vehiculo deh_vehiculos%ROWTYPE;
    modelo  deh_modelos.mod_nombre%type;
    marca   deh_marcas.mar_nombre%type;
    rand_num number;
    num_max number;
begin
     select count(*) into num_max from deh_vehiculos;
     rand_num := round(dbms_random.value(1,num_max));
     select *  into vehiculo from deh_vehiculos where veh_cod = rand_num; 
     select v.mod_nombre,e.mar_nombre into modelo,marca from deh_modelos v ,deh_marcas e where v.mod_cod = vehiculo.veh_mod_cod and e.mar_cod = vehiculo.veh_mar_cod;
     DBMS_OUTPUT.PUT_LINE('Informacion del vehiculo seleccionado para hacer una promocion:'||CHR(10)||
                          ' Marca: '||marca||CHR(10)||
                          ' Modelo:'||modelo||CHR(10)||
                          ' Tipo de vehiculo:'||vehiculo.veh_tipo||CHR(10)||
                          ' Matricula: '||vehiculo.veh_mat||CHR(10));
     return vehiculo;
end;


--Funcion para obtener una fila promocion auxiliar
create or replace function obtenerPromocionAuxiliar return deh_promociones_auxiliares%rowtype
is promocion deh_promociones_auxiliares%rowtype;
   rand_num number;
   num_max number;
begin
    select count(*) into num_max from deh_promociones_auxiliares;
    rand_num := round(dbms_random.value(1,num_max));
    select * into promocion from deh_promociones_auxiliares where prom_cod = rand_num;
    DBMS_OUTPUT.PUT_LINE('Informacion de la promocion a crear:'||CHR(10)||
                         '  Descripcion: '||promocion.prom_descrip||CHR(10)||
                         '  Porcentaje de descuento: '||promocion.prom_ptcDesc||'%');
    return promocion;
end;

--Funcion para verificar que un vehciculo no cuente con una promocion vigente
create or replace function verificarPromocion(id_veh number) return boolean
is var_cont number;
begin
    SELECT COUNT(*) INTO var_cont
    FROM deh_catalogo_promociones
    WHERE cat_fechaFin is not null AND cat_fechaFin > trunc(sysdate)
    AND cat_veh_cod = id_veh AND cat_veh_cod IN (SELECT veh_cod FROM deh_vehiculos WHERE veh_cod = id_veh) ;
    if (var_cont = 0) then
        return true;
    else
        return false;
    end if;
end;

--Procedimiento para generar una promocion
Create or replace procedure crearPromocion(ciclos number) 
is cont number; 
   vehiculo deh_vehiculos%rowtype; 
   booleano boolean;
   prom_insertar deh_promociones_auxiliares%rowtype;
   rand_num number;
   var_sec number;
begin
    cont := 1;
    DBMS_OUTPUT.PUT_LINE('  SIMULACION CREAR PROMOCION');
    while cont <= ciclos loop
        DBMS_OUTPUT.PUT_LINE('-------- '||'CICLO: '||cont||' --------');
        booleano := true;
            while (booleano = true) loop
                DBMS_OUTPUT.PUT_LINE('----* SELECCIONANDO VEHICULO *----'||CHR(10));
                vehiculo:= obtenerVehiculo;
                if verificarPromocion(vehiculo.veh_cod) then
                    DBMS_OUTPUT.PUT_LINE('----* VEHICULO SELECCIONADO *----'||CHR(10));
                    DBMS_OUTPUT.PUT_LINE('Generando promocion...'||CHR(10));
                    prom_insertar := obtenerPromocionAuxiliar;
                    rand_num := round(dbms_random.value(10,100));
                    
                    insert into deh_promociones values (SEQ_PROMOCIONES.NEXTVAL,prom_insertar.prom_descrip,prom_insertar.prom_ptcDesc);
                    insert into deh_catalogo_promociones values(vehiculo.veh_mar_cod,vehiculo.veh_mod_cod,vehiculo.veh_cod,SEQ_PROMOCIONES.CURRVAL,TRUNC(SYSDATE),TRUNC(SYSDATE + rand_num));
                   
                    DBMS_OUTPUT.PUT_LINE('  Fecha de inicio de la promocion: '||SYSDATE);
                    DBMS_OUTPUT.PUT_LINE('  Fecha de fin de la promocion: '||TRUNC(SYSDATE + rand_num));
                    DBMS_OUTPUT.PUT_LINE('-------- *FIN DEL CICLO '||cont||'* --------'||CHR(10));
                    booleano := false;
                else
                    DBMS_OUTPUT.PUT_LINE('Error: El vehículo seleccionado ya cuenta con una promoción'||CHR(10));
                end if;
            end loop;
        cont := cont + 1;
    end loop;
end;

EXECUTE crearPromocion(2);


----------------------------------------- Simulacion 1(LISTO) -----------------------------------------------------------------

create table deh_detalles_alianza(
    det_cod number(4) primary key,
    det_detalle varchar2(100)
);

 CREATE SEQUENCE seq_detalles_alianza
    start with 1
    increment by 1; 

insert into deh_detalles_alianza values (seq_detalles_alianza.nextval,'Descuentos en servicios de mantenimiento');
insert into deh_detalles_alianza values (seq_detalles_alianza.nextval,'Acceso a financiamiento especial para la compra de vehículos');
insert into deh_detalles_alianza values (seq_detalles_alianza.nextval,'Servicio de grúa gratuito en caso de emergencia');
insert into deh_detalles_alianza values (seq_detalles_alianza.nextval,'Descuentos en repuestos y accesorios originales');
insert into deh_detalles_alianza values (seq_detalles_alianza.nextval,'Asesoría legal gratuita en caso de accidente de tránsito');
insert into deh_detalles_alianza values (seq_detalles_alianza.nextval,'Descuentos en seguros de automóviles');
insert into deh_detalles_alianza values (seq_detalles_alianza.nextval,'Pruebas de manejo gratuitas para nuevos modelos');
insert into deh_detalles_alianza values (seq_detalles_alianza.nextval,'Servicio de lavado y encerado gratuito en cada mantenimiento');
insert into deh_detalles_alianza values (seq_detalles_alianza.nextval,'Descuentos en cursos de manejo defensivo y seguridad vial');



create or replace function obtenerProveedor return deh_proveedores%rowtype
is proveedores deh_proveedores%rowtype;
   rand_num number;
   num_max number;
begin
    select count(*) into num_max from deh_proveedores;
    rand_num := round(dbms_random.value(1,num_max));
    select * into proveedores from deh_proveedores where prov_cod = rand_num;
    DBMS_OUTPUT.PUT_LINE('Informacion del proveedor con el que se va a hacer la alianza :'||CHR(10)||
                          ' Nombre del proveedor: '||proveedores.prov_nombre||CHR(10)||
                          ' Telefono: '||proveedores.tal_empresa.lineaTlf||CHR(10)||
                          ' Correo electronico: '||proveedores.tal_empresa.correo_E||CHR(10));
    return proveedores;
end;

--Funcion para obtener detalle auxiliar

CREATE OR REPLACE FUNCTION obtenerDetalle RETURN VARCHAR2
IS
   detalles VARCHAR2(100);
   rand_num NUMBER;
   num_max NUMBER;
BEGIN
   SELECT COUNT(*) INTO num_max FROM deh_detalles_alianza;
   rand_num := ROUND(DBMS_RANDOM.VALUE(1,num_max));
   SELECT det_detalle INTO detalles FROM deh_detalles_alianza WHERE det_cod = rand_num;
   DBMS_OUTPUT.PUT_LINE('Detalle de la alianza: '||detalles||CHR(10));
   RETURN detalles;
END;


--Funcion para obtener taller
create or replace function obtenerTaller return deh_talleres%rowtype
is talleres deh_talleres%rowtype;
   rand_num number;
   num_max number;
begin
    select count(*) into num_max from deh_talleres;
    rand_num := round(dbms_random.value(1,num_max));
    select * into talleres from deh_talleres where tal_cod = rand_num;
    DBMS_OUTPUT.PUT_LINE('Informacion del taller con el que se va a hacer la alianza: '||CHR(10)||
                          ' Nombre del taller: '||talleres.tal_nombre||CHR(10)||
                          ' Localizacion: '||talleres.tal_locacion.calle||CHR(10)||
                          ' Codigo postal: '||talleres.tal_locacion.codigoPostal||CHR(10)||
                          ' RIF: '||talleres.tal_empresa.RIF||CHR(10));
    return talleres;
end;



--Funcion para verificar una asociacion activa con una sede y un proveedor

create or replace function verificarAsociacionProveedor(id_prov number,id_sede number) return boolean
is var_cont number;
begin
    SELECT COUNT(*) INTO var_cont
    FROM deh_suscripciones_alianzas
    WHERE ali_fechaFin > trunc(sysdate)
    AND ali_prov_cod = id_prov AND ali_sed_cod = id_sede;
    if (var_cont = 0) then
        return true;
    else
        return false;
    end if;
end;

--Funcion para verificar una asociacion activa con una sede y un taller

create or replace function verificarAsociacionTaller(id_tall number,id_sede number) return boolean
is var_cont number;
begin
    SELECT COUNT(*) INTO var_cont
    FROM deh_suscripciones_alianzas
    WHERE ali_fechaFin > trunc(sysdate)
    AND ali_tal_cod = id_tall AND ali_sed_cod = id_sede;
    if (var_cont = 0) then
        return true;
    else
        return false;
    end if;
end;

--Procedimiento para crear alianza

Create or replace procedure crearAlianza(ciclos number) 
is cont number;
   proveedor deh_proveedores%rowtype;
   taller deh_talleres%rowtype;
   sede deh_sedes%rowtype;
   booleano boolean;
   var_sec number;
   rand_num number;
   rand number;
begin
    cont := 1;
    DBMS_OUTPUT.PUT_LINE('  SIMULACION CREAR ALIANZA');
    while cont <= ciclos loop
        DBMS_OUTPUT.PUT_LINE('-------- '||'CICLO: '||cont||' --------');
        DBMS_OUTPUT.PUT_LINE('----* SELECCIONANDO SEDE *----'||CHR(10));
        sede := obtenerSede;
        booleano := true;
        rand := round(dbms_random.value(0,1));
                if rand = 0 then
                    while booleano = true loop
                        DBMS_OUTPUT.PUT_LINE('----* SELECCIONANDO TALLER *----'||CHR(10));
                        taller:= obtenerTaller;
                            if verificarAsociacionTaller(taller.tal_cod,sede.sed_cod) then
                                DBMS_OUTPUT.PUT_LINE('----* TALLER SELECCIONADO CON EXITO *----'||CHR(10));
                                rand_num := round(dbms_random.value(10,100));
                                insert into deh_suscripciones_alianzas values(sede.sed_cod,TRUNC(SYSDATE),obtenerDetalle,TRUNC(SYSDATE + rand_num),null,taller.tal_cod);
                                DBMS_OUTPUT.PUT_LINE('  Fecha de inicio de la alianza: '||TRUNC(SYSDATE));
                                DBMS_OUTPUT.PUT_LINE('  Fecha de fin de la alianza: '||TRUNC(SYSDATE + rand_num));
                                DBMS_OUTPUT.PUT_LINE('  Alianza creada con exito.');
                                DBMS_OUTPUT.PUT_LINE('-------- *FIN DEL CICLO '||cont||'* --------'||CHR(10));
                                booleano := false;
                            else
                                DBMS_OUTPUT.PUT_LINE('No ha sido posible registrar la alianza comercial indicada debido a que cuenta con una alianza vigente');
                            end if;
                    end loop;
                else
                    while booleano = true loop
                        DBMS_OUTPUT.PUT_LINE('----* SELECCIONANDO PROVEEDOR *----'||CHR(10));
                        proveedor := obtenerProveedor;
                            if verificarAsociacionProveedor(proveedor.prov_cod,sede.sed_cod) then
                                DBMS_OUTPUT.PUT_LINE('----* PROVEEDOR SELECCIONADO CON EXITO *----'||CHR(10));
                                rand_num := round(dbms_random.value(10,100));
                                insert into deh_suscripciones_alianzas values(sede.sed_cod,TRUNC(SYSDATE),obtenerDetalle,TRUNC(SYSDATE + rand_num),proveedor.prov_cod,null);
                                DBMS_OUTPUT.PUT_LINE('Fecha de inicio de la alianza: '||TRUNC(SYSDATE));
                                DBMS_OUTPUT.PUT_LINE('Fecha de fin de la alianza: '||TRUNC(SYSDATE + rand_num));
                                DBMS_OUTPUT.PUT_LINE('Alianza creada con exito.');
                                DBMS_OUTPUT.PUT_LINE('-------- *FIN DEL CICLO '||cont||'* --------'||CHR(10));
                                booleano := false;
                            else
                                DBMS_OUTPUT.PUT_LINE('ERROR: No ha sido posible registrar la alianza comercial indicada debido a que cuenta con una alianza vigente');
                            end if;
                    end loop;
                end if;
        cont := cont + 1;
    end loop;
end;


---------------------------- Simulacion 6(LISTO) --------------------------------------


CREATE TABLE deh_observaciones_auxiliares_cliente (
    obs_aux_cod number (5) NOT NULL,
    obs_aux_descrip varchar2 (300) NOT NULL
);


CREATE SEQUENCE SEQ_OBSERVACIONES_AUXILIARES_CLIENTE
    START WITH 1
    INCREMENT BY 1;
    
insert into deh_observaciones_auxiliares_cliente values(SEQ_OBSERVACIONES_AUXILIARES_CLIENTE.nextval,'Al inspeccionar el vehículo, noté algunas abolladuras y rasguños en la carrocería, lo que sugiere que el vehículo pudo haber tenido accidentes anteriores.');
insert into deh_observaciones_auxiliares_cliente values(SEQ_OBSERVACIONES_AUXILIARES_CLIENTE.nextval,'Cuando entré en el vehículo, noté un olor extraño, como si hubiera habido un derrame de líquido o si alguien hubiera fumado en el vehículo.');
insert into deh_observaciones_auxiliares_cliente values(SEQ_OBSERVACIONES_AUXILIARES_CLIENTE.nextval,' Al revisar el interior del vehículo, noté manchas en los asientos y en las alfombrillas, lo que sugiere que el vehículo no había sido limpiado adecuadamente antes de entregármelo.');
insert into deh_observaciones_auxiliares_cliente values(SEQ_OBSERVACIONES_AUXILIARES_CLIENTE.nextval,'Durante la conducción, noté algunos ruidos extraños que parecían provenir del motor, lo que sugiere que podría haber problemas mecánicos.');
insert into deh_observaciones_auxiliares_cliente values(SEQ_OBSERVACIONES_AUXILIARES_CLIENTE.nextval,' Al pisar los frenos, noté que hacían un ruido chirriante y que el pedal se sentía suelto, lo que sugiere que podría haber problemas con el sistema de frenos.');
insert into deh_observaciones_auxiliares_cliente values(SEQ_OBSERVACIONES_AUXILIARES_CLIENTE.nextval,'Cuando giré el volante, noté que la dirección se sentía suelta y que el vehículo no se movía de manera estable, lo que sugiere que podría haber problemas con el sistema de dirección.');
insert into deh_observaciones_auxiliares_cliente values(SEQ_OBSERVACIONES_AUXILIARES_CLIENTE.nextval,'Cuando encendí el aire acondicionado, noté que no enfriaba lo suficiente y que emitía un olor extraño, lo que sugiere que podría haber problemas con el sistema de aire acondicionado.');
insert into deh_observaciones_auxiliares_cliente values(SEQ_OBSERVACIONES_AUXILIARES_CLIENTE.nextval,'Al revisar los neumáticos, noté que estaban desgastados y que la presión de los mismos era baja, lo que sugiere que podría haber problemas con el sistema de neumáticos.');
insert into deh_observaciones_auxiliares_cliente values(SEQ_OBSERVACIONES_AUXILIARES_CLIENTE.nextval,'Al encender las luces del vehículo, noté que algunas de ellas no funcionaban correctamente, incluyendo una de las luces intermitentes.');
insert into deh_observaciones_auxiliares_cliente values(SEQ_OBSERVACIONES_AUXILIARES_CLIENTE.nextval,'Durante la conducción, noté que el vehículo consumía más combustible de lo esperado y que tenía problemas para arrancar después de repostar, lo que sugiere que podría haber problemas con el sistema de combustible.');

insert into deh_observaciones_auxiliares_cliente values(SEQ_OBSERVACIONES_AUXILIARES_CLIENTE.nextval,'Los neumáticos parecen estar en excelentes condiciones, con buena profundidad de la banda de rodadura y la presión adecuada.');
insert into deh_observaciones_auxiliares_cliente values(SEQ_OBSERVACIONES_AUXILIARES_CLIENTE.nextval,'El interior del vehículo ha sido limpiado y cuidado adecuadamente, sin manchas ni roturas en los asientos, alfombrillas o tablero.');
insert into deh_observaciones_auxiliares_cliente values(SEQ_OBSERVACIONES_AUXILIARES_CLIENTE.nextval,'El motor arranca sin problemas y funciona sin ruidos extraños, lo que sugiere un buen mantenimiento del vehículo.');
insert into deh_observaciones_auxiliares_cliente values(SEQ_OBSERVACIONES_AUXILIARES_CLIENTE.nextval,'Los frenos responden de manera suave y confiable, sin chirridos ni vibraciones extrañas, lo que sugiere que están en buen estado.');
insert into deh_observaciones_auxiliares_cliente values(SEQ_OBSERVACIONES_AUXILIARES_CLIENTE.nextval,'Todas las luces del vehículo funcionan correctamente, incluyendo los faros, las luces intermitentes, las luces de freno y las luces interiores.');


    
create or replace procedure realizarObservacion(id_evaluacion number) 
is 
   rand_num number;
   num_max number;
   cont number := 0; 
   rand_num2 number;
   observacion varchar2(300);
BEGIN
    select count(*) into num_max from deh_observaciones_auxiliares_cliente;
    rand_num2 := round(dbms_random.value(1,2));
    DBMS_OUTPUT.PUT_LINE('Observaciones: ');
    while (cont < rand_num2) loop
        rand_num := round(dbms_random.value(1,num_max));
        select obs_aux_descrip into observacion from deh_observaciones_auxiliares_cliente where obs_aux_cod = rand_num;
        DBMS_OUTPUT.PUT_LINE('-'||observacion||CHR(10));
        insert into deh_observaciones values (SEQ_OBSERVACIONES.nextval,observacion,id_evaluacion);
        cont := cont + 1;
    end loop;
END;

CREATE OR REPLACE FUNCTION obtener_contrato_cliente(idCliente IN NUMBER)
RETURN deh_contratos%ROWTYPE 
IS
    contrato deh_contratos%ROWTYPE;
BEGIN
    SELECT * into contrato
    FROM deh_contratos
    WHERE con_cli_cod = idCliente AND ROWNUM = 1;
    RETURN contrato;
END;



create or replace function verificarContratoCliente(idCliente number) return boolean
is 
    num_count number;
    bool boolean;
begin
    select count(*) into num_count from deh_contratos
    where con_cli_cod = idCliente;
    if num_count >= 1 then
        bool := true;
    else
        bool := false;
    end if;
    return bool;
end;


CREATE OR REPLACE FUNCTION verificar_Contrato_Vehiculos(id_sede number)
RETURN boolean
is 
  CURSOR cvehiculos IS
    SELECT v.*
    FROM deh_sedes s
    JOIN deh_colecciones_vehiculos cv ON s.sed_cod = cv.col_sed_cod
    JOIN deh_vehiculos v ON cv.col_veh_cod = v.veh_cod
    WHERE s.sed_cod = id_sede;
    
  vehiculos deh_vehiculos%ROWTYPE;
  cont NUMBER;
  booleano BOOLEAN;
BEGIN
  OPEN cvehiculos;
  FETCH cvehiculos INTO vehiculos;
  booleano := false;
  WHILE cvehiculos%FOUND LOOP
    SELECT COUNT(*) INTO cont FROM deh_contratos WHERE con_veh_cod = vehiculos.veh_cod; 
    IF cont >= 1 THEN
      booleano := true;
      EXIT;
    END IF;
    FETCH cvehiculos INTO vehiculos;
  END LOOP;
  CLOSE cvehiculos;
  RETURN booleano;
END;


CREATE OR REPLACE FUNCTION obtener_Vehiculo_Contrato(id_sede number)
RETURN deh_vehiculos%ROWTYPE
IS cursor cvehiculos is
   SELECT v.* FROM deh_sedes s
   JOIN deh_colecciones_vehiculos cv ON s.sed_cod = cv.col_sed_cod
   JOIN deh_vehiculos v ON cv.col_veh_cod = v.veh_cod
   WHERE s.sed_cod = id_sede;
   
   vehiculos deh_vehiculos%ROWTYPE;
   cont number;
BEGIN
  open cvehiculos;
  fetch cvehiculos into vehiculos;
  while cvehiculos%found loop
    select count(*) into cont from deh_contratos where con_veh_cod = vehiculos.veh_cod ; 
        IF cont >= 1 then
            EXIT;
        end if;
    fetch cvehiculos into vehiculos;
  end loop;
  close cvehiculos;
  return vehiculos;
END;


create or replace function obtenerCliente return deh_clientes%rowtype
is clientes  deh_clientes%rowtype;
   rand_num number;
   num_max number;
begin
    select count(*) into num_max from deh_clientes;
    rand_num := round(dbms_random.value(1,num_max));
    select * into clientes from deh_clientes where cli_cod = rand_num;
    DBMS_OUTPUT.PUT_LINE('Informacion del cliente: '||CHR(10)||
                          ' Nombre del cliente: '||clientes.cli_persona.primerNombre||' '||clientes.cli_persona.primerApellido||CHR(10)||
                          ' Cedula: '||clientes.cli_ced||CHR(10)||
                          ' Telefono: '||clientes.cli_tlf||CHR(10)||
                          ' Localizacion: '||clientes.cli_locacion.calle||CHR(10));
    return clientes;
end;


Create or replace procedure realizarEvaluacion(ciclos number) 
is cont number;
   cliente deh_clientes%rowtype;
   contrato deh_contratos%ROWTYPE;
   vehiculo deh_vehiculos%ROWTYPE;
   sede deh_sedes%ROWTYPE;
   booleano boolean;
   V_TEMP BLOB;
   V_BFILE BFILE;
   V_NOMBRE_FOTO VARCHAR(100);
   var_sec number;
   rand_num number;
   rand number;
begin
    cont := 1;
    while cont <= ciclos loop
        DBMS_OUTPUT.PUT_LINE('  SIMULACION REALIZAR EVALUACION A UN VEHICULO');
        DBMS_OUTPUT.PUT_LINE('-------- '||'CICLO: '||cont||' --------');
        booleano := true;
        rand := round(dbms_random.value(0,1));
                if rand = 0 then
                    while booleano = true loop
                        DBMS_OUTPUT.PUT_LINE('----* SELECCIONANDO CLIENTE *----'||CHR(10));
                        cliente := obtenerCliente;
                            if (verificarContratoCliente(cliente.cli_cod)) then
                                DBMS_OUTPUT.PUT_LINE('----* CLIENTE SELECCIONADO CON EXITO *----'||CHR(10));
                                contrato := obtener_contrato_cliente(cliente.cli_cod);
                                rand_num := round(dbms_random.value(1,5));
                                case rand_num
                                    when 1 then 
                                        V_NOMBRE_FOTO := 'CALIFICACIONES_1.PNG';
                                    when 2 then 
                                        V_NOMBRE_FOTO := 'CALIFICACIONES_2.PNG';
                                    when 3 then
                                        V_NOMBRE_FOTO := 'CALIFICACIONES_3.PNG';
                                    when 4 then
                                        V_NOMBRE_FOTO := 'CALIFICACIONES_4.PNG';
                                    when 5 then 
                                        V_NOMBRE_FOTO := 'CALIFICACIONES_5.PNG';
                                end case;
                                insert into deh_evaluaciones values (SEQ_EVALUACIONES.NEXTVAL, rand_num, EMPTY_BLOB(), contrato.con_mar_cod, contrato.con_mod_cod, contrato.con_veh_cod, cliente.cli_cod, null) RETURNING eva_icon INTO V_TEMP;
                                        V_BFILE := BFILENAME('EVALUACIONES_LOB', V_NOMBRE_FOTO);
                                        DBMS_LOB.OPEN(V_BFILE, DBMS_LOB.LOB_READONLY);
                                        DBMS_LOB.LOADFROMFILE(V_TEMP, V_BFILE, DBMS_LOB.GETLENGTH(V_BFILE));
                                        DBMS_LOB.CLOSE(V_BFILE);
                                realizarObservacion(SEQ_EVALUACIONES.currval);
                                DBMS_OUTPUT.PUT_LINE('Puntaje asignado en la evaluacion:'||rand_num||'/5 pts'||CHR(10));
                                DBMS_OUTPUT.PUT_LINE('* Evaluacion realizada con exito. *'||CHR(10));
                                DBMS_OUTPUT.PUT_LINE('-------- *FIN DEL CICLO '||cont||'* --------'||CHR(10));
                                booleano := false;
                            else
                                DBMS_OUTPUT.PUT_LINE('ERROR: El cliente seleccionado no ha realizado ningun contrato.'||CHR(10));
                            end if;
                    end loop;
                else
                    while booleano = true loop
                        DBMS_OUTPUT.PUT_LINE('----* SELECCIONANDO SEDE *----'||CHR(10));
                        sede := obtenerSede;
                            if verificar_Contrato_Vehiculos(sede.sed_cod) then
                               DBMS_OUTPUT.PUT_LINE('----* SEDE SELECCIONADA CON EXITO *----'||CHR(10));
                               vehiculo := obtener_Vehiculo_Contrato(sede.sed_cod);
                               rand_num := round(dbms_random.value(1,5));
                               case rand_num
                                    when 1 then 
                                        V_NOMBRE_FOTO := 'CALIFICACIONES_1.PNG';
                                    when 2 then 
                                        V_NOMBRE_FOTO := 'CALIFICACIONES_2.PNG';
                                    when 3 then
                                        V_NOMBRE_FOTO := 'CALIFICACIONES_3.PNG';
                                    when 4 then
                                        V_NOMBRE_FOTO := 'CALIFICACIONES_4.PNG';
                                    when 5 then 
                                        V_NOMBRE_FOTO := 'CALIFICACIONES_5.PNG';
                                end case;
                                insert into deh_evaluaciones values (SEQ_EVALUACIONES.NEXTVAL, rand_num, EMPTY_BLOB(), vehiculo.veh_mar_cod, vehiculo.veh_mod_cod, vehiculo.veh_cod,null,sede.sed_cod) RETURNING eva_icon INTO V_TEMP;
                                        V_BFILE := BFILENAME('EVALUACIONES_LOB', V_NOMBRE_FOTO);
                                        DBMS_LOB.OPEN(V_BFILE, DBMS_LOB.LOB_READONLY);
                                        DBMS_LOB.LOADFROMFILE(V_TEMP, V_BFILE, DBMS_LOB.GETLENGTH(V_BFILE));
                                        DBMS_LOB.CLOSE(V_BFILE);
                                realizarObservacion(SEQ_EVALUACIONES.currval);
                                booleano := false;
                                DBMS_OUTPUT.PUT_LINE('Puntaje asignado: '||rand_num||'/5 pts'||CHR(10));
                                DBMS_OUTPUT.PUT_LINE('* Evaluacion registrada con exito *'||CHR(10));
                                DBMS_OUTPUT.PUT_LINE('-------- *FIN DEL CICLO '||cont||'* --------'||CHR(10));
                            else
                                DBMS_OUTPUT.PUT_LINE('ERROR: La sede seleccionada no tiene vehiculos que se encuentren o estuvieran en algun contrato.'||CHR(10));
                            end if;
                    end loop;
                end if;
        cont := cont + 1;
    end loop;
end;



---------------------------Simulacion 3(Listo)------------------------------------------------------

create or replace function verificarContrato(idCliente number) return boolean
is
   cant number; 
   booleano boolean;
begin
    booleano := false;
    select count(*) into cant from deh_contratos where con_cli_cod = idCliente and con_fechaFin > TRUNC(SYSDATE);
        if cant >= 1 then 
            booleano := true; 
        end if;
    return booleano;    
end;

CREATE OR REPLACE FUNCTION obtenerContratoVigente(idCliente IN NUMBER)
RETURN deh_contratos%ROWTYPE 
IS
    contrato deh_contratos%ROWTYPE;
    modelo deh_modelos.mod_nombre%TYPE;
    marca deh_marcas.mar_nombre%TYPE;
    matricula deh_vehiculos.veh_mat%TYPE;
BEGIN
    SELECT *
    INTO contrato
    FROM deh_contratos
    WHERE con_cli_cod = idCliente AND con_fechaFin > TRUNC(SYSDATE);
    
    SELECT v.mod_nombre, e.mar_nombre, r.veh_mat 
    INTO modelo, marca, matricula 
    FROM deh_modelos v 
    JOIN deh_marcas e ON v.mod_mar_cod = e.mar_cod 
    JOIN deh_vehiculos r ON r.veh_mod_cod = v.mod_cod 
    JOIN deh_contratos c ON c.con_veh_cod = r.veh_cod
    WHERE c.con_mod_cod = v.mod_cod 
      AND c.con_mar_cod = e.mar_cod
      AND c.con_cod = contrato.con_cod;
    
    DBMS_OUTPUT.PUT_LINE('Informacion del contrato:');
    DBMS_OUTPUT.PUT_LINE('  Modelo: '||modelo);
    DBMS_OUTPUT.PUT_LINE('  Marca: '||marca);
    DBMS_OUTPUT.PUT_LINE('  Matricula: '||matricula);
    DBMS_OUTPUT.PUT_LINE('  Fecha de inicio: '||contrato.con_fechaIni);
    DBMS_OUTPUT.PUT_LINE('  Fecha de fin: '||contrato.con_fechaFin||CHR(10));
    RETURN contrato;
END;


CREATE OR REPLACE FUNCTION verificarCantidad_Pagar(contrato deh_contratos%rowtype) 
return boolean
is  cursor cpagos is
    SELECT * FROM deh_formas_pago
    where pag_con_cod = contrato.con_cod; 
    
    pagos deh_formas_pago%ROWTYPE;
    cantidadPagada number;
begin
    open cpagos;
    fetch cpagos into pagos;
    cantidadPagada := 0;
    while cpagos%found loop   
        cantidadPagada := cantidadPagada + pagos.pag_transaccion.valorNumerico;   
        fetch cpagos into pagos;
    end loop;
    close cpagos;  
    if cantidadPagada != contrato.con_transaccion.valorNumerico then
        return true;
    else
        return false;
    end if; 
end;




CREATE OR REPLACE FUNCTION generarCantidad_Pagar(contrato deh_contratos%rowtype) 
RETURN NUMBER
IS  
    CURSOR cpagos IS
        SELECT * FROM deh_formas_pago
        WHERE pag_con_cod = contrato.con_cod; 
    
    pagos deh_formas_pago%ROWTYPE;
    cantidadPagada NUMBER := 0;
    rand_num NUMBER;
    cantidad_a_pagar NUMBER := 0;
BEGIN
    OPEN cpagos;
    FETCH cpagos INTO pagos;
    WHILE cpagos%found LOOP   
        cantidadPagada := cantidadPagada + pagos.pag_transaccion.valorNumerico;   
        FETCH cpagos INTO pagos;
    END LOOP;
    CLOSE cpagos;
    
    IF cantidadPagada != contrato.con_transaccion.valorNumerico THEN
        cantidad_a_pagar := contrato.con_transaccion.valorNumerico - cantidadPagada;
    END IF;

    RETURN cantidad_a_pagar;
END;


CREATE TABLE deh_formas_pago_aux (
    pag_aux_cod NUMBER PRIMARY KEY,
    pag_aux_metPag VARCHAR2(2) NOT NULL,
    pag_aux_descrip_pago VARCHAR2(50),
    pag_aux_nombre_pago VARCHAR2(50),
    pag_aux_acronimo_pago VARCHAR2(50)
);


CREATE SEQUENCE SEQ_PAGOS_AUXILIARES_CLIENTE
    START WITH 1
    INCREMENT BY 1;

INSERT INTO deh_formas_pago_aux (
    pag_aux_cod, pag_aux_metPag, pag_aux_descrip_pago,
    pag_aux_nombre_pago, pag_aux_acronimo_pago
) VALUES (
    SEQ_PAGOS_AUXILIARES_CLIENTE.NEXTVAL, 'Cr', 'Criptomonedas (BTC)', 'bitcoin', 'BTC'
);

INSERT INTO deh_formas_pago_aux (
    pag_aux_cod, pag_aux_metPag, pag_aux_descrip_pago,
    pag_aux_nombre_pago, pag_aux_acronimo_pago
) VALUES (
    SEQ_PAGOS_AUXILIARES_CLIENTE.NEXTVAL, 'Ef', 'Efectivo', 'dolar estado_unidense', 'USD ($)'
);

INSERT INTO deh_formas_pago_aux (
    pag_aux_cod, pag_aux_metPag, pag_aux_descrip_pago,
    pag_aux_nombre_pago, pag_aux_acronimo_pago
) VALUES (
    SEQ_PAGOS_AUXILIARES_CLIENTE.NEXTVAL, 'Tr', 'Transferencia', 'dolar estado_unidense', 'USD ($)'
);

INSERT INTO deh_formas_pago_aux (
    pag_aux_cod, pag_aux_metPag, pag_aux_descrip_pago,
    pag_aux_nombre_pago, pag_aux_acronimo_pago
) VALUES (
    SEQ_PAGOS_AUXILIARES_CLIENTE.NEXTVAL, 'Pm', 'Pago movil', 'dolar estado_unidense', 'USD ($)'
);

INSERT INTO deh_formas_pago_aux (
    pag_aux_cod, pag_aux_metPag, pag_aux_descrip_pago,
    pag_aux_nombre_pago, pag_aux_acronimo_pago
) VALUES (
    SEQ_PAGOS_AUXILIARES_CLIENTE.NEXTVAL, 'Ti', 'Tarjeta internacional', 'dolar estado_unidense', 'USD ($)'
);



CREATE OR REPLACE FUNCTION obtenerPagosAuxiliares RETURN deh_formas_pago_aux%rowtype
IS
   pagosAux deh_formas_pago_aux%rowtype;
   rand_num NUMBER;
   num_max NUMBER;
BEGIN
   SELECT COUNT(*) INTO num_max FROM deh_formas_pago_aux;
   rand_num := ROUND(DBMS_RANDOM.VALUE(1,num_max));
   SELECT * INTO pagosAux FROM deh_formas_pago_aux WHERE pag_aux_cod = rand_num;
   DBMS_OUTPUT.PUT_LINE('   Detalle de la forma de pago: ');
   DBMS_OUTPUT.PUT_LINE('   Metodo de pago: '||pagosAux.pag_aux_descrip_pago);
   DBMS_OUTPUT.PUT_LINE('   Moneda utilizada: '||pagosAux.pag_aux_nombre_pago);
   DBMS_OUTPUT.PUT_LINE('   Acronimo de la moneda: '||pagosAux.pag_aux_acronimo_pago||CHR(10));

   RETURN pagosAux;
END;



Create or replace procedure realizarPagoContrato(ciclos number) 
is cont number; 
   cliente deh_clientes%rowtype; 
   booleano boolean;
   contrato deh_contratos%rowtype;
   pagosAux deh_formas_pago_aux%rowtype;
   rand_num number;
   total_pagar number;
total_pagar2 number;
begin
    cont := 1;
    while cont <= ciclos loop
        DBMS_OUTPUT.PUT_LINE('  SIMULACION PAGAR CONTRATO');
        DBMS_OUTPUT.PUT_LINE('-------- *'||'CICLO: '||cont||'* --------');
        booleano := true;
            while (booleano = true) loop
                DBMS_OUTPUT.PUT_LINE('----* SELECCIONANDO CLIENTE *----'||CHR(10));
                cliente := obtenerCliente;
                if verificarContrato(cliente.cli_cod) then
                    contrato:= obtenerContratoVigente(cliente.cli_cod);
                    DBMS_OUTPUT.PUT_LINE('----* CLIENTE SELECCIONADO SATISFACTORIAMENTE *----'||CHR(10));
                        if verificarCantidad_Pagar(contrato) then
                            total_pagar := generarCantidad_Pagar(contrato);
                            rand_num := round(dbms_random.value(1,2));
                            booleano := false;
                                if (rand_num = 1) then
                                    DBMS_OUTPUT.PUT_LINE('*Cantidad pagada: '||total_pagar||'$');
                                    pagosAux := obtenerPagosAuxiliares;
                                    INSERT INTO deh_formas_pago VALUES (contrato.con_cod, SEQ_FORMA_PAGO.NEXTVAL, TRUNC(SYSDATE),pagosAux.pag_aux_metPag, '1° de pago: '||pagosAux.pag_aux_descrip_pago, deh_TRANSACCION (deh_TRANSACCION.validarMonto(total_pagar), pagosAux.pag_aux_nombre_pago, pagosAux.pag_aux_acronimo_pago)); 
                                    DBMS_OUTPUT.PUT_LINE('Total pagado: '||total_pagar||'$'||CHR(10));
                                    DBMS_OUTPUT.PUT_LINE('CONTRATO PAGADO SATISFACTORIAMENTE');
                                    DBMS_OUTPUT.PUT_LINE('-------- *FIN DEL CICLO '||cont||'* --------'||CHR(10));
                                else
                                    total_pagar2 := total_pagar/2;
                                    DBMS_OUTPUT.PUT_LINE('*Primer pago realizado: '||total_pagar2||'$'); 
                                    pagosAux := obtenerPagosAuxiliares;
                                    INSERT INTO deh_formas_pago VALUES (contrato.con_cod, SEQ_FORMA_PAGO.NEXTVAL, TRUNC(SYSDATE),pagosAux.pag_aux_metPag, '1° de pago: '||pagosAux.pag_aux_descrip_pago, deh_TRANSACCION (deh_TRANSACCION.validarMonto(total_pagar2), pagosAux.pag_aux_nombre_pago, pagosAux.pag_aux_acronimo_pago));
                                    DBMS_OUTPUT.PUT_LINE('*Segundo pago realizado: '||total_pagar2||'$');
                                    pagosAux := obtenerPagosAuxiliares;
                                    INSERT INTO deh_formas_pago VALUES (contrato.con_cod, SEQ_FORMA_PAGO.NEXTVAL, TRUNC(SYSDATE),pagosAux.pag_aux_metPag, '2° de pago: '||pagosAux.pag_aux_descrip_pago, deh_TRANSACCION (deh_TRANSACCION.validarMonto(total_pagar2), pagosAux.pag_aux_nombre_pago, pagosAux.pag_aux_acronimo_pago));
                                    DBMS_OUTPUT.PUT_LINE('Total pagado: '||total_pagar||'$'||CHR(10));
                                    DBMS_OUTPUT.PUT_LINE('CONTRATO PAGADO SATISFACTORIAMENTE'||CHR(10));
                                    DBMS_OUTPUT.PUT_LINE('-------- *FIN DEL CICLO '||cont||'* --------'||CHR(10));
                                end if;
                        else
                            DBMS_OUTPUT.PUT_LINE('ERROR: El contrato seleccionado ya se encuentra pagado en su totalidad'||CHR(10)); 
                        end if;
                else
                    DBMS_OUTPUT.PUT_LINE('ERROR: No se tiene registro de algún contrato de alquiler vigente con este cliente'||CHR(10)); 
                end if;
            end loop;
        cont := cont + 1;
    end loop;
end;


----------------------------Simulacion 7----------------------------------------


CREATE OR REPLACE FUNCTION verificar_operatividad_sede(id_sede number)
RETURN BOOLEAN
IS 
   vehiculos deh_vehiculos%ROWTYPE;
   cont number;
   cont_no_operativos number; 
   mitad_vehiculos number;
BEGIN
  SELECT COUNT(*) INTO cont_no_operativos FROM deh_sedes s 
    JOIN deh_colecciones_vehiculos cv ON s.sed_cod = cv.col_sed_cod 
    JOIN deh_vehiculos v ON cv.col_veh_cod = v.veh_cod 
    JOIN deh_bitacoras e ON e.bit_veh_cod = v.veh_cod 
    WHERE s.sed_cod = id_sede AND e.bit_estatus = 'FALSE';
  
  SELECT COUNT(*) into cont FROM deh_sedes s 
    JOIN deh_colecciones_vehiculos cv ON s.sed_cod = cv.col_sed_cod 
    JOIN deh_vehiculos v ON cv.col_veh_cod = v.veh_cod 
    JOIN deh_bitacoras e ON e.bit_veh_cod = v.veh_cod 
    WHERE s.sed_cod = id_sede;
    
    mitad_vehiculos := cont/2;
    
    if cont_no_operativos >= mitad_vehiculos then
        return true;
    else
        return false;
    end if;
END;


CREATE OR REPLACE FUNCTION generarMatricula RETURN VARCHAR2 IS
  letras VARCHAR2(26) := 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
  numeros VARCHAR2(3);
  matricula VARCHAR2(7);
BEGIN
  matricula := SUBSTR(letras, DBMS_RANDOM.VALUE(1, 26), 1) ||
               SUBSTR(letras, DBMS_RANDOM.VALUE(1, 26), 1) ||
               SUBSTR(letras, DBMS_RANDOM.VALUE(1, 26), 1);
  numeros := LPAD(TO_CHAR(DBMS_RANDOM.VALUE(0, 1000)), 3, '0');
  matricula := matricula || '-' || numeros;
  DBMS_OUTPUT.PUT_LINE(' Matrícula del vehiculo: ' || matricula||CHR(10));
  RETURN matricula;
END;


create or replace function obtenerVehiculoRestock return deh_vehiculos%rowtype
is  vehiculo deh_vehiculos%ROWTYPE;
    modelo  deh_modelos.mod_nombre%type;
    marca   deh_marcas.mar_nombre%type;
    rand_num number;
    num_max number;
begin
     select count(*) into num_max from deh_vehiculos;
     rand_num := round(dbms_random.value(1,num_max));
     select *  into vehiculo from deh_vehiculos where veh_cod = rand_num; 
     select v.mod_nombre,e.mar_nombre into modelo,marca from deh_modelos v ,deh_marcas e where v.mod_cod = vehiculo.veh_mod_cod and e.mar_cod = vehiculo.veh_mar_cod;
     DBMS_OUTPUT.PUT_LINE('Informacion del vehiculo seleccionado para el restock de la sede:'||CHR(10)||
                          ' Marca: '||marca||CHR(10)||
                          ' Modelo: '||modelo||CHR(10)||
                          ' Tipo de vehiculo: '||vehiculo.veh_tipo);
     return vehiculo;
end;


Create or replace procedure realizarRestockVehiculos(ciclos number) 
is cont number; 
   sede deh_sedes%rowtype; 
   vehiculo deh_vehiculos%ROWTYPE;
   booleano boolean;
   contrato deh_contratos%rowtype;
   rand_num number;
   rand_num2 number;
   cont2 number;
begin
    cont := 1;
    
    DBMS_OUTPUT.PUT_LINE('  SIMULACION HACER RESTOCK DE VEHICULOS DE UNA SEDE');
    while cont <= ciclos loop
        DBMS_OUTPUT.PUT_LINE('-------- *'||'CICLO: '||cont||'* --------');
        booleano := true;
            while (booleano = true) loop
                DBMS_OUTPUT.PUT_LINE('----* SELECCIONANDO SEDE *----'||CHR(10));
                sede := obtenerSede;
                if verificar_operatividad_sede(sede.sed_cod) then
                    DBMS_OUTPUT.PUT_LINE('----* SEDE SELECCIONADA SATISFACTORIAMENTE *----'||CHR(10));
                    cont2 := 1;
                    rand_num := round(dbms_random.value(2,4));   
                        WHILE cont2 <= rand_num loop
                            DBMS_OUTPUT.PUT_LINE('----* VEHICULO INGRESADO NUMERO '||cont2||' *----'||CHR(10));
                            rand_num2 := round(dbms_random.value(70,200));
                            vehiculo:= obtenerVehiculoRestock;
                            INSERT INTO deh_vehiculos VALUES(vehiculo.veh_mar_cod,vehiculo.veh_mod_cod,SEQ_VEHICULOS.NEXTVAL,vehiculo.veh_tipo,generarMatricula,'N',vehiculo.veh_foto,NULL,deh_transaccion(deh_transaccion.validarMonto(rand_num2),'Dolares','$'));
                            INSERT INTO deh_colecciones_vehiculos VALUES (vehiculo.veh_mar_cod, vehiculo.veh_mod_cod, SEQ_VEHICULOS.CURRVAL, sede.sed_cod, SEQ_COLECCION.nextval, TRUNC(SYSDATE), NULL);
                            DBMS_OUTPUT.PUT_LINE('----* SOLICITUD DE VEHICULO PARA RESTOCK REALIZADA EXITOSAMENTE *----'||CHR(10));
                            cont2 := cont2 + 1;
                        end loop;
                    DBMS_OUTPUT.PUT_LINE('-------- *FIN DEL CICLO '||cont||'* --------'||CHR(10));
                    booleano := false;
                else
                    DBMS_OUTPUT.PUT_LINE('ERROR: La sede cuenta con una cantidad  aceptable de vehiculos operativos.'||CHR(10)); 
                end if;
            end loop;
        cont := cont + 1;
    end loop;
end;

----------------------------------SIMULACION 5----------------------------------
CREATE TABLE COORDENADAS_AUXILIARES(
    COO_AUX_COD NUMBER PRIMARY KEY,
    COO_AUX_LATITUD NUMBER(20,14),
    COO_AUX_LONGITUD NUMBER(20,14),
    COO_AUX_LOCALIZACION VARCHAR2(60)
);

CREATE SEQUENCE SEQ_COORDENADA_AUXILIARES
    START WITH 1
    INCREMENT BY 1;


INSERT INTO COORDENADAS_AUXILIARES
VALUES (SEQ_COORDENADA_AUXILIARES.nextval, 10.5050, -66.9148, 'Plaza Bolívar de Caracas');

-- Insert para las coordenadas de Parque del Este Generalísimo Francisco de Miranda
INSERT INTO COORDENADAS_AUXILIARES
VALUES (SEQ_COORDENADA_AUXILIARES.nextval, 10.4899, -66.8273, 'Parque del Este Generalísimo Francisco de Miranda');

-- Insert para las coordenadas de Teleférico de Caracas
INSERT INTO COORDENADAS_AUXILIARES
VALUES (SEQ_COORDENADA_AUXILIARES.nextval, 10.5008, -66.8598, 'Teleférico de Caracas');

-- Insert para las coordenadas de Centro Comercial Sambil Caracas
INSERT INTO COORDENADAS_AUXILIARES
VALUES (SEQ_COORDENADA_AUXILIARES.nextval, 10.4923, -66.8482, 'Centro Comercial Sambil Caracas');

-- Insert para las coordenadas de Universidad Central de Venezuela
INSERT INTO COORDENADAS_AUXILIARES
VALUES (SEQ_COORDENADA_AUXILIARES.nextval, 10.4903, -66.8914, 'Universidad Central de Venezuela');

-- Insert para las coordenadas de Estadio Universitario de Caracas
INSERT INTO COORDENADAS_AUXILIARES
VALUES (SEQ_COORDENADA_AUXILIARES.nextval, 10.4872, -66.8971, 'Estadio Universitario de Caracas');

-- Insert para las coordenadas de Parque Los Caobos
INSERT INTO COORDENADAS_AUXILIARES
VALUES (SEQ_COORDENADA_AUXILIARES.nextval, 10.4974, -66.8585, 'Parque Los Caobos');

-- Insert para las coordenadas de Jardín Botánico de Caracas
INSERT INTO COORDENADAS_AUXILIARES
VALUES (SEQ_COORDENADA_AUXILIARES.nextval, 10.4883, -66.8907, 'Jardín Botánico de Caracas');

-- Insert para las coordenadas de Museo de Bellas Artes de Caracas
INSERT INTO COORDENADAS_AUXILIARES
VALUES (SEQ_COORDENADA_AUXILIARES.nextval, 10.5011, -66.8776, 'Museo de Bellas Artes de Caracas');

-- Insert para las coordenadas de Centro de Arte La Estancia
INSERT INTO COORDENADAS_AUXILIARES
VALUES (SEQ_COORDENADA_AUXILIARES.nextval, 10.4987, -66.8534, 'Centro de Arte La Estancia');




--Funcion para obtener los datos de un empleado de una sede
create or replace procedure obtenerEmpleadoSede(idSede number) 
is empleado deh_empleados%rowtype;
   rand_num number;
   num_max number;
begin
    select * into empleado from deh_empleados where emp_sed_cod = idSede and rownum = 1;
    DBMS_OUTPUT.PUT_LINE('Informacion del empleado que va a hacer el delivery'||CHR(10)||
                          ' Primer nombre: '||empleado.emp_persona.primerNombre||CHR(10)||
                          ' Apellido: '||empleado.emp_persona.primerApellido||CHR(10)||
                          ' Genero: '||empleado.emp_persona.genero||CHR(10)||
                          ' Fecha de nacimiento: '||empleado.emp_persona.fechaNac||CHR(10));
end;



create or replace function obtenerCoordenadasAuxiliares return COORDENADAS_AUXILIARES%rowtype 
is coordenadas COORDENADAS_AUXILIARES%rowtype;
   rand_num number;
   num_max number;
begin
    select count(*) into num_max from COORDENADAS_AUXILIARES;
    rand_num := round(dbms_random.value(1,num_max)); 
    select * into coordenadas from COORDENADAS_AUXILIARES where COO_AUX_COD = rand_num;
    
    DBMS_OUTPUT.PUT_LINE('Informacion de la localizacion al cual se va a enviar el vehiculo'||CHR(10)||
                          ' Localizacion: '||coordenadas.COO_AUX_LOCALIZACION||CHR(10));
    return coordenadas;
end;



Create or replace procedure realizarEnvioVehiculo(ciclos number) 
is cont number; 
   cliente deh_clientes%rowtype; 
   empleado deh_empleados%rowtype;
   direccion COORDENADAS_AUXILIARES%rowtype;
   contrato deh_contratos%rowtype;
   sede deh_sedes%rowtype;
   booleano boolean;
   booleano2 boolean;
   rand_num number(2);
   rand_num2 number(2);
   sedeID number(3);
begin
    cont := 1;
    DBMS_OUTPUT.PUT_LINE('  SIMULACION DELIVERY VEHICULO');
    while cont <= ciclos loop
        DBMS_OUTPUT.PUT_LINE('-------- *'||'CICLO: '||cont||'* --------');
        booleano := true;
            while (booleano = true) loop
                DBMS_OUTPUT.PUT_LINE('----* SELECCIONANDO CLIENTE *----'||CHR(10));
                cliente := obtenerCliente;
                if verificarClienteConReserva(cliente.cli_cod) then
                    DBMS_OUTPUT.PUT_LINE('----* USUARIO RECONOCIDO EN EL SISTEMA *----'||CHR(10));
                     booleano2 := true;
                    while booleano2 = true loop
                       rand_num := round(dbms_random.value(1,4));  
                       if rand_num > 1 then
                           DBMS_OUTPUT.PUT_LINE('----* RESERVA IDENTIFICADA *----'||CHR(10));   
                           rand_num2 := round(dbms_random.value(1,2));
                           contrato := obtenerContratoVigente(cliente.cli_cod);
                           case rand_num2
                                    when 1 then 
                                        DBMS_OUTPUT.PUT_LINE('----* ENVIAR EL VEHICULO A LA LOCALIZACION DEL CLIENTE *----'||CHR(10));
                                        sede := obtenerSede;
                                        obtenerEmpleadoSede(sede.sed_cod);
                                        DBMS_OUTPUT.PUT_LINE(' Direccion del cliente: '||cliente.cli_locacion.calle);
                                        DBMS_OUTPUT.PUT_LINE(' Estatus del delivery: ENVIADO'||CHR(10));
                                        DBMS_OUTPUT.PUT_LINE('-------- *FIN DEL CICLO '||cont||'* --------'||CHR(10));
                                    when 2 then 
                                        DBMS_OUTPUT.PUT_LINE('----* ENVIAR EL VEHICULO A UNA LOCALIZACION ESPECIFICA *----'||CHR(10));
                                        sedeID := obtener_Vehiculo_Sede_Reserva(contrato.con_veh_cod);
                                        obtenerEmpleadoSede(sedeID);
                                        direccion := obtenerCoordenadasAuxiliares;
                                        DBMS_OUTPUT.PUT_LINE('-------- *FIN DEL CICLO '||cont||'* --------'||CHR(10));
                            end case;
                           booleano2 := false;
                     
                       else
                       DBMS_OUTPUT.PUT_LINE('ERROR: El vehículo que ha indicado no se encuentra disponible o no es el que ha presentado en su solicitud de reserva'||CHR(10));  
                       end if;                   
                    end loop;
                    booleano := false;
                else
                  DBMS_OUTPUT.PUT_LINE('ERROR: Reserva no identificada'||CHR(10));   
                end if;
            end loop;
        cont := cont + 1;
    end loop;
end;


CREATE OR REPLACE FUNCTION verificarClienteConReserva(id_cli NUMBER) RETURN BOOLEAN 
IS
    -- Declaración de variables
    contador NUMBER;
BEGIN
    SELECT COUNT(*) into contador
    FROM deh_contratos c
    JOIN deh_reservas r ON c.con_res_cod = r.res_cod
    WHERE c.con_fechaIni IS NOT NULL
        AND c.con_fechaFin > trunc(sysdate)
        AND c.con_cli_cod = id_cli;

    IF contador = 1 THEN
       return TRUE;
    ELSE
       return FALSE;
    END IF;

END;


CREATE OR REPLACE FUNCTION obtener_Vehiculo_Sede_Reserva(idVehiculo NUMBER) RETURN NUMBER
IS
    sede deh_sedes%rowtype;
    num_sede NUMBER;
BEGIN
    SELECT s.* into sede 
    from deh_sedes s
    join deh_colecciones_vehiculos cv on s.sed_cod = cv.col_sed_cod
    join deh_vehiculos v on v.veh_cod = cv.col_veh_cod
    where v.veh_cod = idVehiculo;
    
    DBMS_OUTPUT.PUT_LINE('Informacion de la sede: '||CHR(10)||
                          ' Localizacion: '||sede.sed_locacion.calle||CHR(10)||
                          ' Codigo postal:'||sede.sed_locacion.codigoPostal||CHR(10)||
                          ' Telefono: '||sede.sed_empresa.lineaTlf||CHR(10));
    return sede.sed_cod;

END;