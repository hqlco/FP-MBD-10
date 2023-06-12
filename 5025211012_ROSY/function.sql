CREATE OR REPLACE FUNCTION total_durasi_pergenre(genre_name varchar) RETURNS INTEGER AS $$
DECLARE total_duration INTEGER;
BEGIN
SELECT SUM(l.durasi) INTO total_duration
FROM Lagu l
    JOIN genre_Lagu gl ON l.id = gl.Lagu_id
    JOIN genre g ON gl.genre_id = g.id
WHERE g.nama = genre_name;
RETURN total_duration;
END;
$$ LANGUAGE plpgsql;
--- total_durasi_pergenre('Pop')