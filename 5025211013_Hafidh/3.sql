-- 3. identitas pegawai dengan jumlah transaksi terbanyak dari negara Congo
SELECT CONCAT(p.nama_depan, ' ', p.nama_belakang) AS nama_lengkap,  count(t.id) AS jumlah_transaksi
,negara , jabatan, alamat, kota, Nomor_telepon
FROM pegawai p
INNER JOIN transaksi t ON t.pegawai_id = p.id
GROUP BY p.id
HAVING p.negara = 'Congo'
ORDER BY count(t.id) DESC
LIMIT 1;