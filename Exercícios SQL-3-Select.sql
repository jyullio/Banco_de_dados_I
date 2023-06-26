CREATE DATABASE hospital;

USE hospital;

CREATE TABLE paciente(
	idPaciente INT NOT NULL AUTO_INCREMENT,
    nomePaciente VARCHAR(20) NOT NULL,
    cidade VARCHAR(20) NOT NULL,
    PRIMARY KEY(idPaciente)
);

CREATE TABLE medico(
	idMedico INT NOT NULL AUTO_INCREMENT,
    nomeMedico VARCHAR(20) NOT NULL,
    hospital VARCHAR(20) NOT NULL,
    PRIMARY KEY(idMedico)
);

CREATE TABLE consulta(
	idConsulta INT NOT NULL AUTO_INCREMENT,
    data_consulta DATE NOT NULL,
    idMedico INT NOT NULL,
    idPaciente INT NOT NULL,
    PRIMARY KEY(idConsulta),
    FOREIGN KEY(idMedico) REFERENCES medico(idMedico),
    FOREIGN KEY(idPaciente) REFERENCES paciente(idPaciente)
);

CREATE TABLE receita(
	nomeMedicamento VARCHAR(20) UNIQUE,
    idConsulta INT NOT NULL,
    idReceita INT NOT NULL AUTO_INCREMENT,
    PRIMARY KEY(idReceita)
);



INSERT INTO paciente (nomePaciente, cidade)
VALUES ('Clara Silva', 'Janauba');
INSERT INTO medico (nomeMedico,hospital)
VALUES ('Julle', 'Reginal2');
INSERT INTO consulta (data_consulta,idMedico,idPaciente)
VALUES ('2023-06-14', 1,1);
INSERT INTO receita (idConsulta,idReceita, nomeMedicamento)
VALUES (1,1,'saxenda');

INSERT INTO paciente (nomePaciente, cidade)
VALUES ('Ana lora', 'Porteirinha');
INSERT INTO medico (nomeMedico,hospital)
VALUES ('Joao de Souza', 'Reginal1');
INSERT INTO consulta (data_consulta,idMedico,idPaciente)
VALUES ('2023-06-10', 2,2);
INSERT INTO receita (idConsulta,idReceita, nomeMedicamento)
VALUES (2,2,'Rivotril');

INSERT INTO paciente (nomePaciente, cidade)
VALUES ('Larissa', 'Porteirinha');
INSERT INTO medico (nomeMedico,hospital)
VALUES ('José da Silva', 'Reginal1');
INSERT INTO consulta (data_consulta,idMedico,idPaciente)
VALUES ('2023-06-14', 3,3);
INSERT INTO receita (idConsulta,idReceita, nomeMedicamento)
VALUES (3,3,'Paracetamol');

INSERT INTO paciente (nomePaciente, cidade)
VALUES ('Marina Silva', 'Porteirinha');
INSERT INTO medico (nomeMedico,hospital)
VALUES ('Rubia', 'Reginal3');
INSERT INTO consulta (data_consulta,idMedico,idPaciente)
VALUES ('2023-06-14', 4,4);
INSERT INTO receita (idConsulta,idReceita, nomeMedicamento)
VALUES (4,4,'Dipirona');

INSERT INTO medico (nomeMedico,hospital)
VALUES ('Luiz Fernando', 'Reginal4');


#1
SELECT * 
FROM paciente
WHERE paciente.cidade = 'Porteirinha';

#2
SELECT consulta.data_consulta 
FROM consulta JOIN medico ON consulta.idMedico = medico.idMedico AND medico.nomeMedico = 'Joao de Souza';

#3
SELECT consulta.data_consulta , medico.nomeMedico , medico.hospital 
FROM consulta JOIN medico ON consulta.idMedico = medico.idMedico
JOIN paciente ON consulta.idPaciente = paciente.idPaciente AND paciente.nomePaciente = 'Marina Silva';

#4
SELECT receita.nomeMedicamento 
FROM consulta JOIN receita USING(idConsulta)
JOIN medico ON medico.idMedico = consulta.idMedico AND medico.nomeMedico = 'Joao de Souza'; 

#5
SELECT idMedico 
FROM medico 
WHERE idMedico NOT IN( SELECT idMedico FROM consulta);

#6
SELECT paciente.nomePaciente
FROM consulta JOIN paciente ON consulta.idPaciente = paciente.idPaciente AND paciente.cidade = 'Janauba'
JOIN medico ON consulta.idMedico = medico.idMedico AND medico.nomeMedico != 'Jose da Silva';


#7
SELECT medico.nomeMedico 
FROM consulta JOIN medico ON consulta.idMedico = medico.idMedico AND (data_consulta < 01-04-2023 OR hospital = 'hospgeral');




