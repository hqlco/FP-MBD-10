WITH jml_lagu_per_album AS(
	SELECT l.album_id, COUNT(l.album_id) AS total
	FROM lagu l
	GROUP BY l.album_id
	ORDER BY COUNT(l.album_id) DESC
	LIMIT 10
)

SELECT a.nama, j.total
FROM album a
INNER JOIN jml_lagu_per_album j ON j.album_id = a.id
ORDER BY j.total DESC