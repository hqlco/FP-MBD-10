WITH top_10_pelanggan AS(
	SELECT t.pelanggan_id, COUNT(t.pelanggan_id) AS total_transaksi
	FROM transaksi t
	GROUP BY t.pelanggan_id
	ORDER BY COUNT(t.pelanggan_id) DESC
	LIMIT 10
)

SELECT p.nama_depan, p.nama_belakang, tp.total_transaksi
FROM pelanggan p
INNER JOIN top_10_pelanggan tp ON tp.pelanggan_id = p.id
ORDER BY COUNT(t.pelanggan_id) DESC