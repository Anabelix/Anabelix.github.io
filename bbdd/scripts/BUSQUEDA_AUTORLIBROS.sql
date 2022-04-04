SET VERIFY OFF;
CLEAR SCREEN
CLEAR BREAKS
CLEAR COMPUTES
CLEAR COLUMNS

SET LINESIZE 75
SET PAGESIZE 15
SET HEADSEP |
TTITLE CENTER '------------------------------' SKIP1 CENTER '| BUSQUEDA DE LIBROS POR AUTOR |' SKIP1 CENTER '------------------------------' SKIP2 CENTER

ACCEPT CD PROMPT 'Introduce el codigo del autor para ver sus libros escritos (Ej: 001ML):'

COLUMN APENOM HEADING 'Nombre del autor' FORMAT A20 TRUNCATED
COLUMN TITULO HEADING 'Titulo del libro' FORMAT A41 TRUNCATED
COLUMN UBICACION HEADING 'Ubicacion' FORMAT A10 TRUNCATED

BREAK ON APENOM SKIP 2
SELECT AUTOR.APENOM, LIBRO.TITULO, TEMA.UBICACION FROM AUTOR, LIBRO, ESCRITO, TEMA
WHERE AUTOR.CODIGO = UPPER('&CD')
AND AUTOR.CODIGO=ESCRITO.CODIGO
AND ESCRITO.ISBN=LIBRO.ISBN
AND TEMA.CODIGO=LIBRO.CODIGO
GROUP BY TEMA.UBICACION, AUTOR.APENOM, LIBRO.TITULO
ORDER BY AUTOR.APENOM;