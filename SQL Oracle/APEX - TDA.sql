-- TDA TRANSACCION

CREATE OR REPLACE TYPE deh_TRANSACCION AS OBJECT (
    valorNumerico number (9),
    unidadMonetaria varchar2 (30),
    abrevSimbolo varchar (10),

 -- Métodos de validación
    STATIC FUNCTION validarMonto (valor number) RETURN number
);

CREATE OR REPLACE TYPE BODY deh_TRANSACCION AS

-- VALIDAR MONTO

 STATIC FUNCTION validarMonto (valor number) RETURN number IS
     BEGIN
       If (valor > 0) THEN
           return valor;
        ELSE
           RAISE_APPLICATION_ERROR(-20001,'Monto invalido para el vehiculo');
       END IF;
     END;
END;

CREATE OR REPLACE TYPE deh_PERSONA AS OBJECT (
    primerNombre varchar2 (30),
    primerApellido varchar2 (30),
    genero varchar2 (20),
    fechaNac date,

 -- Métodos de validación
    STATIC FUNCTION validarNombre (nombre varchar) RETURN varchar,
    STATIC FUNCTION validarApellido (apellido varchar) RETURN varchar,
    STATIC FUNCTION validarGenero (genero varchar) RETURN varchar,
    STATIC FUNCTION validarFechaNac (fecha date) RETURN date
);

CREATE OR REPLACE TYPE BODY deh_PERSONA AS

        STATIC FUNCTION validarNombre(nombre varchar) RETURN varchar IS
             BEGIN
               IF (REGEXP_LIKE(nombre,'^[^0-9]*$')) THEN
                   return nombre;
                ELSE
                   RAISE_APPLICATION_ERROR(-20001,'Formato de nombre invalido');
               END IF;
             END;

STATIC FUNCTION validarApellido(apellido varchar) RETURN varchar IS
     BEGIN
       IF (REGEXP_LIKE(apellido,'^[^0-9]*$')) THEN
           return apellido;
        ELSE
           RAISE_APPLICATION_ERROR(-20001,'Formato de apellido invalido');
       END IF;
     END;

STATIC FUNCTION validarGenero(genero varchar) RETURN varchar IS
     BEGIN
       IF (REGEXP_LIKE(genero,'Hombre|Mujer')) THEN
           return genero;
        ELSE
           RAISE_APPLICATION_ERROR(-20001,'Formato de apellido invalido');
       END IF;
     END;
     
STATIC FUNCTION validarFechaNac(fecha date) RETURN date IS
     BEGIN
       IF (SYSDATE - fecha >= 18 ) THEN
           return fecha;
        ELSE
           RAISE_APPLICATION_ERROR(-20001,'Fecha invalida, la persona es menor de edad');
       END IF;
     END;
END;

-- TDA LOCACION

CREATE OR REPLACE TYPE deh_LOCACION AS OBJECT (
    codigoPostal number (4),
    latitud number(20,14),
    longitud number(20,14),
    calle varchar2(50),

 -- METODOS DE VALIDACION
    STATIC FUNCTION validarCodigoPostal(codigoPostal number) RETURN number,
    STATIC FUNCTION validarlatitud(latitud number) return number,
    STATIC FUNCTION validarlongitud(longitud number) return number

);

-- VALIDAR DATOS LOCACION

CREATE OR REPLACE TYPE BODY deh_LOCACION AS

-- VALIDAR CODIGO POSTAL

   STATIC FUNCTION validarCodigoPostal (codigoPostal number) RETURN number IS
     BEGIN
       IF length(to_char(codigoPostal)) = 4 THEN
           return codigoPostal;
        ELSE
           RAISE_APPLICATION_ERROR(-20001,'Formato de codigo postal invalido en Venezuela');
       END IF;
     END;
     
-- VALIDAR LATITUD

   STATIC FUNCTION validarLatitud(latitud number) RETURN number IS
      BEGIN
       IF (latitud >= -90 and latitud <= 90) THEN
           return latitud;
        ELSE
           RAISE_APPLICATION_ERROR(-20001,'la latitud esta fuera de rango');
       END IF;
     END;

-- VALIDAR LONGITUD

   STATIC FUNCTION validarLongitud(longitud number) RETURN number IS
      BEGIN
       IF (longitud >= -180 and longitud <= 180) THEN
           return longitud;
        ELSE
           RAISE_APPLICATION_ERROR(-20001,'la longitud esta fuera de rango');
       END IF;
    END;
 END;
 
-- TDA EMPRESA

CREATE OR REPLACE TYPE deh_EMPRESA AS OBJECT (
    lineaTlf varchar2 (30),
    RIF varchar2 (30),
    correo_E varchar2 (100),

 -- METODOS DE VALIDACION
    STATIC FUNCTION formatoTelefono (lineaTlf varchar) RETURN varchar,
    STATIC FUNCTION validarRIF (RIF varchar) RETURN varchar,
    STATIC FUNCTION formatoCorreo (correo_E varchar) RETURN varchar
);

-- VALIDAR DATOS EMPRESA


CREATE OR REPLACE TYPE BODY deh_EMPRESA AS

-- VALIDAR TELEFONO

   STATIC FUNCTION formatoTelefono (lineaTlf varchar) RETURN varchar IS
     BEGIN
       IF (REGEXP_LIKE(lineaTlf,'^0212|0214|0424|0216-[0-9]{7}$')) THEN
           return lineaTlf;
        ELSE
           RAISE_APPLICATION_ERROR(-20001,'Formato de telefono invalido para Venezuela');
       END IF;
     END;

-- VALIDAR RIF

   STATIC FUNCTION validarRIF(RIF varchar) RETURN varchar IS
      BEGIN
       IF (REGEXP_LIKE(RIF,'^[J]-\d{9}$')) THEN
           return RIF;
        ELSE
           RAISE_APPLICATION_ERROR(-20001,'Formato de rif invalido para venezuela');
       END IF;
     END;

-- VALIDAR CORREO

   STATIC FUNCTION formatoCorreo(correo_E varchar) RETURN varchar IS
      BEGIN
       IF (REGEXP_LIKE(correo_E, '^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$')) THEN
           return correo_E;
        ELSE
           RAISE_APPLICATION_ERROR(-20001,'Formato de correo invalido');
       END IF;
    END;
 END;