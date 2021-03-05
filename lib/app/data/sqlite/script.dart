final createTable = '''
CREATE TABLE tasks(
  id INTEGER NOT NULL PRIMARY KEY,
  tarefa VARCHAR(100) NOT NULL,
  descricao VARCHAR(300),
  importante BOOLEAN NOT NULL,
  completa BOOLEAN NOT NULL
)
''';

final testeInsert = '''
INSERT INTO tasks(tarefa, descricao, importante, completa)
VALUES('Lavar a louça', 'Lavar a louça de casa', 0, 0),
      ('Falar com Vitória', '', 1, 1),
      ('Jogar LoL', 'Feedar até o talo', 0, 1),
      ('Terminar o app', 'Implementar o Banco de Dados', 1, 1),
      ('Beber água', '3L por dia', 1, 0),
      ('Mandar Bryan tomar no cu', '', 1, 0)
''';
