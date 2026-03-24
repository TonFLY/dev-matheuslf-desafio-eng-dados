
CREATE OR REPLACE VIEW vw_produtos_mais_vendidos AS

SELECT 
        A.produto_id
    ,   B.nome AS produto_nome
    ,   SUM(A.quantidade) AS total_vendido
FROM pedido_itens AS A
INNER JOIN produtos AS B ON A.produto_id = B.id
GROUP BY A.produto_id, B.nome
ORDER BY total_vendido DESC;