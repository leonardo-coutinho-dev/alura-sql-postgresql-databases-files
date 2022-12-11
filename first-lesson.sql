-- CREATE AND REMOVE DATABASE

CREATE DATABASE alura;

DROP DATABASE alura;

-- CREATE TABLE

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

-- CREATE - Insert information in the columns of the table

INSERT INTO aluno 
			(nome, cpf, observacao, idade, dinheiro, altura, ativo, data_nascimento, hora_aula, data_matricula) 
		VALUES 
			('Leonardo', '42152213823', 'Lorem ipsum dolor sit amet', 35, 350.5, 1.81, true, '1997-05-08', '17:30:00', '2022-08-12 12:32:45');

INSERT INTO aluno 
			(nome, cpf, observacao, idade, dinheiro, altura, ativo, data_nascimento, hora_aula, data_matricula) 
		VALUES 
			('Josemiaz', '12345678911', 'Lorem ipsum dolor sit amet', 25, 30.5, 1.41, true, '1998-06-08', '14:10:00', '2022-08-12 12:35:45');
			
-- READ - Read information from the table

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

SELET * FROM aluno WHERE

SELECT * FROM aluno;

SELECT * FROM escola;
			
-- UPDATE - Update information of the table

UPDATE aluno SET nome = 'Burina Rafaela dos Santos Cardozo',
        cpf = '42152213823',
        observacao = 'Lorem ipsum dolor sit amet',
        idade = 40,
        dinheiro = 30.5,
        altura = 1.67,
        ativo = false,
        data_nascimento = '1998-10-10',
        hora_aula = '17:50:00',
        data_matricula = '2022-12-08 16:40:00'
		WHERE id = 2;

-- DELETE - Delete informatiom from the table

DELETE FROM aluno WHERE id = 1;

DELETE FROM aluno WHERE id = 2;