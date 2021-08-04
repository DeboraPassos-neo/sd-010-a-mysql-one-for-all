-- DROP VIEW top_2_hits_do_momento;

CREATE VIEW top_2_hits_do_momento AS
    SELECT 
        s.song AS cancao, COUNT(r.user_id) AS reproducoes
    FROM
        SpotifyClone.songs AS s
            INNER JOIN
        SpotifyClone.reproduction_history AS r ON s.song_id = r.song_id
    GROUP BY 1
    ORDER BY 2 DESC , 1
    LIMIT 2;

-- SELECT * FROM top_2_hits_do_momento;
