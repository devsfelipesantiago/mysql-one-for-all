DROP DATABASE IF EXISTS SpotifyClone;

CREATE DATABASE SpotifyClone;

USE SpotifyClone;

CREATE TABLE PLANOS (
  ID_PLANO INT(6) UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  PLANO VARCHAR(15),
  VALOR NUMERIC(3, 2)
) ENGINE = INNODB;

CREATE TABLE ARTISTAS (
  ID_ARTISTA INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  ARTISTA VARCHAR(30)
) ENGINE = INNODB;

CREATE TABLE USUARIOS (
  ID_USUARIO INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  NOME VARCHAR(50),
  IDADE INT(2),
  ID_PLANO INT(6) UNSIGNED,
  CONSTRAINT fk_users FOREIGN KEY (ID_PLANO) REFERENCES PLANOS (ID_PLANO)
) ENGINE = INNODB;

CREATE TABLE SEGUIDORES (
  ID_USUARIO INT UNSIGNED,
  ID_ARTISTA INT UNSIGNED,
  CONSTRAINT PRIMARY KEY(ID_USUARIO, ID_ARTISTA),
  FOREIGN KEY (ID_USUARIO) REFERENCES USUARIOS (ID_USUARIO),
  FOREIGN KEY (ID_ARTISTA) REFERENCES ARTISTAS (ID_ARTISTA)
) ENGINE = INNODB;

CREATE TABLE ALBUNS (
  ID_ALBUM INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  ALBUM VARCHAR(50) NOT NULL,
  ID_ARTISTA INT UNSIGNED,
  FOREIGN KEY (ID_ARTISTA) REFERENCES ARTISTAS (ID_ARTISTA)
) ENGINE = INNODB;

CREATE TABLE CANCOES (
  ID_CANCAO INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  CANCAO VARCHAR(30),
  ID_ALBUM INT UNSIGNED,
  FOREIGN KEY (ID_ALBUM) REFERENCES ALBUNS (ID_ALBUM)
) ENGINE = INNODB;

CREATE TABLE HISTORICO_DE_REPRODUCAO (
  ID_USUARIO INT UNSIGNED,
  ID_CANCAO INT UNSIGNED,
  CONSTRAINT PRIMARY KEY(ID_USUARIO, ID_CANCAO),
  FOREIGN KEY (ID_USUARIO) REFERENCES USUARIOS (ID_USUARIO),
  FOREIGN KEY (ID_CANCAO) REFERENCES CANCOES (ID_CANCAO)
) ENGINE = INNODB;

INSERT INTO
  PLANOS (PLANO, VALOR)
VALUES
  ('gratuito', 0),
  ('familiar', 7.99),
  ('universitário', 5.99);

INSERT INTO
  USUARIOS (NOME, IDADE, ID_PLANO)
VALUES
  ('Thati', 23, 1),
  ('Cintia', 35, 2),
  ('Bill', 20, 3),
  ('Roger', 45, 1);

INSERT INTO
  ARTISTAS (ARTISTA)
VALUES
  ('Walter Phoenix'),
  ('Peter Strong'),
  ('Lance Day'),
  ('Freedie Shannon');

INSERT INTO
  SEGUIDORES (ID_USUARIO, ID_ARTISTA)
VALUES
  (1, 1),
  (1, 4),
  (1, 3),
  (2, 1),
  (2, 3),
  (3, 2),
  (3, 1),
  (4, 4);

INSERT INTO
  ALBUNS (ALBUM, ID_ARTISTA)
VALUES
  ('Envious', 1),
  ('Exuberant', 1),
  ('Hallowed Steam', 2),
  ('Incandescent', 3),
  ('Temporary Culture', 4);

INSERT INTO
  CANCOES (CANCAO, ID_ALBUM)
VALUES
  ("Soul For Us", 1),
  ("Reflections Of Magic", 1),
  ("Dance With Her Own", 1),
  ("Troubles Of My Inner Fire", 2),
  ("Time Fireworks", 2),
  ("Magic Circus", 3),
  ("Honey, So Do I", 3),
  ("Sweetie, Let's Go Wild", 3),
  ("She Knows", 3),
  ("Fantasy For Me", 4),
  ("Celebration Of More", 4),
  ("Rock His Everything", 4),
  ("Home Forever", 4),
  ("Diamond Power", 4),
  ("Honey, Let's Be Silly", 4),
  ("Thang Of Thunder", 5),
  ("Words Of Her Life", 5),
  ("Without My Streets", 5);

INSERT INTO
  HISTORICO_DE_REPRODUCAO (ID_USUARIO, ID_CANCAO)
VALUES
  (1, 1),
  (1, 6),
  (1, 14),
  (1, 16),
  (2, 13),
  (2, 17),
  (2, 2),
  (2, 15),
  (3, 4),
  (3, 16),
  (3, 6),
  (4, 3),
  (4, 18),
  (4, 11);
