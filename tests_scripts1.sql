# Exibe as bases existentes
SHOW DATABASES;

# Usa/seleciona a Base de Dados sakila
USE sakila;

# Exibe as tabelas da base sakila
SHOW TABLES;

# Lista o conteúdo da tabela film
SELECT * FROM film;

# Lista o conteúdo da tabela film com ID 10
SELECT * FROM film
WHERE film_id = 10;

# Exercício 1: Listar o registro com filme de 126 minutos de duração (coluna "length"):
SELECT * FROM film
WHERE length = 126;

# Ordena a listagem por ordem crescente da tabela category:
SELECT * FROM category
ORDER BY name ASC;

# Ordena a listagem por ordem decrescente da tabela category:
SELECT * FROM category
ORDER BY name DESC;

# Incrementa cinco dias o tempo de aluguel da coluna rental_duration
SELECT rental_duration, rental_duration + 5 
FROM film;

# Cria aliase da coluna rental_duration
SELECT rental_duration, rental_duration + 5 AS aluguel 
FROM film;

# Exercício 2: Traduzir as colunas title e description da tabela film
SELECT title AS Título, description AS Descrição
FROM film;

# Lista dados únicos da tabela
SELECT DISTINCT country_id, city FROM city
ORDER BY country_id;

# Lista de filmes que foram alugados por mais de 7 dias da tabela film
SELECT * FROM film
WHERE rental_duration >= 7;

# Ecercício 3: Listar os usuários desativados
SELECT * FROM customer
WHERE active != 1;

# Uso do AND
SELECT * FROM film
WHERE rental_duration = 5 AND length > 90;

# Uso do OR
SELECT * FROM film
WHERE title = "APOLLO TEEN" OR title = "ATTACKS HATE";

# Uso do NOT
SELECT * FROM film
WHERE NOT rental_duration = 7;

-- Exercício 4: Listar aluguel de um usuário com id 239 que não é
-- o aluguel com id 2346 da tabela rental
SELECT * FROM rental
WHERE customer_id = 239 AND NOT inventory_id = 2346;