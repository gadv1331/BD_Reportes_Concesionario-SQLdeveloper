----------------------------------------------Reporte 1----------------------------------------------------------

create or replace NONEDITIONABLE PROCEDURE reporte_1(cursor1 out sys_refcursor, fechaInicio DATE, fechaFin DATE,
                                                     tipo varchar2, marca varchar2, modelo varchar2, anio number) is

begin
    open cursor1 for
        SELECT veh_tipo, mar_nombre, mod_nombre, mod_anio, cantidad, veh_foto
        FROM (SELECT v.veh_tipo,
                     d.mar_nombre,
                     e.mod_nombre,
                     e.mod_anio,
                     subq.cantidad,
                     v.veh_foto,
                     ROW_NUMBER() OVER (PARTITION BY e.mod_nombre ORDER BY subq.cantidad DESC) AS rn
              FROM deh_vehiculos v,
                   deh_modelos e,
                   deh_marcas d,
                   deh_contratos c,
                   (SELECT con_mod_cod, COUNT(*) AS cantidad
                    FROM deh_contratos
                    where (con_fechaIni >= fechaInicio AND con_fechaIni <= fechaFin)
                       OR (fechaInicio is NULL AND fechaFin is NULL)
                    GROUP BY con_mod_cod
                    ORDER BY COUNT(*) DESC) subq

              WHERE (v.veh_mod_cod = e.mod_cod AND e.mod_mar_cod = d.mar_cod AND v.veh_cod = c.con_veh_cod AND
                     c.con_mod_cod = subq.con_mod_cod AND (c.con_fechaIni BETWEEN fechaInicio AND fechaFin))
                 OR (v.veh_mod_cod = e.mod_cod AND e.mod_mar_cod = d.mar_cod AND v.veh_cod = c.con_veh_cod AND
                     c.con_mod_cod = subq.con_mod_cod AND (c.con_fechaFin BETWEEN fechaInicio AND fechaFin))
                 OR (v.veh_mod_cod = e.mod_cod AND e.mod_mar_cod = d.mar_cod AND v.veh_cod = c.con_veh_cod AND
                     c.con_mod_cod = subq.con_mod_cod AND
                     (c.con_fechaIni <= fechaInicio AND c.con_fechaFin >= fechaFin))

                 OR (v.veh_mod_cod = e.mod_cod AND e.mod_mar_cod = d.mar_cod AND v.veh_cod = c.con_veh_cod AND
                     c.con_mod_cod = subq.con_mod_cod AND v.veh_tipo = tipo)
                 OR (v.veh_mod_cod = e.mod_cod AND e.mod_mar_cod = d.mar_cod AND v.veh_cod = c.con_veh_cod AND
                     c.con_mod_cod = subq.con_mod_cod AND e.mod_nombre = modelo)
                 OR (v.veh_mod_cod = e.mod_cod AND e.mod_mar_cod = d.mar_cod AND v.veh_cod = c.con_veh_cod AND
                     c.con_mod_cod = subq.con_mod_cod AND d.mar_nombre = marca)
                 OR (v.veh_mod_cod = e.mod_cod AND e.mod_mar_cod = d.mar_cod AND v.veh_cod = c.con_veh_cod AND
                     c.con_mod_cod = subq.con_mod_cod AND e.mod_anio = anio)
                 OR (v.veh_mod_cod = e.mod_cod AND e.mod_mar_cod = d.mar_cod AND v.veh_cod = c.con_veh_cod AND
                     c.con_mod_cod = subq.con_mod_cod AND tipo IS NULL AND marca IS NULL AND modelo IS NULL AND
                     anio IS NULL AND fechaInicio is NULL AND fechaFin is NULL))

        WHERE rn = 1
        ORDER BY veh_tipo DESC;

End;


----------------------------------------------Reporte 2----------------------------------------------------------

create or replace NONEDITIONABLE PROCEDURE reporte_2(cursor2 out sys_refcursor, fechaInicio date, fechaFin date,
                                                     tipo varchar) is

begin
    open cursor2 for
        SELECT subq.cli_ced,
               subq.nombre,
               subq.apellido,
               subq.correo,
               subq.fecha,
               subq.genero,
               subq.tipo,
               subq.foto,
               subq.latitud,
               subq.longitud,
               subq.fecha_ingreso
        FROM (SELECT c.cli_ced,
                     c.cli_persona.primerNombre                                    as nombre,
                     c.cli_persona.primerApellido                                  as apellido,
                     c.cli_correo                                                  as correo,
                     c.cli_persona.fechaNac                                        as fecha,
                     c.cli_persona.genero                                          as genero,
                     c.cli_tipo                                                    as tipo,
                     c.cli_foto                                                    as foto,
                     c.cli_locacion.latitud                                        as latitud,
                     c.cli_locacion.longitud                                       as longitud,
                     con.con_fechaIni                                              as fecha_ingreso,
                     ROW_NUMBER() OVER (PARTITION BY c.cli_ced ORDER BY c.cli_ced) AS rn
              FROM deh_clientes c,
                   deh_contratos con

              WHERE (c.cli_cod = con.con_cli_cod and (con.con_fechaIni BETWEEN fechaInicio AND fechaFin))

                 OR (c.cli_cod = con.con_cli_cod and c.cli_tipo = tipo)
                 OR (c.cli_cod = con.con_cli_cod and tipo is null and fechaInicio is null and fechaFin is null)) subq
        WHERE rn = 1;
END;

----------------------------------------------Reporte 3----------------------------------------------------------

create or replace NONEDITIONABLE PROCEDURE reporte_3(cursor3 out sys_refcursor, mes varchar2, anio number,
                                                     tipo varchar2, marca varchar2, modelo varchar2) is

begin
    open cursor3 for
        SELECT veh_tipo, mar_nombre, mod_nombre, mod_anio, cantidad, veh_foto
        FROM (SELECT v.veh_tipo,
                     d.mar_nombre,
                     e.mod_nombre,
                     e.mod_anio,
                     subq.cantidad,
                     v.veh_foto,
                     ROW_NUMBER() OVER (PARTITION BY e.mod_nombre ORDER BY subq.cantidad DESC) AS rn
              FROM deh_vehiculos v,
                   deh_modelos e,
                   deh_marcas d,
                   deh_contratos c,
                   (SELECT con_mod_cod, COUNT(*) AS cantidad
                    FROM deh_contratos
                    where (TO_CHAR(con_fechaIni, 'FMMONTH', 'NLS_DATE_LANGUAGE=SPANISH') = mes and anio is null and
                           tipo IS NULL AND marca IS NULL AND modelo IS NULL)
                       OR (TO_CHAR(con_fechaIni, 'FMMONTH', 'NLS_DATE_LANGUAGE=SPANISH') = mes and
                           EXTRACT(YEAR FROM con_fechaIni) = anio and tipo IS NULL AND marca IS NULL AND modelo IS NULL)
                       OR (EXTRACT(YEAR FROM con_fechaIni) = anio and mes is null and tipo IS NULL AND marca IS NULL AND
                           modelo IS NULL)
                       OR (mes is NULL AND anio is NULL)
                    GROUP BY con_mod_cod
                    ORDER BY COUNT(*) DESC) subq

              WHERE (v.veh_mod_cod = e.mod_cod AND e.mod_mar_cod = d.mar_cod AND v.veh_cod = c.con_veh_cod AND
                     c.con_mod_cod = subq.con_mod_cod AND
                     (TO_CHAR(con_fechaIni, 'FMMONTH', 'NLS_DATE_LANGUAGE=SPANISH') = mes) AND anio IS NULL AND
                     tipo IS NULL AND marca IS NULL AND modelo IS NULL)
                 OR (v.veh_mod_cod = e.mod_cod AND e.mod_mar_cod = d.mar_cod AND v.veh_cod = c.con_veh_cod AND
                     c.con_mod_cod = subq.con_mod_cod AND
                     (TO_CHAR(con_fechaIni, 'FMMONTH', 'NLS_DATE_LANGUAGE=SPANISH') = mes) AND
                     EXTRACT(YEAR FROM con_fechaIni) = anio AND tipo IS NULL AND marca IS NULL AND modelo IS NULL)
                 OR (v.veh_mod_cod = e.mod_cod AND e.mod_mar_cod = d.mar_cod AND v.veh_cod = c.con_veh_cod AND
                     c.con_mod_cod = subq.con_mod_cod AND EXTRACT(YEAR FROM con_fechaIni) = anio AND mes IS NULL AND
                     tipo IS NULL AND marca IS NULL AND modelo IS NULL)
                 OR (v.veh_mod_cod = e.mod_cod AND e.mod_mar_cod = d.mar_cod AND v.veh_cod = c.con_veh_cod AND
                     c.con_mod_cod = subq.con_mod_cod AND v.veh_tipo = tipo)
                 OR (v.veh_mod_cod = e.mod_cod AND e.mod_mar_cod = d.mar_cod AND v.veh_cod = c.con_veh_cod AND
                     c.con_mod_cod = subq.con_mod_cod AND e.mod_nombre = modelo)
                 OR (v.veh_mod_cod = e.mod_cod AND e.mod_mar_cod = d.mar_cod AND v.veh_cod = c.con_veh_cod AND
                     c.con_mod_cod = subq.con_mod_cod AND d.mar_nombre = marca)
                 OR (v.veh_mod_cod = e.mod_cod AND e.mod_mar_cod = d.mar_cod AND v.veh_cod = c.con_veh_cod AND
                     c.con_mod_cod = subq.con_mod_cod AND tipo IS NULL AND marca IS NULL AND modelo IS NULL AND
                     mes is NULL AND anio is NULL))

        WHERE rn = 1
        ORDER BY veh_tipo DESC;

End;

----------------------------------------------Reporte 4----------------------------------------------------------

create or replace NONEDITIONABLE PROCEDURE reporte_4(cursor4 OUT sys_refcursor, fechaInicio DATE, fechaFin DATE) IS

BEGIN

    -- Apertura del cursor
    OPEN cursor4 FOR
        SELECT descripcion,
               Precio_sinDescuento,
               Precio_conDescuento,
               porcentaje,
               marca,
               modelo,
               anio,
               foto
        FROM
            -- Query
            (SELECT p.prom_descrip                                                      as descripcion,
                    TO_CHAR(calcularPrecioPorDia(d.con_transaccion.VALORNUMERICO, d.con_fechaIni, d.con_fechaFin),
                            '99999.99') || ' ' || d.con_transaccion.ABREVSIMBOLO        as Precio_sinDescuento,
                    TO_CHAR(calcularDescuento(calcularPrecioPorDia(d.con_transaccion.VALORNUMERICO, d.con_fechaIni,
                                                                   d.con_fechaFin), p.prom_ptcDesc), '99999.99') ||
                    ' ' || d.con_transaccion.ABREVSIMBOLO                               as Precio_conDescuento,
                    p.prom_ptcDesc                                                      as porcentaje,
                    mar.mar_nombre                                                      AS marca,
                    e.mod_nombre                                                        AS modelo,
                    e.mod_anio                                                          AS anio,
                    v.veh_foto                                                          AS foto,
                    ROW_NUMBER() OVER (PARTITION BY e.mod_nombre ORDER BY e.mod_nombre) AS rn


             FROM -- Tablas manipuladas / empleadas

                  deh_catalogo_promociones c,
                  deh_promociones p,
                  deh_vehiculos v,
                  deh_modelos e,
                  deh_marcas mar,
                  deh_contratos d -- Contratos de Alquiler

             WHERE (c.cat_fechaIni BETWEEN fechaInicio AND fechaFin AND mar.mar_cod = c.cat_mar_cod AND
                    c.cat_mar_cod = v.veh_mar_cod AND v.veh_mar_cod = d.con_mar_cod AND e.mod_cod = c.cat_mod_cod AND
                    c.cat_mod_cod = v.veh_mod_cod AND v.veh_mod_cod = d.con_mod_cod AND c.cat_veh_cod = v.veh_cod AND
                    v.veh_cod = d.con_veh_cod AND c.cat_prom_cod = p.prom_cod)
                OR (c.cat_fechaFin BETWEEN fechaInicio AND fechaFin AND mar.mar_cod = c.cat_mar_cod AND
                    c.cat_mar_cod = v.veh_mar_cod AND v.veh_mar_cod = d.con_mar_cod AND e.mod_cod = c.cat_mod_cod AND
                    c.cat_mod_cod = v.veh_mod_cod AND v.veh_mod_cod = d.con_mod_cod AND c.cat_veh_cod = v.veh_cod AND
                    v.veh_cod = d.con_veh_cod AND c.cat_prom_cod = p.prom_cod)
                OR (c.cat_fechaIni <= fechaInicio AND c.cat_fechaFin >= fechaFin AND mar.mar_cod = c.cat_mar_cod AND
                    c.cat_mar_cod = v.veh_mar_cod AND v.veh_mar_cod = d.con_mar_cod AND e.mod_cod = c.cat_mod_cod AND
                    c.cat_mod_cod = v.veh_mod_cod AND v.veh_mod_cod = d.con_mod_cod AND c.cat_veh_cod = v.veh_cod AND
                    v.veh_cod = d.con_veh_cod AND c.cat_prom_cod = p.prom_cod)
                OR (fechaInicio IS NULL AND fechaFin IS NULL AND mar.mar_cod = c.cat_mar_cod AND
                    c.cat_mar_cod = v.veh_mar_cod AND v.veh_mar_cod = d.con_mar_cod AND e.mod_cod = c.cat_mod_cod AND
                    c.cat_mod_cod = v.veh_mod_cod AND v.veh_mod_cod = d.con_mod_cod AND c.cat_veh_cod = v.veh_cod AND
                    v.veh_cod = d.con_veh_cod AND c.cat_prom_cod = p.prom_cod))

        WHERE rn = 1;

END;

----------------------------------------------Reporte 5----------------------------------------------------------

create or replace NONEDITIONABLE PROCEDURE reporte_5(cursor5 OUT sys_refcursor, fechaInicio DATE, fechaFin DATE,
                                                     tipo varchar2, marca varchar2, modelo varchar2, placa varchar2) IS

BEGIN
    -- Apertura del cursor
    OPEN cursor5 FOR

--Query
        SELECT fecha_mantenimiento,
               tipo,
               placa,
               marca,
               modelo,
               año,
               foto,
               mantenimiento_realizado,
               estatus,
               registro_bitacora,
               taller,
               latitud,
               longitud,
               fecha_próxima_mantenimiento
        from (SELECT b.bit_fechaMan                                                      as fecha_mantenimiento,
                     getValorHash(man.man_tipo)                                          as tipo,
                     v.veh_mat                                                           as Placa,
                     mar.mar_nombre                                                      as marca,
                     e.mod_nombre                                                        as modelo,
                     e.mod_anio                                                          as año,
                     v.veh_foto                                                          as foto,
                     man.man_nombre                                                      as mantenimiento_realizado,
                     getValorHash(b.bit_estatus)                                         as estatus,
                     b.bit_descrip                                                       as registro_bitacora,
                     t.tal_nombre                                                        as taller,
                     t.tal_locacion.LATITUD                                              AS latitud,
                     t.tal_locacion.LONGITUD                                                longitud,
                     b.bit_fechaProx                                                     as fecha_próxima_mantenimiento,
                     ROW_NUMBER() OVER (PARTITION BY e.mod_nombre ORDER BY e.mod_nombre) AS rn

              FROM deh_marcas mar,
                   deh_modelos e,
                   deh_vehiculos v,
                   deh_talleres t,
                   deh_mantenimiento man,
                   deh_bitacoras b

              WHERE (mar.mar_cod = v.veh_mar_cod AND v.veh_mar_cod = b.bit_mar_cod AND e.mod_cod = v.veh_mod_cod AND
                     v.veh_mod_cod = b.bit_mod_cod AND v.veh_cod = b.bit_veh_cod AND man.man_cod = b.bit_man_cod AND
                     t.tal_cod = b.bit_tal_cod AND (b.bit_fechaMan BETWEEN fechaInicio AND fechaFin))
                 OR                                                                                              -- 1
                  (mar.mar_cod = v.veh_mar_cod AND v.veh_mar_cod = b.bit_mar_cod AND e.mod_cod = v.veh_mod_cod AND
                   v.veh_mod_cod = b.bit_mod_cod AND v.veh_cod = b.bit_veh_cod AND man.man_cod = b.bit_man_cod AND
                   t.tal_cod = b.bit_tal_cod AND (b.bit_fechaFin BETWEEN fechaInicio AND fechaFin))
                 OR                                                                                              -- 2
                  (mar.mar_cod = v.veh_mar_cod AND v.veh_mar_cod = b.bit_mar_cod AND e.mod_cod = v.veh_mod_cod AND
                   v.veh_mod_cod = b.bit_mod_cod AND v.veh_cod = b.bit_veh_cod AND man.man_cod = b.bit_man_cod AND
                   t.tal_cod = b.bit_tal_cod AND (b.bit_fechaMan <= fechaInicio AND b.bit_fechaFin >= fechaFin)) -- 3
                 OR (mar.mar_cod = v.veh_mar_cod AND v.veh_mar_cod = b.bit_mar_cod AND e.mod_cod = v.veh_mod_cod AND
                     v.veh_mod_cod = b.bit_mod_cod AND v.veh_cod = b.bit_veh_cod AND man.man_cod = b.bit_man_cod AND
                     t.tal_cod = b.bit_tal_cod AND man.man_tipo = tipo)
                 OR (mar.mar_cod = v.veh_mar_cod AND v.veh_mar_cod = b.bit_mar_cod AND e.mod_cod = v.veh_mod_cod AND
                     v.veh_mod_cod = b.bit_mod_cod AND v.veh_cod = b.bit_veh_cod AND man.man_cod = b.bit_man_cod AND
                     t.tal_cod = b.bit_tal_cod AND mar.mar_nombre = marca)
                 OR (mar.mar_cod = v.veh_mar_cod AND v.veh_mar_cod = b.bit_mar_cod AND e.mod_cod = v.veh_mod_cod AND
                     v.veh_mod_cod = b.bit_mod_cod AND v.veh_cod = b.bit_veh_cod AND man.man_cod = b.bit_man_cod AND
                     t.tal_cod = b.bit_tal_cod AND e.mod_nombre = modelo)
                 OR (mar.mar_cod = v.veh_mar_cod AND v.veh_mar_cod = b.bit_mar_cod AND e.mod_cod = v.veh_mod_cod AND
                     v.veh_mod_cod = b.bit_mod_cod AND v.veh_cod = b.bit_veh_cod AND man.man_cod = b.bit_man_cod AND
                     t.tal_cod = b.bit_tal_cod AND v.veh_mat = placa)
                 OR (mar.mar_cod = v.veh_mar_cod AND v.veh_mar_cod = b.bit_mar_cod AND e.mod_cod = v.veh_mod_cod AND
                     v.veh_mod_cod = b.bit_mod_cod AND v.veh_cod = b.bit_veh_cod AND man.man_cod = b.bit_man_cod AND
                     t.tal_cod = b.bit_tal_cod AND tipo is null and marca is null and modelo is null and
                     placa is null and fechaInicio is null and fechaFin is null))
        WHERE RN = 1;

END;


----------------------------------------------Reporte 6--------------------------------------------------------------

---------------procedure 1 - proveedor-----------------

create or replace NONEDITIONABLE PROCEDURE reporte_6p1(cursor6p1 OUT sys_refcursor, fechaInicio DATE, fechaFin DATE) IS

BEGIN

    -- Apertura del cursor
    OPEN cursor6p1 FOR
        SELECT "Fecha de Inicio de la alianza",
               "Descripción de la Alianza",
               "Nombre del Proveedor",
               "Logo del Proveedor"

        FROM (SELECT sus.ali_fechaIni                                                            AS "Fecha de Inicio de la alianza",
                     sus.ali_detSev                                                              AS "Descripción de la Alianza",
                     prov.prov_nombre                                                            AS "Nombre del Proveedor",
                     prov.prov_logo                                                              AS "Logo del Proveedor",
                     ROW_NUMBER() OVER (PARTITION BY prov.prov_nombre ORDER BY prov.prov_nombre) AS row_num
              FROM deh_proveedores prov,
                   deh_suscripciones_alianzas sus
              WHERE ((prov.prov_cod = sus.ali_prov_cod AND sus.ali_fechaIni >= fechaInicio AND
                      sus.ali_fechaIni <= fechaFin)
                  OR (prov.prov_cod = sus.ali_prov_cod AND fechaInicio is null AND fechaFin is null)))
        WHERE row_num = 1;

END;

---------------procedure 2 - talleres------------------

create or replace NONEDITIONABLE PROCEDURE reporte_6p2(cursor6p2 OUT sys_refcursor, fechaInicio DATE, fechaFin DATE) IS

BEGIN

    -- Apertura del cursor
    OPEN cursor6p2 FOR
        SELECT "Fecha de Inicio de la alianza",
               "Descripción de la Alianza",
               "Nombre del Taller",
               "Logo del taller"

        FROM (SELECT sus.ali_fechaIni                                                        AS "Fecha de Inicio de la alianza",
                     sus.ali_detSev                                                          AS "Descripción de la Alianza",
                     tal.tal_nombre                                                          AS "Nombre del Taller",
                     tal.tal_logo                                                            as "Logo del taller",
                     ROW_NUMBER() OVER (PARTITION BY tal.tal_nombre ORDER BY tal.tal_nombre) AS row_num
              FROM deh_talleres tal,
                   deh_suscripciones_alianzas sus
              WHERE (tal.tal_cod = sus.ali_prov_cod AND sus.ali_fechaIni >= fechaInicio AND
                     sus.ali_fechaIni <= fechaFin)
                 OR (tal.tal_cod = sus.ali_prov_cod AND fechaInicio IS NULL AND fechaFin IS NULL))
        WHERE row_num = 1;

END;

----------------------------------------------Reporte 7----------------------------------------------------------

-- Reporte N ° 7 - Alquileres de vehiculos con su status

-- Funciones empleadas

-- getStatusDeAlquiler: Obtener el status del vehiculo (Disponible, En Mantenimiento, Alquilado) en base a su codigo
CREATE OR REPLACE FUNCTION getStatusDeAlquiler ( codigoVehiculo IN NUMBER ) RETURN VARCHAR
    IS
    -- Declaración de variables
    esAlquilado VARCHAR (20);

    BEGIN
        SELECT
            CASE
                WHEN COUNT(DISTINCT con.con_veh_cod) = 0 AND COUNT(DISTINCT CASE WHEN bit.bit_estatus = 'FALSE' THEN bit.bit_veh_cod END) = 0 THEN 'Disponible'       -- Vehiculo sin alquilar
                WHEN COUNT(DISTINCT con.con_veh_cod) = 0 AND COUNT(DISTINCT CASE WHEN bit.bit_estatus = 'FALSE' THEN bit.bit_veh_cod END) = 1 THEN 'En Mantenimiento' -- Mantenimiento
                WHEN COUNT(DISTINCT con.con_veh_cod) = 1 AND COUNT(DISTINCT CASE WHEN bit.bit_estatus = 'FALSE' THEN bit.bit_veh_cod END) = 0 THEN 'Alquilado'        -- Alquiler
               -- WHEN COUNT(DISTINCT con.con_veh_cod) = 1 AND COUNT(DISTINCT CASE WHEN bit.bit_estatus = 'FALSE' THEN bit.bit_veh_cod END) = 1 THEN 'En Mantenimiento' -- Mantenimiento de un vehiculo en alquiler

            END
        INTO esAlquilado
        FROM
            deh_vehiculos veh
        LEFT JOIN deh_contratos con ON veh.veh_cod = codigoVehiculo AND codigoVehiculo = con.con_veh_cod
        LEFT JOIN deh_bitacoras bit ON veh.veh_cod = codigoVehiculo AND codigoVehiculo = bit.bit_veh_cod;

    RETURN esAlquilado;

    END;


-- getCedula: Obtener la cedula del cliente con alquiler en base al codigo del vehículo
CREATE OR REPLACE FUNCTION getCedula ( codigoVehiculo IN NUMBER ) RETURN NUMBER
    IS
        cedulaCliente NUMBER;
    BEGIN
        SELECT
            CASE
                WHEN contadorCliente = 1 THEN cli_ced
                WHEN contadorCliente = 0 THEN NULL
            END
        INTO cedulaCliente

        FROM
            (SELECT

                COUNT (con.con_cli_cod) AS contadorCliente,
                MAX (cli.cli_ced) AS cli_ced

            FROM  deh_vehiculos veh, deh_contratos con, deh_clientes cli

            WHERE
                veh.veh_cod = codigoVehiculo AND
                veh.veh_cod = con.con_veh_cod AND
                con.con_cli_cod = cli.cli_cod AND ROWNUM = 1

            GROUP BY
                veh.veh_cod
            ) subquery;

        RETURN cedulaCliente;
    END;

-- getCliente: Obtener las credenciales del cliente (Nombre Completo) en base al codigo del vehículo
CREATE OR REPLACE FUNCTION getCliente ( codigoVehiculo IN NUMBER ) RETURN VARCHAR
    IS -- Declaración de Variables
        nombreCliente VARCHAR (50);

    BEGIN
        SELECT
            CASE
                WHEN contadorCliente = 1 THEN cli_nombreCompleto
                WHEN contadorCliente = 0 THEN NULL
            END
        INTO nombreCliente

        FROM
            (SELECT

                COUNT (con.con_cli_cod) AS contadorCliente,
                MAX (cli.cli_persona.PRIMERNOMBRE || ' ' || cli.cli_persona.PRIMERAPELLIDO ) AS cli_nombreCompleto

            FROM  deh_vehiculos veh, deh_contratos con, deh_clientes cli

            WHERE
                veh.veh_cod = codigoVehiculo AND
                veh.veh_cod = con.con_veh_cod AND
                con.con_cli_cod = cli.cli_cod AND ROWNUM = 1

            GROUP BY
                veh.veh_cod
            ) subquery;

        RETURN nombreCliente;
    END;

-- getEmpleado: Obtener las credenciales del empleado (Nombre Completo) en base al codigo del vehículo
CREATE OR REPLACE FUNCTION getEmpleado ( codigoVehiculo IN NUMBER )RETURN VARCHAR
    IS
    nombreEmpleado VARCHAR (50);
    BEGIN

        SELECT emp.emp_persona.PRIMERNOMBRE || ' ' || emp.emp_persona.PRIMERAPELLIDO

        INTO nombreEmpleado

            FROM deh_colecciones_vehiculos col, deh_sedes sed, deh_empleados emp, deh_contratos con, deh_reservas res

        WHERE
              res.res_tipoEnt = 'Delivery' AND
              res.res_cod = con.con_res_cod AND
              con.con_veh_cod = codigoVehiculo AND
              codigoVehiculo = col.col_veh_cod AND
              col.col_sed_cod = sed.sed_cod AND
              sed.sed_cod = emp.emp_sed_cod

        ORDER BY DBMS_RANDOM.VALUE()
        FETCH FIRST ROW ONLY;

        RETURN nombreEmpleado;
END;

-- getLatitud: Obtener la latitud de envío del vehiculo en base al codigo del vehiculo
CREATE OR REPLACE FUNCTION getLatitud (codigoVehiculo IN NUMBER) RETURN NUMBER
    IS
        latitud NUMBER;
    BEGIN
        SELECT
            CASE
                WHEN COUNT(CASE WHEN res.res_tipoEnt = 'D' THEN 1 END) = 1 AND COUNT(CASE WHEN res.res_tipoEnt <> 'D' OR con.con_veh_cod = veh.veh_cod THEN 1 END) = 1 THEN MAX(cli.cli_locacion.LATITUD)
                WHEN COUNT(CASE WHEN res.res_tipoEnt = 'D' THEN 1 END) = 1 AND COUNT(CASE WHEN res.res_tipoEnt <> 'D' OR con.con_veh_cod = veh.veh_cod THEN 1 END) = 0 THEN NULL
                WHEN COUNT(CASE WHEN res.res_tipoEnt = 'D' THEN 1 END) = 0 AND COUNT(CASE WHEN res.res_tipoEnt <> 'D' OR con.con_veh_cod = veh.veh_cod THEN 1 END) = 1 THEN MAX(sed.sed_locacion.LATITUD)
            END
        INTO latitud
        FROM deh_vehiculos veh
        LEFT JOIN deh_contratos con ON con.con_veh_cod = veh.veh_cod
        LEFT JOIN deh_reservas res ON res.res_cod = con.con_res_cod
        LEFT JOIN deh_clientes cli ON cli.cli_cod = con.con_cli_cod
        LEFT JOIN deh_colecciones_vehiculos col ON veh.veh_cod = col.col_veh_cod
        LEFT JOIN deh_sedes sed ON sed.sed_cod = col.col_sed_cod
        WHERE veh.veh_cod = codigoVehiculo AND ROWNUM = 1
        GROUP BY veh.veh_cod;

        RETURN latitud;
    END;

-- getLongitud: Obtener la longitud de envío del vehiculo en base al codigo del vehiculo
CREATE OR REPLACE FUNCTION getLongitud (codigoVehiculo IN NUMBER) RETURN NUMBER
    IS
        longitud NUMBER;
    BEGIN
        SELECT
            CASE
                WHEN COUNT(CASE WHEN res.res_tipoEnt = 'D' THEN 1 END) = 1 AND COUNT(CASE WHEN res.res_tipoEnt <> 'D' OR con.con_veh_cod = veh.veh_cod THEN 1 END) = 1 THEN MAX(cli.cli_locacion.LONGITUD)
                WHEN COUNT(CASE WHEN res.res_tipoEnt = 'D' THEN 1 END) = 1 AND COUNT(CASE WHEN res.res_tipoEnt <> 'D' OR con.con_veh_cod = veh.veh_cod THEN 1 END) = 0 THEN NULL
                WHEN COUNT(CASE WHEN res.res_tipoEnt = 'D' THEN 1 END) = 0 AND COUNT(CASE WHEN res.res_tipoEnt <> 'D' OR con.con_veh_cod = veh.veh_cod THEN 1 END) = 1 THEN MAX(sed.sed_locacion.LONGITUD)
            END
        INTO longitud
        FROM deh_vehiculos veh
        LEFT JOIN deh_contratos con ON con.con_veh_cod = veh.veh_cod
        LEFT JOIN deh_reservas res ON res.res_cod = con.con_res_cod
        LEFT JOIN deh_clientes cli ON cli.cli_cod = con.con_cli_cod
        LEFT JOIN deh_colecciones_vehiculos col ON veh.veh_cod = col.col_veh_cod
        LEFT JOIN deh_sedes sed ON sed.sed_cod = col.col_sed_cod
        WHERE veh.veh_cod = codigoVehiculo AND ROWNUM = 1
        GROUP BY veh.veh_cod;

        RETURN longitud;
    END;

-- getFechaDesde: Obtener la fecha de Inicio de un contrato de un vehiculo (con o sin reserva)
CREATE OR REPLACE FUNCTION getFechaDesde(codigoVehiculo IN NUMBER) RETURN DATE
    IS
    fechaDesde DATE;
    BEGIN
        SELECT
            CASE
                WHEN COUNT(res.res_cod) > 0 THEN MAX(res.res_fechaRes)
                ELSE MAX(con.con_fechaIni)
            END
        INTO fechaDesde
        FROM
            deh_vehiculos veh
        LEFT JOIN deh_contratos con ON con.con_veh_cod = veh.veh_cod
        LEFT JOIN deh_reservas res ON res.res_cod = con.con_res_cod
        WHERE veh.veh_cod = codigoVehiculo
        GROUP BY veh.veh_cod;

        RETURN fechaDesde;
    END;


-- getFechaHasta: Obtener la fecha de Fin de un contrato de un vehiculo
CREATE OR REPLACE FUNCTION getFechaHasta(codigoVehiculo IN NUMBER) RETURN DATE
    IS
    fechaHasta DATE;
BEGIN
    SELECT con.con_fechaFin
    INTO fechaHasta
    FROM deh_vehiculos veh,
         deh_contratos con
    WHERE veh.veh_cod = codigoVehiculo
      AND con.con_veh_cod = veh.veh_cod
      AND ROWNUM = 1;
    RETURN fechaHasta;
END;

-- getPrecioTotal: Obtener el precio total pagado por un vehiculo alquilado
CREATE OR REPLACE FUNCTION getPrecioTotal(codigoVehiculo IN NUMBER) RETURN NUMBER
    IS
    precioTotal NUMBER;
BEGIN
    SELECT SUM(con.con_transaccion.VALORNUMERICO)
    INTO precioTotal
    FROM deh_vehiculos veh,
         deh_contratos con
    WHERE veh.veh_cod = codigoVehiculo
      AND con.con_veh_cod = veh.veh_cod;

    RETURN precioTotal;
END;

CREATE OR REPLACE FUNCTION calcularPrecioPorDia ( precioOriginal IN NUMBER, fechaInicio IN DATE, fechaFin IN DATE ) RETURN NUMBER
    IS -- Declaraci?n de variables
    precioDiario NUMBER;
    diasAlquilado NUMBER;
BEGIN
    diasAlquilado := TRUNC ( MONTHS_BETWEEN (fechaFin, fechaInicio) * 30 );
    precioDiario := precioOriginal / diasAlquilado;
    RETURN precioDiario;
END;


create or replace NONEDITIONABLE PROCEDURE reporte_7(cursor7 out sys_refcursor, fechaInicio DATE, fechaFin DATE, tipo varchar2, estatus varchar2) is

begin
    open cursor7 for

            SELECT
                "Tipo de vehiculo",
                "Marca",
                "Modelo",
                "Año",
                "Foto",
                "Placa",
                "Status de Alquiler",
                "Cedula",
                "Nombre del Cliente",
                "Fechas Desde",
                "Fechas Hasta",
                "Precio Por Día",
                "Precio Total",
                "Empleado encargado",
                COALESCE("Latitud", 0) AS "Latitud",
                COALESCE("Longitud", 0) AS "Longitud"
            FROM
                (SELECT
                    veh.veh_tipo AS "Tipo de vehiculo",
                    mar.mar_nombre AS "Marca",
                    mod.mod_nombre AS "Modelo",
                    mod.mod_anio AS "Año",
                    veh.veh_foto AS "Foto",
                    veh.veh_mat AS "Placa",
                    getStatusDeAlquiler(veh.veh_cod) AS "Status de Alquiler",
                    getCedula(veh.veh_cod) AS "Cedula",
                    getCliente(veh.veh_cod) AS "Nombre del Cliente",
                    getFechaDesde(veh.veh_cod) AS "Fechas Desde",
                    getFechaHasta(veh.veh_cod) AS "Fechas Hasta",
                    TO_CHAR(calcularPrecioPorDia(getPrecioTotal(veh.veh_cod), getFechaDesde(veh.veh_cod), getFechaHasta(veh.veh_cod)), '99999.99') AS "Precio Por Día",
                    getPrecioTotal(veh.veh_cod) AS "Precio Total",
                    getEmpleado(veh.veh_cod) AS "Empleado encargado",
                    getLatitud(veh.veh_cod) AS "Latitud",
                    getLongitud(veh.veh_cod) AS "Longitud",
                    ROW_NUMBER() OVER (PARTITION BY mod.mod_nombre ORDER BY veh.veh_cod) AS rn
                FROM
                    deh_vehiculos veh
                    INNER JOIN deh_marcas mar ON mar.mar_cod = veh.veh_mar_cod -- Marca
                    INNER JOIN deh_modelos mod ON mod.mod_cod = veh.veh_mod_cod
                WHERE
                    ((veh.veh_tipo) = tipo OR (getStatusDeAlquiler(veh.veh_cod) = estatus) OR (getFechaDesde(veh.veh_cod) >= fechaInicio and getFechaDesde(veh.veh_cod) <= fechaFin)or (tipo is null and estatus is null and fechaInicio is null and fechaFin is null))
                ORDER BY
                    veh.veh_cod ASC) sub
            WHERE
                rn = 1;
END;


----------------------------------------------Reporte 8-----------------------------------------------------------

create or replace NONEDITIONABLE PROCEDURE reporte_8(cursor8 out sys_refcursor, fechaInicio DATE, fechaFin DATE,
                                                     tipo varchar2, marca varchar2) is

begin
    open cursor8 for
        SELECT EXTRACT(YEAR FROM c.con_fechaIni) AS "ANIO",
               TRUNC(c.con_fechaIni, 'MONTH')    AS "MES",
               e.mod_nombre                      AS "MODELOS",
               COUNT(*)                          AS "CANTIDAD_MODELO"
        FROM deh_vehiculos v,
             deh_modelos e,
             deh_marcas d,
             deh_contratos c
        WHERE ((v.veh_mod_cod = e.mod_cod AND e.mod_mar_cod = d.mar_cod AND v.veh_cod = c.con_veh_cod AND
                c.con_mod_cod = e.mod_cod AND (c.con_fechaIni BETWEEN fechaInicio AND fechaFin))
            OR (v.veh_mod_cod = e.mod_cod AND e.mod_mar_cod = d.mar_cod AND v.veh_cod = c.con_veh_cod AND
                c.con_mod_cod = e.mod_cod AND d.mar_nombre = marca)
            OR (v.veh_mod_cod = e.mod_cod AND e.mod_mar_cod = d.mar_cod AND v.veh_cod = c.con_veh_cod AND
                c.con_mod_cod = e.mod_cod AND v.veh_tipo = tipo)
            OR (v.veh_mod_cod = e.mod_cod AND e.mod_mar_cod = d.mar_cod AND v.veh_cod = c.con_veh_cod AND
                c.con_mod_cod = e.mod_cod AND marca IS NULL AND tipo IS NULL AND fechaInicio IS NULL AND
                fechaFin IS NULL))
        GROUP BY EXTRACT(YEAR FROM c.con_fechaIni), TRUNC(c.con_fechaIni, 'MONTH'), e.mod_nombre
        ORDER BY EXTRACT(YEAR FROM c.con_fechaIni), TRUNC(c.con_fechaIni, 'MONTH') ASC;

End;


----------------------------------------------Reporte 9-----------------------------------------------------------

create or replace NONEDITIONABLE PROCEDURE reporte_9(cursor9 out sys_refcursor, mes varchar2, anio number) is
    
begin
open cursor9 for
            SELECT mes_anio,
                   mes,
                   anio,
                   ingreso_total,
                   egreso_total,
                   total,
                   ROUND((ingreso_total / total) * 100, 2) AS porcentaje_ingreso,
                   ROUND((egreso_total / total) * 100, 2) AS porcentaje_egreso
            FROM (
              SELECT TO_CHAR(cont.CON_FECHAINI, 'MonthYYYY', 'NLS_DATE_LANGUAGE=SPANISH') AS mes_anio,
                     TO_CHAR(cont.CON_FECHAINI, 'FMMONTH', 'NLS_DATE_LANGUAGE=SPANISH') as mes,
                     EXTRACT(YEAR FROM cont.CON_FECHAINI) AS anio,
                     SUM(cont.CON_TRANSACCION.VALORNUMERICO) AS ingreso_total,
                     COALESCE(egr1.valor, 0) AS egreso_total,
                     SUM(cont.CON_TRANSACCION.VALORNUMERICO) + COALESCE(egr1.valor, 0) AS total
              FROM DEH_SEDES sede,
                   DEH_COLECCIONES_VEHICULOS colecc,
                   DEH_VEHICULOS veh,
                   DEH_CONTRATOS cont full outer join
                   (select to_char(egr.EGR_FECHAEGR, 'Month-YYYY', 'NLS_DATE_LANGUAGE=SPANISH')   as fecha_egr,
                           sum(egr.EGR_TRANSACCION.VALORNUMERICO) as valor
                    from DEH_EGRESOS egr
                    GROUP BY TO_CHAR(egr.EGR_FECHAEGR, 'Month-YYYY', 'NLS_DATE_LANGUAGE=SPANISH')
                    ) egr1 on TO_CHAR(cont.CON_FECHAINI, 'Month-YYYY', 'NLS_DATE_LANGUAGE=SPANISH')=fecha_egr
              WHERE ((sede.SED_COD = colecc.COL_SED_COD AND colecc.COL_VEH_COD = veh.VEH_COD AND veh.VEH_COD = cont.CON_VEH_COD AND TO_CHAR(cont.CON_FECHAINI, 'FMMONTH', 'NLS_DATE_LANGUAGE=SPANISH')= mes AND EXTRACT(YEAR FROM cont.CON_FECHAINI) = anio)
              OR (sede.SED_COD = colecc.COL_SED_COD AND colecc.COL_VEH_COD = veh.VEH_COD AND veh.VEH_COD = cont.CON_VEH_COD AND mes is null and anio is null))
              GROUP BY TO_CHAR(cont.CON_FECHAINI, 'MonthYYYY', 'NLS_DATE_LANGUAGE=SPANISH'), TO_CHAR(con_fechaIni, 'FMMONTH', 'NLS_DATE_LANGUAGE=SPANISH'), EXTRACT(YEAR FROM cont.CON_FECHAINI), egr1.valor
            )
            ORDER BY anio, TO_DATE(mes, 'Month', 'NLS_DATE_LANGUAGE=SPANISH');

END;


----------------------------------------------Reporte 10-----------------------------------------------------------

create or replace NONEDITIONABLE PROCEDURE reporte_10(cursor10 out sys_refcursor, fechaInicio DATE, fechaFin DATE,
                                                      tipo varchar2) is

begin
    open cursor10 for
        select Fecha_reserva,
               Tipo_vehiculo,
               Cedula,
               nombre_cliente,
               Foto_cliente,
               Matricula,
               Marca,
               Modelo,
               Foto_vehiculo,
               Forma_entrega
        from (SELECT r.res_fechaRes                                                      AS Fecha_reserva,
                     v.veh_tipo                                                          AS Tipo_vehiculo,
                     cl.cli_ced                                                          AS Cedula,
                     cl.cli_persona.primerNombre || ' ' || cl.cli_persona.primerApellido AS nombre_cliente,
                     cl.cli_foto                                                         AS Foto_cliente,
                     v.veh_mat                                                           AS Matricula,
                     m.mar_nombre                                                        AS Marca,
                     mo.mod_nombre                                                       AS Modelo,
                     v.veh_foto                                                          AS Foto_vehiculo,
                     r.res_tipoent                                                       AS Forma_entrega,
                     ROW_NUMBER() OVER (PARTITION BY cl.cli_ced ORDER BY cl.cli_ced)     AS rn
              FROM deh_reservas r,
                   deh_contratos c,
                   deh_vehiculos v,
                   deh_marcas m,
                   deh_modelos mo,
                   deh_clientes cl
              WHERE ((c.con_res_cod = r.res_cod AND c.con_veh_cod = v.veh_cod AND c.con_mar_cod = m.mar_cod AND
                      c.con_mod_cod = mo.mod_cod AND c.con_cli_cod = cl.cli_cod AND c.con_res_cod IS NOT NULL and
                      (c.con_fechaIni between fechaInicio and fechaFin))
                  OR (c.con_res_cod = r.res_cod AND c.con_veh_cod = v.veh_cod AND c.con_mar_cod = m.mar_cod AND
                      c.con_mod_cod = mo.mod_cod AND c.con_cli_cod = cl.cli_cod AND c.con_res_cod IS NOT NULL and
                      v.veh_tipo = tipo)
                  OR (c.con_res_cod = r.res_cod AND c.con_veh_cod = v.veh_cod AND c.con_mar_cod = m.mar_cod AND
                      c.con_mod_cod = mo.mod_cod AND c.con_cli_cod = cl.cli_cod AND c.con_res_cod IS NOT NULL and
                      fechaInicio is null and fechaFin is null and tipo is null)))
        where rn = 1;

END;

----------------------------------------------Reporte 11-----------------------------------------------------------

create or replace NONEDITIONABLE PROCEDURE reporte_11(cursor11 out sys_refcursor, fechaInicio DATE, fechaFin DATE,
                                                      tipo varchar2) is

begin
    open cursor11 for
        SELECT t.codigo,
               t.tipo,
               t.detalles_pago,
               t.metodo,
               t.monto,
               t.porcentaje_number,
               t.porcentaje_string,
               s.total_monto
        FROM (SELECT p.pag_con_cod                                 AS codigo,
                     v.veh_tipo                                    AS tipo,
                     LISTAGG(p.pag_metpag || ': $' || p.pag_transaccion.valorNumerico || CHR(10), CHR(10))
                             WITHIN GROUP (ORDER BY p.pag_con_cod) AS detalles_pago,
                     p.pag_metpag                                  AS metodo,
                     p.pag_transaccion.valorNumerico               AS monto,
                     CASE
                         WHEN SUM(p.pag_transaccion.valorNumerico) OVER (PARTITION BY p.pag_con_cod) = 0 THEN 0
                         ELSE ROUND(p.pag_transaccion.valorNumerico /
                                    SUM(p.pag_transaccion.valorNumerico) OVER (PARTITION BY p.pag_con_cod) * 100, 2)
                         END                                       AS porcentaje_number,
                     CASE
                         WHEN SUM(p.pag_transaccion.valorNumerico) OVER (PARTITION BY p.pag_con_cod) = 0 THEN '0%'
                         ELSE TO_CHAR(ROUND(p.pag_transaccion.valorNumerico /
                                            SUM(p.pag_transaccion.valorNumerico) OVER (PARTITION BY p.pag_con_cod) *
                                            100, 2), 'FM999.00') || '%'
                         END                                       AS porcentaje_string
              FROM deh_contratos c,
                   deh_vehiculos v,
                   deh_formas_pago p
              WHERE ((c.con_veh_cod = v.veh_cod AND p.pag_con_cod = c.con_cod AND
                      (c.con_fechaini BETWEEN fechaInicio AND fechaFin))
                  OR (c.con_veh_cod = v.veh_cod AND p.pag_con_cod = c.con_cod AND v.veh_tipo = tipo)
                  OR (c.con_veh_cod = v.veh_cod AND p.pag_con_cod = c.con_cod AND tipo is null and
                      fechaInicio is null and fechaFin is null))
              GROUP BY p.pag_con_cod, v.veh_tipo, p.pag_metpag, p.pag_transaccion.valorNumerico) t
                 INNER JOIN (SELECT p.pag_con_cod                        AS codigo,
                                    SUM(p.pag_transaccion.valorNumerico) AS total_monto
                             FROM deh_contratos c,
                                  deh_vehiculos v,
                                  deh_formas_pago p
                             WHERE ((c.con_veh_cod = v.veh_cod AND p.pag_con_cod = c.con_cod AND
                                     (c.con_fechaini BETWEEN fechaInicio AND fechaFin))
                                 OR (c.con_veh_cod = v.veh_cod AND p.pag_con_cod = c.con_cod AND v.veh_tipo = tipo)
                                 OR (c.con_veh_cod = v.veh_cod AND p.pag_con_cod = c.con_cod AND tipo is null and
                                     fechaInicio is null and fechaFin is null))
                             GROUP BY p.pag_con_cod) s ON t.codigo = s.codigo;

END;

----------------------------------------------Reporte 12-----------------------------------------------------------

create or replace NONEDITIONABLE PROCEDURE reporte_12(cursor12 OUT sys_refcursor, fechaInicio DATE, fechaFin DATE,
                                                      tipo varchar2, marca varchar2, modelo varchar2, placa varchar2) IS

BEGIN
    OPEN cursor12 FOR
        select tipo,
               marca,
               modelo,
               anio,
               matricula,
               foto_vehiculo,
               icono,
               calificacion,
               descripcion
        from (SELECT v.veh_tipo                                                            as tipo,
                     m.mar_nombre                                                          as marca,
                     mo.mod_nombre                                                         as modelo,
                     mo.mod_anio                                                           as anio,
                     v.veh_mat                                                             as matricula,
                     v.veh_foto                                                            as foto_vehiculo,
                     ev.eva_icon                                                           as icono,
                     to_char(ev.eva_calif || ' - ' || (ev.eva_calif * 100) / 5 || '%')     as calificacion,
                     o.descripcion                                                         as descripcion,
                     ROW_NUMBER() OVER (PARTITION BY o.descripcion ORDER BY o.descripcion) AS rn
              FROM deh_vehiculos v,
                   deh_marcas m,
                   deh_modelos mo,
                   deh_evaluaciones ev,
                   deh_contratos c,
                   (SELECT obs_eva_cod, listagg(obs_descrip, ', ') WITHIN GROUP (ORDER BY obs_cod) as descripcion
                    FROM deh_observaciones
                    GROUP BY obs_eva_cod) o
              WHERE (v.veh_mar_cod = m.mar_cod AND v.veh_mod_cod = mo.mod_cod AND v.veh_cod = ev.eva_veh_cod AND ev.eva_cod = o.obs_eva_cod AND v.veh_cod = c.con_veh_cod AND (c.con_fechaIni BETWEEN fechaInicio and fechaFin)
              OR (v.veh_mar_cod = m.mar_cod AND v.veh_mod_cod = mo.mod_cod AND v.veh_cod = ev.eva_veh_cod AND ev.eva_cod = o.obs_eva_cod AND v.veh_cod = c.con_veh_cod AND v.veh_tipo = tipo)
              OR (v.veh_mar_cod = m.mar_cod AND v.veh_mod_cod = mo.mod_cod AND v.veh_cod = ev.eva_veh_cod AND ev.eva_cod = o.obs_eva_cod AND v.veh_cod = c.con_veh_cod AND m.mar_nombre = marca)
              OR (v.veh_mar_cod = m.mar_cod AND v.veh_mod_cod = mo.mod_cod AND v.veh_cod = ev.eva_veh_cod AND ev.eva_cod = o.obs_eva_cod AND v.veh_cod = c.con_veh_cod AND mo.mod_nombre = modelo)
              OR (v.veh_mar_cod = m.mar_cod AND v.veh_mod_cod = mo.mod_cod AND v.veh_cod = ev.eva_veh_cod AND ev.eva_cod = o.obs_eva_cod AND v.veh_cod = c.con_veh_cod AND v.veh_mat = placa)
              OR (v.veh_mar_cod = m.mar_cod AND v.veh_mod_cod = mo.mod_cod AND v.veh_cod = ev.eva_veh_cod AND ev.eva_cod = o.obs_eva_cod AND v.veh_cod = c.con_veh_cod AND fechaInicio is null and fechaFin is null and tipo is null and marca is null and modelo is null and placa is null)))
        where rn = 1;
end;

----------------------------------------------Reporte 13-----------------------------------------------------------

create or replace NONEDITIONABLE PROCEDURE reporte_13(cursor13 out sys_refcursor, semanaInicio DATE, semanaFin DATE) is

begin
open cursor13 for

        SELECT 
          TO_CHAR(TRUNC(c.con_fechaIni, 'IW'), 'DD/MM/YYYY', 'NLS_DATE_LANGUAGE=SPANISH') || ' al ' || TO_CHAR(TRUNC(c.con_fechaIni, 'IW') + 6, 'DD/MM/YYYY', 'NLS_DATE_LANGUAGE=SPANISH') AS "FECHA_SEMANA",
          (CASE TO_CHAR(c.con_fechaIni-1, 'D')
             WHEN '1' THEN 'LUNES'
             WHEN '2' THEN 'MARTES'
             WHEN '3' THEN 'MIÉRCOLES'
             WHEN '4' THEN 'JUEVES'
             WHEN '5' THEN 'VIERNES'
             WHEN '6' THEN 'SÁBADO'
             WHEN '7' THEN 'DOMINGO'
           END) AS "DIA_SEMANA",
          COUNT(v.veh_cod) AS "CANTIDAD_vehiculos"
        FROM deh_vehiculos v, deh_modelos e, deh_contratos c, deh_marcas d
        WHERE 
          (v.veh_mod_cod = e.mod_cod AND e.mod_mar_cod = d.mar_cod AND v.veh_cod = c.con_veh_cod AND c.con_mod_cod = e.mod_cod AND (c.con_fechaIni >=semanaInicio and c.con_fechaIni <= semanaFin) 
          OR (v.veh_mod_cod = e.mod_cod AND e.mod_mar_cod = d.mar_cod AND v.veh_cod = c.con_veh_cod AND c.con_mod_cod = e.mod_cod AND semanaInicio IS NULL and semanaFin IS NULL))
        GROUP BY TRUNC(c.con_fechaIni, 'IW'), TO_CHAR(c.con_fechaIni-1, 'D')
        ORDER BY TRUNC(c.con_fechaIni, 'IW') asc, TO_CHAR(c.con_fechaIni-1, 'D') asc;
End;