CREATE OR REPLACE FUNCTION fn_vendas_por_cidade(p_cidade VARCHAR)

RETURNS TABLE (
    CIDADE_CLIENTE          VARCHAR
    , TOTAL_DE_VENDAS       INTEGER
    , VALOR_TOTAL_VENDAS    NUMERIC
)
AS $$

BEGIN
    RETURN QUERY
        SELECT 
                C.cidade                            AS CIDADE_CLIENTE
            ,   a.quantidade                        AS TOTAL_DE_VENDAS
            ,   SUM(A.quantidade * A.preco_unit)    AS VALOR_TOTAL_VENDAS

        FROM  pedido_itens AS A
        INNER JOIN pedidos AS B ON A.pedido_id = B.id
        INNER JOIN clientes AS C ON B.cliente_id = C.id
        WHERE C.cidade ILIKE unaccent(p_cidade || '%')    
        GROUP BY C.cidade, a.quantidade
        ORDER BY VALOR_TOTAL_VENDAS DESC;


        IF NOT FOUND THEN
        RETURN QUERY
        SELECT 
                 'Cidade não encontrada ou sem vendas'::VARCHAR          AS CIDADE_CLIENTE
            ,     0::INTEGER                                             AS TOTAL_DE_VENDAS
            ,     0::NUMERIC                                             AS VALOR_TOTAL_VENDAS
        ;
        END IF;

END;
$$ LANGUAGE plpgsql;

SELECT fn_vendas_por_cidade('po')


