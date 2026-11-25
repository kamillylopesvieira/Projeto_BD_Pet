// Modelo: (Tutor)-[:TUTOR_DE]->(Animal)
//         (Tutor)-[:CONTRATOU {reserva_id, data}]->(Servico)
//         (Cuidador)-[:OFERECE]->(Servico)
//         (Tutor)-[:AVALIOU {nota}]->(Cuidador)
// Cuidadores bem avaliados por tutores que contrataram os mesmos serviços que TUTOR025
MATCH (t:Tutor {id: 'TUTOR025'})-[:CONTRATOU]->(s:Servico),
      (s)<-[:CONTRATOU]-(outro:Tutor),
      (outro)-[a:AVALIOU]->(c:Cuidador)
WHERE outro <> t
  AND a.nota >= 4
  AND NOT (t)-[:AVALIOU]->(c)
RETURN c.id, c.nome, count(DISTINCT outro) AS tutores_semelhantes
ORDER BY tutores_semelhantes DESC
LIMIT 5;
