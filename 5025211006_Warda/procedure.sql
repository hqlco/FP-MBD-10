-- Menambahkan lagu ke dalam playlist dengan memasukkan nama lagu dan nama playlist

CREATE PROCEDURE addSongtoPlaylist(
    nama_lagu VARCHAR,
    nama_playlist VARCHAR
) AS $$
DECLARE
    lagu_id INTEGER;
    playlist_id INTEGER;
BEGIN
    -- Cek apakah lagu dan playlist yang diberikan sudah ada
    SELECT id INTO lagu_id FROM lagu WHERE nama = nama_lagu ;
    SELECT id INTO playlist_id FROM playlist WHERE nama = nama_playlist;

    IF lagu_id IS NULL THEN
        RAISE EXCEPTION 'Lagu % tidak ditemukan', nama_lagu;
    END IF;

    IF playlist_id IS NULL THEN
        INSERT INTO playlist (nama) VALUES (nama_playlist) RETURNING id INTO playlist_id;
    END IF;

    -- Tambahkan relasi many-to-many antara lagu-playlist
    INSERT INTO Lagu_Playlist (Lagu_id, Playlist_id) VALUES (lagu_id, playlist_id);

    COMMIT;

    RAISE NOTICE 'Lagu dengan nama % berhasil ditambahkan ke dalam playlist', nama_lagu;

END;
$$ LANGUAGE plpgsql;
