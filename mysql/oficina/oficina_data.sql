-- Inserindo dados na tabela de Funcionários
INSERT INTO Funcionarios (Nome, Cargo, Salario, DataContratacao, DataNascimento)
VALUES
    ('João Silva', 'Mecânico', 2500.00, '2022-01-15', '1985-03-10'),
    ('Maria Santos', 'Gerente de Serviços', 3500.00, '2020-05-20', '1990-07-25'),
    ('Pedro Oliveira', 'Eletricista', 2700.00, '2021-03-05', '1988-11-15');

-- Inserindo dados na tabela de Clientes
INSERT INTO Clientes (Nome, Telefone, Email, NumeroVisitas)
VALUES
    ('Ana Pereira', '555-1234', 'ana@email.com', 3),
    ('Carlos Souza', '555-5678', 'carlos@email.com', 2),
    ('Lúcia Lima', '555-9876', 'lucia@email.com', 1);

-- Inserindo dados na tabela de Veículos
INSERT INTO Veiculos (Marca, Modelo, Ano, Placa, TipoVeiculo)
VALUES
    ('Toyota', 'Corolla', 2019, 'ABC123', 'Carro'),
    ('Honda', 'CBR600RR', 2020, 'XYZ789', 'Moto'),
    ('Volvo', 'FH16', 2022, 'DEF456', 'Caminhão');

-- Inserindo dados na tabela de Serviços
INSERT INTO Servicos (TipoServico, Descricao, Preco)
VALUES
    ('Elétrica', 'Reparo no sistema elétrico', 150.00),
    ('Outro', 'Troca de óleo', 50.00),
    ('Elétrica', 'Instalação de som automotivo', 200.00);

-- Inserindo dados na tabela de Produtos
INSERT INTO Produtos (NomeProduto, Categoria, Preco, Estoque)
VALUES
    ('Som Automotivo Pioneer', 'Acessórios', 300.00, 10),
    ('Ferramenta de Chave Inglesa', 'Ferramentas', 20.00, 30),
    ('Extintor ABC 5kg', 'EPIs', 40.00, 15);

-- Inserindo dados na tabela de Ordens de Serviço
INSERT INTO OrdensServico (ClienteID, VeiculoID, FuncionarioID, GerenteServicoID, DataEntrada, DataSaida, ValorTotal)
VALUES
    (1, 1, 1, 2, '2023-08-15 09:00:00', '2023-08-15 15:00:00', 200.00),
    (2, 2, 3, 2, '2023-08-16 10:30:00', '2023-08-16 16:30:00', 250.00),
    (3, 3, 1, 2, '2023-08-17 08:45:00', '2023-08-17 14:45:00', 100.00);

INSERT INTO MetodosPagamento (Metodo)
VALUES
    ('Dinheiro'),
    ('Cartão de Crédito'),
    ('Cartão de Débito'),
    ('Transferência Bancária');