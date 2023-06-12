CREATE OR REPLACE PROCEDURE ganti_atasan(id_lama INT, id_baru INT)
LANGUAGE plpgsql    
AS $$
BEGIN
    UPDATE pegawai
	SET atasan = id_baru
    WHERE atasan = id_lama;
    COMMIT;
END;$$
