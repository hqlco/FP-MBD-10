SELECT Lagu.nama
FROM Lagu
    INNER JOIN genre_Lagu ON Lagu.id = genre_Lagu.Lagu_id
    INNER JOIN Genre ON genre_Lagu.genre_id = Genre.id
WHERE Genre.nama IN ('Pop', 'Rock')
ORDER BY Lagu.durasi DESC
LIMIT 5;