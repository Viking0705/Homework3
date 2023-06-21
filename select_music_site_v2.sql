-- Задание 2
-- 2.1 Название и продолжительность самого длительного трека.
SELECT track_name, duration FROM Tracks
WHERE duration = (SELECT MAX(duration) FROM Tracks);

-- 2.2 Название треков, продолжительность которых не менее 3,5 минут.
SELECT track_name FROM Tracks
WHERE duration >= 3.5*60;

-- 2.3 Названия сборников, вышедших в период с 2018 по 2020 год включительно.
SELECT collection_name FROM Collections
WHERE year_issue BETWEEN 2018 AND 2020;

-- 2.4 Исполнители, чьё имя состоит из одного слова.
SELECT alias FROM Performers
WHERE alias NOT LIKE '% %';

-- 2.5 Название треков, которые содержат слово «мой» или «my».
--SELECT track_name FROM Tracks
--WHERE track_name LIKE '%my%' OR track_name LIKE'%My%' OR track_name LIKE '%мой%' OR track_name LIKE'%Мой%';
SELECT track_name FROM Tracks
WHERE track_name ILIKE 'my %'
OR track_name ILIKE '% my'
OR track_name ILIKE '% my %'
OR track_name ILIKE 'my'
OR track_name ILIKE 'мой %'
OR track_name ILIKE '% мой'
OR track_name ILIKE '% мой %'
OR track_name ILIKE 'мой';

-- Задание 3
-- 3.1 Количество исполнителей в каждом жанре.
SELECT mg.name_genre, COUNT(ag.id_performer) FROM Artist_genres ag
INNER JOIN Music_genres mg 
ON ag.id_genre=mg.id_music_genre
GROUP BY mg.name_genre;

-- 3.2 Количество треков, вошедших в альбомы 2019–2020 годов.
SELECT COUNT(t.id_track) FROM Tracks t
INNER JOIN Albums a
USING(id_album)
WHERE a.year_issue BETWEEN 2019 AND 2020;

-- 3.3 Средняя продолжительность треков по каждому альбому.
SELECT a.title, AVG(t.duration) AS avg_td FROM Tracks t
INNER JOIN Albums a
USING(id_album)
GROUP BY a.title
ORDER BY avg_td DESC;

-- 3.4 Все исполнители, которые не выпустили альбомы в 2020 году.
SELECT p.alias
FROM Performers p
WHERE p.alias NOT IN (
SELECT p.alias
FROM Performers p
JOIN Album_artists aa USING(id_performer)
JOIN Albums a USING(id_album)
WHERE year_issue = 2020
);

-- 3.5 Названия сборников, в которых присутствует конкретный исполнитель (выберите его сами: 'I Petrov classic').
SELECT DISTINCT c.collection_name FROM Collections c 
INNER JOIN Tracks_from_collection tfc 
USING(id_collection)
INNER JOIN Tracks t
USING(id_track)
INNER JOIN Album_artists aa 
USING(id_album)
INNER JOIN Performers p  
USING(id_performer)
WHERE p.alias = 'I Petrov classic';

-- Задание 4
-- 4.1 Названия альбомов, в которых присутствуют исполнители более чем одного жанра.
SELECT DISTINCT a.title
FROM Albums a
JOIN Album_artists aa USING(id_album)
JOIN Performers p USING(id_performer)
JOIN Artist_genres ag USING(id_performer)
GROUP BY a.title, ag.id_performer
HAVING COUNT(ag.id_genre) > 1;

-- 4.2 Наименования треков, которые не входят в сборники.
SELECT t.track_name FROM Tracks t
LEFT JOIN Tracks_from_collection tfc
USING(id_track)
LEFT JOIN Collections c 
USING(id_collection)
WHERE c.id_collection is NULL;

-- 4.3 Исполнитель или исполнители, написавшие самый короткий по продолжительности трек,— 
--     теоретически таких треков может быть несколько.
SELECT p.alias, t.track_name, t.duration FROM Performers p
JOIN Album_artists aa 
USING(id_performer)
JOIN Tracks t 
USING(id_album)
WHERE duration = (SELECT MIN(duration) FROM Tracks);

-- 4.4 Названия альбомов, содержащих наименьшее количество треков.
SELECT DISTINCT a.title AS atit, COUNT(t.track_name) FROM Albums a
JOIN Tracks t
USING(id_album)
GROUP BY a.title
HAVING  COUNT(t.track_name) = (
	SELECT MIN(counter.ct) AS min_ct
	FROM(
		SELECT DISTINCT a.title AS atit, COUNT(t.track_name) AS ct FROM Albums a
		JOIN Tracks t
		USING(id_album)
		GROUP BY a.title) counter);