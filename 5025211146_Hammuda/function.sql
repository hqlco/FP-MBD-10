CREATE OR REPLACE FUNCTION total_penjualan(tanggal date)
RETURNS bigint
LANGUAGE plpgsql
AS $$
DECLARE
   total bigint;
BEGIN
	WITH filter_tanggal AS(
		SELECT t.id, t.tanggal_transaksi
		FROM transaksi t
		WHERE t.tanggal_transaksi = tanggal
	)
	
	SELECT SUM(a.harga * dt.jumlah)
	FROM detail_transaksi dt
	INTO total
	INNER JOIN album a ON a.id = dt.album_id
	INNER JOIN filter_tanggal ft ON ft.id = dt.transaksi_id
	GROUP BY ft.tanggal_transaksi;
	
	IF total IS NULL THEN total = 0; END IF;
   
   RETURN total;
END;
$$;