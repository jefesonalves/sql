-- Cria base de dados
CREATE DATABASE sbd;

-- Usa a base de dados sbd
USE sbd;

-- Cria tabela Users
CREATE TABLE users(
	user_id INT NOT NULL AUTO_INCREMENT,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    sallary INT,
    dob DATE,
    PRIMARY KEY(user_id)
);

-- Insere dados na tabela Users
INSERT INTO users(first_name, last_name, sallary, dob)
VALUES("Jefeson", "Alves", 2000, "1990-10-12");

-- Exercício 10: Inserir um dado na tabela
INSERT INTO users(first_name, last_name, sallary, dob)
VALUES("João", "Silva", 3000, "1980-11-10");

-- Insere múltiplos valores
INSERT INTO users(first_name, last_name, sallary, dob)
VALUES("Alex", "Kids", 6000, "1970-10-07"),
("Marcos", "Alves", 16000, "1973-09-07"),
("José", "da Silva", 56000, "1975-05-07");

-- Altera valor de uma tabela
UPDATE users
SET sallary = 4000
WHERE user_id = 1;

-- Exclui valores de uma tabela
DELETE FROM users
WHERE user_id = 5;