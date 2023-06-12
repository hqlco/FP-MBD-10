WITH total_album AS(
	SELECT dt.transaksi_id, SUM(dt.jumlah) AS total_album
	FROM detail_transaksi dt
	GROUP BY dt.transaksi_id
)

SELECT EXTRACT(YEAR FROM t.tanggal_transaksi) AS tahun, SUM(ta.total_album) AS total_album
FROM transaksi t
FULL JOIN total_album ta ON ta.transaksi_id = t.id
GROUP BY EXTRACT(YEAR FROM t.tanggal_transaksi)
ORDER BY EXTRACT(YEAR FROM t.tanggal_transaksi)