SELECT Album.id,
    Album.nama,
    SUM(detail_transaksi.jumlah) AS total_penjualan
FROM Album
    INNER JOIN detail_transaksi ON Album.id = detail_transaksi.Album_id
GROUP BY Album.id,
    Album.nama
ORDER BY total_penjualan DESC
LIMIT 1;