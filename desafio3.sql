CREATE VIEW historico_reproducao_usuarios AS
SELECT
  u.NOME AS 'usuario',
  c.CANCAO AS 'nome'
FROM
  HISTORICO_DE_REPRODUCAO AS h
  JOIN USUARIOS AS u ON h.ID_USUARIO = u.ID_USUARIO
  JOIN CANCOES AS c ON c.ID_CANCAO = h.ID_CANCAO
ORDER BY
  1,
  2;
