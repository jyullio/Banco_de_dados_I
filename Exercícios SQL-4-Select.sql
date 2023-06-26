CREATE DATABASE empresa_teste;

USE empresa_teste;

CREATE TABLE fornecedor(

	idFornecedor INT NOT NULL AUTO_INCREMENT,
    nomeFantasia VARCHAR(20) NOT NULL,
    telefone VARCHAR(30) NOT NULL,
	PRIMARY KEY(idFornecedor)
);

CREATE TABLE produto(
	
    idProduto INT NOT NULL AUTO_INCREMENT,
    nomeProduto VARCHAR(20) NOT NULL,
    precoUnitario NUMERIC(12,2) NOT NULL,
    idFornecedor INT NOT NULL,
    PRIMARY KEY(idProduto),
	FOREIGN KEY(idFornecedor) REFERENCES fornecedor(idFornecedor)
	
);

CREATE TABLE cliente(

	idCliente INT NOT NULL AUTO_INCREMENT,
    nomeCliente VARCHAR(20) NOT NULL,
    rua VARCHAR(20) NOT NULL,
    numero INT NOT NULL,
    fone VARCHAR(20) NOT NULL,
    bairo VARCHAR(20) NOT NULL,
    cidade VARCHAR(20) NOT NULL,
    estado CHAR(2) NOT NULL,
    PRIMARY KEY(idCliente)

);

CREATE TABLE notaFiscal(

	numeroNota INT NOT NULL,
    valorNota NUMERIC(12,2) NOT NULL,
    dataEmissao DATE NOT NULL,
    idCliente INT NOT NULL,
	PRIMARY KEY(numeroNota),
    FOREIGN KEY(idCliente) REFERENCES cliente(idCliente)
    
);

CREATE TABLE itemNota(
	
    numeroNota INT NOT NULL,
    idProduto INT NOT NULL,
    qtdeItem INT NOT NULL,
    valorItem NUMERIC(12,2) NOT NULL,
    UNIQUE(numeroNota),
	UNIQUE(idProduto),
    FOREIGN KEY(numeroNota) REFERENCES notaFiscal(numeroNota),
    FOREIGN KEY(idProduto) REFERENCES produto(idProduto)
    
);

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

#1-

#a)
SELECT * FROM notaFiscal WHERE numeroNota BETWEEN 1000 AND 2000;

#b)
SELECT * FROM produto WHERE precoUnitario < 10.00;

#c)
SELECT idProduto
FROM itemNota
WHERE qtdeItem > 10; 

#d)
SELECT cliente.nomeCliente , notaFiscal.dataEmissao
FROM notaFiscal JOIN cliente 
ON notaFiscal.idCliente = cliente.idCliente;

#e)
SELECT cliente.estado
FROM notaFiscal JOIN cliente 
ON notaFiscal.idCliente = cliente.idCliente AND notaFiscal.valorNota > 5000.00;

#2-

#a)
SELECT * 
FROM Departamento;

#b)
SELECT Pnome + Unome
FROM Funcionario
WHERE Salario > 30000.00;

#c)
SELECT Pnome, Unome, Salario
FROM Funcionario
WHERE Pnome LIKE 'A%';

#d)
SELECT Unome , DataNasc
FROM Funcionario
WHERE DataNasc BETWEEN 1950-01-01 AND 1970-01-01;

#e)
#Não existe possibilidade de achar horas trabalhadas por funcionários

#f)
#Não existe possibilidade de achar horas trabalhadas por funcionários








