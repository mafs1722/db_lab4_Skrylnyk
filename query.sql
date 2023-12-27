SELECT StudioName, COUNT(*) AS MovieCount
FROM ProductionStudios
JOIN Movies ON ProductionStudios.StudioID = Movies.StudioID
GROUP BY StudioName;

SELECT Genre, COUNT(*) AS GenreCount
FROM Movies
GROUP BY Genre;

SELECT EXTRACT(YEAR FROM ReleaseYear) AS ReleaseYear, AVG(Duration) AS AvgDuration
FROM Movies
GROUP BY ReleaseYear
ORDER BY ReleaseYear;
