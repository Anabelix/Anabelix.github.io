SET VERIFY OFF;
CLEAR SCREEN
CLEAR BREAKS
CLEAR COMPUTES
CLEAR COLUMNS
SET LINESIZE 120
SET PAGESIZE 15
SET HEADSEP |

TTITLE '=================================================================================================|BUSQUEDA DE LOS LIBROS PRESTADOS POR SOCIO|================================================================================================='
COLUMN APENOM HEADING 'Nombre'

COLUMN TITULO HEADING 'Titulo' 
COLUMN TITULO FORMAT A41
COLUMN TITULO TRUNCATED
COLUM FECHA_INICIO HEADING 'Pedido' FORMAT A10 TRUNCATED
COLUM FECHA_DEVOLUCION HEADING 'Devuelto' FORMAT A10 TRUNCATED

BREAK ON APENOM SKIP 1

ACCEPT NB PROMPT 'Introduce el socio a buscar (000SX): '
SELECT SOCIO.APENOM, LIBRO.TITULO, PRESTAMO.FECHA_INICIO, PRESTAMO.FECHA_DEVOLUCION FROM LIBRO, SOCIO, PRESTAMO
WHERE SOCIO.NUM_SOCIO=UPPER('&NB')
AND SOCIO.NUM_SOCIO=PRESTAMO.NUM_SOCIO AND LIBRO.ISBN=PRESTAMO.ISBN ORDER BY SOCIO.APENOM;