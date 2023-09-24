-- KELOMPOK 8
-- 1. Arsya Hendratno Putri
-- 2. Fegi Anora
-- 3. Jab Yoan Efendi
-- 4. Zikri Muhammad Madani

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
