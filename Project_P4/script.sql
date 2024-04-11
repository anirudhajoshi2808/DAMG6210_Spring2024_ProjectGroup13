/****** Object:  Database [musicanalytics]    Script Date: 4/10/2024 2:35:26 PM ******/
CREATE DATABASE [musicanalytics]  (EDITION = 'Standard', SERVICE_OBJECTIVE = 'S1', MAXSIZE = 20 GB) WITH CATALOG_COLLATION = SQL_Latin1_General_CP1_CI_AS, LEDGER = OFF;
GO
ALTER DATABASE [musicanalytics] SET COMPATIBILITY_LEVEL = 150
GO
ALTER DATABASE [musicanalytics] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [musicanalytics] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [musicanalytics] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [musicanalytics] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [musicanalytics] SET ARITHABORT OFF 
GO
ALTER DATABASE [musicanalytics] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [musicanalytics] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [musicanalytics] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [musicanalytics] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [musicanalytics] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [musicanalytics] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [musicanalytics] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [musicanalytics] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [musicanalytics] SET ALLOW_SNAPSHOT_ISOLATION ON 
GO
ALTER DATABASE [musicanalytics] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [musicanalytics] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [musicanalytics] SET  MULTI_USER 
GO
ALTER DATABASE [musicanalytics] SET ENCRYPTION ON
GO
ALTER DATABASE [musicanalytics] SET QUERY_STORE = ON
GO
ALTER DATABASE [musicanalytics] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 100, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
/*** The scripts of database scoped configurations in Azure should be executed inside the target database connection. ***/
GO
-- ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 8;
GO
/****** Object:  UserDefinedFunction [dbo].[GetLikenessPercentage]    Script Date: 4/10/2024 2:35:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
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

GO
/****** Object:  Table [dbo].[Artist]    Script Date: 4/10/2024 2:35:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Artist](
	[artist_id] [varchar](255) NOT NULL,
	[artist_name] [nvarchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[artist_id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Track]    Script Date: 4/10/2024 2:35:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Track](
	[track_id] [varchar](255) NOT NULL,
	[album_id] [varchar](255) NULL,
	[trackName] [nvarchar](255) NOT NULL,
	[release_date] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[track_id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TrackArtist]    Script Date: 4/10/2024 2:35:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TrackArtist](
	[track_id] [varchar](255) NOT NULL,
	[artist_id] [varchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[track_id] ASC,
	[artist_id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Genre]    Script Date: 4/10/2024 2:35:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Genre](
	[genre_id] [int] IDENTITY(1,1) NOT NULL,
	[genre_name] [nvarchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[genre_id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TrackToGenre]    Script Date: 4/10/2024 2:35:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TrackToGenre](
	[genre_id] [int] NOT NULL,
	[track_id] [varchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[genre_id] ASC,
	[track_id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Playlist]    Script Date: 4/10/2024 2:35:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Playlist](
	[playlist_id] [int] IDENTITY(1,1) NOT NULL,
	[playlist_name] [nvarchar](255) NOT NULL,
	[playlist_follows] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[playlist_id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TracksToPlaylist]    Script Date: 4/10/2024 2:35:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TracksToPlaylist](
	[track_id] [varchar](255) NOT NULL,
	[playlist_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[track_id] ASC,
	[playlist_id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[View_TopArtistsGenres]    Script Date: 4/10/2024 2:35:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
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

GO
/****** Object:  Table [dbo].[User_Interaction]    Script Date: 4/10/2024 2:35:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User_Interaction](
	[interaction_ID] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [varchar](255) NULL,
	[track_id] [varchar](255) NULL,
	[play_count] [int] NULL,
	[like_flag] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[interaction_ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[View_UserEngagement]    Script Date: 4/10/2024 2:35:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
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

GO
/****** Object:  Table [dbo].[Album]    Script Date: 4/10/2024 2:35:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Album](
	[album_id] [varchar](255) NOT NULL,
	[album_name] [nvarchar](255) NOT NULL,
	[album_release_date] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[album_id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[View_MusicLibraryOverview]    Script Date: 4/10/2024 2:35:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_MusicLibraryOverview] AS
SELECT 'TotalTracks' AS Metric, COUNT(*) AS Value FROM dbo.Track
UNION ALL
SELECT 'TotalAlbums' AS Metric, COUNT(*) AS Value FROM dbo.Album
UNION ALL
SELECT 'TotalArtists' AS Metric, COUNT(*) AS Value FROM dbo.Artist;

GO
/****** Object:  View [dbo].[View_PlaylistPopularity]    Script Date: 4/10/2024 2:35:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_PlaylistPopularity] AS
SELECT playlist_name, playlist_follows
FROM dbo.Playlist where playlist_follows > 0;

GO
/****** Object:  Table [dbo].[Track_Features]    Script Date: 4/10/2024 2:35:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Track_Features](
	[feature_id] [int] IDENTITY(1,1) NOT NULL,
	[track_id] [varchar](255) NULL,
	[bpm] [int] NULL,
	[keynote] [int] NULL,
	[mode] [int] NULL,
	[danceability_percent] [float] NULL,
	[valence_percent] [float] NULL,
	[energy_percent] [float] NULL,
	[acousticness_percent] [float] NULL,
	[instrumentalness_percent] [float] NULL,
	[liveness_percent] [float] NULL,
	[speechiness_percent] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[feature_id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[View_TrackFeaturesAnalysis]    Script Date: 4/10/2024 2:35:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_TrackFeaturesAnalysis] AS
SELECT g.genre_name, AVG(tf.danceability_percent) AS AvgDanceability, AVG(tf.energy_percent) AS AvgEnergy
FROM dbo.Track_Features tf
JOIN dbo.Track t ON tf.track_id = t.track_id
JOIN dbo.TrackToGenre ttg ON t.track_id = ttg.track_id
JOIN dbo.Genre g ON ttg.genre_id = g.genre_id
GROUP BY g.genre_name;

GO
/****** Object:  View [dbo].[View_AlbumReleasesOverTime]    Script Date: 4/10/2024 2:35:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_AlbumReleasesOverTime] AS
SELECT 
    FLOOR(YEAR(a.album_release_date) / 10) * 10 AS ReleaseDecade,
    COUNT(*) AS NumberOfAlbums
FROM dbo.Album a
GROUP BY FLOOR(YEAR(a.album_release_date) / 10) * 10;

GO
/****** Object:  Table [dbo].[TracksToChart]    Script Date: 4/10/2024 2:35:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TracksToChart](
	[track_id] [varchar](255) NOT NULL,
	[chart_id] [int] NOT NULL,
	[chart_position] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[track_id] ASC,
	[chart_id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[View_ChartPositions]    Script Date: 4/10/2024 2:35:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_ChartPositions] AS
SELECT distinct t.trackName, sum(tc.chart_position) as chart_position
FROM dbo.TracksToChart tc
JOIN dbo.Track t ON tc.track_id = t.track_id
group by t.trackName;

GO
/****** Object:  View [dbo].[View_CorrelationAnalysis]    Script Date: 4/10/2024 2:35:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_CorrelationAnalysis] AS
SELECT tf.danceability_percent, COUNT(ui.play_count) AS PlayCount, t.trackName
FROM dbo.Track_Features tf
JOIN dbo.Track t on t.track_id = tf.track_id
JOIN dbo.User_Interaction ui ON tf.track_id = ui.track_id
GROUP BY tf.danceability_percent, t.trackName;

GO
/****** Object:  Table [dbo].[ArtistGenre]    Script Date: 4/10/2024 2:35:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ArtistGenre](
	[genre_id] [int] NOT NULL,
	[artist_id] [varchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[genre_id] ASC,
	[artist_id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Chart]    Script Date: 4/10/2024 2:35:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Chart](
	[chart_id] [int] IDENTITY(1,1) NOT NULL,
	[chart_name] [nvarchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[chart_id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserAudit]    Script Date: 4/10/2024 2:35:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserAudit](
	[audit_id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NULL,
	[username] [varchar](50) NULL,
	[operation] [varchar](20) NULL,
	[old_username] [varchar](50) NULL,
	[timestamp] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[audit_id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserTable]    Script Date: 4/10/2024 2:35:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserTable](
	[user_id] [varchar](255) NOT NULL,
	[first_name] [nvarchar](255) NULL,
	[last_name] [nvarchar](255) NULL,
	[contact_no] [varbinary](256) NULL,
	[email_id] [varbinary](256) NULL,
PRIMARY KEY CLUSTERED 
(
	[user_id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserToPlaylist]    Script Date: 4/10/2024 2:35:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserToPlaylist](
	[user_id] [varchar](255) NOT NULL,
	[playlist_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[user_id] ASC,
	[playlist_id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_Artist_artistID]    Script Date: 4/10/2024 2:35:26 PM ******/
CREATE NONCLUSTERED INDEX [IDX_Artist_artistID] ON [dbo].[Artist]
(
	[artist_id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IDX_Genre_genreID]    Script Date: 4/10/2024 2:35:26 PM ******/
CREATE NONCLUSTERED INDEX [IDX_Genre_genreID] ON [dbo].[Genre]
(
	[genre_id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_Track_trackID]    Script Date: 4/10/2024 2:35:26 PM ******/
CREATE NONCLUSTERED INDEX [IDX_Track_trackID] ON [dbo].[Track]
(
	[track_id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[UserAudit] ADD  DEFAULT (getdate()) FOR [timestamp]
GO
ALTER TABLE [dbo].[ArtistGenre]  WITH CHECK ADD FOREIGN KEY([artist_id])
REFERENCES [dbo].[Artist] ([artist_id])
GO
ALTER TABLE [dbo].[ArtistGenre]  WITH CHECK ADD FOREIGN KEY([genre_id])
REFERENCES [dbo].[Genre] ([genre_id])
GO
ALTER TABLE [dbo].[Track]  WITH CHECK ADD FOREIGN KEY([album_id])
REFERENCES [dbo].[Album] ([album_id])
GO
ALTER TABLE [dbo].[Track_Features]  WITH CHECK ADD FOREIGN KEY([track_id])
REFERENCES [dbo].[Track] ([track_id])
GO
ALTER TABLE [dbo].[TrackArtist]  WITH CHECK ADD FOREIGN KEY([artist_id])
REFERENCES [dbo].[Artist] ([artist_id])
GO
ALTER TABLE [dbo].[TrackArtist]  WITH CHECK ADD FOREIGN KEY([track_id])
REFERENCES [dbo].[Track] ([track_id])
GO
ALTER TABLE [dbo].[TracksToChart]  WITH CHECK ADD FOREIGN KEY([chart_id])
REFERENCES [dbo].[Chart] ([chart_id])
GO
ALTER TABLE [dbo].[TracksToChart]  WITH CHECK ADD FOREIGN KEY([track_id])
REFERENCES [dbo].[Track] ([track_id])
GO
ALTER TABLE [dbo].[TracksToPlaylist]  WITH CHECK ADD FOREIGN KEY([playlist_id])
REFERENCES [dbo].[Playlist] ([playlist_id])
GO
ALTER TABLE [dbo].[TracksToPlaylist]  WITH CHECK ADD FOREIGN KEY([track_id])
REFERENCES [dbo].[Track] ([track_id])
GO
ALTER TABLE [dbo].[TrackToGenre]  WITH CHECK ADD FOREIGN KEY([genre_id])
REFERENCES [dbo].[Genre] ([genre_id])
GO
ALTER TABLE [dbo].[TrackToGenre]  WITH CHECK ADD FOREIGN KEY([track_id])
REFERENCES [dbo].[Track] ([track_id])
GO
ALTER TABLE [dbo].[User_Interaction]  WITH CHECK ADD FOREIGN KEY([track_id])
REFERENCES [dbo].[Track] ([track_id])
GO
ALTER TABLE [dbo].[User_Interaction]  WITH CHECK ADD FOREIGN KEY([user_id])
REFERENCES [dbo].[UserTable] ([user_id])
GO
ALTER TABLE [dbo].[UserToPlaylist]  WITH CHECK ADD FOREIGN KEY([playlist_id])
REFERENCES [dbo].[Playlist] ([playlist_id])
GO
ALTER TABLE [dbo].[UserToPlaylist]  WITH CHECK ADD FOREIGN KEY([user_id])
REFERENCES [dbo].[UserTable] ([user_id])
GO
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
GO
/****** Object:  StoredProcedure [dbo].[GetArtistGenres]    Script Date: 4/10/2024 2:35:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetArtistGenres]
    @artist_id VARCHAR(255)
AS
BEGIN
    SELECT 
        g.genre_name
    FROM 
        Genre g
    INNER JOIN 
        ArtistGenre ag ON g.genre_id = ag.genre_id
    WHERE 
        ag.artist_id = @artist_id;
END;

GO
/****** Object:  StoredProcedure [dbo].[GetChartTopTracks]    Script Date: 4/10/2024 2:35:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetChartTopTracks]
    @chart_id INT
AS
BEGIN
    SELECT 
        t.track_id, t.trackName, t.release_date, tc.chart_position
    FROM 
        Track t
    INNER JOIN 
        TracksToChart tc ON t.track_id = tc.track_id
    WHERE 
        tc.chart_id = @chart_id
    ORDER BY 
        tc.chart_position;
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_CreatePlaylist]    Script Date: 4/10/2024 2:35:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_CreatePlaylist]
    @user_id VARCHAR(255),
    @playlist_name NVARCHAR(255)
AS
BEGIN
    DECLARE @playlist_id INT
    DECLARE @message NVARCHAR(255)

    -- Check if the playlist name is unique for the user
    IF NOT EXISTS (SELECT 1 FROM Playlist WHERE playlist_name = @playlist_name)
    BEGIN
        -- Insert the new playlist
        INSERT INTO Playlist (playlist_name, playlist_follows)
        VALUES (@playlist_name, 0)

        -- Get the generated playlist_id
        SET @playlist_id = SCOPE_IDENTITY()

        -- Associate the playlist with the user
        INSERT INTO UserToPlaylist (user_id, playlist_id)
        VALUES (@user_id, @playlist_id)

        SET @message = 'Playlist created successfully.'
    END
    ELSE
    BEGIN
        SET @message = 'Playlist name already exists for the user.'
    END
    -- Return the message
    SELECT @message AS message
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetTopGenres]    Script Date: 4/10/2024 2:35:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_GetTopGenres]
    @top_count INT
AS
BEGIN
    SELECT TOP (@top_count) g.genre_id, g.genre_name, COUNT(tg.track_id) AS track_count
    FROM Genre g
    LEFT JOIN TrackToGenre tg ON g.genre_id = tg.genre_id
    GROUP BY g.genre_id, g.genre_name
    ORDER BY COUNT(tg.track_id) DESC
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetTrackRecommendations]    Script Date: 4/10/2024 2:35:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_GetTrackRecommendations]
    @user_id VARCHAR(255)
AS
BEGIN
   -- Get genres listened by the user
    SELECT DISTINCT tg.track_id, tg.genre_id
    INTO #UserGenres
    FROM User_Interaction ui
    INNER JOIN TrackToGenre tg ON ui.track_id = tg.track_id
    WHERE ui.user_id = @user_id

    -- Get recommended tracks from similar genres
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
GO
ALTER DATABASE [musicanalytics] SET  READ_WRITE 
GO
