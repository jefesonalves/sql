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

# Traduzir as colunas title e description da tabela film
SELECT title AS Título, description AS Descrição
FROM film;