CREATE DATABASE Locadora;

USE Locadora;

CREATE TABLE Marca
(
	idMarca INT PRIMARY KEY IDENTITY
	,Nome	VARCHAR(200) NOT NULL
);

CREATE TABLE Cliente
(
	idCliente INT PRIMARY KEY IDENTITY
	,Nome	VARCHAR(200) NOT NULL
	,CPF VARCHAR(11) NOT NULL
);

CREATE TABLE Modelo
(
	idModelo INT PRIMARY KEY IDENTITY
	,idMarca INT FOREIGN KEY REFERENCES Marca (idMarca)
	,NomeDoModelo VARCHAR (200) NOT NULL
);

CREATE TABLE Empresas
(
	idEmpresa INT PRIMARY KEY IDENTITY
	,Nome VARCHAR(200) NOT NULL
);

CREATE TABLE Veiculos
(
	idVeiculo INT PRIMARY KEY IDENTITY
	,idEmpresa INT FOREIGN KEY REFERENCES Empresas (idEmpresa)
	,idModelo INT FOREIGN KEY REFERENCES Modelo (idModelo)
	,Placa VARCHAR(7) NOT NULL
);
DROP TABLE Alugueis;
CREATE TABLE Alugueis
(
	idAluguel INT PRIMARY KEY IDENTITY
	,idCliente INT FOREIGN KEY REFERENCES Cliente (idCliente)
	,idVeiculo INT FOREIGN KEY REFERENCES Veiculos (idVeiculo)
	,DataInicio VARCHAR(10) NOT NULL
	,DataFim VARCHAR(10) NOT NULL
);
