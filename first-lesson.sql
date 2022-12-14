-- CREATE AND REMOVE DATABASE

CREATE DATABASE alura;

DROP DATABASE alura;

-- CREATE TABLE

DROP TABLE aluno;

CREATE TABLE aluno(
    id SERIAL,
        nome VARCHAR(255),
        cpf CHAR(11),
        observação TEXT,
        idade INTEGER,
        dinheiro NUMERIC(10,2),
        altura REAL,
        ativo BOOLEAN,
        data_nascimento DATE,
        hora_aula TIME,
        data_matricula TIMESTAMP
);

CREATE TABLE aluno(
	id SERIAL PRIMARY KEY,
	nome VARCHAR(255) NOT NULL
);

DROP TABLE aluno_curso;

CREATE TABLE aluno_curso (
	aluno_id INTEGER,
	curso_id INTEGER,
	PRIMARY KEY(aluno_id, curso_id),
	
	FOREIGN KEY(aluno_id)
	REFERENCES aluno (id)
	-- ON DELETE RESTRICT (DEFAULT)
	ON DELETE CASCADE
	-- ON UPDATE RESTRICT (DEFAULT)
	ON UPDATE CASCADE,
	
	FOREIGN KEY(curso_id)
	REFERENCES curso (id)
);

DROP TABLE curso;

CREATE TABLE curso(
	id INTEGER NOT NULL UNIQUE,
	nome VARCHAR(255) NOT NULL
);

DROP TABLE funcionarios;

CREATE TABLE funcionarios(
	id SERIAL PRIMARY KEY,
	matricula VARCHAR(10),
	nome VARCHAR(255),
	sobrenome VARCHAR(255)
);

-- CREATE - Insert information in the columns of the table

INSERT INTO aluno (nome) VALUES ('Leonardo');

INSERT INTO aluno (nome) VALUES ('Odranoel');

INSERT INTO aluno 
			(nome, cpf, observacao, idade, dinheiro, altura, ativo, data_nascimento, hora_aula, data_matricula) 
		VALUES 
			('Leonardo', '12345678911', 'Lorem ipsum dolor sit amet', 64, 350.5, 1.81, true, '1997-05-08', '17:30:00', '2022-08-12 12:32:45');

INSERT INTO aluno 
			(nome, cpf, observacao, idade, dinheiro, altura, ativo, data_nascimento, hora_aula, data_matricula) 
		VALUES 
			('Tiroleza', '98765432100', 'Lorem ipsum dolor sit amet', 25, 30.5, 1.41, true, '1998-06-08', '14:10:00', '2022-08-12 12:35:45');
			
INSERT INTO aluno
			(nome)
		VALUES
			('Rivaldo');
			
INSERT INTO aluno
			(nome)
		VALUES
			('Tantrico');

INSERT INTO aluno
			(nome)
		VALUES
			('Nico');
			
INSERT INTO aluno_curso (aluno_id, curso_id) VALUES (1, 1);

INSERT INTO aluno_curso (aluno_id, curso_id) VALUES (2, 1);

INSERT INTO aluno_curso (aluno_id, curso_id) VALUES (3, 2);

INSERT INTO aluno_curso (aluno_id, curso_id) VALUES (4, 3);

-- ERRO: CHAVE ESTRANGEIRA

INSERT INTO aluno_curso (aluno_id, curso_id) VALUES (2, 2);

INSERT INTO aluno_curso (aluno_id, curso_id) VALUES (3, 5);

--

INSERT INTO curso (id, nome) VALUES (NULL, NULL);

INSERT INTO curso (id, nome) VALUES (1, 'HTML');

INSERT INTO curso (id, nome) VALUES (2, 'JavaScript');

INSERT INTO curso (id, nome) VALUES (3, 'CSS');

-- FUNCIONARIOS

INSERT INTO funcionarios (matricula, nome, sobrenome) VALUES ('M001', 'José', 'Malaquias');
INSERT INTO funcionarios (matricula, nome, sobrenome) VALUES ('M002', 'Estevão', 'Armando');
INSERT INTO funcionarios (matricula, nome, sobrenome) VALUES ('M003', 'Rubens', 'Senior');
INSERT INTO funcionarios (matricula, nome, sobrenome) VALUES ('M004', 'Malafaia', 'Jumento');
INSERT INTO funcionarios (matricula, nome, sobrenome) VALUES ('M005', 'Bin', 'Laden');
INSERT INTO funcionarios (matricula, nome, sobrenome) VALUES ('M006', 'Exor', 'Cista');
INSERT INTO funcionarios (matricula, nome, sobrenome) VALUES ('M007', 'Exor', 'Zista');

-- READ - Read information from the table - Busca de informações

-- SELECT COM JOIN

SELECT * FROM funcionarios;

SELECT * FROM funcionarios ORDER BY nome, id DESC;

SELECT * FROM funcionarios ORDER BY 3, 4 DESC;

SELECT * FROM funcionarios ORDER BY id ASC LIMIT 5 OFFSET 3;

SELECT 
	aluno.nome as "Nome do Aluno", 
	curso.nome as "Nome do Curso" 
	FROM aluno 
	JOIN aluno_curso ON aluno_curso.aluno_id = aluno.id 
	JOIN curso ON curso.id = aluno_curso.curso_id;

----- SELECT COM INNER JOIN

SELECT
	aluno.nome as "Nome do aluno",
	aluno_curso.curso_id as "ID do curso",
	curso.nome as "Nome do curso"
	FROM aluno
	INNER JOIN aluno_curso
	ON aluno.id = aluno_curso.aluno_id
	INNER JOIN curso
	ON aluno_curso.curso_id = curso.id;

----- SELECT COM LEFT JOIN

SELECT 
	aluno.nome as "Nome do Aluno", 
	curso.nome as "Nome do Curso" 
	FROM aluno 
	LEFT JOIN aluno_curso ON aluno_curso.aluno_id = aluno.id 
	LEFT JOIN curso ON curso.id = aluno_curso.curso_id;
	
------ SELECT COM RIGHT JOIN

SELECT 
	aluno.nome as "Nome do Aluno", 
	curso.nome as "Nome do Curso" 
	FROM aluno 
	RIGHT JOIN aluno_curso ON aluno_curso.aluno_id = aluno.id 
	RIGHT JOIN curso ON curso.id = aluno_curso.curso_id;

------ SELECT COM FULL JOIN

SELECT 
	aluno.nome as "Nome do Aluno",
	aluno.id   as "ID do aluno",
	curso.nome as "Nome do Curso",
	curso.id   as "ID do curso"
	FROM aluno 
	FULL JOIN aluno_curso ON aluno_curso.aluno_id = aluno.id 
	FULL JOIN curso ON curso.id = aluno_curso.curso_id
	ORDER BY curso.nome, aluno.id DESC;

------

SELECT 
	aluno.nome as "Nome do Aluno", 
	curso.nome as "Nome do Curso" 
	FROM aluno 
	CROSS JOIN curso;

------ 

SELECT * FROM aluno;

SELECT * FROM aluno_curso;

SELECT * FROM curso;

SELECT * FROM aluno WHERE id = 1;

SELECT * FROM aluno WHERE id = 2;

SELECT * FROM aluno WHERE id = 3;

SELECT * FROM curso WHERE id = 1;

SELECT * FROM curso WHERE id = 2;

SELECT * FROM curso WHERE id = 3;

-----

SELECT * FROM aluno WHERE id = 3;

SELECT nome FROM aluno WHERE id = 3;

SELECT nome FROM aluno WHERE id = 1;

SELECT nome, idade, altura, data_nascimento AS "Data de nascimento" FROM aluno;

SELECT * FROM aluno WHERE nome <> 'Leonardo';

SELECT * FROM aluno WHERE nome LIKE 'Josemia_';

SELECT * FROM aluno WHERE nome NOT LIKE 'Josemia_';

SELECT * FROM aluno WHERE nome LIKE 'L%';

SELECT * FROM aluno WHERE nome LIKE 'J%';

SELECT * FROM aluno WHERE nome LIKE '%z';

SELECT * FROM aluno WHERE cpf IS null;

SELECT * FROM aluno WHERE cpf IS NOT null;

SELECT * FROM aluno WHERE idade > 25;

SELECT * FROM aluno WHERE idade BETWEEN 24 AND 36;

SELECT * FROM aluno WHERE data_nascimento BETWEEN '1997-01-01' AND '1997-12-31';

SELECT * FROM aluno WHERE data_nascimento BETWEEN '1998-01-01' AND '1998-12-31';

SELECT * FROM aluno WHERE ativo IS null;

SELECT * FROM aluno WHERE ativo IS NOT null;

SELECT * FROM aluno WHERE ativo IS false;

SELECT nome, cpf FROM aluno WHERE idade IS null;

SELECT * FROM aluno WHERE nome LIKE 'T%' AND cpf IS NOT NULL;

SELECT * FROM aluno WHERE nome LIKE 'Leonardo' OR nome LIKE 'Tim Maia' OR nome LIKE 'Tiroleza';

SELECT nome, cpf, idade FROM aluno WHERE nome LIKE 'Leonardo' AND idade > 40; 

SELECT nome, cpf, idade FROM aluno WHERE nome LIKE 'Leonardo' AND idade < 40; 
			
-- UPDATE - Update information of the table

UPDATE aluno SET nome = 'Burina Rafaela dos Santos Cardozo',
        cpf = '21354687911',
        observacao = 'Lorem ipsum dolor sit amet',
        idade = 40,
        dinheiro = 30.5,
        altura = 1.67,
        ativo = false,
        data_nascimento = '1998-10-10',
        hora_aula = '17:50:00',
        data_matricula = '2022-12-08 16:40:00'
		WHERE id = 2;
		
UPDATE aluno SET nome = 'Dogofredo'
		WHERE id = 3;
		
UPDATE aluno SET id = 1
		WHERE id = 20;

-- DELETE - Delete informatiom from the table

DELETE FROM aluno WHERE id = 1;

DELETE FROM aluno WHERE id = 2;

DELETE FROM curso WHERE id = 1;

DELETE FROM curso WHERE id = 2;

-- FUNÇÕES DE AGREGAÇÃO

-- COUNT - RETORNA A QUANTIDADE DE REGISTROS
-- SUM   - RETORNA A SOMA DOS REGISTROS
-- MAX   - RETORNA O MAIOR VALOR DOS REGISTROS
-- MIN   - RETORNA O MENOR VALOR DOS REGISTROS
-- AVG   - RETORNA A MÉDIA DOS REGISTROS

SELECT COUNT(id), SUM(id), MAX(id), MIN(id), ROUND(AVG(id), 2) FROM funcionarios;

-- AGRUPANDO CONSULTAS

SELECT * FROM funcionarios;

SELECT DISTINCT nome, sobrenome FROM funcionarios ORDER BY nome;

SELECT nome, sobrenome, COUNT(id) FROM funcionarios GROUP BY 1, 2 ORDER BY nome;

-- QUANTIDADE DE ALUNOS POR CURSO

SELECT curso.nome,
	COUNT(aluno.id)
	FROM aluno
	JOIN aluno_curso ON aluno.id = aluno_curso.aluno_id
	JOIN curso ON curso.id = aluno_curso.curso_id
	GROUP BY 1
	ORDER BY 1;
	
-- FILTRAR CURSO POR QUANTIDADE DE ALUNOS
	
SELECT curso.nome,
	COUNT (aluno.id)
	FROM curso
	LEFT JOIN aluno_curso ON aluno_curso.curso_id = curso.id
	LEFT JOIN aluno ON aluno.id = aluno_curso.aluno_id
	GROUP BY 1
	HAVING COUNT (aluno.id) = 2;
	
-- NOMES DUPLICADOS
	
SELECT nome,
	COUNT(id)
	FROM funcionarios
	GROUP BY nome
	HAVING COUNT(id) > 1;

-- NOMES NÃO DUPLICADOS
	
SELECT nome,
	COUNT(id)
	FROM funcionarios
	GROUP BY nome
	HAVING COUNT(id) = 1;