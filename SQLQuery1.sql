CREATE DATABASE clinica

GO

USE clinica

GO
CREATE TABLE paciente(
num_beneficiario INT NOT NULL,
nome VARCHAR(100)    NOT NULL,
logradouro VARCHAR(200) NOT NULL,
numero INT NOT NULL,
CEP CHAR(8) NULL,
complemento VARCHAR(255) NULL,
telefone VARCHAR(11) NOT NULL
PRIMARY KEY (num_beneficiario)
)

GO

CREATE TABLE especialidade(
id INT NOT NULL,
especialidade VARCHAR(100) NOT NULL
PRIMARY KEY (id)
)

GO

CREATE TABLE medico(
codigo INT NOT NULL,
nome VARCHAR(100) NOT NULL,
logradouro VARCHAR(200) NOT NULL,
numero INT NOT NULL,
CEP CHAR(8) NOT NULL,
complemento VARCHAR(255) NOT NULL,
contato VARCHAR(11) NOT NULL,
especialidade_id INT NOT NULL

PRIMARY KEY(codigo)
FOREIGN KEY (especialidade_id)
REFERENCES especialidade (id)
)

GO

CREATE TABLE consulta(
pacientenum_beneficiario INT NOT NULL,
medicocodigo INT NOT NULL,
data_hora datetime NOT NULL,
observacao VARCHAR(255) NOT NULL

PRIMARY KEY (data_hora),
FOREIGN KEY (pacientenum_beneficiario) 
REFERENCES paciente (num_beneficiario),
FOREIGN KEY (medicocodigo)
REFERENCES medico (codigo),
)


INSERT INTO especialidade (id, especialidade)
VALUES(1, 'Otorrinolaringologista')
INSERT INTO especialidade (id, especialidade)
VALUES(2, 'Urologista')
INSERT INTO especialidade (id, especialidade)
VALUES(3,'Geriatra')
INSERT INTO especialidade (id, especialidade)
VALUES(4, 'Pediatra')


INSERT INTO paciente (num_beneficiario, nome, logradouro, numero, CEP, complemento, telefone) 
VALUES(99901, 'Washington Silva', 'R. Anhaia', 150, 02345000, 'Casa', '922229999')

INSERT INTO paciente (num_beneficiario, nome, logradouro, numero, CEP, complemento, telefone) 
VALUES(99902, 'Luis Ricardo', 'R. Voluntários da Pátria', 2251, 03254010, 'Bloco B Apto 25', '92340987')

INSERT INTO paciente (num_beneficiario, nome, logradouro, numero, CEP, complemento, telefone) 
VALUES(99903, 'Maria Elisa', 'Av. Aguia de Haia', 1188, 06987020, 'Apto 1208', '912348765')

INSERT INTO paciente (num_beneficiario, nome, logradouro, numero, CEP, complemento, telefone) 
VALUES(99904, 'José Araujo', 'R. XV de Novembro', 18, 03678000, 'Casa', '945674312')

INSERT INTO paciente (num_beneficiario, nome, logradouro, numero, CEP, complemento, telefone) 
VALUES(99905, 'Joana Paula', 'R. 7 de Abril', 97, 01214000, 'Conjunto 3 - Apto 801', '912095674')


INSERT INTO medico VALUES
(100001, 'Ana Paula', 'R. 7 de Setembro', 256, 03698000, 'Casa', '915689456', 1)

INSERT INTO medico VALUES
(100002, 'Maria Aparecida', 'Av. Brasil', 32, '02145070', 'Casa', '923236464', 3)

INSERT INTO medico VALUES
(100003, 'Lucas Borges', 'Av. do Estado', 3210, '05241000', 'Apto 205', '963698585', 2)

INSERT INTO medico VALUES
(100004, 'Gabriel Oliveira', 'Av. Dom Helder Camara', 350, '03145000', 'Apto 602', '932458745',3)




INSERT INTO consulta (pacientenum_beneficiario, medicocodigo, data_hora, observacao)
VALUES(99901, 100002, '2021-09-04 13:20', 'Infeccao Urina')

INSERT INTO consulta (pacientenum_beneficiario, medicocodigo, data_hora, observacao)
VALUES(99902, 100003, '2021-09-04 13:15', 'Gripe')

INSERT INTO consulta (pacientenum_beneficiario, medicocodigo, data_hora, observacao)
VALUES(99901, 100001, '2021-09-04 12:30', 'Infeccao Garganta')



ALTER TABLE medico
ADD dia_atendimento	VARCHAR(100) NULL

UPDATE medico 
SET dia_atendimento = 'Segunda Feira'
WHERE codigo = 100001

UPDATE medico 
SET dia_atendimento = 'Quarta Feira'
WHERE codigo = 100002

UPDATE medico 
SET dia_atendimento = 'Segunda Feira'
WHERE codigo = 100003

UPDATE medico 
SET dia_atendimento = 'Quinta Feira'
WHERE codigo = 100004

UPDATE medico
SET logradouro = 'Av. Bras Leme'
WHERE codigo = 100003

UPDATE medico
SET numero = 876
WHERE codigo = 100003

UPDATE medico
SET CEP = 02122000
WHERE codigo = 100003

UPDATE medico
SET complemento = 'Apto 507'
WHERE codigo = 100003


 DELETE FROM especialidade
 WHERE id = 4

 SELECT * FROM especialidade
 SELECT * FROM paciente
 SELECT * FROM medico
 SELECT * FROM consulta

 EXEC sp_rename 'dbo.medico.dia_atendimento', 'dia_semana_atendimento'

ALTER TABLE consulta 
 ALTER COLUMN observacao VARCHAR(200)