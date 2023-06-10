SELECT Album.id,
    Album.nama,
    Lagu.nama AS lagu_terkecil,
    MIN(Lagu.durasi) AS durasi_terkecil
FROM Album
    INNER JOIN Lagu ON Album.id = Lagu.Album_id
GROUP BY Album.id,
    Album.nama,
    Lagu.nama
HAVING MIN(Lagu.durasi) = (
        SELECT MIN(durasi)
        FROM Lagu
        WHERE Album_id = Album.id
    )
ORDER BY durasi_terkecil ASC
LIMIT 1;