SELECT Playlist.id,
    Playlist.nama,
    COUNT(Lagu_Playlist.Lagu_id) AS jumlah_lagu_pop
FROM Playlist
    INNER JOIN Lagu_Playlist ON Playlist.id = Lagu_Playlist.Playlist_id
    INNER JOIN Lagu ON Lagu_Playlist.Lagu_id = Lagu.id
    INNER JOIN genre_Lagu ON Lagu.id = genre_Lagu.Lagu_id
    INNER JOIN genre ON genre_Lagu.genre_id = genre.id
WHERE genre.nama = 'Pop'
GROUP BY Playlist.id,
    Playlist.nama
ORDER BY jumlah_lagu_pop DESC
LIMIT 1;