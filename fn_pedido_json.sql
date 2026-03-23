CREATE OR REPLACE FUNCTION fn_pedido_json(p_id_pedido INT)
RETURNS JSON AS $$
DECLARE
    v_resultado JSON;
BEGIN
    SELECT
        JSON_BUILD_OBJECT(
            'pedido_id', A.id
        ,   'data_pedido', A.data_pedido
        ,   'cliente', JSON_BUILD_OBJECT(
                'cliente_id', B.id
            ,   'nome', B.nome
            ,   'cidade', B.cidade
            )
        ,   'itens', COALESCE(
                JSON_AGG(
                    JSON_BUILD_OBJECT(
                        'produto_id', D.id
                    ,   'produto_nome', D.nome
                    ,   'quantidade', C.quantidade
                    ,   'preco_unit', C.preco_unit
                    ,   'subtotal', (C.preco_unit * C.quantidade)
                    )
                ) FILTER (WHERE C.id IS NOT NULL)
            ,   '[]'::JSON
            )
        ,   'valor_total', COALESCE(SUM(C.preco_unit * C.quantidade), 0)
        )
    -- INTO v_resultado
    FROM pedidos          AS A
        INNER JOIN clientes      AS B ON B.id = A.cliente_id
        LEFT JOIN pedido_itens   AS C ON C.pedido_id = A.id
        LEFT JOIN produtos       AS D ON D.id = C.produto_id
    WHERE A.id = 1
    GROUP BY A.id, A.data_pedido, B.id, B.nome, B.cidade;

    IF v_resultado IS NULL THEN
        RETURN JSON_BUILD_OBJECT(
            'erro', 'Pedido nao encontrado',
            'pedido_id', p_id_pedido
        );
    END IF;

    RETURN v_resultado;
END;
$$ LANGUAGE plpgsql;


SELECT fn_pedido_json(1);
