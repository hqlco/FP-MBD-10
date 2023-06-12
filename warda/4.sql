-- Provinsi dengan jumlah transaksi terbanyak dihitung sejak 1/7/2000
SELECT p.provinsi, COUNT(t.id) AS jumlah_transaksi FROM pegawai p
INNER JOIN transaksi t ON t.pegawai_id = p.id
WHERE t.Tanggal_transaksi >= '2000-07-01'
GROUP BY p.provinsi
ORDER BY jumlah_transaksi DESC
LIMIT 1;
