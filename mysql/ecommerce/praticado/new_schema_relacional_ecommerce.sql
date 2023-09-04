-- Crie o banco de dados 'ecommerce' se ainda não existir
drop database ecommerce;
CREATE DATABASE IF NOT EXISTS ecommerce;
USE ecommerce;
-- Crie a tabela 'cliente'
CREATE TABLE cliente (
    idCliente INT AUTO_INCREMENT PRIMARY KEY,
    FName VARCHAR(10),
    LName VARCHAR(45),
    email VARCHAR(45),
    CPF VARCHAR(11),
    endereco VARCHAR(45),
    dataNascimento DATE
);

-- Crie a tabela 'fornecedor'
CREATE TABLE fornecedor (
    idFornecedor INT AUTO_INCREMENT PRIMARY KEY,
    razaoSocial VARCHAR(45),
    CNPJ VARCHAR(45),
    endereco VARCHAR(45),
    prioridade ENUM('1', '2', '3', '4', '5')
);

-- Crie a tabela 'produto'
CREATE TABLE produto (
    idProduto INT AUTO_INCREMENT PRIMARY KEY,
    Pname VARCHAR(45),
    categoria VARCHAR(45),
    qualidade ENUM('A', 'B', 'C', 'D', 'E') DEFAULT NULL,
    avaliacao ENUM('1', '2', '3', '4', '5') DEFAULT '1',
    quantidade INT,
    precoUnidade FLOAT,
    precoTotal DOUBLE,
    classification_kids BOOLEAN DEFAULT FALSE
);

-- Crie a tabela 'estoque'
CREATE TABLE estoque (
    idEstoque INT AUTO_INCREMENT PRIMARY KEY,
    local VARCHAR(45),
    endereco VARCHAR(45),
    nomeEncarregado VARCHAR(45),
    disponibilidadeEmbarque VARCHAR(45),
    ultimoAcessoEstoque DATE
);

-- Crie a tabela de relacionamento 'produto_has_estoque'
CREATE TABLE produto_has_estoque (
    Estoque_idEstoque INT,
    Produto_idProduto INT,
    Quantidade INT,
    PRIMARY KEY (Estoque_idEstoque, Produto_idProduto),
    FOREIGN KEY (Estoque_idEstoque) REFERENCES estoque(idEstoque),
    FOREIGN KEY (Produto_idProduto) REFERENCES produto(idProduto)
);

-- Crie a tabela 'terceiro_vendedor'
CREATE TABLE terceiro_vendedor (
    idTerceiroVendedor INT AUTO_INCREMENT PRIMARY KEY,
    razaoSocial VARCHAR(45),
    endereco VARCHAR(45),
    CNPJ VARCHAR(45),
    vendedorComissionado ENUM('Comissionado', 'Não Comissionado') DEFAULT 'Comissionado'
);

-- Crie a tabela de relacionamento 'produtos_vendedor'
CREATE TABLE produtos_vendedor (
    TerceiroVendedor_idTerceiroVendedor INT,
    Produto_idProduto INT,
    PRIMARY KEY (TerceiroVendedor_idTerceiroVendedor, Produto_idProduto),
    FOREIGN KEY (TerceiroVendedor_idTerceiroVendedor) REFERENCES terceiro_vendedor(idTerceiroVendedor),
    FOREIGN KEY (Produto_idProduto) REFERENCES produto(idProduto)
);

-- Crie a tabela de relacionamento 'disponibilizando_um_produto'
CREATE TABLE disponibilizando_um_produto (
    Fornecedor_idFornecedor INT,
    Produto_idProduto INT,
    PRIMARY KEY (Fornecedor_idFornecedor, Produto_idProduto),
    FOREIGN KEY (Fornecedor_idFornecedor) REFERENCES fornecedor(idFornecedor),
    FOREIGN KEY (Produto_idProduto) REFERENCES produto(idProduto)
);

-- Crie a tabela 'relacao_produto_pedido'
CREATE TABLE relacao_produto_pedido (
    Produto_idProduto INT,
    Pedido_idPedido INT,
    Quantidade INT,
    Status ENUM('Disponivel', 'Fora de estoque') DEFAULT 'Disponivel',
    PRIMARY KEY (Produto_idProduto, Pedido_idPedido),
    FOREIGN KEY (Produto_idProduto) REFERENCES produto(idProduto)
);

-- Crie a tabela 'pedido'
CREATE TABLE pedido (
    idPedido INT AUTO_INCREMENT PRIMARY KEY,
    statusPedido ENUM('Em andamento', 'Processando', 'Enviado', 'Entregue'),
    descricao VARCHAR(45),
    frete FLOAT,
    outrosDetalhes VARCHAR(45)
);

-- Crie a tabela 'carrinho'
CREATE TABLE carrinho (
    idCarrinho INT AUTO_INCREMENT PRIMARY KEY,
    dataCriacao DATE,
    Cliente_idCliente INT,
    FOREIGN KEY (Cliente_idCliente) REFERENCES cliente(idCliente)
);

-- Crie a tabela 'carrinho_itens'
CREATE TABLE carrinho_itens (
    idCarrinho_itens INT AUTO_INCREMENT PRIMARY KEY,
    Quantidade INT,
    Carrinho_idCarrinho INT,
    Produto_idProduto INT,
    FOREIGN KEY (Carrinho_idCarrinho) REFERENCES carrinho(idCarrinho),
    FOREIGN KEY (Produto_idProduto) REFERENCES produto(idProduto)
);

-- Crie a tabela 'payments'
CREATE TABLE payments (
    idClient INT,
    idPayment INT,
    typePayment ENUM('Boleto', 'Cartão', 'Dois Cartões'),
    limitAvailable FLOAT,
    PRIMARY KEY (idClient, idPayment),
    FOREIGN KEY (idClient) REFERENCES cliente(idCliente)
);
