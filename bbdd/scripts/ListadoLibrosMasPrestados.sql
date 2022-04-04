REM ****** Nombre: ListadoLibrosMasPrestados.sql ******
REM ****** Descripcion: Informe sobre los socios que son morosos *****
CLEAR SCREEN
CLEAR BREAKS
CLEAR COMPUTES
CLEAR COLUMNS

SET LINESIZE 65
SET PAGESIZE 17
SET HEADSEP |

TTITLE '=================================================================================================|LISTADO DE LOS LIBROS MAS PRESTADOS|================================================================================================='
COLUMN TITULO HEADING 'Titulo' 
COLUMN TITULO FORMAT A41
COLUMN TITULO TRUNCATED
COLUMN ISBN HEADING 'ISBN'
COLUMN COUNT(PRESTAMO.ISBN) HEADING 'Veces prestado'

BREAK ON TITULO SKIP 1

SPOOL ListadoLibrosMasPrestados.lst

SELECT LIBRO.TITULO, PRESTAMO.ISBN, COUNT(PRESTAMO.ISBN) FROM LIBRO, PRESTAMO
WHERE LIBRO.ISBN=PRESTAMO.ISBN
HAVING COUNT(*)>2
GROUP BY LIBRO.TITULO, PRESTAMO.ISBN
ORDER BY LIBRO.TITULO;

