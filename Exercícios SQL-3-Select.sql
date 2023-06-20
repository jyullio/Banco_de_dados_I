#CREATE DATABASE hospital;

USE hospital;

/*
CREATE TABLE paciente(
	idPaciente INT NOT NULL,
    nomePaciente VARCHAR(20) NOT NULL,
    cidade VARCHAR(20) NOT NULL,
    PRIMARY KEY(idPaciente)
);

CREATE TABLE medico(
	idMedico INT NOT NULL,
    nomeMedico VARCHAR(20) NOT NULL,
    hospital VARCHAR(20) NOT NULL,
    PRIMARY KEY(idMedico)
);

CREATE TABLE consulta(
	idConsulta INT NOT NULL,
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
    idReceita INT NOT NULL,
    PRIMARY KEY(idReceita)
);
*/

SELECT * FROM paciente WHERE paciente.cidade="Porteirinha";
SELECT consulta.data_consulta FROM consulta,medico WHERE medico.nomeMedico="João de Souza" AND medico.idMedico = consulta.idMedico;
SELECT data_consulta , nomeMedico , hospital FROM paciente,medico,consulta WHERE nomePaciente = "Marina Silva" AND consulta.idPaciente = paciente.idPaciente AND consulta.idMedico = medico.idMedico;
SELECT nomeMedicamento FROM receita,medico,consulta WHERE medico.nomeMedico="João de Souza" AND medico.idMedico = consulta.idMedico AND consulta.idConsulta = receita.idConsulta;
SELECT idMedico FROM medico WHERE idMedico NOT IN (SELECT idMedico FROM consulta);
SELECT paciente.* FROM paciente,medico,consulta WHERE paciente.cidade = "Janaúba" AND medico.idMedico = consulta.idMedico AND paciente.idPaciente = consulta.idPaciente AND medico.nomeMedico != "José da Silva";
SELECT medico.nomeMedico FROM medico,consulta WHERE medico.idMedico = consulta.idMedico AND (consulta.data_consulta < 01/04/2023 OR medico.hospital = "Hospital Geral de Montes Claros");

