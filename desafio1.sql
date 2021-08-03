DROP DATABASE IF EXISTS SpotifyClone;

CREATE DATABASE SpotifyClone;

CREATE TABLE SpotifyClone.Planos(
    plano_id INT NOT NULL AUTO_INCREMENT,
    plano VARCHAR(40) NOT NULL,
    valor VARCHAR(20) NOT NULL,
    PRIMARY KEY (plano_id)
) engine = InnoDB;

CREATE TABLE SpotifyClone.Usuarios(
    usuario_id INT NOT NULL AUTO_INCREMENT,
    usuario VARCHAR(40) NOT NULL,
    idade INT NOT NULL,
    plano_id INT NOT NULL,
    PRIMARY KEY (usuario_id),
    FOREIGN KEY (plano_id) REFERENCES SpotifyClone.Planos (plano_id)
) engine = InnoDB;

CREATE TABLE SpotifyClone.Artistas(
    artista_id INT NOT NULL AUTO_INCREMENT,
    nome_artista VARCHAR(150) NOT NULL,
    PRIMARY KEY (artista_id)
) engine = InnoDB;

CREATE TABLE SpotifyClone.Albuns(
    album_id INT NOT NULL AUTO_INCREMENT,
    album VARCHAR(100) NOT NULL,
    artista_id INT NOT NULL,
    PRIMARY KEY (album_id),
    FOREIGN KEY (artista_id) REFERENCES SpotifyClone.Artistas (artista_id)
) engine = InnoDB;

CREATE TABLE SpotifyClone.Cancoes(
    cancao_id INT NOT NULL AUTO_INCREMENT,
    album_id INT NOT NULL,
    cancao VARCHAR(150) NOT NULL,
    PRIMARY KEY (cancao_id),
    FOREIGN KEY (album_id) REFERENCES SpotifyClone.Albuns (album_id)
) engine = InnoDB;

CREATE TABLE SpotifyClone.Historico(
    historico_id INT NOT NULL AUTO_INCREMENT,
    usuario_id INT NOT NULL,
    cancao_id INT NOT NULL,
    PRIMARY KEY (historico_id, usuario_id, cancao_id),
    FOREIGN KEY (usuario_id) REFERENCES SpotifyClone.Usuarios (usuario_id),
    FOREIGN KEY (cancao_id) REFERENCES SpotifyClone.Cancoes (cancao_id)
) engine = InnoDB;

CREATE TABLE SpotifyClone.Seguindo(
    seguindo_id INT NOT NULL AUTO_INCREMENT,
    usuario_id INT NOT NULL,
    artista_id INT NOT NULL,
    PRIMARY KEY (seguindo_id, usuario_id, artista_id),
    FOREIGN KEY (usuario_id) REFERENCES SpotifyClone.Usuarios (usuario_id),
    FOREIGN KEY (artista_id) REFERENCES SpotifyClone.Artistas (artista_id)
) engine = InnoDB;

INSERT INTO SpotifyClone.Planos (plano_id, plano, valor)
VALUES
(1, 'gratuito', 0),
(2, 'familiar', 7.99),
(3, 'universitário', 5.99);
  
INSERT INTO SpotifyClone.Usuarios (usuario_id, usuario, idade, plano_id)
VALUES
(1, 'Thati', 23, 1),
(2, 'Cintia', 35, 2),
(3, 'Bill', 20, 3),
(4, 'Roger', 45, 1);

INSERT INTO SpotifyClone.Artistas (artista_id, nome_artista)
VALUES
(1, 'Walter Phoenix'),
(2, 'Freedie Shannon'),
(3, 'Lance Day'),
(4, 'Peter Strong');

INSERT INTO SpotifyClone.Albuns (album_id, album, artista_id)
VALUES
(1, 'Envious', 1),
(2, 'Exuberant', 1),
(3, 'Hallowed Steam', 4),
(4, 'Incandescent', 3),
(5, 'Temporary Culture', 2);

INSERT INTO  SpotifyClone.Cancoes(cancao_id, album_id, cancao)
VALUES
(1,1,'Soul For Us'),
(2,1,'Reflections Of Magic'),
(3,1,'Dance With Her Own'),
(4,2,'Troubles Of My Inner Fire'),
(5,2,'Time Fireworks'),
(6,3,'Magic Circus'),
(7,3,'Honey, So Do I'),
(8,3,"Sweetie, Let's Go Wild"),
(9,3,'She Knows'),
(10,4,'Fantasy For Me'),
(11,4,'Celebration Of More'),
(12,4,'Rock His Everything'),
(13,4,'Home Forever'),
(14,4,'Diamond Power'),
(15,4, "Honey, Let's Be Silly"),
(16,5,'Thang Of Thunder'),
(17,5,'Words Of Her Life'),
(18,5,'Without My Streets');

INSERT INTO SpotifyClone.Historico(historico_id, usuario_id, cancao_id)
VALUES
(1,1,1),
(2,1,6),
(3,1,14),
(4,1,16),
(5,2,13),
(6,2,17),
(7,2,2),
(8,2,15),
(9,3,4),
(10,3,16),
(11,3,6),
(12,4,3),
(13,4,18),
(14,4,11);

INSERT INTO SpotifyClone.Seguindo(seguindo_id, usuario_id, artista_id)
VALUES
(1,1,1),
(2,1,2),
(3,1,3),
(4,2,1),
(5,2,3),
(6,3,4),
(7,3,1),
(8,4,2 );
