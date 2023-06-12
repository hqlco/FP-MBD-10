-- Menampilkan 20 nama depan dan nama belakang sebagai nama pelanggan dengan negara asal pelanggan adalah 'New Zealand' diurutkan berdasarkan jumlah transaksi. 
--Jika ada jumlah transaksi yang sama, urutkan berdasarkan abjad nama pelanggan

SELECT p.Nama_Depan ||' '|| p.Nama_belakang AS nama_pelanggan, COUNT(t.id) AS jumlah_transaksi FROM Pelanggan p
INNER JOIN transaksi t ON t.pelanggan_id = p.id
WHERE p.negara = 'New Zealand'
GROUP BY p.Nama_Depan, p.Nama_Belakang
ORDER BY jumlah_transaksi DESC, nama_pelanggan ASC
LIMIT 20;
