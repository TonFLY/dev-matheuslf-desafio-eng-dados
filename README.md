# Desafio de Engenharia de Dados (PostgreSQL)

[![LinkedIn](https://img.shields.io/badge/LinkedIn-Tonfly-0A66C2?style=for-the-badge&logo=linkedin&logoColor=white)](https://www.linkedin.com/in/tonfly)

## Sobre o desafio

Este repositório contém minha resolução do desafio proposto pelo Dev Matheus, com foco em análise de vendas e clientes usando PostgreSQL.

Mesmo sendo DBA SQL Server, esse foi meu primeiro contato prático com funções em PostgreSQL. O objetivo foi me desafiar em uma stack diferente, aproveitando a base que já tenho em SQL relacional.

## Escopo técnico

Base utilizada:
- clientes
- produtos
- pedidos
- pedido_itens

Entregas implementadas:

| Tipo   | Nome                      | Objetivo técnico                       |
|--------|---------------------------|----------------------------------------|
| View   | vw_pedidos_detalhados     | JOIN e cálculo de subtotal por item    |
| View   | vw_total_por_cliente      | agregação de faturamento por cliente   |
| View   | vw_pedidos_resumo         | resumo com contagem e soma             |
| View   | vw_vendas_por_cidade      | consolidado de vendas por cidade       |
| View   | vw_produtos_mais_vendidos | ranking de produtos                    |
| Função | fn_calcula_total_pedido   | cálculo de total por pedido            |
| Função | fn_clientes_vip           | filtro dinâmico por valor e volume     |
| Função | fn_produtos_mais_vendidos | agregação de produtos vendidos         |
| Função | fn_vendas_por_cidade      | análise por prefixo de cidade          |
| Função | fn_pedido_json            | retorno estruturado em JSON            |

## Abordagem

- Desenvolvimento 100% manual, sem uso de IA na resolução.
- Pesquisa pontual no Google apenas para detalhar o retorno em JSON no PostgreSQL.
- Validação de resultados por consultas diretas após criação de views e funções.

## Principais aprendizados

- Diferenças práticas entre T-SQL e PL/pgSQL na criação de funções.
- Uso de funções com retorno escalar e tabular no PostgreSQL.
- Estruturação de payload JSON direto no banco para integração.
- Reforço de boas práticas com JOIN, GROUP BY, HAVING e COALESCE.

## Arquivos principais

- Funções: fn_calcula_total_pedido.sql, fn_clientes_vip.sql, fn_produtos_mais_vendidos.sql, fn_vendas_por_cidade.sql, fn_pedido_json.sql
- Views: vw_pedidos_detalhados.sql, vw_total_por_cliente.sql, vw_pedidos_resumo.sql, vw_vendas_por_cidade.sql, vw_produtos_mais_vendidos.sql
- Backup da base: vendasx.backup

## Referências

- Repositório original do desafio (Dev Matheus): https://github.com/matheuslf/dev-matheuslf-desafio-eng-dados
- Vídeo encontrado posteriormente no YouTube: https://www.youtube.com/watch?v=GtW_FK-_2u4


