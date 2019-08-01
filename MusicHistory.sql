-- 1. Query all of the entries in the Genre table

SELECT Id, Label FROM Genre
SELECT Id, ArtistName, YearEstablished FROM Artist
SELECT Id, Title, ReleaseDate, AlbumLength, Label, ArtistId, GenreId FROM Album
SELECT Id, Title, SongLength, ReleaseDate, GenreId, ArtistId, AlbumId FROM Song

-- 2. Using the INSERT statement, add one of your favorite artists to the Artist table.

INSERT INTO Artist (ArtistName, YearEstablished) VALUES ('ADTR', 2003) 

-- 3. Using the INSERT statement, add one, or more, albums by your artist to the Album table.

INSERT INTO Album (Title,ReleaseDate,AlbumLength,Label,ArtistId,GenreId) VALUES ('Bad Vibrations', '9/30/15', 3456, 'The Blasting Room', 31, 5)

-- 4. Using the INSERT statement, add some songs that are on that album to the Song table.

INSERT INTO Song (Title, SongLength, ReleaseDate, GenreId, ArtistId, AlbumId) VALUES ('Bad Vibrations', 333, '6/6/2015', 5, 31, 25)

-- 5. Write a SELECT query that provides the song titles, album title, and artist name for all of the data you just entered in. Use the LEFT JOIN keyword sequence to connect the tables, and the WHERE keyword to filter the results to the album and artist you added.
SELECT s.Title, a.Title AS AlbumTitle, c.ArtistName
From Song s
JOIN Album a ON s.AlbumId = a.Id
JOIN Artist c ON s.ArtistId = c.Id
WHERE c.Id = 31


-- 6. Write a SELECT statement to display how many songs exist for each album. You'll need to use the COUNT() function and the GROUP BY keyword sequence.

SELECT COUNT(Title) AS SongCount, AlbumId
From Song
GROUP BY AlbumId

-- 7. Write a SELECT statement to display how many songs exist for each artist. You'll need to use the COUNT() function and the GROUP BY keyword sequence.

SELECT COUNT(Title) AS SongCount, ArtistId
From Song
GROUP BY ArtistId

-- 8. Write a SELECT statement to display how many songs exist for each genre. You'll need to use the COUNT() function and the GROUP BY keyword sequence.

SELECT COUNT(Title) AS SongCount, GenreId
From Song
GROUP BY GenreId

-- 9. Using MAX() function, write a select statement to find the album with the longest duration. The result should display the album title and the duration.

SELECT Title AS AlbumTitle, AlbumLength FROM Album WHERE AlbumLength = (SELECT MAX(AlbumLength) FROM Album)

-- 10. Using MAX() function, write a select statement to find the song with the longest duration. The result should display the song title and the duration.

SELECT Title AS SongTitle, SongLength FROM Song WHERE SongLength = (SELECT MAX(SongLength) FROM Song)

-- 11. Modify the previous query to also display the title of the album.

SELECT s.Title AS SongTitle, a.Title AS AlbumTitle, SongLength From Song s JOIN Album a ON s.AlbumId = a.Id WHERE SongLength = (SELECT MAX(SongLength) FROM Song);