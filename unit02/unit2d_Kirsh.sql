-- =====================================================================
-- Unit 2d — Counting and Summarizing
-- Database Applications Development · MCCC
--
-- Database: nba_5seasons.db · Tables: teams, players, team_game_stats
--
-- Rename this file with your last name before you start.
--
-- Read unit2d_Walkthrough.md first. Stuck on syntax? See unit2_StudyGuide.md.
-- =====================================================================


-- 1. How many teams are in the database?
SELECT COUNT(*) AS team_count
FROM teams;
30
-- 2. How many players?
SELECT COUNT(*) AS player_count 
FROM players;
1029
-- 3. What is the earliest founding year of any team?
SELECT MIN(year_founded) AS oldest_team
FROM teams;
1946
-- 4. What is the most recent?
SELECT MAX(year_founded) AS newest_team
FROM teams;
2002
-- 5. What is the average founding year, rounded to a whole number?
SELECT round(AVG(year_founded)) AS average_year
FROM teams;


-- 6. What is the total number of points scored across every game in
--    the database?
SELECT SUM(pts) AS total_points
FROM team_game_stats;
1399607
-- =====================================================================
-- CHECK YOUR WORK
-- =====================================================================

-- Query 6 reads 10,842 rows and gives you one number. What is it?
1399607

-- COUNT(*) counts rows. What does COUNT(birth_year) count instead?
It counts how many columns have include birth_year

-- =====================================================================
-- VOCABULARY — your words, not the reference sheet's
-- =====================================================================

-- Aggregate function: taking all the values in a table and getting on value from it.