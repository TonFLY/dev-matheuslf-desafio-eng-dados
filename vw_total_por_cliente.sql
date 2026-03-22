CREATE OR REPLACE VIEW vw_total_por_cliente AS

SELECT

    C.nome                              AS cliente_nome
,   SUM(A.preco_unit * a.quantidade)    AS valor_total

FROM pedido_itens  AS A 
    INNER JOIN pedidos      AS B ON A.pedido_id     = B.id
    INNER JOIN clientes     AS C ON B.cliente_id    = C.id
GROUP BY C.nome
