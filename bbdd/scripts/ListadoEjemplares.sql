REM ******Nombre: ListadoEjemplares.sql******
REM ******Descripcion: Informe sobre los libros que hay en la biblioteca******
CLEAR SCREEN
CLEAR BREAKS
CLEAR COMPUTES
CLEAR COLUMNS

SET HEADSEP |
SET LINESIZE 70
SET PAGESIZE 37

TTITLE '=================================================================================================|LISTADO DE EJEMPLARES|================================================================================================='
COLUMN TITULO HEADING 'Titulo'
COLUMN TITULO FORMAT A45
COLUMN TITULO TRUNCATED

COLUMN COUNT(NUM_EJEMPLAR) HEADING 'Numero de ejemplares'


BREAK ON TITULO SKIP 2
BREAK ON REPORT
COMPUTE SUM LABEL 'Total libros' OF COUNT(NUM_EJEMPLAR) ON REPORT

SPOOL ListadoEjemplares.lst

SELECT LIBRO.TITULO, COUNT(NUM_EJEMPLAR) FROM LIBRO, EJEMPLARES
WHERE LIBRO.ISBN=EJEMPLARES.ISBN GROUP BY TITULO ORDER BY TITULO;

