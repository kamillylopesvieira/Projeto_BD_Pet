// Cria o grafo de exemplo (ver neo4j/grafo-exemplo.png)
CREATE (ana:Tutor {id: 'TUTOR025', nome: 'Ana'})
CREATE (luna:Animal {id: 'PET001', nome: 'Luna', especie: 'Cachorro'})
CREATE (mariana:Cuidador {id: 'CUIDADOR010', nome: 'Mariana'})
CREATE (hosp:Servico {id: 'SERV01', tipo: 'Hospedagem'})
CREATE (ana)-[:TUTOR_DE]->(luna)
CREATE (ana)-[:CONTRATOU {reserva_id: 'RESERVA100', data: '2026-12-20'}]->(hosp)
CREATE (mariana)-[:OFERECE]->(hosp)
CREATE (ana)-[:AVALIOU {nota: 5}]->(mariana);

// Serviços que Ana contratou e quem os oferece
MATCH (t:Tutor {nome: 'Ana'})-[:CONTRATOU]->(s:Servico)<-[:OFERECE]-(c:Cuidador)
RETURN s.tipo, c.nome;
