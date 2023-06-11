-- 2. Atasan dengan jumlah bawahan terbanyak
SELECT CONCAT(a.nama_depan, ' ', a.nama_belakang) AS nama_lengkap, COUNT(b.atasan) jumlah
FROM pegawai a
INNER JOIN pegawai b ON b.atasan = a.id
GROUP BY a.id
ORDER BY jumlah DESC
LIMIT 1;
