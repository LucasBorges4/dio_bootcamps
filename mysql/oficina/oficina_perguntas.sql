SHOW TABLES;

SELECT Categoria, SUM(Estoque) AS QuantidadeComprada
FROM Produtos
GROUP BY Categoria;

SELECT F.Nome AS NomeVendedor, P.Categoria, COUNT(*) AS QuantidadeVendida
FROM OrdensServico AS OS
JOIN Funcionarios AS F ON OS.FuncionarioID = F.ID
JOIN Veiculos AS V ON OS.VeiculoID = V.ID
JOIN Produtos AS P ON V.ID = P.IDProduto -- Supondo que IDProduto seja usado para registrar produtos vendidos
GROUP BY F.Nome, P.Categoria;


SELECT F.Nome AS NomeVendedor, P.Categoria, COUNT(*) AS QuantidadeVendida
FROM OrdensServico AS OS
JOIN Funcionarios AS F ON OS.FuncionarioID = F.ID
JOIN Veiculos AS V ON OS.VeiculoID = V.ID
JOIN Produtos AS P ON V.ID = P.IDProduto -- Supondo que IDProduto seja usado para registrar produtos vendidos
GROUP BY F.Nome, P.Categoria;

SELECT 'Servico' AS Tipo, Descricao, Preco FROM Servicos
UNION ALL
SELECT 'Produto', NomeProduto, Preco FROM Produtos;

-- Para calcular a média
SELECT AVG(Preco) AS MediaPreco
FROM (
    SELECT Preco
    FROM Servicos
    UNION ALL
    SELECT Preco
    FROM Produtos
) AS Precos;

-- Para calcular a variância
SELECT VARIANCE(Preco) AS VariancePreco
FROM (
    SELECT Preco
    FROM Servicos
    UNION ALL
    SELECT Preco
    FROM Produtos
) AS Precos;
