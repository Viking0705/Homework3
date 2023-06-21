-- Задание 1
INSERT INTO Music_genres
VALUES(1, 'classic'),
	(2, 'jazz'),
	(3, 'rock');
	
INSERT INTO Performers
VALUES (1, 'I Petrov classic'),
	(2, 'Jazzband'),
	(3, 'New Mozart'),
	(4, 'Goodrock');
	
INSERT INTO Albums
VALUES(1, 'New classic', 2018),
	(2, 'Good old jazz', 2016),
	(3, 'Rockers', 2019),
	(4, 'Jazz and rock', 2020);
	
INSERT INTO Album_artists
VALUES (1, 1),
	(1, 3),
	(1, 4),
	(2, 2),
	(3, 4),
	(4, 2),
	(4, 4);

INSERT INTO Artist_genres
VALUES (1, 1),
	(2, 2),
	(2, 1),
	(3, 1),
	(3, 3),
	(4, 3);
	
INSERT INTO Tracks
VALUES (1, 'My jazz', 150, 2),
	(2, 'Sonata', 300, 1),
	(3, 'Rondo', 90, 1),
	(4, 'It is my day', 200, 3),
	(5, 'Hello world', 170, 3),
	(6, 'Concert nom.1', 900, 1),
	(7, 'New sonata', 450, 2),
	(8, 'my own', 450, 2),
	(9, 'own my', 450, 2),
	(10, 'my', 450, 2),
	(11, 'oh my god', 450, 2),
	(12, 'myself', 450, 2),
	(13, 'by myself', 450, 2),
	(14, 'bemy self', 450, 2),
	(15, 'myself by', 450, 2),
	(16, 'by myself by', 450, 2),
	(17, 'beemy', 450, 2),
	(18, 'premyne', 450, 2);
	
INSERT INTO Collections
VALUES(1, 'Good_music', 2019),
	(2, 'Classic_music', 2021),
	(3, 'Cool rock', 2022),
	(4, 'Class and jazz', 2018);

INSERT INTO Tracks_from_collection
VALUES (1, 1),
	(1, 4),
	(2, 2),
	(2, 1),
	(3, 1),
	(3, 2),
	(3, 4),
	(4, 3),
	(6, 1),
	(6, 2);