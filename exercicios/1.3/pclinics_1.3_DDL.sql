CREATE DATABASE ClinicaPet;

USE ClinicaPet;

CREATE TABLE Clinicas
(
	idClinica INT PRIMARY KEY IDENTITY
	,RazaoSocial VARCHAR(200) NOT NULL
	,CNPJ VARCHAR(12) NOT NULL
	,Endereco VARCHAR(500)
);

CREATE TABLE Veterinarios
(
	idVeterinario INT PRIMARY KEY IDENTITY
	,idClinica INT FOREIGN KEY REFERENCES Clinicas(idClinica)
	,Nome VARCHAR(300) NOT NULL
	,CRMV VARCHAR(11) NOT NULL
);

CREATE TABLE TiposPets
(
	idTipoPet INT PRIMARY KEY IDENTITY
	,Descricao VARCHAR(600) NOT NULL
);

CREATE TABLE Racas
(
	idRaca INT PRIMARY KEY IDENTITY
	,idTipoPet INT FOREIGN KEY REFERENCES TiposPets(idTipoPet)
	,Descricao VARCHAR(600) NOT NULL
);

CREATE TABLE Donos
(
	idDono INT PRIMARY KEY IDENTITY
	,Nome VARCHAR(200) NOT NULL
);

CREATE TABLE Pets
(
	idPet INT PRIMARY KEY IDENTITY
	,idRaca INT FOREIGN KEY REFERENCES Racas(idRaca)
	,idDono INT FOREIGN KEY REFERENCES Donos (idDono)
	,NomePet VARCHAR(100)
	,DataNascimento VARCHAR(15)
);

CREATE TABLE Atendimentos
(
	idAtendimento INT PRIMARY KEY IDENTITY
	,idVeterinario INT FOREIGN KEY REFERENCES Veterinarios(idVeterinario)
	,idPet INT FOREIGN KEY REFERENCES Pets (idPet)
	,Diagnostico VARCHAR(600) NOT NULL
	,DataAtendimento VARCHAR(15) NOT NULL
);