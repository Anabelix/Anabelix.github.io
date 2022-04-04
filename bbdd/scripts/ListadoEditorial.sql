REM ******Nombre: ListadoEditorial.sql ******
REM ******Descripcion: Informe sobre los libros que hay en la biblioteca******
CLEAR SCREEN
CLEAR BREAKS
CLEAR COMPUTES
CLEAR COLUMNS

SET HEADSEP |
SET LINESIZE 80
SET PAGESIZE 40

TTITLE '===================================================================|LISTADO DE LIBROS POR EDITORIAL|==================================================================='
COLUMN EDINB HEADING 'Editorial' FORMAT A30 TRUNCATED
COLUMN TITULO HEADING 'Libro' FORMAT A41 TRUNCATED

BTITLE '===================================================================|Ana Isabel Pedrajas Navarro			DAW1V|==================================================================='

BREAK ON NOMBRE SKIP 2

SPOOL ListadoEditorial.lst

SELECT EDITORIAL.EDINB, LIBRO.TITULO FROM EDITORIAL, LIBRO
WHERE LIBRO.CIF=EDITORIAL.CIF ORDER BY EDINB;