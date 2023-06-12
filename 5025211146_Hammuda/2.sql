WITH top_10_pegawai AS(
	SELECT dt.transaksi_id, SUM(a.harga * dt.jumlah) AS total
	FROM  detail_transaksi dt
	INNER JOIN album a ON a.id = dt.album_id
	GROUP BY dt.transaksi_id
	ORDER BY SUM(a.harga * dt.jumlah) DESC
	LIMIT 10
)

SELECT p.nama_depan, p.nama_belakang, tp.total
FROM transaksi t
INNER JOIN pegawai p ON p.id = t.pegawai_id
INNER JOIN top_10_pegawai tp ON tp.transaksi_id = t.id