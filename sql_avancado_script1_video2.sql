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