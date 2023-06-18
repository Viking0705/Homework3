-- Задание 1
INSERT INTO Music_genres
VALUES(1, 'classic'),
	(2, 'jazz'),
	(3, 'rock');
	
INSERT INTO Performers
VALUES (1, 'I Petrov classic'),
	(2, 'Jassband'),
	(3, 'New Mozart'),
	(4, 'Goodrock');
	
INSERT INTO Albums
VALUES(1, 'New classic', 2018),
	(2, 'Good old jazz', 2016),
	(3, 'Rockers', 2019);
	
INSERT INTO Album_artists
VALUES (1, 1),
	(1, 3),
	(1, 4),
	(2, 2),
	(3, 4);

INSERT INTO Artist_genres
VALUES (1, 1),
	(2, 2),
	(3, 1),
	(4, 3);
	
INSERT INTO Tracks
VALUES (1, 'My jazz', 150, 2),
	(2, 'Sonata', 300, 1),
	(3, 'Rondo', 90, 1),
	(4, 'It is my day', 200, 3),
	(5, 'Hello world', 170, 3),
	(6, 'Concert nom.1', 900, 1),
	(7, 'New sonata', 450, 1);
	
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