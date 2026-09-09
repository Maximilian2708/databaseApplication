-- =====================================================================
-- Unit 2f — Joining Two Tables
-- Database Applications Development · MCCC
--
-- Databases: movies_small.db for 1-3, nba_5seasons.db for 4-6
-- Note above each query which database it uses.
--
-- Rename this file with your last name before you start.
--
-- Read unit2f_Walkthrough.md first. Stuck on syntax? See unit2_StudyGuide.md.
-- =====================================================================


-- 1. Show every movie's title alongside its average rating.
-- Database: movies_small.db
SELECT m.title, r.rating
FROM movies m
INNER JOIN ratings r ON m.id = r.movie_id;


-- 2. Show the ten most-voted movies: title, average rating, and
--    number of votes.
-- Database: movies_small.db
SELECT m.title, r.rating, r.votes
FROM movies m
INNER JOIN ratings r ON m.id = r.movie_id
ORDER BY r.votes DESC
LIMIT 10;


-- 3. Show movies rated above 8.5: title, release year, and rating,
--    highest rated first.
-- Database: movies_small.db
SELECT m.title, m.year, r.rating
FROM movies m
INNER JOIN ratings r ON m.id = r.movie_id
WHERE r.rating > 8.5
ORDER BY r.rating DESC;


-- 4. Show the game date, team name, and points for the first 20 rows
--    of team_game_stats.
-- Database: nba_5seasons.db
SELECT g.game_date, t.name AS team_name, tgs.points
FROM team_game_stats tgs
INNER JOIN games g ON tgs.game_id = g.id
INNER JOIN teams t ON tgs.team_id = t.id
LIMIT 20;


-- 5. Show the ten highest-scoring player seasons: player name,
--    season, and points.
-- Database: nba_5seasons.db
SELECT p.name AS player_name, ps.season, ps.points
FROM player_seasons ps
INNER JOIN players p ON ps.player_id = p.id
ORDER BY ps.points DESC
LIMIT 10;


-- 6. For the 2024-25 season, show the ten highest-scoring players
--    with their name, their team's name, and their points.
--    (Three tables.)
-- Database: nba_5seasons.db
SELECT p.name AS player_name, t.name AS team_name, ps.points
FROM player_seasons ps
INNER JOIN players p ON ps.player_id = p.id
INNER JOIN teams t ON ps.team_id = t.id
WHERE ps.season = '2024-25'
ORDER BY ps.points DESC
LIMIT 10;


-- =====================================================================
-- CHECK YOUR WORK
-- =====================================================================

-- Query 1 returns 2,659 rows — the same as the number of movies.
-- What does that tell you about the relationship between movies and
-- ratings?
It tells us there is a 1-to-1 relationship between movies and ratings in 
this database

-- In query 6, which table sits in the middle connecting the other two?
'player_seasons` sits in the middle because it contains foreign keys 
(player_id and team_id) referencing both the `players` and `teams` tables.


-- =====================================================================
-- VOCABULARY — your words, not the reference sheet's
-- =====================================================================

-- Join: A way to combine columns from two or more tables into a single result 
-- based on matching values in related columns.

-- INNER JOIN: A join that only keeps rows where a matching value exists in 
-- both connected tables, filtering out unmatched rows.

-- Table alias: A temporary nickname given to a table in a query to keep the SQL shorter and cleaner to read.