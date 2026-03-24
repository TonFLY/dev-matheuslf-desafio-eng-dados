CREATE OR REPLACE FUNCTION  fn_produtos_mais_vendidos(
    p_valor_minimo NUMERIC DEFAULT NULL,
    p_qtd_min_pedidos INT DEFAULT NULL
)

-- fn_produtos_mais_vendidos

RETURNS TABLE (
    produto_id INT,
    produto_nome TEXT,
    total_vendido BIGINT
) AS $$
BEGIN
    RETURN QUERY   
    SELECT 
            A.produto_id
        ,   cast(replace(B.nome, '"', ' Polegadas')   as TEXT)              AS produto_nome
        ,   SUM(A.quantidade)                                               AS total_vendido
    FROM pedido_itens AS A
    INNER JOIN produtos AS B ON A.produto_id = B.id
    WHERE        
        (p_valor_minimo IS NULL OR A.preco_unit * A.quantidade >= p_valor_minimo)
        AND (p_qtd_min_pedidos IS NULL OR A.quantidade >= p_qtd_min_pedidos)
    GROUP BY A.produto_id, B.nome
    ORDER BY total_vendido DESC;
END;
$$ LANGUAGE plpgsql;

SELECT * FROM produtos


SELECT fn_produtos_mais_vendidos(1, 2);
