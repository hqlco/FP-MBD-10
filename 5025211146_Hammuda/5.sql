WITH total_album AS(
	SELECT t.tanggal_transaksi, p.nama, SUM(dt.jumlah) AS total
	FROM detail_transaksi dt
	INNER JOIN transaksi t ON t.id = dt.transaksi_id
	INNER JOIN album a ON a.id = dt.album_id
	INNER JOIN penyanyi p ON p.id = a.penyanyi_id
	GROUP BY t.tanggal_transaksi, p.id
),
max_total AS(
	SELECT ta.tanggal_transaksi, MAX(ta.total) AS total
	FROM total_album ta
	GROUP BY ta.tanggal_transaksi
)

SELECT ta.tanggal_transaksi, ta.nama, ta.total
FROM total_album ta
INNER JOIN max_total mt ON mt.tanggal_transaksi = ta.tanggal_transaksi
WHERE ta.total = mt.total
ORDER BY ta.tanggal_transaksi