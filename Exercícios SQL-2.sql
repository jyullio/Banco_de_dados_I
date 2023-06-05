CREATE DATABASE empresa;

USE empresa;

CREATE TABLE Dependente(
	NomeDependente VARCHAR(60) NOT NULL,
    FCPF VARCHAR(15) NOT NULL,
    Sexo CHAR NOT NULL,
    Datanasc DATE NOT NULL,
    Parentesco VARCHAR(20) NOT NULL,
    PRIMARY KEY(NomeDependente)
);

CREATE TABLE Funcionario(
	CPF VARCHAR(15) NOT NULL,
    CPFsuperv VARCHAR(15) NOT NULL,
    numDept INT NOT NULL,
    Pnome VARCHAR(60) NOT NULL,
    Minicial CHAR NOT NULL,
    Unome VARCHAR(30) NOT NULL,
    DataNasc DATE NOT NULL,
    Endereco VARCHAR(80) NOT NULL,
    Sexo CHAR NOT NULL,
    Salario DOUBLE NOT NULL,
    PRIMARY KEY(CPF)
);

CREATE TABLE Trabalha_em(
	projNumero INT NOT NULL,
    FCPF VARCHAR(15) NOT NULL
);

CREATE TABLE Localizacao_departamento(
	Dlocal VARCHAR(30) NOT NULL,
    Dnumero INT NOT NULL,
    PRIMARY KEY(Dlocal)
);

CREATE TABLE Departamento(
	Dnumero INT NOT NULL,
    CPFgerente VARCHAR(15) NOT NULL,
    Dnome VARCHAR(30) NOT NULL,
    DataInicio DATE NOT NULL,
	PRIMARY KEY(Dnumero)
);

CREATE TABLE Projeto(
	Projnumero INT NOT NULL,
    dnum INT NOT NULL,
    Projnome VARCHAR(30) NOT NULL,
    Projlocal VARCHAR(30) NOT NULL,
	PRIMARY KEY(Projnumero)
);

ALTER TABLE Dependente ADD FOREIGN KEY(FCPF) REFERENCES Funcionario(CPF);
ALTER TABLE Funcionario ADD FOREIGN KEY(CPFsuperv) REFERENCES Funcionario(CPF);
ALTER TABLE Funcionario ADD FOREIGN KEY(numDept) REFERENCES Departamento(Dnumero);
ALTER TABLE Localizacao_departamento ADD FOREIGN KEY(Dnumero) REFERENCES Departamento(Dnumero);
ALTER TABLE Departamento ADD FOREIGN KEY(CPFgerente) REFERENCES Funcionario(CPF);
ALTER TABLE Projeto ADD FOREIGN KEY(dnum) REFERENCES Departamento(Dnumero);
ALTER TABLE Trabalha_em ADD FOREIGN KEY(projNumero) REFERENCES Projeto(Projnumero);
ALTER TABLE Trabalha_em ADD FOREIGN KEY(FCPF) REFERENCES Funcionario(CPF);








