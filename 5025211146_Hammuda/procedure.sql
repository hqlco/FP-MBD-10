CREATE OR REPLACE PROCEDURE pecat(id_pegawai INT)
LANGUAGE plpgsql    
AS $$
BEGIN
    UPDATE pegawai
	SET atasan = NULL
    WHERE atasan = id_pegawai;

	DELETE FROM pegawai
	WHERE id = id_pegawai;
    COMMIT;
END;$$
