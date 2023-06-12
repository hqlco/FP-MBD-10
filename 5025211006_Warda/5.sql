-- Nama pegawai yang melayani transaksi lebih dari 5 sejak 1/1/2010 sampai 31/12/2020
SELECT p.Nama_Depan ||' '|| p.Nama_Belakang AS nama_pegawai, p.provinsi, p.negara, COUNT(t.id) AS jumlah_transaksi FROM Pegawai p
INNER JOIN transaksi t ON t.pegawai_id = p.id
WHERE t.Tanggal_transaksi BETWEEN '2010-01-01' AND '2020-12-31' 
GROUP BY p.Nama_Depan, p.Nama_Belakang, p.provinsi, p.negara 
HAVING COUNT(t.id) > 5;
