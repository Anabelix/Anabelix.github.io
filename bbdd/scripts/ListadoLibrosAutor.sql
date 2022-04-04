REM ******Nombre: ListadoLibrosAutor.sql******
REM ******Descripción: Informe sobre los libros que hay en la biblioteca******
CLEAR SCREEN
CLEAR BREAKS
CLEAR COMPUTES
CLEAR COLUMNS

SET HEADSEP |
SET LINESIZE 100
SET PAGESIZE 75

TTITLE '=================================================================================================|LISTADO DE LIBROS POR AUTOR|================================================================================================='
COLUMN APENOM HEADING 'Nombre del autor'
COLUMN APENOM FORMAT A27
COLUMN APENOM TRUNCATED

COLUMN TITULO HEADING 'Libro'
COLUMN FECHA_IMP HEADING 'Fecha de impresion' FORMAT A20 TRUNCATED

BREAK ON APENOM SKIP 2

BTITLE '=================================================================================================|Ana Isabel Pedrajas Navarro			DAW1V|================================================================================================='

SPOOL ListadoLibrosAutor.lst

SELECT AUTOR.APENOM, LIBRO.TITULO, LIBRO.FECHA_IMP FROM AUTOR, LIBRO, ESCRITO
WHERE LIBRO.ISBN=ESCRITO.ISBN AND AUTOR.CODIGO=ESCRITO.CODIGO ORDER BY APENOM, FECHA_IMP;



