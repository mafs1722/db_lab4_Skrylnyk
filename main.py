import psycopg2
import matplotlib.pyplot as plt

username = 'postgres'
password = 'anna2002'
database = 'Skrylnyk_Anna_DB'
host = 'localhost'
port = '5432'

query_1 = '''
          SELECT
              Genre,
              COUNT(*) AS MovieCount
          FROM
              Movies
          GROUP BY
              Genre
          ORDER BY
	          MovieCount;
          '''
query_2 = '''
          SELECT AVG(AvgRating), ActorCount FROM (
          	SELECT
          	    m.MovieID_,
          	    COUNT(a.ActorID) AS ActorCount,
          	    AVG(m.PeopleRating + m.CriticsRating)/2 AS AvgRating
          	FROM
          	    Movies m
          	    LEFT JOIN Actor a ON m.MovieID_ = a.MovieID_
          	GROUP BY
          	    m.MovieID_) as subquery
          	GROUP BY ActorCount
          '''

conn = psycopg2.connect(user=username, password=password, dbname=database, host=host, port=port)

with conn:
    cur = conn.cursor()

    cur.execute(query_1)
    film_genre = []
    total = []

    for row in cur:
        print(row)
        film_genre.append(row[0])
        total.append(row[1])

    print()
    for i in range(len(film_genre)):
        print(f"{film_genre[i]} {100*total[i]/sum(total):1.01f}%")

    cur.execute(query_2)
    rating = []
    count = []

    print()
    for row in cur:
        print(row)
        rating.append(row[0])
        count.append(row[1])