CREATE DATABASE musicanalytics;

-- Use the above database, to work on it
USE musicanalytics;
GO

-- Artists Table
CREATE TABLE Artist (
    artist_id VARCHAR(255) PRIMARY KEY,
    artist_name NVARCHAR(255) NOT NULL
);

-- Albums Table
CREATE TABLE Album (
    album_id VARCHAR(255) PRIMARY KEY,
    album_name NVARCHAR(255) NOT NULL,
    album_release_date DATE
);

-- Tracks Table
CREATE TABLE Track (
    track_id VARCHAR(255) PRIMARY KEY,
    album_id VARCHAR(255),
    trackName NVARCHAR(255) NOT NULL,
    release_date DATE,
    FOREIGN KEY (album_id) REFERENCES Album(album_id)
);

-- Track Features Table
CREATE TABLE Track_Features (
    feature_id INT IDENTITY(1,1) PRIMARY KEY,
    track_id VARCHAR(255),
    bpm INT,
    keynote INT,
    mode INT,
    danceability_percent FLOAT,
    valence_percent FLOAT,
    energy_percent FLOAT,
    acousticness_percent FLOAT,
    instrumentalness_percent FLOAT,
    liveness_percent FLOAT,
    speechiness_percent FLOAT,
    FOREIGN KEY (track_id) REFERENCES Track(track_id)
);

-- TrackArtist Table (Many-to-Many relationship between Tracks and Artists)
CREATE TABLE TrackArtist (
    track_id VARCHAR(255),
    artist_id VARCHAR(255),
    PRIMARY KEY (track_id, artist_id),
    FOREIGN KEY (track_id) REFERENCES Track(track_id),
    FOREIGN KEY (artist_id) REFERENCES Artist(artist_id)
);

-- Genre Table
CREATE TABLE Genre (
    genre_id INT IDENTITY(1,1) PRIMARY KEY,
    genre_name NVARCHAR(255) NOT NULL
);

-- ArtistGenre Table (Many-to-Many relationship between Artists and Genres)
CREATE TABLE ArtistGenre (
    genre_id INT,
    artist_id VARCHAR(255),
    PRIMARY KEY (genre_id, artist_id),
    FOREIGN KEY (genre_id) REFERENCES Genre(genre_id),
    FOREIGN KEY (artist_id) REFERENCES Artist(artist_id)
);

-- TrackToGenre Table (Many-to-Many relationship between Tracks and Genres)
CREATE TABLE TrackToGenre (
    genre_id INT,
    track_id VARCHAR(255),
    PRIMARY KEY (genre_id, track_id),
    FOREIGN KEY (genre_id) REFERENCES Genre(genre_id),
    FOREIGN KEY (track_id) REFERENCES Track(track_id)
);

-- User Table
CREATE TABLE UserTable (
    user_id VARCHAR(255) PRIMARY KEY,
    first_name NVARCHAR(255),
    last_name NVARCHAR(255),
    contact_no NVARCHAR(255),
    email_id NVARCHAR(255)
);

-- User Interaction Table
CREATE TABLE User_Interaction (
    interaction_ID INT IDENTITY(1,1) PRIMARY KEY,
    user_id VARCHAR(255),
    track_id VARCHAR(255),
    play_count INT,
    like_flag BIT,
    FOREIGN KEY (user_id) REFERENCES UserTable(user_id),
    FOREIGN KEY (track_id) REFERENCES Track(track_id)
);

-- Chart Table
CREATE TABLE Chart (
    chart_id INT IDENTITY(1,1) PRIMARY KEY,
    chart_name NVARCHAR(255) NOT NULL
);

-- TracksToChart Table (Many-to-Many relationship between Tracks and Charts)
CREATE TABLE TracksToChart (
    track_id VARCHAR(255),
    chart_id INT,
    chart_position INT,
    PRIMARY KEY (track_id, chart_id),
    FOREIGN KEY (track_id) REFERENCES Track(track_id),
    FOREIGN KEY (chart_id) REFERENCES Chart(chart_id)
);

-- Playlist Table
CREATE TABLE Playlist (
    playlist_id INT IDENTITY(1,1) PRIMARY KEY,
    playlist_name NVARCHAR(255) NOT NULL,
    playlist_follows INT
);

-- TracksToPlaylist Table (Many-to-Many relationship between Tracks and Playlists)
CREATE TABLE TracksToPlaylist (
    track_id VARCHAR(255),
    playlist_id INT,
    PRIMARY KEY (track_id, playlist_id),
    FOREIGN KEY (track_id) REFERENCES Track(track_id),
    FOREIGN KEY (playlist_id) REFERENCES Playlist(playlist_id)
);

-- UserToPlaylist Table (Many-to-Many relationship between Users and Playlists)
CREATE TABLE UserToPlaylist (
    user_id VARCHAR(255),
    playlist_id INT,
    PRIMARY KEY (user_id, playlist_id),
    FOREIGN KEY (user_id) REFERENCES UserTable(user_id),
    FOREIGN KEY (playlist_id) REFERENCES Playlist(playlist_id)
);
