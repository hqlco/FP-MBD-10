-- menaikkan harga sebuah album jika penjualannya sudah mencapai 100 buah (naik 10%)

CREATE OR REPLACE FUNCTION increasePricePopularAlbums()
RETURNS TRIGGER AS $$
BEGIN
    -- Menghitung total penjualan dari semua album
    CREATE TEMPORARY TABLE top_albums AS
    SELECT album_id, SUM(jumlah) AS total_penjualan
    FROM detail_transaksi
    GROUP BY album_id
    HAVING SUM(Jumlah) > 100;

    -- Memperbarui harga jual pada album yang masuk dalam top 10 penjualan
    UPDATE album
    SET harga = harga * 1.1 --naik 10%
    WHERE id IN (SELECT album_id FROM top_albums);

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER increasePriceTrigger
AFTER INSERT ON detail_transaksi
FOR EACH ROW
EXECUTE FUNCTION increasePricePopularAlbums();
