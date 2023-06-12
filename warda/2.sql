-- Nama composer dengan lagu jazz terbanyak
SELECT c.nama_composer, COUNT(l.id) AS Jumlah_lagu FROM composer c
INNER JOIN Composer_Lagu cl ON cl.composer_id = c.id
INNER JOIN Lagu l ON l.id = cl.Lagu_id
INNER JOIN genre_Lagu gl ON gl.Lagu_id = l.id
INNER JOIN genre g ON g.id = gl.genre_id
WHERE g.nama = 'Jazz'
GROUP BY c.id
ORDER BY Jumlah_lagu DESC
LIMIT 1;
