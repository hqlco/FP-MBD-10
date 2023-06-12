--update stok ketika dilakukan insert
CREATE OR REPLACE FUNCTION check_and_update_album_stok()
RETURNS TRIGGER AS $$
BEGIN
    IF (TG_OP = 'INSERT') THEN
        IF (NEW.jumlah > (SELECT stok FROM Album WHERE id = NEW.Album_id)) THEN
            RAISE EXCEPTION 'Stok album tidak mencukupi';
        END IF;
        
        UPDATE Album
        SET stok = stok - NEW.jumlah
        WHERE id = NEW.Album_id;
        
        RETURN NEW;
    END IF;
    
    RETURN NULL;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER transaksi_before_insert_update
BEFORE INSERT OR UPDATE ON detail_transaksi
FOR EACH ROW
EXECUTE FUNCTION check_and_update_album_stok();

--  select * from album where id = 123;
--  INSERT INTO detail_transaksi (id,jumlah, Transaksi_id, Album_id)
-- VALUES (100002,37, 1, 123);
-- select * from album where id = 123;