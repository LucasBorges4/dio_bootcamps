-- Tabela de Funcionários
drop database oficina;
CREATE DATABASE IF NOT EXISTS oficina;
USE oficina;

CREATE TABLE Funcionarios (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(50) NOT NULL,
    Cargo VARCHAR(50),
    Salario DECIMAL(10, 2),
    DataContratacao DATE,
    DataNascimento DATE
);

-- Tabela de Clientes
CREATE TABLE Clientes (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(50) NOT NULL,
    Telefone VARCHAR(15),
    Email VARCHAR(100),
    NumeroVisitas INT
);

-- Tabela de Veículos
CREATE TABLE Veiculos (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    Marca VARCHAR(50),
    Modelo VARCHAR(50),
    Ano INT,
    Placa VARCHAR(10) UNIQUE,
    TipoVeiculo ENUM('Carro', 'Moto', 'Caminhão', 'Caminhonete')
);

-- Tabela de Serviços
CREATE TABLE Servicos (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    TipoServico ENUM('Manutenção geral', 'Troca de peça', 'Troca de óleo', 'Troca de pneu', 'Reparo na lataria', 'Limpeza', 'Elétrica', 'Outro') NOT NULL,
    Descricao VARCHAR(100) NOT NULL,
    Preco DECIMAL(10, 2) NOT NULL
);

-- Tabela de Produtos
CREATE TABLE Produtos (
    IDProduto INT PRIMARY KEY AUTO_INCREMENT,
    NomeProduto VARCHAR(100) NOT NULL,
    Categoria VARCHAR(50) NOT NULL, -- Por exemplo: "Acessórios", "Ferramentas", "EPIs", etc.
    Preco DECIMAL(10, 2) NOT NULL,
    Estoque INT NOT NULL
);

-- Tabela de Ordens de Serviço
CREATE TABLE OrdensServico (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    ClienteID INT,
    VeiculoID INT,
    FuncionarioID INT,
    GerenteServicoID INT,
    DataEntrada DATETIME,
    DataSaida DATETIME,
    ValorTotal DECIMAL(10, 2),
    FOREIGN KEY (ClienteID) REFERENCES Clientes(ID),
    FOREIGN KEY (VeiculoID) REFERENCES Veiculos(ID),
    FOREIGN KEY (FuncionarioID) REFERENCES Funcionarios(ID),
    FOREIGN KEY (GerenteServicoID) REFERENCES Funcionarios(ID)
);

-- Tabela de Métodos de Pagamento
CREATE TABLE MetodosPagamento (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    Metodo VARCHAR(50) NOT NULL
);
