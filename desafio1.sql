DROP DATABASE if exists SpotifyClone;

CREATE DATABASE SpotifyClone;

CREATE Table SpotifyClone.`PLANO` (
  `plano_id` INT AUTO_INCREMENT PRIMARY KEY,
  `nome` VARCHAR(30) NOT NULL,
  `valor` FLOAT NOT NULL
);

INSERT INTO `PLANO` (`nome`, `valor`)
VALUES
('gratuito', 0),
('familiar', 7.99),
('universitário', 5.99);

CREATE Table SpotifyClone.`USUARIO` (
  `usuario_id` INT AUTO_INCREMENT PRIMARY KEY,
  `nome_usuario` VARCHAR(30) NOT NULL,
  `idade` INT NOT NULL,
  `plano_id` INT NOT NULL,
  FOREIGN KEY (`plano_id`) REFERENCES `PLANO` (`plano_id`)
);

INSERT INTO `USUARIO` (`nome_usuario`, `idade`, `plano_id`)
VALUES
('Thati', 23, 1),
('Cintia', 35, 2),
('Bill', 20, 3),
('Roger', 40, 1);

CREATE Table SpotifyClone.`ARTISTA` (
  `artista_id` INT AUTO_INCREMENT PRIMARY KEY,
  `artista_nome` VARCHAR(30) NOT NULL
);

INSERT INTO `ARTISTA` (`artista_nome`)
VALUES
('Walter Phoenix'),
('Peter Strong'),
('Lance Day'),
('Freedie Shannon');

CREATE Table SpotifyClone.`ALBUM` (
  `album_id` INT AUTO_INCREMENT PRIMARY KEY,
  `nome_album` VARCHAR(30) NOT NULL,
  `artista_id` INT NOT NULL,
  FOREIGN KEY (`artista_id`) REFERENCES `ARTISTA` (`artista_id`)
);

INSERT INTO `ALBUM` (`nome_album`, `artista_id`)
VALUES
('Envious', 1),
('Exuberant', 1),
('Hallowed Steam', 2),
('Freedie Shannon', 3),
('Temporary Culture', 4);

CREATE Table SpotifyClone.`CANCAO` (
  `cancao_id` INT AUTO_INCREMENT PRIMARY KEY,
  `nome_cancao` VARCHAR(50) NOT NULL,
  `album_id` INT NOT NULL,
  `artista_id` INT NOT NULL,
  FOREIGN KEY (`album_id`) REFERENCES `ALBUM` (`album_id`),
  FOREIGN KEY (`artista_id`) REFERENCES `ARTISTA` (`artista_id`)
);

INSERT INTO `CANCAO` (`nome_cancao`, `album_id`, `artista_id`)
VALUES
('Celebration Of More', 4, 3),
('Dance With Her Own', 1 , 1),
('Diamond Power', 3 , 3),
('Fantasy For Me', 4 , 3),
('Home Forever', 4 , 3),
('Honey, Let`s Be Silly', 4 , 3),
('Honey, Let`s Be Silly', 3 , 2),
('Magic Circus', 3 , 2),
('Reflections Of Magic', 1 , 1),
('Rock His Everything', 4 , 3),
('She Knows', 3 , 2),
('Soul For Us', 1 , 1),
('Sweetie, Let`s Go Wild', 3 , 2),
('Thang Of Thunder', 5 , 4),
('Time Fireworks', 2 , 1),
('Troubles Of My Inner Fire', 2 , 1),
('Without My Streets', 5 , 4),
('Words Of Her Life', 5 , 4);

CREATE Table SpotifyClone.`SEGUINDO_ARTISTA` (
  `seguindo_id` INT AUTO_INCREMENT PRIMARY KEY,
  `usuario_id` INT NOT NULL,
  `artista_id` INT NOT NULL,
  FOREIGN KEY (`usuario_id`) REFERENCES `USUARIO` (`usuario_id`),
  FOREIGN KEY (`artista_id`) REFERENCES `ARTISTA` (`artista_id`)
);

INSERT INTO `SEGUINDO_ARTISTA` (`usuario_id`, `artista_id`)
VALUES
(1, 1),
(1, 4),
(1, 3),
(2, 1),
(2, 3),
(3, 2),
(3, 1),
(4, 4);


CREATE Table SpotifyClone.`HISTORICO_REPRODUCAO` (
  `reproducao_id` INT AUTO_INCREMENT PRIMARY KEY,
  `usuario_id` INT NOT NULL,
  `cancao_id` INT NOT NULL,
  FOREIGN KEY (`usuario_id`) REFERENCES `USUARIO` (`usuario_id`),
  FOREIGN KEY (`cancao_id`) REFERENCES `CANCAO` (`cancao_id`)
);

INSERT INTO `HISTORICO_REPRODUCAO` (`usuario_id`, `cancao_id`)
VALUES
(1, 12),
(1, 8),
(1, 3),
(1, 14),
(2, 5),
(2, 18),
(2, 9),
(2, 6),
(3, 16),
(3, 14),
(3, 8),
(4, 2),
(4, 17),
(4, 1);
