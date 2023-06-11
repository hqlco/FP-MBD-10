-- 5. catatan pemasukan dari pelanggan dari setiap transaksi terurut secara menurun
WITH d_transaksi AS
(
    SELECT dt.Transaksi_id AS id, dt.jumlah * a.harga AS total_detail
    FROM detail_transaksi dt
    INNER JOIN Album a ON a.id = dt.Album_id
)
SELECT CONCAT(p.nama_depan, ' ', p.nama_belakang) AS nama_pelanggan, t.Tanggal_transaksi, SUM(d.total_detail) AS pemasukan
FROM transaksi t
INNER JOIN pelanggan p ON p.id = t.pelanggan_id
INNER JOIN d_transaksi d ON d.id = t.id
GROUP BY p.nama_depan, p.nama_belakang, t.Tanggal_transaksi
ORDER BY pemasukan DESC;