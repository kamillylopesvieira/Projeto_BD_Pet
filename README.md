# Plataforma de Hospedagem e Passeios para Animais: Projeto de Dados

Trabalho da disciplina Banco de Dados Não Relacionais (Fatec Osasco, Prof. Vander Ribeiro Elme).
Autora: Kamilly Lopes Vieira.

Proposta de arquitetura de dados para uma plataforma que conecta tutores de animais a cuidadores
(hospedagem e passeios), pensada para suportar picos de acesso em férias e feriados.

## Estrutura

| Pasta | Conteúdo |
|---|---|
| `docs/` | Relatório técnico (PDF e DOCX) e apresentação |
| `modelo-json/` | Documentos JSON de exemplo (`animal.json` e `reserva.json`, MongoDB) |
| `mongodb/` | Índice único que impede reservas duplicadas |
| `redis/` | Exemplos de chaves e comandos (sessão, pesquisas, bloqueio de horário) |
| `neo4j/` | Grafo de exemplo (Cypher e imagem) e consulta de recomendação |
| `sql/` | A mesma consulta em SQL, para comparar com o grafo |
| `dw/` | Esquema em estrela do Data Warehouse (imagem e DDL SQL) |

## Decisões de arquitetura

| Necessidade | Banco | Categoria |
|---|---|---|
| Catálogo de animais, cuidadores e serviços | MongoDB | Documentos |
| Sessões, pesquisas recentes e bloqueio temporário de reservas | Redis | Chave-valor |
| Relações entre tutores, animais, cuidadores, serviços e avaliações | Neo4j | Grafos |

- **CAP:** reservas priorizam CP (coleção `reservas` no MongoDB, índice único e transação); catálogo prioriza AP.
- **Grafos vs. relacional:** `neo4j/recomendacao.cypher` e `sql/recomendacao_relacional.sql` resolvem a mesma recomendação.
- **Data Warehouse:** tabela fato `FATO_RESERVAS` e dimensões Tempo, Tutor, Animal, Serviço, Cuidador e Localização.
- **Mineração:** clustering (perfis de tutores) e regras de associação (serviços contratados juntos).
- **Segurança e LGPD:** controle de acesso com MFA, criptografia, backups testados, monitoramento, e exclusão/anonimização nos bancos operacionais e no DW.

## Checklist dos critérios de entrega

- [x] Justificativa da categoria NoSQL para cada cenário
- [x] Modelo JSON estruturado
- [x] Teorema CAP (reservas e catálogo)
- [x] Esquema do DW (fato, métricas e dimensões)
- [x] Estratégia de ETL
- [x] Mineração de dados
- [x] Ações de segurança e LGPD
- [x] Relatório em PDF
