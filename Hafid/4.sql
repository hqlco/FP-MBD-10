-- 4. identitas pelanggan dengan jumlah transaksi terbanyak dari kota Lake Michael
SELECT CONCAT(p.nama_depan, ' ', p.nama_belakang) AS nama_lengkap,  count(t.id) AS jumlah_transaksi
,negara , alamat, kota, Nomor_telepon
FROM pelanggan p 
INNER JOIN transaksi t ON t.pegawai_id = p.id
GROUP BY p.id
HAVING p.kota = 'Lake Michael'
ORDER BY count(t.id) DESC
LIMIT 1;
