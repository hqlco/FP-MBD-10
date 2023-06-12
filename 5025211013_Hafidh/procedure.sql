--procedure untuk mengupdate email dari pegawai

CREATE OR REPLACE PROCEDURE update_email(
    pegawai_id int,
    new_email varchar(100)
)
LANGUAGE plpgsql
AS $$
BEGIN
    UPDATE Pegawai
    SET Email = new_email
    WHERE id = pegawai_id;
END;
$$;

-- CALL update_email(123, 'gokillllll@example.com');

-- select * from pegawai where id = 123;