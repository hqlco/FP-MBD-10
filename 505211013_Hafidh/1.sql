-- 1. lagu dari album termurah
SELECT l.nama, l.durasi
FROM lagu l
WHERE album_id = (SELECT id FROM album ORDER BY harga ASC LIMIT 1);