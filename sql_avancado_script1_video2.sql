USE sakila;

-- Função Mínimo
SELECT MIN(length) FROM film;

-- Função Máximo
SELECT MAX(length) FROM film;

-- Função média
SELECT AVG(length) FROM film;

-- Função soma de valores
SELECT SUM(length) FROM film;

-- Exercício 1: Somar toda a quantia de pagamento e mostrar quantos pagamentos
-- foram realizados
SELECT SUM(amount) AS "Valor Total", COUNT(amount) AS "Quant. Pagamentos" FROM payment;

-- Exercício 2: Agrupar os filmes por categoria
SELECT COUNT(film_id) AS "Quant", name AS "Categoria" FROM film
JOIN film_category
USING(film_id)
JOIN category
USING(category_id)
GROUP BY(name);

-- subquery
SELECT title FROM film
WHERE
	length = (SELECT MAX(length) FROM film);
    
-- Exercício 3: Selecionar filmes com o tempo de aluguel acima da media
SELECT title AS "Título", rental_duration AS "Duração" FROM film
WHERE
	rental_duration > (SELECT AVG(rental_duration) FROM film)
ORDER BY(rental_duration) ASC;

-- Stored procedure sem argumentos
DELIMITER //
CREATE PROCEDURE usuarios_ativos ()
BEGIN
	SELECT * FROM customer
    WHERE active = 1;
END//
DELIMITER ;

-- Chamar a stored procedure criada "usuarios_ativos"
CALL usuarios_ativos()

-- Stored procedure com argumentos
DELIMITER //
CREATE PROCEDURE get_movies_from_category (category_name VARCHAR(100))
BEGIN
	SELECT title AS "Título", name AS "Categoria" FROM film
    JOIN film_category
    USING(film_id)
    JOIN category
    USING(category_id)
    WHERE name = category_name;
END//
DELIMITER ;

-- Chamar a stored procedure criada "get_movies_from_category" com o argumento
call get_movies_from_category("Horror")

-- Exercício 4: Procedure que lista filmes maior ou igual a um rental_duration
-- de um argumento
DELIMITER //
CREATE PROCEDURE get_movies_maior_igual_arg (duration INT)
BEGIN
	SELECT title, rental_duration FROM film
    WHERE rental_duration >= duration;
END//
DELIMITER ;

CALL get_movies_maior_igual_arg(2)