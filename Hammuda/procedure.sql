CREATE OR REPLACE PROCEDURE pecat(id_pegawai INT)
LANGUAGE plpgsql    
AS $$
DECLARE
	id_atasan INT;
BEGIN
	SELECT p.atasan INTO id_atasan
	FROM pegawai
    WHERE p.id = id_pegawai;
	
	IF id_atasan IS NOT NULL THEN
    	UPDATE pegawai
	    SET atasan = id_atasan
    	WHERE atasan = id_pegawai;
    	COMMIT;
	ELSE
		RAISE EXCEPTION 'cannot fire owner level employee';
	END IF;
END;$$
