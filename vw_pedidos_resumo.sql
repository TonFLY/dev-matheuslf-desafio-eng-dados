CREATE VIEW vw_pedidos_resumo AS

SELECT

        A.pedido_id                                 AS PEDIDO_ID
    ,   COUNT(pedido_id )                           AS TOTAL_PEDIDOS
    ,   SUM(A.preco_unit * A.quantidade)            AS VALOR_TOTAL

FROM pedido_itens       AS A 
    INNER JOIN pedidos  AS B ON A.pedido_id = B.id
GROUP BY A.pedido_id
ORDER BY A.pedido_id