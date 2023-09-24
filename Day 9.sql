-- KELOMPOK 8
-- 1. Arsya Hendratno Putri
-- 2. Fegi Anora
-- 3. Jab Yoan Efendi
-- 4. Zikri Muhammad Madani

-- CASE 3
CREATE TABLE students 
( 
       id serial PRIMARY KEY, 
       first_name varchar NOT NULL, 
       last_name varchar DEFAULT NULL, 
       email varchar UNIQUE NOT NULL, 
       age integer DEFAULT 18, 
       gender varchar CHECK (gender IN ('male','female')),
       date_of_birth daTe NOT NULL,
       created_at timestamptz DEFAULT NOW());
)

-- CASE 4
CREATE OR REPLACE FUNCTION CountMoviesByGenre(genreTitle VARCHAR)
RETURNS INT AS $$
DECLARE
    movieCount INT;
BEGIN
    SELECT COUNT(*) INTO movieCount
    FROM movie
    JOIN movie_genres ON movie.mov_id = movie_genres.mov_id
    JOIN genres ON movie_genres.gen_id = genres.gen_id
    WHERE genres.gen_title = genreTitle;
    
    RETURN movieCount;
END;
$$ LANGUAGE plpgsql;

contoh: 
       SELECT CountMoviesByGenre('Drama');

-- CASE 5
SELECT r.rev_stars AS rating, 
       m.mov_title AS judul_film, 
       concat(a.act_fname,' ', a.act_lname) AS nama_pemain, 
       mc.role
FROM rating r
INNER JOIN movie m 
  ON m.mov_id = r.mov_id
INNER JOIN movie_cast mc 
  ON mc.mov_id = m.mov_id
INNER JOIN actor a 
  ON a.act_id = mc.act_id
WHERE rev_stars BETWEEN 8.30 AND 10.00
ORDER BY rev_stars DESC
LIMIT 5;

-- CASE 7
SELECT * 
FROM ( 
  SELECT m.mov_title,
         g.gen_title,
         r.rev_stars,
         RANK() OVER (PARTITION BY gen_title ORDER BY rev_stars DESC) AS rank 
  FROM movie m 
  INNER JOIN movie_genres mg ON m.mov_id = mg.mov_id 
  INNER JOIN genres g ON mg.gen_id = g.gen_id 
  INNER JOIN rating r ON m.mov_id = r.mov_id 
  WHERE r.rev_stars IS NOT NULL) tbl_movie 
WHERE tbl_movie.rank = 1;
