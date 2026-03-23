CREATE OR REPLACE FUNCTION fn_clientes_vip(
    p_valor_minimo NUMERIC DEFAULT NULL,
    p_qtd_min_pedidos INT DEFAULT NULL
)
RETURNS TABLE (
    cliente_id INT,
    cliente_nome TEXT,
    total_pedidos BIGINT,
    valor_total NUMERIC
) AS $$
BEGIN
    RETURN QUERY
    SELECT
            A.id                                        AS cliente_id
        ,   A.nome::TEXT                                AS cliente_nome
        ,   COUNT(DISTINCT B.id)                        AS total_pedidos
        ,   SUM(C.preco_unit * C.quantidade)::NUMERIC   AS valor_total
    FROM clientes       AS A
        INNER JOIN pedidos      AS B  ON B.cliente_id = A.id
        INNER JOIN pedido_itens AS C  ON C.pedido_id = B.id
    GROUP BY A.id, A.nome
    HAVING
        (p_valor_minimo IS NULL OR SUM(C.preco_unit * C.quantidade) >= p_valor_minimo)
        AND (p_qtd_min_pedidos IS NULL OR COUNT(DISTINCT B.id) >= p_qtd_min_pedidos)
    ORDER BY valor_total DESC, cliente_nome;
END;
$$ LANGUAGE plpgsql;


