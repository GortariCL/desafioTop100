-- 1. Crear base de datos llamada películas.

CREATE DATABASE peliculas;

--Crear tabla peliculas
CREATE TABLE peliculas(
    id INT NOT NULL UNIQUE,
    pelicula VARCHAR (100) NOT NULL,
    anio_estreno INT NOT NULL, 
    director VARCHAR (25) NOT NULL,
    PRIMARY KEY (id)
);

--Crear tabla reparto
CREATE TABLE reparto(
    id INT NOT NULL,
    actor VARCHAR (100) NOT NULL,
    FOREIGN KEY (id) REFERENCES peliculas (id)
);

-- 2. Cargar ambos archivos a su tabla correspondiente.

\copy peliculas FROM 'C:\Users\ferna\OneDrive\Desktop\apoyoDesafio\peliculas.csv' csv header;
\copy reparto FROM 'C:\Users\ferna\OneDrive\Desktop\apoyoDesafio\reparto.csv' csv header;


-- 3. Obtener el ID de la película “Titanic”.

SELECT id FROM peliculas WHERE pelicula = 'Titanic';

-- 4. Listar a todos los actores que aparecen en la película "Titanic".

SELECT actor FROM reparto WHERE id = 2;

-- 5. Consultar en cuántas películas del top 100 participa Harrison Ford.

SELECT COUNT(actor) as participacion FROM reparto WHERE actor = 'Harrison Ford';

-- 6. Indicar las películas estrenadas entre los años 1990 y 1999 ordenadas por título de
-- manera ascendente.

SELECT * FROM peliculas WHERE anio_estreno BETWEEN 1990 AND 1999 ORDER BY pelicula ASC;

-- 7. Hacer una consulta SQL que muestre los títulos con su longitud, la longitud debe ser
-- nombrado para la consulta como “longitud_titulo”.

SELECT pelicula, LENGTH(pelicula) AS longitud_titulo FROM peliculas;

-- 8. Consultar cual es la longitud más grande entre todos los títulos de las películas.
SELECT MAX(LENGTH(pelicula)) FROM peliculas;