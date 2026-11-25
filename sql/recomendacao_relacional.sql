-- Mesma consulta de neo4j/recomendacao.cypher em banco relacional (para comparação)
SELECT c.id, c.nome, COUNT(DISTINCT a.tutor_id) AS tutores_semelhantes
FROM contratacoes ct
JOIN contratacoes outro ON outro.servico_id = ct.servico_id
                       AND outro.tutor_id <> ct.tutor_id
JOIN avaliacoes a ON a.tutor_id = outro.tutor_id AND a.nota >= 4
JOIN cuidadores c ON c.id = a.cuidador_id
WHERE ct.tutor_id = 'TUTOR025'
  AND NOT EXISTS (SELECT 1 FROM avaliacoes x
                  WHERE x.tutor_id = 'TUTOR025'
                    AND x.cuidador_id = c.id)
GROUP BY c.id, c.nome
ORDER BY tutores_semelhantes DESC
LIMIT 5;
