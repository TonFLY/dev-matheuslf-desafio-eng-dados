CREATE OR REPLACE VIEW vw_pedidos_detalhados AS

SELECT
   /* Dados do cliente */

    a.id                AS id_do_pedido
,   C.nome              AS cliente_nome
,   c.cidade            AS cidade_do_cliente

    /* Dados do produto */
,   D.nome              AS nome_do_produto
,   D.preco             AS preco_do_produto


    /* Dados do pedido */
,   B.data_pedido       AS data_do_pedido
,   A.preco_unit * a.quantidade AS valor_total

FROM pedido_itens  AS A 
    INNER JOIN pedidos  AS B ON A.pedido_id = B.id
    INNER JOIN clientes AS C ON B.cliente_id = C.id
    INNER JOIN produtos AS D ON A.produto_id = D.id
    