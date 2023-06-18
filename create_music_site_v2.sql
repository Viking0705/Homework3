CREATE TABLE IF NOT EXISTS Music_genres (
	id_music_genre INTEGER PRIMARY KEY,
	name_genre VARCHAR(40) NOT NULL UNIQUE 
);

CREATE TABLE IF NOT EXISTS Performers (
	id_performer INTEGER PRIMARY KEY,
	alias VARCHAR(40) NOT NULL UNIQUE 
);

CREATE TABLE IF NOT EXISTS Albums (
	id_album INTEGER PRIMARY KEY,
	title VARCHAR(40) NOT NULL,
	year_issue INTEGER CHECK (year_issue > 1920)
);

CREATE TABLE IF NOT EXISTS Album_artists (
	id_album INTEGER REFERENCES Albums(id_album),
	id_performer INTEGER REFERENCES Performers(id_performer),
	CONSTRAINT pk1 PRIMARY KEY (id_album, id_performer)
);

CREATE TABLE IF NOT EXISTS Artist_genres (
	id_performer INTEGER REFERENCES Performers(id_performer),
	id_genre INTEGER REFERENCES Music_genres(id_music_genre),
	CONSTRAINT pk2 PRIMARY KEY (id_performer, id_genre)
);

CREATE TABLE IF NOT EXISTS Tracks (
	id_track INTEGER PRIMARY KEY,
	track_name VARCHAR(40) NOT NULL,
	duration INTEGER NOT NULL,
	id_album INTEGER NOT NULL REFERENCES Albums(id_album)
);

CREATE TABLE IF NOT EXISTS Collections (
	id_collection INTEGER PRIMARY KEY,
	collection_name VARCHAR(40) NOT NULL,
	year_issue INTEGER CHECK (year_issue > 1920)
);

CREATE TABLE IF NOT EXISTS Tracks_from_collection (
	id_track INTEGER REFERENCES Tracks(id_track),
	id_collection INTEGER REFERENCES Collections(id_collection),
	CONSTRAINT pk3 PRIMARY KEY (id_track, id_collection)
);