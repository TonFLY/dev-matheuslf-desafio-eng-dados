CREATE OR REPLACE FUNCTION fn_calcula_total_pedido(p_id_pedido INT)
RETURNS DECIMAL AS $$
DECLARE
    v_total DECIMAL(10, 2) := 0;
BEGIN
    SELECT SUM(A.preco_unit * A.quantidade)
    INTO v_total
    FROM pedido_itens AS A
    WHERE A.pedido_id = p_id_pedido;

    RETURN COALESCE(v_total, 0);
END;
$$ LANGUAGE plpgsql;


