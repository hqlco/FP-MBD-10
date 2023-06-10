-- Create a trigger to update the stock of an album when a new song is inserted into the 'Lagu' table
CREATE OR REPLACE FUNCTION update_album_stock() RETURNS TRIGGER AS $$ BEGIN IF TG_OP = 'INSERT' THEN
UPDATE Album
SET stok = stok + 1000
WHERE id = NEW.Album_id;
END IF;
RETURN NEW;
END;
$$ LANGUAGE plpgsql;
-- Create the trigger
CREATE TRIGGER lagu_insert_trigger
AFTER
INSERT ON Lagu FOR EACH ROW EXECUTE FUNCTION update_album_stock();
--- INSERT INTO Lagu (id, nama, durasi, Album_id) VALUES (4002, 'Lagu Baru', 100, 1);
--- SELECT * FROM Album WHERE id = 1;