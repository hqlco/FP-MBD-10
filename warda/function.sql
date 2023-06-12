-- rata-rata pendapatan suatu provinsi

CREATE OR REPLACE FUNCTION AvgIncomeProvince(provinsi_input VARCHAR) RETURNS NUMERIC AS $$
DECLARE
    average_transaction NUMERIC;
BEGIN
    SELECT AVG(album.harga * detail_transaksi.jumlah) INTO average_transaction
    FROM pegawai p
    INNER JOIN transaksi t ON p.id = t.pegawai_id
    INNER JOIN detail_transaksi ON detail_transaksi.transaksi_id = t.id
    INNER JOIN album ON album.id = detail_transaksi.album_id
    WHERE p.provinsi = provinsi_input;

    RETURN average_transaction;
END;
$$ LANGUAGE plpgsql;
