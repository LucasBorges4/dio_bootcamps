SHOW TABLES;

SELECT categoria, SUM(Quantidade) AS total_comprado, AVG(avaliacao) AS media_avaliacao, AVG(qualidade) AS media_qualidade
FROM produto
LEFT JOIN relacao_produto_pedido ON produto.idProduto = relacao_produto_pedido.Produto_idProduto
GROUP BY categoria;

SELECT terceiro_vendedor.razaoSocial AS vendedor, COUNT(pedido.idPedido) AS quantidade_vendas
FROM terceiro_vendedor
LEFT JOIN produtos_vendedor ON terceiro_vendedor.idTerceiroVendedor = produtos_vendedor.TerceiroVendedor_idTerceiroVendedor
LEFT JOIN produto ON produtos_vendedor.Produto_idProduto = produto.idProduto
LEFT JOIN relacao_produto_pedido ON produto.idProduto = relacao_produto_pedido.Produto_idProduto
LEFT JOIN pedido ON relacao_produto_pedido.Pedido_idPedido = pedido.idPedido
GROUP BY terceiro_vendedor.razaoSocial;

SELECT terceiro_vendedor.razaoSocial AS vendedor, produto.categoria, COUNT(pedido.idPedido) AS quantidade_vendas
FROM terceiro_vendedor
LEFT JOIN produtos_vendedor ON terceiro_vendedor.idTerceiroVendedor = produtos_vendedor.TerceiroVendedor_idTerceiroVendedor
LEFT JOIN produto ON produtos_vendedor.Produto_idProduto = produto.idProduto
LEFT JOIN relacao_produto_pedido ON produto.idProduto = relacao_produto_pedido.Produto_idProduto
LEFT JOIN pedido ON relacao_produto_pedido.Pedido_idPedido = pedido.idPedido
GROUP BY terceiro_vendedor.razaoSocial, produto.categoria;

SELECT Pname, precoUnidade, AVG(precoUnidade) AS media_preco, VARIANCE(precoUnidade) AS variancia_preco
FROM produto
GROUP BY Pname, precoUnidade;

SELECT local, ultimoAcessoEstoque, nomeEncarregado
FROM estoque;

SELECT typePayment, COUNT(typePayment) AS quantidade
FROM payments
GROUP BY typePayment
ORDER BY quantidade DESC
LIMIT 1;

-- Para relacionar os resultados da consulta 3 e 5, você pode criar consultas separadas e depois unir os resultados usando JOIN ou UNION, dependendo do que deseja exatamente.
-- Por exemplo, para mostrar a quantidade de vendas feitas por vendedor e o preço médio por produto vendido por vendedor:
-- Consulta 3:
SELECT
    terceiro_vendedor.idTerceiroVendedor,
    terceiro_vendedor.razaoSocial AS vendedor,
    COUNT(pedido.idPedido) AS quantidade_vendas,
    NULL AS media_preco
FROM terceiro_vendedor
LEFT JOIN produtos_vendedor ON terceiro_vendedor.idTerceiroVendedor = produtos_vendedor.TerceiroVendedor_idTerceiroVendedor
LEFT JOIN produto ON produtos_vendedor.Produto_idProduto = produto.idProduto
LEFT JOIN relacao_produto_pedido ON produto.idProduto = relacao_produto_pedido.Produto_idProduto
LEFT JOIN pedido ON relacao_produto_pedido.Pedido_idPedido = pedido.idPedido
GROUP BY terceiro_vendedor.idTerceiroVendedor, terceiro_vendedor.razaoSocial

UNION ALL

-- Consulta 5:
SELECT
    terceiro_vendedor.idTerceiroVendedor,
    NULL AS vendedor,
    NULL AS quantidade_vendas,
    AVG(produto.precoUnidade) AS media_preco
FROM terceiro_vendedor
LEFT JOIN produtos_vendedor ON terceiro_vendedor.idTerceiroVendedor = produtos_vendedor.TerceiroVendedor_idTerceiroVendedor
LEFT JOIN produto ON produtos_vendedor.Produto_idProduto = produto.idProduto
GROUP BY terceiro_vendedor.idTerceiroVendedor;

SELECT carrinho.idCarrinho, COUNT(carrinho_itens.idCarrinho_itens) AS produtos_comprados, SUM(produto.precoUnidade) AS total_preco
FROM carrinho
LEFT JOIN carrinho_itens ON carrinho.idCarrinho = carrinho_itens.Carrinho_idCarrinho
LEFT JOIN produto ON carrinho_itens.Produto_idProduto = produto.idProduto
GROUP BY carrinho.idCarrinho;

SELECT cliente.idCliente, CONCAT(cliente.FName, ' ', cliente.LName) AS nome_cliente, COUNT(carrinho_itens.idCarrinho_itens) AS produtos_comprados
FROM cliente
LEFT JOIN carrinho ON cliente.idCliente = carrinho.Cliente_idCliente
LEFT JOIN carrinho_itens ON carrinho.idCarrinho = carrinho_itens.Carrinho_idCarrinho
GROUP BY cliente.idCliente
ORDER BY produtos_comprados DESC
LIMIT 1;

