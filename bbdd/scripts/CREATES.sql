DROP TABLE EDITORIAL CASCADE CONSTRAINTS;

CREATE TABLE EDITORIAL (
CIF VARCHAR(5),
EDINB VARCHAR(20) NOT NULL,
PAIS VARCHAR(20) NOT NULL,
CIUDAD VARCHAR(20),
CODIGO_POSTAL NUMBER(5),
CONSTRAINT pk_editorial PRIMARY KEY (CIF)
);

DROP TABLE TEMA CASCADE CONSTRAINTS;

CREATE TABLE TEMA (
CODIGO VARCHAR(5),
NOMBRE VARCHAR(20) NOT NULL,
UBICACION VARCHAR(20)NOT NULL,
CONSTRAINT pk_tema PRIMARY KEY (CODIGO)
);


DROP TABLE AUTOR CASCADE CONSTRAINTS;

CREATE TABLE AUTOR (
CODIGO VARCHAR(5),
APENOM VARCHAR(40) NOT NULL,
PAIS VARCHAR(20) NOT NULL,
ALIAS VARCHAR(20),
CONSTRAINT pk_autor PRIMARY KEY (CODIGO)
);

DROP TABLE LIBRO CASCADE CONSTRAINTS;
CREATE TABLE LIBRO (
ISBN VARCHAR(5),
TITULO VARCHAR(50) NOT NULL,
FECHA_IMP DATE,
LUGAR_IMP VARCHAR(20),
IDIOMA VARCHAR(10) NOT NULL,
NUM_PAG NUMBER,
CIF VARCHAR(9),
CODIGO VARCHAR(5),
CONSTRAINT pk_libro PRIMARY KEY (ISBN),
CONSTRAINT fk_libro1 FOREIGN KEY (CIF) REFERENCES EDITORIAL (CIF) ON DELETE CASCADE,
CONSTRAINT fk_libro2 FOREIGN KEY (CODIGO) REFERENCES TEMA (CODIGO) ON DELETE CASCADE
);

DROP TABLE ESCRITO CASCADE CONSTRAINTS;

CREATE TABLE ESCRITO (
CODIGO VARCHAR(5),
ISBN VARCHAR(5),
CONSTRAINT pk_escrito PRIMARY KEY (CODIGO, ISBN),
CONSTRAINT fk_escrito1 FOREIGN KEY (ISBN) REFERENCES LIBRO (ISBN) ON DELETE CASCADE,
CONSTRAINT fk_escrito2 FOREIGN KEY (CODIGO) REFERENCES AUTOR (CODIGO) ON DELETE CASCADE
);


DROP TABLE EJEMPLARES CASCADE CONSTRAINTS;

CREATE TABLE EJEMPLARES (
ISBN VARCHAR(5),
NUM_EJEMPLAR NUMBER,
FORMATO VARCHAR(10) NOT NULL,
ESTADO VARCHAR(50),
FECHA_EDICION DATE NOT NULL,
CONSTRAINT pk_ejemplares PRIMARY KEY (ISBN, NUM_EJEMPLAR),
CONSTRAINT fk_ejemplares1 FOREIGN KEY (ISBN, NUM_EJEMPLAR) REFERENCES EJEMPLARES (ISBN,NUM_EJEMPLAR) ON DELETE CASCADE
);


DROP TABLE TIPO_SOCIO CASCADE CONSTRAINTS;

CREATE TABLE TIPO_SOCIO (
CODIGO VARCHAR(5),
DESCRIPCION VARCHAR(30) NOT NULL,
CONSTRAINT pk_tsocio PRIMARY KEY (CODIGO),
CONSTRAINT c_socio1 CHECK (DESCRIPCION IN('INFANTIL','ADULTO','INSTITUCIONAL'))
);

DROP TABLE SOCIO CASCADE CONSTRAINTS;

CREATE TABLE SOCIO (
NUM_SOCIO VARCHAR(5),
APENOM VARCHAR(40) NOT NULL,
FECHA_NAC DATE NOT NULL,
DIRECCION VARCHAR(30),
TELEFONO VARCHAR(10),
CODIGO VARCHAR(5),
CONSTRAINT pk_socio PRIMARY KEY (NUM_SOCIO),
CONSTRAINT fk_socio1 FOREIGN KEY (CODIGO) REFERENCES TIPO_SOCIO(CODIGO) ON DELETE CASCADE
);

DROP TABLE PRESTAMO CASCADE CONSTRAINTS;

CREATE TABLE PRESTAMO(
NUM_EJEMPLAR NUMBER,
ISBN VARCHAR(5),
NUM_SOCIO VARCHAR(5),
FECHA_INICIO DATE,
FECHA_FIN DATE NOT NULL,
FECHA_DEVOLUCION DATE,
CONSTRAINT pk_prestamo PRIMARY KEY (NUM_EJEMPLAR, ISBN, NUM_SOCIO, FECHA_INICIO),
CONSTRAINT fk_prestamo1 FOREIGN KEY (ISBN,NUM_EJEMPLAR) REFERENCES EJEMPLARES(ISBN,NUM_EJEMPLAR) ON DELETE CASCADE,
CONSTRAINT fk_prestamo2 FOREIGN KEY (NUM_SOCIO) REFERENCES SOCIO (NUM_SOCIO) ON DELETE CASCADE
);