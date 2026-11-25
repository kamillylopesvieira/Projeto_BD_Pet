-- DDL derivado do diagrama dw/esquema-estrela.png (esquema em estrela)
CREATE TABLE dim_tempo (
  id_tempo INT PRIMARY KEY, data DATE, dia INT, mes INT, ano INT, periodo VARCHAR(30)
);
CREATE TABLE dim_tutor (
  id_tutor INT PRIMARY KEY, perfil_contratacao VARCHAR(50), faixa_localizacao VARCHAR(50)
);
CREATE TABLE dim_animal (
  id_animal INT PRIMARY KEY, especie VARCHAR(30), porte VARCHAR(20), idade INT
);
CREATE TABLE dim_servico (
  id_servico INT PRIMARY KEY, tipo VARCHAR(30), categoria VARCHAR(50)
);
CREATE TABLE dim_cuidador (
  id_cuidador INT PRIMARY KEY, perfil VARCHAR(50), avaliacao_media FLOAT
);
CREATE TABLE dim_localizacao (
  id_localizacao INT PRIMARY KEY, cidade VARCHAR(80), bairro VARCHAR(80), regiao VARCHAR(50)
);
CREATE TABLE fato_reservas (
  id_tempo INT REFERENCES dim_tempo(id_tempo),
  id_tutor INT REFERENCES dim_tutor(id_tutor),
  id_animal INT REFERENCES dim_animal(id_animal),
  id_servico INT REFERENCES dim_servico(id_servico),
  id_cuidador INT REFERENCES dim_cuidador(id_cuidador),
  id_localizacao INT REFERENCES dim_localizacao(id_localizacao),
  id_reserva VARCHAR(20),            -- dimensão degenerada: agrupa serviços da mesma reserva
  quantidade INT,
  valor_contratado DECIMAL(10,2),
  duracao_minutos INT
);
