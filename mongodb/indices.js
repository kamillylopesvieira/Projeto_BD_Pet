// Um documento por cuidador e por horário: o índice único impede reserva duplicada
db.agenda_cuidador.createIndex(
  { cuidador_id: 1, horario: 1 }, { unique: true })
// A confirmação da reserva grava agenda_cuidador e reservas na mesma transação,
// com writeConcern { w: "majority" }.
