DELIMITER $$
CREATE TRIGGER SpotifyClone.trigger_usuario_delete
AFTER DELETE ON SpotifyClone.Usuario
FOR EACH ROW
BEGIN
DELETE FROM SpotifyClone.Historico AS h WHERE OLD.Usuario_id = h.Usuario_id;
DELETE FROM SpotifyClone.Seguindo AS s WHERE OLD.Usuario_id = s.Usuario_id;
END$$

DELIMITER ;
