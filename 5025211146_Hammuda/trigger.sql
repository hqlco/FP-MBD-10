CREATE OR REPLACE FUNCTION update_stok_album() 
	RETURNS TRIGGER 
	LANGUAGE plpgsql
AS $$ 
BEGIN 
	CREATE TEMPORARY TABLE album_more_100 AS
	    SELECT dt.album_id
    	FROM detail_transaksi dt
	    GROUP BY dt.album_id
    	HAVING SUM(jumlah) > 100;
	
    UPDATE album
    SET stok = stok + 100
    WHERE id IN (SELECT album_id FROM album_more_100);
	
	RETURN NEW;
END;
$$ ;

CREATE OR REPLACE TRIGGER tambahStokTrigger
AFTER INSERT ON detail_transaksi
FOR EACH ROW
EXECUTE FUNCTION update_stok_album();