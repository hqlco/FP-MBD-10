SELECT metode_pembayaran.Method,
    COUNT(Transaksi.id) AS jumlah_transaksi
FROM metode_pembayaran
    INNER JOIN Transaksi ON metode_pembayaran.id = Transaksi.metode_pembayaran_id
GROUP BY metode_pembayaran.Method
ORDER BY jumlah_transaksi DESC
LIMIT 1;