CREATE VIEW vw_vendas_por_cidade AS  

    SELECT 
            C.cidade AS CIDADE_CLIENTE
        ,   SUM(A.quantidade * A.preco_unit) AS VALOR_TOTAL_VENDAS

    FROM  pedido_itens AS A
    INNER JOIN pedidos AS B ON A.pedido_id = B.id
    INNER JOIN clientes AS C ON B.cliente_id = C.id
    GROUP BY C.cidade
    ORDER BY VALOR_TOTAL_VENDAS DESC;

