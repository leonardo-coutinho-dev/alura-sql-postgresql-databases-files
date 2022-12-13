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
	REFERENCES aluno (id),
	
	FOREIGN KEY(curso_id)
	REFERENCES curso (id)
);

DROP TABLE curso;

CREATE TABLE curso(
	id INTEGER NOT NULL UNIQUE,
	nome VARCHAR(255) NOT NULL
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
			('Tederico');
			
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

INSERT INTO aluno_curso (aluno_id, curso_id) VALUES (3, 1);

-- ERRO: CHAVE ESTRANGEIRA

INSERT INTO aluno_curso (aluno_id, curso_id) VALUES (2, 2);

INSERT INTO aluno_curso (aluno_id, curso_id) VALUES (3, 5);

--

INSERT INTO curso (id, nome) VALUES (NULL, NULL);

INSERT INTO curso (id, nome) VALUES (1, 'HTML');

INSERT INTO curso (id, nome) VALUES (2, 'JavaScript');

INSERT INTO curso (id, nome) VALUES (3, 'CSS');

-- READ - Read information from the table - Busca de informações

-- SELECT COM JOIN

SELECT 
	aluno.nome as "Nome do Aluno", 
	curso.nome as "Nome do Curso" 
	FROM aluno 
	JOIN aluno_curso ON aluno_curso.aluno_id = aluno.id 
	JOIN curso ON curso.id = aluno_curso.curso_id;

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
	curso.nome as "Nome do Curso" 
	FROM aluno 
	FULL JOIN aluno_curso ON aluno_curso.aluno_id = aluno.id 
	FULL JOIN curso ON curso.id = aluno_curso.curso_id;

------

SELECT 
	aluno.nome as "Nome do Aluno", 
	curso.nome as "Nome do Curso" 
	FROM aluno 
	CROSS JOIN curso;

------ 

SELECT * FROM aluno;

SELECT * FROM aluno_curso;

SELECT * FROM aluno WHERE id = 1;

SELECT * FROM aluno WHERE id = 2;

SELECT * FROM aluno WHERE id = 3;

SELECT * FROM curso WHERE id = 1;

SELECT * FROM curso WHERE id = 2;

SELECT * FROM curso WHERE id = 3;

-----

SELECT * FROM curso;

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

-- DELETE - Delete informatiom from the table

DELETE FROM aluno WHERE id = 1;

DELETE FROM aluno WHERE id = 2;

DELETE FROM curso WHERE id = 1;

DELETE FROM curso WHERE id = 2;