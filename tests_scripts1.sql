-- Exibe as bases existentes
SHOW DATABASES;

-- Usa/seleciona a Base de Dados sakila
USE sakila;

-- Exibe as tabelas da base sakila
SHOW TABLES;

-- Lista o conteúdo da tabela film
SELECT * FROM film;

-- Lista o conteúdo da tabela film com ID 10
SELECT * FROM film
WHERE film_id = 10;

-- Exercício 1: Listar o registro com filme de 126 minutos de duração (coluna "length"):
SELECT * FROM film
WHERE length = 126;

-- Ordena a listagem por ordem crescente da tabela category:
SELECT * FROM category
ORDER BY name ASC;

-- Ordena a listagem por ordem decrescente da tabela category:
SELECT * FROM category
ORDER BY name DESC;

-- Incrementa cinco dias o tempo de aluguel da coluna rental_duration
SELECT rental_duration, rental_duration + 5 
FROM film;

-- Cria aliase da coluna rental_duration
SELECT rental_duration, rental_duration + 5 AS aluguel 
FROM film;

-- Exercício 2: Traduzir as colunas title e description da tabela film
SELECT title AS Título, description AS Descrição
FROM film;

-- Lista dados únicos da tabela
SELECT DISTINCT country_id, city FROM city
ORDER BY country_id;

-- Lista de filmes que foram alugados por mais de 7 dias da tabela film
SELECT * FROM film
WHERE rental_duration >= 7;

-- Ecercício 3: Listar os usuários desativados
SELECT * FROM customer
WHERE active != 1;

-- Uso do AND
SELECT * FROM film
WHERE rental_duration = 5 AND length > 90;

-- Uso do OR
SELECT * FROM film
WHERE title = "APOLLO TEEN" OR title = "ATTACKS HATE";

-- Uso do NOT
SELECT * FROM film
WHERE NOT rental_duration = 7;

-- Exercício 4: Listar aluguel de um usuário com id 239 que não é
-- o aluguel com id 2346 da tabela rental
-- Possbilidade 1:
SELECT * FROM rental
WHERE customer_id = 239 AND NOT inventory_id = 2346;

-- Possbilidade 2:
SELECT * FROM rental
WHERE customer_id = 239 AND inventory_id != 2346;

-- Comparação com o operador IN
SELECT * FROM film
WHERE length IN(60, 70, 90, 120);

-- Uso do between para intervalos
SELECT * FROM film
WHERE length BETWEEN 60 AND 120;

-- Exercício 5: selecionar os filmes com replacement_cost entre 20 e 25 e ordenar do maior valor para o menor
SELECT * FROM film
WHERE replacement_cost BETWEEN 20 AND 25
ORDER BY replacement_cost DESC;

-- Seleciona valor que contém determinada string usando LIKE
SELECT * FROM film
WHERE title LIKE("%aladdin%");

-- Seleciona valor que começa com determinada string usando LIKE
SELECT * FROM film
WHERE title LIKE("alad%");

-- Seleciona valor que termina com determinada string usando LIKE
SELECT * FROM film
WHERE title LIKE("%ey");

-- Exercício 6: Filmes que contenham Drama
SELECT * FROM film
WHERE description LIKE("%drama%");

-- Uso de expressões regulares
-- Seleciona valor que contém determinada string
SELECT * FROM film
WHERE title REGEXP("aca");

-- Seleciona valor que começa com determinada string
SELECT * FROM film
WHERE title REGEXP("^aca");

-- Seleciona valor que termina com determinada string
SELECT * FROM film
WHERE title REGEXP("my$");

-- Exercício 7: Listar last_name que termina com son da tabela customer
-- Solução 1 com expressão regular
SELECT * FROM customer
WHERE last_name REGEXP("son$");

-- Solução 2 com LIKE
SELECT * FROM customer
WHERE last_name LIKE("%son");

-- Uso de agregação com COUNT
SELECT COUNT(*) AS "Filmes com 6 dias de aluguel" FROM film
WHERE rental_duration = 6;

-- Exercício 8: Selecionar 3 filmes com menor duração de aluguel
SELECT * FROM film
ORDER BY rental_duration ASC
LIMIT 3;

-- Unir tabelas com join das tabelas customer e address
SELECT * FROM customer
JOIN address
ON customer.address_id = address.address_id;

-- Join em múltiplas tabelas

-- Exercício 9: Nome do filme, nome e sobrenome do autor
SELECT film.title, actor.first_name, actor.last_name FROM film
JOIN film_actor
ON film.film_id = film_actor.film_id
JOIN actor
ON actor.actor_id = film_actor.actor_id;

-- Simplificando com USING
SELECT film.title, actor.first_name, actor.last_name FROM film
JOIN film_actor
USING(film_id)
JOIN actor
USING(actor_id);