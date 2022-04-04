REM ******Nombre: ListadoLibros.sql******
REM ******Descripción: Informe sobre los libros que hay en la biblioteca******
CLEAR SCREEN
CLEAR BREAKS
CLEAR COMPUTES
CLEAR COLUMNS

SET HEADSEP |
SET LINESIZE 130
SET PAGESIZE 35

TTITLE '=================================================================================================================================|LISTADO DE LIBROS|================================================================================================================================='

COLUMN ISBN HEADING 'ISBN'
COLUMN TITULO HEADING 'Libro'
COLUMN IDIOMA HEADING 'Idioma'
COLUMN NUM_PAG HEADING 'Numero de paginas'
COLUMN EDINB HEADING 'Editorial'
COLUMN NOMBRE HEADING 'Tema'

SPOOL ListadoLibros.lst

SELECT LIBRO.ISBN, LIBRO.TITULO, TEMA.NOMBRE, EDITORIAL.EDINB, LIBRO.IDIOMA, LIBRO.NUM_PAG
FROM LIBRO, TEMA, EDITORIAL
WHERE LIBRO.CODIGO=TEMA.CODIGO AND EDITORIAL.CIF=LIBRO.CIF;