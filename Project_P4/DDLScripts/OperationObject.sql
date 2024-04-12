-- STORED PROCEDURE-1

CREATE PROCEDURE sp_GetTopGenres
    @top_count INT
AS
BEGIN
    SELECT TOP (@top_count) g.genre_id, g.genre_name, COUNT(tg.track_id) AS track_count
    FROM Genre g
    LEFT JOIN TrackToGenre tg ON g.genre_id = tg.genre_id
    GROUP BY g.genre_id, g.genre_name
    ORDER BY COUNT(tg.track_id) DESC
END

EXEC sp_GetTopGenres @top_count = 5;

-- STORED PROCEDURE-2

CREATE PROCEDURE sp_CreatePlaylist
    @user_id VARCHAR(255),
    @playlist_name NVARCHAR(255)
AS
BEGIN
    DECLARE @playlist_id INT
    DECLARE @message NVARCHAR(255)

    IF NOT EXISTS (SELECT 1 FROM Playlist WHERE playlist_name = @playlist_name)
    BEGIN
        INSERT INTO Playlist (playlist_name, playlist_follows)
        VALUES (@playlist_name, 0)
        SET @playlist_id = SCOPE_IDENTITY()
        INSERT INTO UserToPlaylist (user_id, playlist_id)
        VALUES (@user_id, @playlist_id)
        SET @message = 'Playlist created successfully.'
    END
    ELSE
    BEGIN
        SET @message = 'Playlist name already exists for the user.'
    END
    SELECT @message AS message
END

EXEC sp_CreatePlaylist @user_id = '4', @playlist_name = 'Bollywood';

-- STORED PROCEDURE-3

CREATE PROCEDURE sp_GetTrackRecommendations
    @user_id VARCHAR(255)
AS
BEGIN
    SELECT DISTINCT tg.track_id, tg.genre_id
    INTO #UserGenres
    FROM User_Interaction ui
    INNER JOIN TrackToGenre tg ON ui.track_id = tg.track_id
    WHERE ui.user_id = @user_id

    SELECT 
        t.track_id, 
        t.trackName, 
        t.release_date, 
        t.album_id,
        g.genre_id AS recommended_genre_id,
        g.genre_name AS recommended_genre_name,
        ui.play_count
    FROM Track t
    INNER JOIN TrackToGenre tg ON t.track_id = tg.track_id
    INNER JOIN Genre g ON tg.genre_id = g.genre_id
    INNER JOIN #UserGenres ug ON tg.genre_id = ug.genre_id
    LEFT JOIN User_Interaction ui ON t.track_id = ui.track_id
    GROUP BY t.track_id, t.trackName, t.release_date, t.album_id, g.genre_id, g.genre_name, ui.play_count
    ORDER BY COUNT(*) DESC
END

EXEC sp_GetTrackRecommendations @user_id = '4';

-- VIEW-1
CREATE VIEW [dbo].[View_TopArtistsGenres] AS
SELECT g.genre_name, COUNT(t.track_id) AS NumberOfTracks, COUNT(DISTINCT p.playlist_id) AS PlaylistAppearances
FROM dbo.Artist a
JOIN dbo.TrackArtist ta ON a.artist_id = ta.artist_id
JOIN dbo.Track t ON ta.track_id = t.track_id
JOIN dbo.TrackToGenre ttg ON t.track_id = ttg.track_id
JOIN dbo.Genre g ON ttg.genre_id = g.genre_id
JOIN dbo.TracksToPlaylist tp ON t.track_id = tp.track_id
JOIN dbo.Playlist p ON tp.playlist_id = p.playlist_id
GROUP BY  g.genre_name;

SELECT * FROM View_TopArtistsGenres;

-- VIEW-2
CREATE VIEW [dbo].[View_UserEngagement] AS
SELECT 
    g.genre_name,
    COUNT(ui.play_count) AS TotalPlays, 
    SUM(CASE WHEN ui.like_flag = 1 THEN 1 ELSE 0 END) AS TotalLikes
FROM 
    dbo.Track t
INNER JOIN 
    dbo.User_Interaction ui ON t.track_id = ui.track_id
INNER JOIN 
    dbo.TrackToGenre ttg ON t.track_id = ttg.track_id
INNER JOIN 
    dbo.Genre g ON ttg.genre_id = g.genre_id
GROUP BY 
    g.genre_name;

SELECT * FROM View_UserEngagement;

-- VIEW-3
CREATE VIEW [dbo].[View_MusicLibraryOverview] AS
SELECT 'TotalTracks' AS Metric, COUNT(*) AS Value FROM dbo.Track
UNION ALL
SELECT 'TotalAlbums' AS Metric, COUNT(*) AS Value FROM dbo.Album
UNION ALL
SELECT 'TotalArtists' AS Metric, COUNT(*) AS Value FROM dbo.Artist;

SELECT * FROM View_MusicLibraryOverview

-- VIEW-4
CREATE VIEW [dbo].[View_PlaylistPopularity] AS
SELECT playlist_name, playlist_follows
FROM dbo.Playlist where playlist_follows > 0;

SELECT * FROM View_PlaylistPopularity;

-- VIEW-5
CREATE VIEW [dbo].[View_TrackFeaturesAnalysis] AS
SELECT g.genre_name, AVG(tf.danceability_percent) AS AvgDanceability, AVG(tf.energy_percent) AS AvgEnergy
FROM dbo.Track_Features tf
JOIN dbo.Track t ON tf.track_id = t.track_id
JOIN dbo.TrackToGenre ttg ON t.track_id = ttg.track_id
JOIN dbo.Genre g ON ttg.genre_id = g.genre_id
GROUP BY g.genre_name;

SELECT * FROM View_TrackFeaturesAnalysis;

-- VIEW-6
CREATE VIEW [dbo].[View_AlbumReleasesOverTime] AS
SELECT 
    FLOOR(YEAR(a.album_release_date) / 10) * 10 AS ReleaseDecade,
    COUNT(*) AS NumberOfAlbums
FROM dbo.Album a
GROUP BY FLOOR(YEAR(a.album_release_date) / 10) * 10;

SELECT * FROM View_AlbumReleasesOverTime;

-- VIEW-7
CREATE VIEW [dbo].[View_ChartPositions] AS
SELECT distinct t.trackName, sum(tc.chart_position) as chart_position
FROM dbo.TracksToChart tc
JOIN dbo.Track t ON tc.track_id = t.track_id
group by t.trackName;

SELECT * FROM View_ChartPositions

-- VIEW-8
CREATE VIEW [dbo].[View_CorrelationAnalysis] AS
SELECT tf.danceability_percent, COUNT(ui.play_count) AS PlayCount, t.trackName
FROM dbo.Track_Features tf
JOIN dbo.Track t on t.track_id = tf.track_id
JOIN dbo.User_Interaction ui ON tf.track_id = ui.track_id
GROUP BY tf.danceability_percent, t.trackName;

SELECT * FROM View_CorrelationAnalysis;


-- TRIGGER
CREATE TABLE UserAudit (
  audit_id INT PRIMARY KEY IDENTITY(1,1),  -- Auto-incrementing primary key
  user_id INT,
  username VARCHAR(50),
  operation VARCHAR(20),
  old_username VARCHAR(50) NULL,
  timestamp DATETIME DEFAULT CURRENT_TIMESTAMP
);

GO

CREATE TRIGGER UserAuditTrigger
ON UserTable
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
  DECLARE @FirstName VARCHAR(50);
  DECLARE @LastName VARCHAR(50);
  DECLARE @UserID INT;
  DECLARE @OldFirstName VARCHAR(50);  -- For UPDATE operation
  DECLARE @OldLastName VARCHAR(50);   -- For UPDATE operation

  -- Get user information separately for INSERTED and DELETED
  SELECT @FirstName = i.first_name, @LastName = i.last_name, @UserID = i.user_id
  FROM INSERTED i;

  IF EXISTS (SELECT 1 FROM DELETED) -- Check if user still exists
  BEGIN
    -- Get old names for UPDATE
    SELECT TOP 1 @OldFirstName = first_name, @OldLastName = last_name FROM DELETED;

    -- Use INSERT to log UPDATE operation (if user still exists)
    IF EXISTS (SELECT 1 FROM UserTable WHERE user_id = @UserID) -- Check for user existence
    BEGIN
      INSERT INTO UserAudit (user_id, username, operation, old_username)
      VALUES (@UserID, CONCAT(@OldFirstName, ' ', @OldLastName), 'UPDATE', CONCAT(@FirstName, ' ', @LastName));
    END;
  END
  ELSE
  BEGIN
    -- Use INSERT to log INSERT operation
    INSERT INTO UserAudit (user_id, username, operation)
    VALUES (@UserID, CONCAT(@FirstName, ' ', @LastName), 'INSERT');
  END;
END;

-- CHECK CONSTRAINTS

ALTER TABLE [dbo].[Album]  WITH CHECK ADD  CONSTRAINT [CHK_AlbumReleaseDate] CHECK  (([album_release_date]<=getdate()))
GO
ALTER TABLE [dbo].[Album] CHECK CONSTRAINT [CHK_AlbumReleaseDate]
GO
ALTER TABLE [dbo].[Track_Features]  WITH CHECK ADD  CONSTRAINT [CHK_ValidBPM] CHECK  (([bpm]>=(40) AND [bpm]<=(240)))
GO
ALTER TABLE [dbo].[Track_Features] CHECK CONSTRAINT [CHK_ValidBPM]
GO
ALTER TABLE [dbo].[Track_Features]  WITH CHECK ADD  CONSTRAINT [CHK_ValidPercentages] CHECK  (([energy_percent]>=(0) AND [energy_percent]<=(1) AND ([danceability_percent]>=(0) AND [danceability_percent]<=(1))))
GO
ALTER TABLE [dbo].[Track_Features] CHECK CONSTRAINT [CHK_ValidPercentages]

-- UDF
Select * from Track;

CREATE FUNCTION [dbo].[GetLikenessPercentage] (@trackName NVARCHAR(255))
RETURNS FLOAT
AS
BEGIN
    DECLARE @likeliness FLOAT;
    
    SELECT @likeliness = (AVG(danceability_percent) + 
                          AVG(valence_percent) + 
                          AVG(energy_percent) + 
                          AVG(acousticness_percent) + 
                          AVG(instrumentalness_percent) + 
                          AVG(liveness_percent) + 
                          AVG(speechiness_percent)) / 7.0
    FROM dbo.Track_Features
    WHERE track_id IN (SELECT track_id FROM dbo.Track WHERE trackName = @trackName);
    RETURN @likeliness;
END

ALTER TABLE Track
ADD likeliness AS dbo.GetLikenessPercentage(trackName);

Select * from Track;

-- ENCRYPTION
SELECT * FROM UserTable;

ALTER TABLE UserTable 
ADD EncryptedContactNo varbinary(256), 
    EncryptedEmailId varbinary(256);

CREATE MASTER KEY ENCRYPTION BY PASSWORD = 'MusicManagement@13';

CREATE CERTIFICATE UserTableCertificate WITH SUBJECT = 'UserTable Encryption';

CREATE SYMMETRIC KEY UserTableKey 
WITH ALGORITHM = AES_256 
ENCRYPTION BY CERTIFICATE UserTableCertificate;

OPEN SYMMETRIC KEY UserTableKey 
DECRYPTION BY CERTIFICATE UserTableCertificate;

UPDATE UserTable 
SET EncryptedContactNo = EncryptByKey(Key_GUID('UserTableKey'), contact_no),
    EncryptedEmailId = EncryptByKey(Key_GUID('UserTableKey'), email_id);

CLOSE SYMMETRIC KEY UserTableKey;

OPEN SYMMETRIC KEY UserTableKey 
DECRYPTION BY CERTIFICATE UserTableCertificate;

SELECT contact_no, 
       email_id, 
       CONVERT(varchar(50), DecryptByKey(EncryptedContactNo)) AS DecryptedContactNo,
       CONVERT(varchar(100), DecryptByKey(EncryptedEmailId)) AS DecryptedEmailId
FROM UserTable;

CLOSE SYMMETRIC KEY UserTableKey;

ALTER TABLE UserTable
DROP COLUMN contact_no;

ALTER TABLE UserTable
DROP COLUMN email_id;

EXEC sp_rename 'UserTable.EncryptedContactNo', 'contact_no', 'COLUMN';
EXEC sp_rename 'UserTable.EncryptedEmailId', 'email_id', 'COLUMN';

-- NONCLUSTERED INDEX

CREATE NONCLUSTERED INDEX [IDX_Artist_artistID] ON [dbo].[Artist]
(
	[artist_id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IDX_Genre_genreID] ON [dbo].[Genre]
(
	[genre_id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
CREATE NONCLUSTERED INDEX [IDX_Track_trackID] ON [dbo].[Track]
(
	[track_id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO