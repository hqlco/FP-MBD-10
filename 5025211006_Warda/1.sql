-- Menampilkan semua nama penyanyi dengan jumlah album terbanyak
SELECT p.nama, COUNT(a.id) AS Jumlah_Album FROM penyanyi p
INNER JOIN Album a ON a.Penyanyi_id = p.id
GROUP BY p.id
HAVING COUNT(a.id) = ( 
    SELECT COUNT(id) AS Jumlah_Album
    FROM Album
    GROUP BY Penyanyi_id
    ORDER BY Jumlah_Album DESC
    LIMIT 1
);
