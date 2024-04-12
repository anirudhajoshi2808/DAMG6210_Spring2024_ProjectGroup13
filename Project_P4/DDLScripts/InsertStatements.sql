-- Insert into Artists Table
INSERT INTO Artist (artist_id, artist_name) VALUES ('1', N'Radiohead');
INSERT INTO Artist (artist_id, artist_name) VALUES ('2', N'The Beatles');
INSERT INTO Artist (artist_id, artist_name) VALUES ('3', N'Kendrick Lamar');
INSERT INTO Artist (artist_id, artist_name) VALUES ('4', N'Adele');
INSERT INTO Artist (artist_id, artist_name) VALUES ('5', N'Led Zeppelin');
INSERT INTO Artist (artist_id, artist_name) VALUES ('6', N'Taylor Swift');
INSERT INTO Artist (artist_id, artist_name) VALUES ('7', N'David Bowie');
INSERT INTO Artist (artist_id, artist_name) VALUES ('8', N'Bob Dylan');
INSERT INTO Artist (artist_id, artist_name) VALUES ('9', N'Drake');
INSERT INTO Artist (artist_id, artist_name) VALUES ('10', N'Pink Floyd');

-- Insert into Albums Table
INSERT INTO Album (album_id, album_name, album_release_date) VALUES ('101', N'OK Computer', '1997-05-21');
INSERT INTO Album (album_id, album_name, album_release_date) VALUES ('102', N'Abbey Road', '1969-09-26');
INSERT INTO Album (album_id, album_name, album_release_date) VALUES ('103', N'To Pimp a Butterfly', '2015-03-15');
INSERT INTO Album (album_id, album_name, album_release_date) VALUES ('104', N'25', '2015-11-20');
INSERT INTO Album (album_id, album_name, album_release_date) VALUES ('105', N'Led Zeppelin IV', '1971-11-08');
INSERT INTO Album (album_id, album_name, album_release_date) VALUES ('106', N'1989', '2014-10-27');
INSERT INTO Album (album_id, album_name, album_release_date) VALUES ('107', N'The Rise and Fall of Ziggy Stardust and the Spiders from Mars', '1972-06-16');
INSERT INTO Album (album_id, album_name, album_release_date) VALUES ('108', N'Highway 61 Revisited', '1965-08-30');
INSERT INTO Album (album_id, album_name, album_release_date) VALUES ('109', N'Views', '2016-04-29');
INSERT INTO Album (album_id, album_name, album_release_date) VALUES ('110', N'The Dark Side of the Moon', '1973-03-01');

-- Insert into Tracks Table (just a few tracks per album for example)
INSERT INTO Track (track_id, album_id, trackName, release_date) VALUES ('1001', '101', N'Karma Police', '1997-05-21');
INSERT INTO Track (track_id, album_id, trackName, release_date) VALUES ('1002', '101', N'No Surprises', '1997-05-21');
INSERT INTO Track (track_id, album_id, trackName, release_date) VALUES ('1003', '102', N'Come Together', '1969-09-26');
INSERT INTO Track (track_id, album_id, trackName, release_date) VALUES ('1004', '102', N'Here Comes The Sun', '1969-09-26');
INSERT INTO Track (track_id, album_id, trackName, release_date) VALUES ('1005', '103', N'Alright', '2015-03-15');
INSERT INTO Track (track_id, album_id, trackName, release_date) VALUES ('1006', '103', N'King Kunta', '2015-03-15');
INSERT INTO Track (track_id, album_id, trackName, release_date) VALUES ('1007', '104', N'Hello', '2015-11-20');
INSERT INTO Track (track_id, album_id, trackName, release_date) VALUES ('1008', '104', N'When We Were Young', '2015-11-20');
INSERT INTO Track (track_id, album_id, trackName, release_date) VALUES ('1009', '105', N'Stairway To Heaven', '1971-11-08');
INSERT INTO Track (track_id, album_id, trackName, release_date) VALUES ('1010', '105', N'Black Dog');

-- Insert into Track_Features Table
INSERT INTO Track_Features (track_id, bpm, keynote, mode, danceability_percent, valence_percent, energy_percent, acousticness_percent, instrumentalness_percent, liveness_percent, speechiness_percent) 
VALUES ('1001', 118, 5, 1, 0.64, 0.52, 0.70, 0.01, 0.00, 0.15, 0.04);
INSERT INTO Track_Features (track_id, bpm, keynote, mode, danceability_percent, valence_percent, energy_percent, acousticness_percent, instrumentalness_percent, liveness_percent, speechiness_percent) 
VALUES ('1002', 135, 3, 0, 0.68, 0.65, 0.80, 0.05, 0.02, 0.10, 0.03);
INSERT INTO Track_Features (track_id, bpm, keynote, mode, danceability_percent, valence_percent, energy_percent, acousticness_percent, instrumentalness_percent, liveness_percent, speechiness_percent) 
VALUES ('1003', 150, 8, 1, 0.73, 0.75, 0.78, 0.04, 0.05, 0.08, 0.05);
INSERT INTO Track_Features (track_id, bpm, keynote, mode, danceability_percent, valence_percent, energy_percent, acousticness_percent, instrumentalness_percent, liveness_percent, speechiness_percent) 
VALUES ('1004', 95, 10, 0, 0.53, 0.45, 0.55, 0.10, 0.00, 0.12, 0.03);
INSERT INTO Track_Features (track_id, bpm, keynote, mode, danceability_percent, valence_percent, energy_percent, acousticness_percent, instrumentalness_percent, liveness_percent, speechiness_percent) 
VALUES ('1005', 105, 2, 1, 0.71, 0.67, 0.85, 0.02, 0.04, 0.13, 0.04);
INSERT INTO Track_Features (track_id, bpm, keynote, mode, danceability_percent, valence_percent, energy_percent, acousticness_percent, instrumentalness_percent, liveness_percent, speechiness_percent) 
VALUES ('1006', 110, 4, 1, 0.66, 0.54, 0.76, 0.03, 0.01, 0.11, 0.06);
INSERT INTO Track_Features (track_id, bpm, keynote, mode, danceability_percent, valence_percent, energy_percent, acousticness_percent, instrumentalness_percent, liveness_percent, speechiness_percent) 
VALUES ('1007', 125, 6, 0, 0.69, 0.58, 0.81, 0.07, 0.00, 0.09, 0.04);
INSERT INTO Track_Features (track_id, bpm, keynote, mode, danceability_percent, valence_percent, energy_percent, acousticness_percent, instrumentalness_percent, liveness_percent, speechiness_percent) 
VALUES ('1008', 128, 1, 1, 0.74, 0.88, 0.90, 0.01, 0.05, 0.34, 0.03);
INSERT INTO Track_Features (track_id, bpm, keynote, mode, danceability_percent, valence_percent, energy_percent, acousticness_percent, instrumentalness_percent, liveness_percent, speechiness_percent) 
VALUES ('1009', 122, 7, 0, 0.60, 0.40, 0.65, 0.15, 0.00, 0.10, 0.04);
INSERT INTO Track_Features (track_id, bpm, keynote, mode, danceability_percent, valence_percent, energy_percent, acousticness_percent, instrumentalness_percent, liveness_percent, speechiness_percent) 
VALUES ('1010', 123, 11, 1, 0.77, 0.70, 0.82, 0.09, 0.10, 0.07, 0.05);

-- Insert into TrackArtist Table
INSERT INTO TrackArtist (track_id, artist_id) VALUES ('1001', '1'); -- Karma Police by Radiohead
INSERT INTO TrackArtist (track_id, artist_id) VALUES ('1002', '10'); -- No Surprises by Pink Floyd
INSERT INTO TrackArtist (track_id, artist_id) VALUES ('1003', '2'); -- Come Together by The Beatles
INSERT INTO TrackArtist (track_id, artist_id) VALUES ('1004', '3'); -- Here Comes The Sun by Kendrick Lamar
INSERT INTO TrackArtist (track_id, artist_id) VALUES ('1005', '4'); -- Alright by Adele
INSERT INTO TrackArtist (track_id, artist_id) VALUES ('1006', '5'); -- King Kunta by Led Zeppelin
INSERT INTO TrackArtist (track_id, artist_id) VALUES ('1007', '6'); -- Hello by Taylor Swift
INSERT INTO TrackArtist (track_id, artist_id) VALUES ('1008', '7'); -- When We Were Young by David Bowie
INSERT INTO TrackArtist (track_id, artist_id) VALUES ('1009', '8'); -- Stairway To Heaven by Bob Dylan
INSERT INTO TrackArtist (track_id, artist_id) VALUES ('1010', '9'); -- Black Dog by Drake


-- Insert into Genre Table
INSERT INTO Genre (genre_name) VALUES (N'Rock');
INSERT INTO Genre (genre_name) VALUES (N'Pop');
INSERT INTO Genre (genre_name) VALUES (N'Jazz');
INSERT INTO Genre (genre_name) VALUES (N'Classical');
INSERT INTO Genre (genre_name) VALUES (N'Electronic');
INSERT INTO Genre (genre_name) VALUES (N'Hip Hop');
INSERT INTO Genre (genre_name) VALUES (N'Country');
INSERT INTO Genre (genre_name) VALUES (N'Blues');
INSERT INTO Genre (genre_name) VALUES (N'Reggae');
INSERT INTO Genre (genre_name) VALUES (N'Funk');

-- Insert into ArtistGenre Table
INSERT INTO ArtistGenre (genre_id, artist_id) VALUES (1, '1');
INSERT INTO ArtistGenre (genre_id, artist_id) VALUES (2, '1');
INSERT INTO ArtistGenre (genre_id, artist_id) VALUES (1, '2');
INSERT INTO ArtistGenre (genre_id, artist_id) VALUES (2, '2'); 
INSERT INTO ArtistGenre (genre_id, artist_id) VALUES (6, '3');
INSERT INTO ArtistGenre (genre_id, artist_id) VALUES (2, '4');
INSERT INTO ArtistGenre (genre_id, artist_id) VALUES (7, '4');
INSERT INTO ArtistGenre (genre_id, artist_id) VALUES (1, '5');
INSERT INTO ArtistGenre (genre_id, artist_id) VALUES (8, '5');
INSERT INTO ArtistGenre (genre_id, artist_id) VALUES (2, '6');
INSERT INTO ArtistGenre (genre_id, artist_id) VALUES (7, '6');
INSERT INTO ArtistGenre (genre_id, artist_id) VALUES (1, '7');
INSERT INTO ArtistGenre (genre_id, artist_id) VALUES (9, '7');
INSERT INTO ArtistGenre (genre_id, artist_id) VALUES (1, '8');
INSERT INTO ArtistGenre (genre_id, artist_id) VALUES (8, '8');
INSERT INTO ArtistGenre (genre_id, artist_id) VALUES (6, '9');
INSERT INTO ArtistGenre (genre_id, artist_id) VALUES (2, '9');
INSERT INTO ArtistGenre (genre_id, artist_id) VALUES (1, '10');
INSERT INTO ArtistGenre (genre_id, artist_id) VALUES (5, '10');

-- Insert into TrackToGenre Table
INSERT INTO TrackToGenre (track_id, genre_id)
VALUES (1001, 1);
INSERT INTO TrackToGenre (track_id, genre_id)
VALUES (1002, 1);
INSERT INTO TrackToGenre (track_id, genre_id)
VALUES (1003, 7);
INSERT INTO TrackToGenre (track_id, genre_id)
VALUES (1007, 2);
INSERT INTO TrackToGenre (track_id, genre_id)
VALUES (1008, 2);
INSERT INTO TrackToGenre (track_id, genre_id)
VALUES (1005, 6);
INSERT INTO TrackToGenre (track_id, genre_id)
VALUES (1006, 6);
INSERT INTO TrackToGenre (track_id, genre_id)
VALUES (1009, 4);
INSERT INTO TrackToGenre (track_id, genre_id)
VALUES (1010, 5);
INSERT INTO TrackToGenre (track_id, genre_id)
VALUES (1004, 1);

-- Insert into UserTable
INSERT INTO UserTable (user_id, first_name, last_name, contact_no, email_id)
VALUES (1, 'John', 'Smith', '+1 (202) 555-0123', 'john.smith@example.com');
INSERT INTO UserTable (user_id, first_name, last_name, contact_no, email_id)
VALUES (2, 'Aisha', 'Kapoor', '+1 (415) 555-4567', 'aisha.kapoor@example.com');
INSERT INTO UserTable (user_id, first_name, last_name, contact_no, email_id)
VALUES (3, 'Emily', 'Williams', '+1 (703) 555-8901', 'emily.williams@example.com');
INSERT INTO UserTable (user_id, first_name, last_name, contact_no, email_id)
VALUES (4, 'Rohan', 'Sharma', '+1 (650) 555-3210', 'rohan.sharma@example.com');
INSERT INTO UserTable (user_id, first_name, last_name, contact_no, email_id)
VALUES (5, 'William', 'Miller', '+1 (310) 555-7654', 'william.miller@example.com');
INSERT INTO UserTable (user_id, first_name, last_name, contact_no, email_id)
VALUES (6, 'Priya', 'Patel', '+1 (916) 555-1357', 'priya.patel@example.com');
INSERT INTO UserTable (user_id, first_name, last_name, contact_no, email_id)
VALUES (7, 'Sarah', 'Brown', '+1 (512) 555-9876', 'sarah.brown@example.com');
INSERT INTO UserTable (user_id, first_name, last_name, contact_no, email_id)
VALUES (8, 'Rahul', 'Singh', '+1 (212) 555-2468', 'rahul.singh@example.com');
INSERT INTO UserTable (user_id, first_name, last_name, contact_no, email_id)
VALUES (9, 'David', 'Johnson', '+1 (818) 555-0987', 'david.johnson@example.com');
INSERT INTO UserTable (user_id, first_name, last_name, contact_no, email_id)
VALUES (10, 'Nikita', 'Gupta', '+1 (404) 555-5790', 'nikita.gupta@example.com');

-- Insert into User_Interaction Table
INSERT INTO User_Interaction (interaction_ID, user_id, track_id, play_count, like_flag)
VALUES (1, 1, 1001, 2, 1);
INSERT INTO User_Interaction (interaction_ID, user_id, track_id, play_count, like_flag)
VALUES (2, 2, 1002, 1, 0);
INSERT INTO User_Interaction (interaction_ID, user_id, track_id, play_count, like_flag)
VALUES (3, 3, 1003, 4, 1);
INSERT INTO User_Interaction (interaction_ID, user_id, track_id, play_count, like_flag)
VALUES (4, 4, 1004, 3, 0);
INSERT INTO User_Interaction (interaction_ID, user_id, track_id, play_count, like_flag)
VALUES (5, 5, 1005, 1, 1);
INSERT INTO User_Interaction (interaction_ID, user_id, track_id, play_count, like_flag)
VALUES (6, 6, 1006, 2, 0);
INSERT INTO User_Interaction (interaction_ID, user_id, track_id, play_count, like_flag)
VALUES (7, 7, 1007, 5, 1);
INSERT INTO User_Interaction (interaction_ID, user_id, track_id, play_count, like_flag)
VALUES (8, 8, 1008, 7, 0);
INSERT INTO User_Interaction (interaction_ID, user_id, track_id, play_count, like_flag)
VALUES (9, 9, 1009, 3, 1);
INSERT INTO User_Interaction (interaction_ID, user_id, track_id, play_count, like_flag)
VALUES (10, 10, 1010, 6, 0);

-- Insert into Chart Table
INSERT INTO Chart (chart_id, chart_name) VALUES (201, N'Billboard Top 5');
INSERT INTO Chart (chart_id, chart_name) VALUES (202, N'Weekly Top 3');
INSERT INTO Chart (chart_id, chart_name) VALUES (203, N'Rock');
INSERT INTO Chart (chart_id, chart_name) VALUES (204, N'Country Music Chart');
INSERT INTO Chart (chart_id, chart_name) VALUES (205, N'USA Top 5');
INSERT INTO Chart (chart_id, chart_name) VALUES (206, N'Global Top 3');
INSERT INTO Chart (chart_id, chart_name) VALUES (207, N'Jazz Classics');
INSERT INTO Chart (chart_id, chart_name) VALUES (208, N'Electronic Beats');
INSERT INTO Chart (chart_id, chart_name) VALUES (209, N'Classical Music Favorites');
INSERT INTO Chart (chart_id, chart_name) VALUES (210, N'Blues Hits');

-- Insert into TracksToChart Table

INSERT INTO TracksToChart (track_id, chart_id, chart_position) VALUES ('1001', 201, 1);
INSERT INTO TracksToChart (track_id, chart_id, chart_position) VALUES ('1002', 201, 2);
INSERT INTO TracksToChart (track_id, chart_id, chart_position) VALUES ('1003', 201, 3);
INSERT INTO TracksToChart (track_id, chart_id, chart_position) VALUES ('1004', 201, 4);
INSERT INTO TracksToChart (track_id, chart_id, chart_position) VALUES ('1005', 201, 5);
INSERT INTO TracksToChart (track_id, chart_id, chart_position) VALUES ('1006', 202, 1);
INSERT INTO TracksToChart (track_id, chart_id, chart_position) VALUES ('1007', 202, 2);
INSERT INTO TracksToChart (track_id, chart_id, chart_position) VALUES ('1008', 202, 3);
INSERT INTO TracksToChart (track_id, chart_id, chart_position) VALUES ('1009', 203, 1);
INSERT INTO TracksToChart (track_id, chart_id, chart_position) VALUES ('1010', 203, 2);
INSERT INTO TracksToChart (track_id, chart_id, chart_position) VALUES ('1001', 203, 3);
INSERT INTO TracksToChart (track_id, chart_id, chart_position) VALUES ('1002', 203, 4);
INSERT INTO TracksToChart (track_id, chart_id, chart_position) VALUES ('1003', 203, 5);
INSERT INTO TracksToChart (track_id, chart_id, chart_position) VALUES ('1004', 204, 1);
INSERT INTO TracksToChart (track_id, chart_id, chart_position) VALUES ('1005', 204, 2);
INSERT INTO TracksToChart (track_id, chart_id, chart_position) VALUES ('1006', 204, 3);
INSERT INTO TracksToChart (track_id, chart_id, chart_position) VALUES ('1007', 205, 1);
INSERT INTO TracksToChart (track_id, chart_id, chart_position) VALUES ('1008', 205, 2);
INSERT INTO TracksToChart (track_id, chart_id, chart_position) VALUES ('1009', 205, 3);
INSERT INTO TracksToChart (track_id, chart_id, chart_position) VALUES ('1010', 205, 4);
INSERT INTO TracksToChart (track_id, chart_id, chart_position) VALUES ('1001', 205, 5);
INSERT INTO TracksToChart (track_id, chart_id, chart_position) VALUES ('1001', 206, 1);
INSERT INTO TracksToChart (track_id, chart_id, chart_position) VALUES ('1002', 206, 2);
INSERT INTO TracksToChart (track_id, chart_id, chart_position) VALUES ('1003', 206, 3);
INSERT INTO TracksToChart (track_id, chart_id, chart_position) VALUES ('1004', 207, 1);
INSERT INTO TracksToChart (track_id, chart_id, chart_position) VALUES ('1005', 207, 2);
INSERT INTO TracksToChart (track_id, chart_id, chart_position) VALUES ('1006', 207, 3);
INSERT INTO TracksToChart (track_id, chart_id, chart_position) VALUES ('1007', 207, 4);
INSERT INTO TracksToChart (track_id, chart_id, chart_position) VALUES ('1008', 207, 5);
INSERT INTO TracksToChart (track_id, chart_id, chart_position) VALUES ('1009', 208, 1);
INSERT INTO TracksToChart (track_id, chart_id, chart_position) VALUES ('1010', 208, 2);
INSERT INTO TracksToChart (track_id, chart_id, chart_position) VALUES ('1001', 208, 3);
INSERT INTO TracksToChart (track_id, chart_id, chart_position) VALUES ('1002', 208, 4);
INSERT INTO TracksToChart (track_id, chart_id, chart_position) VALUES ('1003', 208, 5);
INSERT INTO TracksToChart (track_id, chart_id, chart_position) VALUES ('1004', 208, 6);
INSERT INTO TracksToChart (track_id, chart_id, chart_position) VALUES ('1005', 208, 7);
INSERT INTO TracksToChart (track_id, chart_id, chart_position) VALUES ('1006', 209, 1);
INSERT INTO TracksToChart (track_id, chart_id, chart_position) VALUES ('1007', 209, 2);
INSERT INTO TracksToChart (track_id, chart_id, chart_position) VALUES ('1008', 209, 3);
INSERT INTO TracksToChart (track_id, chart_id, chart_position) VALUES ('1009', 209, 4);
INSERT INTO TracksToChart (track_id, chart_id, chart_position) VALUES ('1010', 209, 5);
INSERT INTO TracksToChart (track_id, chart_id, chart_position) VALUES ('1001', 209, 6);
INSERT INTO TracksToChart (track_id, chart_id, chart_position) VALUES ('1002', 210, 1);
INSERT INTO TracksToChart (track_id, chart_id, chart_position) VALUES ('1003', 210, 2);
INSERT INTO TracksToChart (track_id, chart_id, chart_position) VALUES ('1004', 210, 3);
INSERT INTO TracksToChart (track_id, chart_id, chart_position) VALUES ('1005', 210, 4);
INSERT INTO TracksToChart (track_id, chart_id, chart_position) VALUES ('1006', 210, 5);






-- Insert into Playlist Table

INSERT INTO Playlist (playlist_id, playlist_name, playlist_follows)
VALUES (301, 'Classic Rock', 5);
INSERT INTO Playlist (playlist_id, playlist_name, playlist_follows)
VALUES (302, 'Hip-Hop', 10);
INSERT INTO Playlist (playlist_id, playlist_name, playlist_follows)
VALUES (303, 'Pop', 2);
INSERT INTO Playlist (playlist_id, playlist_name, playlist_follows)
VALUES (304, 'Throwback', 8);
INSERT INTO Playlist (playlist_id, playlist_name, playlist_follows)
VALUES (305, 'Electronic', 15);
INSERT INTO Playlist (playlist_id, playlist_name, playlist_follows)
VALUES (306, 'Favorites', 0);
INSERT INTO Playlist (playlist_id, playlist_name, playlist_follows)
VALUES (307, 'Favortes', 0);
INSERT INTO Playlist (playlist_id, playlist_name, playlist_follows)
VALUES (308, 'Jazz', 0);
INSERT INTO Playlist (playlist_id, playlist_name, playlist_follows)
VALUES (309, 'Regional', 0);
INSERT INTO Playlist (playlist_id, playlist_name, playlist_follows)
VALUES (310, 'Devotional', 0);

-- Insert into TractToPlaylist Table
INSERT INTO TracksToPlaylist (track_id, playlist_id)
VALUES (1001, 301);
INSERT INTO TracksToPlaylist (track_id, playlist_id)
VALUES (1002, 301);
INSERT INTO TracksToPlaylist (track_id, playlist_id)
VALUES (1003, 301);
INSERT INTO TracksToPlaylist (track_id, playlist_id)
VALUES (1004, 301);
INSERT INTO TracksToPlaylist (track_id, playlist_id)
VALUES (1005, 302);
INSERT INTO TracksToPlaylist (track_id, playlist_id)
VALUES (1006, 302);
INSERT INTO TracksToPlaylist (track_id, playlist_id)
VALUES (1007, 303);
INSERT INTO TracksToPlaylist (track_id, playlist_id)
VALUES (1009, 304);
INSERT INTO TracksToPlaylist (track_id, playlist_id)
VALUES (1008, 304);
INSERT INTO TracksToPlaylist (track_id, playlist_id)
VALUES (1010, 305);


-- Insert into UserToPlaylist Table
INSERT INTO UserToPlaylist (user_id, playlist_id)
VALUES (1, 301);
INSERT INTO UserToPlaylist (user_id, playlist_id)
VALUES (1, 304);
INSERT INTO UserToPlaylist (user_id, playlist_id)
VALUES (2, 303);
INSERT INTO UserToPlaylist (user_id, playlist_id)
VALUES (2, 305);
INSERT INTO UserToPlaylist (user_id, playlist_id)
VALUES (4, 302);
INSERT INTO UserToPlaylist (user_id, playlist_id)
VALUES (9, 310);
INSERT INTO UserToPlaylist (user_id, playlist_id)
VALUES (3, 304); 
INSERT INTO UserToPlaylist (user_id, playlist_id)
VALUES (5, 302); 
INSERT INTO UserToPlaylist (user_id, playlist_id)
VALUES (6, 301); 
INSERT INTO UserToPlaylist (user_id, playlist_id)
VALUES (7, 305); 