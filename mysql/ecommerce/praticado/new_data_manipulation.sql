-- Inserir dados na tabela 'cliente'
INSERT INTO cliente (FName, LName, email, CPF, endereco, dataNascimento)
VALUES
    ('João', 'Silva', 'joao@email.com', '12345678901', 'Rua A, 123', '1990-01-15'),
    ('Maria', 'Santos', 'maria@email.com', '98765432101', 'Rua B, 456', '1985-03-20'),
    ('Ana', 'Santana', 'ana@email.com', '55555555555', 'Rua E, 789', '1995-07-10'),
    ('Pedro', 'Ribeiro', 'pedro@email.com', '66666666666', 'Rua F, 456', '1988-12-18'),
    ('Lúcia', 'Oliveira', 'lucia@email.com', '77777777777', 'Rua G, 123', '1992-03-25');

-- Inserir dados na tabela 'fornecedor'
INSERT INTO fornecedor (razaoSocial, CNPJ, endereco, prioridade)
VALUES
    ('Fornecedor A', '12345678901234', 'Av. X, 789', '1'),
    ('Fornecedor B', '98765432109876', 'Av. Y, 567', '2'),
    ('Fornecedor C', '33333333333333', 'Av. W, 123', '3'),
    ('Fornecedor D', '44444444444444', 'Av. X, 456', '4'),
    ('Fornecedor E', '55555555555555', 'Av. Z, 789', '5');

-- Inserir dados na tabela 'produto'
INSERT INTO produto (Pname, categoria, qualidade, quantidade, precoUnidade, precoTotal, classification_kids)
VALUES
    ('Smartphone', 'Eletrônico', 'A', 100, 500.00, 50000.00, 0),
    ('Camiseta', 'Vestimenta', 'B', 200, 30.00, 6000.00, 1),
    ('Boneca', 'Brinquedos', 'C', 150, 25.00, 3750.00, 1),
    ('Arroz', 'Alimentos', 'A', 300, 5.00, 1500.00, 0),
    ('Sofá', 'Móveis', 'B', 50, 150.00, 7500.00, 0);

-- Inserir dados na tabela 'estoque'
INSERT INTO estoque (local, endereco, nomeEncarregado, disponibilidadeEmbarque, ultimoAcessoEstoque)
VALUES
    ('Depósito A', 'Rua C, 789', 'José', 'Sim', '2023-09-01'),
    ('Depósito B', 'Rua D, 456', 'Maria', 'Não', '2023-09-02'),
    ('Depósito C', 'Rua H, 789', 'Marcos', 'Sim', '2023-09-05'),
    ('Depósito D', 'Rua I, 456', 'Juliana', 'Não', '2023-09-06'),
    ('Depósito E', 'Rua J, 123', 'Roberto', 'Sim', '2023-09-07');

-- Inserir dados na tabela 'produto_has_estoque'
INSERT INTO produto_has_estoque (Estoque_idEstoque, Produto_idProduto, Quantidade)
VALUES
    (1, 1, 50),
    (1, 2, 100),
    (3, 3, 30),
    (3, 4, 200),
    (4, 5, 20);

-- Inserir dados na tabela 'terceiro_vendedor'
INSERT INTO terceiro_vendedor (razaoSocial, CNPJ, endereco, vendedorComissionado)
VALUES
    ('Vendedor X', '11111111111111', 'Av. Z, 123', 'Comissionado'),
    ('Vendedor Y', '22222222222222', 'Av. W, 456', 'Não Comissionado'),
    ('Vendedor Z', '55555555555555', 'Av. Y, 789', 'Comissionado'),
    ('Vendedor W', '66666666666666', 'Av. Z, 456', 'Não Comissionado'),
    ('Vendedor A', '77777777777777', 'Av. X, 789', 'Comissionado');

-- Inserir mais dados na tabela 'produtos_vendedor'
-- Inserir dados na tabela 'produtos_vendedor'
INSERT INTO produtos_vendedor (TerceiroVendedor_idTerceiroVendedor, Produto_idProduto)
VALUES
    (5, 6), -- Terceiro Vendedor 5, Produto 6
    (2, 7), -- Terceiro Vendedor 2, Produto 7
    (5, 8), -- Terceiro Vendedor 5, Produto 8
    (4, 9), -- Terceiro Vendedor 4, Produto 9
    (1, 10); -- Terceiro Vendedor 1, Produto 10
    
-- Inserir dados na tabela 'disponibilizando_um_produto'
INSERT INTO disponibilizando_um_produto (Fornecedor_idFornecedor, Produto_idProduto)
VALUES
    (1, 1),
    (2, 2),
    (1, 2),
    (3, 3),
    (4, 4);

-- Inserir dados na tabela 'relacao_produto_pedido'
INSERT INTO relacao_produto_pedido (Produto_idProduto, Pedido_idPedido, Quantidade)
VALUES
    (1, 1, 10),
    (2, 1, 5),
    (2, 2, 8),
    (3, 3, 15),
    (4, 3, 10);

-- Inserir dados na tabela 'pedido'
INSERT INTO pedido (statusPedido, descricao, frete, outrosDetalhes)
VALUES
    ('Em andamento', 'Pedido em processamento', 20.00, 'Detalhes adicionais do pedido 1'),
    ('Processando', 'Pedido sendo preparado para envio', 15.00, 'Detalhes adicionais do pedido 2'),
    ('Enviado', 'Pedido a caminho', 30.00, 'Detalhes adicionais do pedido 3'),
    ('Entregue', 'Pedido entregue com sucesso', 0.00, 'Detalhes adicionais do pedido 4'),
    ('Em andamento', 'Pedido em processamento', 20.00, 'Detalhes adicionais do pedido 5');

-- Inserir dados na tabela 'carrinho'
INSERT INTO carrinho (dataCriacao, Cliente_idCliente)
VALUES
    ('2023-09-03', 1),
    ('2023-09-03', 2),
    ('2023-09-04', 3),
    ('2023-09-05', 4),
    ('2023-09-06', 5);

-- Inserir dados na tabela 'carrinho_itens'
INSERT INTO carrinho_itens (Quantidade, Carrinho_idCarrinho, Produto_idProduto)
VALUES
    (2, 1, 1),
    (3, 1, 2),
    (4, 2, 1),
    (2, 3, 4),
    (3, 3, 5);

-- Inserir dados na tabela 'payments'
INSERT INTO payments (idClient, idPayment, typePayment, limitAvailable)
VALUES
    (1, 1, 'Boleto', 500.00),
    (2, 2, 'Cartão', 1000.00),
    (3, 3, 'Dois Cartões', 800.00),
    (4, 4, 'Boleto', 300.00),
    (5, 5, 'Cartão', 700.00);
