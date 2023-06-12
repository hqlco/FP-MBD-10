CREATE OR REPLACE FUNCTION penghasilan_pegawai(first_name text, last_name text)
RETURNS bigint
LANGUAGE plpgsql
AS $$
DECLARE
   total bigint;
BEGIN
	WITH d_transaksi AS (
		SELECT dt.Transaksi_id AS id, dt.jumlah * a.harga AS total_detail
		FROM detail_transaksi dt
		INNER JOIN Album a ON a.id = dt.Album_id
	)
	SELECT SUM(d.total_detail) AS pemasukan
	FROM transaksi t
	INTO total
	INNER JOIN pegawai p ON p.id = t.pegawai_id
	INNER JOIN d_transaksi d ON d.id = t.id
	GROUP BY p.id
	HAVING p.nama_depan = first_name AND p.nama_belakang = last_name;
	
	IF total IS NULL THEN total = 0; END IF;
   
   RETURN total;
END;
$$;