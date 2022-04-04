REM ****** Nombre: ListadoLibrosPrestados.sql ******
REM ****** Descripcion: Informe sobre los socios que son morosos ******
CLEAR SCREEN
CLEAR BREAKS
CLEAR COMPUTES
CLEAR COLUMNS
SET LINESIZE 82
SET PAGESIZE 50
SET HEADSEP |

TTITLE '=================================================================================================|LISTADO DE TODOS LOS LIBROS PRESTADOS|================================================================================================='
COLUMN APENOM HEADING 'Nombre'

COLUMN TITULO HEADING 'Titulo' 
COLUMN TITULO FORMAT A41
COLUMN TITULO TRUNCATED

BREAK ON APENOM SKIP 1

SPOOL ListadoLibrosPrestados.lst

SELECT SOCIO.APENOM, LIBRO.TITULO FROM LIBRO, SOCIO, PRESTAMO
WHERE SOCIO.NUM_SOCIO=PRESTAMO.NUM_SOCIO AND LIBRO.ISBN=PRESTAMO.ISBN ORDER BY SOCIO.APENOM;