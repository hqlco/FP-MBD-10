CREATE OR REPLACE PROCEDURE UpdateNamaLagu(
        IN old_song_name VARCHAR(100),
        IN new_song_name VARCHAR(100)
    ) LANGUAGE plpgsql AS $$ BEGIN -- Mengupdate nama lagu berdasarkan nama lagu lama
UPDATE Lagu
SET nama = new_song_name
WHERE nama = old_song_name;
END;
$$;
--- UpdateNamaLagu('Lagu Baru', 'Lagu Lama')
--- SELECT * FROM Lagu WHERE id =2;