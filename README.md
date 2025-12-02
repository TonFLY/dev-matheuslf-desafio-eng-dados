# Desafio de Engenharia de Dados

O objetivo é trabalhar conceitos de **consultas relacionais**, **agregações**, **funções PL/pgSQL** e **integração SQL → JSON**, utilizando o **PostgreSQL**.

---

## Cenário

Você está trabalhando em uma empresa que precisa analisar dados de **vendas e clientes**.  
Foi fornecido um banco de dados já estruturado com as tabelas:

- `clientes`
- `produtos`
- `pedidos`
- `pedido_itens`

Sua missão é **importar o banco de dados** disponibilizado e criar as *views* e *funções* solicitadas a seguir.

---

## Importação e Inserts

Após importar o banco, execute os comandos abaixo para popular as tabelas iniciais:

```sql
INSERT INTO clientes (nome, cidade) VALUES
('Ana Souza', 'Curitiba'),
('Bruno Lima', 'Florianópolis'),
('Carla Mendes', 'Porto Alegre');

INSERT INTO produtos (nome, preco) VALUES
('Notebook Lenovo', 4200.00),
('Mouse Logitech', 120.00),
('Monitor LG 24"', 950.00),
('Teclado Mecânico Redragon', 380.00);

INSERT INTO pedidos (cliente_id, data_pedido, valor_total)
VALUES
(1, '2025-11-10', 0), -- pedido da Ana
(2, '2025-11-11', 0); -- pedido do Bruno

-- Pedido 1 (Ana Souza)
INSERT INTO pedido_itens (pedido_id, produto_id, quantidade, preco_unit) VALUES
(1, 1, 1, 4200.00), -- Notebook Lenovo
(1, 2, 1, 120.00);  -- Mouse Logitech

-- Pedido 2 (Bruno Lima)
INSERT INTO pedido_itens (pedido_id, produto_id, quantidade, preco_unit) VALUES
(2, 3, 2, 950.00),  -- 2 Monitores LG
(2, 4, 1, 380.00);  -- Teclado Mecânico
```

## O que você deve fazer?

| Tipo   | Nome                        | Demonstra                  | Conceitos            |
| ------ | --------------------------- | -------------------------- | -------------------- |
| View   | `vw_pedidos_detalhados`     | JOIN + cálculo de subtotal | relacionamentos      |
| View   | `vw_total_por_cliente`      | GROUP BY + SUM             | agregação            |
| View   | `vw_pedidos_resumo`         | COUNT + SUM                | agrupamento          |
| View   | `vw_vendas_por_cidade`      | GROUP BY + ORDER BY        | análise por região   |
| View   | `vw_produtos_mais_vendidos` | SUM + ORDER BY DESC        | ranking              |
| Função | `fn_calcula_total_pedido`   | SELECT INTO + COALESCE     | função escalar       |
| Função | `fn_clientes_vip`           | HAVING + parâmetros        | filtro dinâmico      |
| Função | `fn_produtos_mais_vendidos` | retorno TABLE              | agregação            |
| Função | `fn_vendas_por_cidade`      | retorno TABLE + join       | agrupamento múltiplo |
| Função | `fn_pedido_json`            | JSON_BUILD_OBJECT          | integração API/SQL   |

