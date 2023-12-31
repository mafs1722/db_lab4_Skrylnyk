CREATE TABLE ProductionStudios
(
  StudioID INT NOT NULL,
  StudioName VARCHAR(50) NOT NULL,
  Country VARCHAR(50) NOT NULL,
  YearFounded DATE NOT NULL,
  PRIMARY KEY (StudioID)
);

CREATE TABLE Movies
(
  MovieID_ INT NOT NULL,
  Title VARCHAR(50) NOT NULL,
  ReleaseYear DATE NOT NULL,
  Genre VARCHAR(50) NOT NULL,
  Duration INT NOT NULL,
  Country VARCHAR(50) NOT NULL,
  PeopleRating FLOAT NOT NULL,
  CriticsRating FLOAT NOT NULL,
  StudioID INT NOT NULL,
  PRIMARY KEY (MovieID_),
  FOREIGN KEY (StudioID) REFERENCES ProductionStudios(StudioID)
);

CREATE TABLE Actor
(
  ActorID INT NOT NULL,
  FirstName VARCHAR(50) NOT NULL,
  LastName VARCHAR(50) NOT NULL,
  BirthYear DATE NOT NULL,
  Country VARCHAR(50) NOT NULL,
  MovieID_ INT NOT NULL,
  PRIMARY KEY (ActorID),
  FOREIGN KEY (MovieID_) REFERENCES Movies(MovieID_)
);

CREATE TABLE Director
(
  DirectorID INT NOT NULL,
  FirstName VARCHAR(50) NOT NULL,
  LastName VARCHAR(50) NOT NULL,
  BirthYear DATE NOT NULL,
  Country VARCHAR(50) NOT NULL,
  MovieID_ INT NOT NULL,
  PRIMARY KEY (DirectorID),
  FOREIGN KEY (MovieID_) REFERENCES Movies(MovieID_)
);