Internet Programming - SQL Code

USE [master]
GO


CREATE DATABASE [MovieDB] 


ALTER DATABASE [MovieDB] SET ANSI_NULL_DEFAULT OFF 
GO

ALTER DATABASE [MovieDB] SET ANSI_NULLS OFF 
GO

ALTER DATABASE [MovieDB] SET ANSI_PADDING OFF 
GO

ALTER DATABASE [MovieDB] SET ANSI_WARNINGS OFF 
GO

ALTER DATABASE [MovieDB] SET ARITHABORT OFF 
GO

ALTER DATABASE [MovieDB] SET AUTO_CLOSE OFF 
GO

ALTER DATABASE [MovieDB] SET AUTO_CREATE_STATISTICS ON 
GO

ALTER DATABASE [MovieDB] SET AUTO_SHRINK OFF 
GO

ALTER DATABASE [MovieDB] SET AUTO_UPDATE_STATISTICS ON 
GO

ALTER DATABASE [MovieDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO

ALTER DATABASE [MovieDB] SET CURSOR_DEFAULT  GLOBAL 
GO

ALTER DATABASE [MovieDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO

ALTER DATABASE [MovieDB] SET NUMERIC_ROUNDABORT OFF 
GO

ALTER DATABASE [MovieDB] SET QUOTED_IDENTIFIER OFF 
GO

ALTER DATABASE [MovieDB] SET RECURSIVE_TRIGGERS OFF 
GO

ALTER DATABASE [MovieDB] SET  DISABLE_BROKER 
GO

ALTER DATABASE [MovieDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO

ALTER DATABASE [MovieDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO

ALTER DATABASE [MovieDB] SET TRUSTWORTHY OFF 
GO

ALTER DATABASE [MovieDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO

ALTER DATABASE [MovieDB] SET PARAMETERIZATION SIMPLE 
GO

ALTER DATABASE [MovieDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO

ALTER DATABASE [MovieDB] SET  READ_WRITE 
GO

ALTER DATABASE [MovieDB] SET RECOVERY FULL 
GO

ALTER DATABASE [MovieDB] SET  MULTI_USER 
GO

ALTER DATABASE [MovieDB] SET PAGE_VERIFY CHECKSUM  
GO

ALTER DATABASE [MovieDB] SET DB_CHAINING OFF 
GO

---------------------------------------

USE [MovieDB]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[UserRatings](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Rating] [smallint] NOT NULL,
 CONSTRAINT [PK_UserRatings] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

CREATE TABLE USERS(
user_code INT IDENTITY(1,1) NOT NULL UNIQUE,
user_username VARCHAR(50) NOT NULL,
user_password VARCHAR(25) NOT NULL,
user_fname VARCHAR(50) NOT NULL,
user_lname VARCHAR(50) NOT NULL,
user_email VARCHAR(75) NOT NULL,
user_DOB DATE NOT NULL
CONSTRAINT users_pk PRIMARY KEY(user_code)
);

CREATE TABLE ADMINS(
admin_code INT IDENTITY(1,1) NOT NULL UNIQUE,
admin_username VARCHAR(50) NOT NULL UNIQUE,
admin_password VARCHAR(25) NOT NULL,
admin_fname VARCHAR(50) NOT NULL,
admin_lname VARCHAR(50) NOT NULL,
admin_email VARCHAR(75) NOT NULL,
CONSTRAINT admins_pk PRIMARY KEY(admin_code)
);

CREATE TABLE DIRECTOR(
dir_id INT IDENTITY(1,1) NOT NULL UNIQUE,
dir_fname VARCHAR(50),
dir_lname VARCHAR(50),
CONSTRAINT dir_pk PRIMARY KEY(dir_id)
);

CREATE TABLE MOVIE(
movie_id INT IDENTITY(1,1) NOT NULL UNIQUE,
movie_title VARCHAR(75) NOT NULL,
movie_runlength INT NOT NULL,
movie_releaseYear DATE NOT NULL,
movie_dir_id INT NOT NULL,
movie_rating VARCHAR(5),
CONSTRAINT movie_pk PRIMARY KEY(movie_id),
CONSTRAINT movie_fk FOREIGN KEY(movie_dir_id) REFERENCES DIRECTOR(dir_id)
);

CREATE TABLE COMMENTS(
com_id INT IDENTITY(1,1) NOT NULL,
u_id INT NOT NULL,
m_id INT NOT NULL,
comment VARCHAR(255),
CONSTRAINT comments_pk PRIMARY KEY(com_id, u_id, m_id),
CONSTRAINT comments_user_id_fk FOREIGN KEY(User_id) REFERENCES USERS(user_code),
CONSTRAINT comments_movie_id_fk FOREIGN KEY(Movie_id) REFERENCES MOVIE(movie_id)
);

CREATE TABLE RATINGS(
u_id INT NOT NULL,
m_id INT NOT NULL,
rating DECIMAL(5,2),
CONSTRAINT rating_pk PRIMARY KEY(u_id, m_id),
CONSTRAINT ratings_user_id_fk FOREIGN KEY(u_id) REFERENCES USERS(user_code),
CONSTRAINT ratings_movie_id_fk FOREIGN KEY(m_id) REFERENCES MOVIE(movie_id),
CONSTRAINT rating_ck CHECK (rating BETWEEN 0 AND 10)
);

CREATE TABLE ACTOR(
actor_id INT IDENTITY(1,1) NOT NULL,
actor_fname VARCHAR(50) NOT NULL,
actor_lname VARCHAR(50) NOT NULL,
CONSTRAINT actor_pk PRIMARY KEY(actor_id)
);

CREATE TABLE PRODUCER(
producer_id INT IDENTITY(1,1) NOT NULL,
producer_fname VARCHAR(50) NOT NULL,
producer_lname VARCHAR(50) NOT NULL, 
CONSTRAINT producer_pk PRIMARY KEY(producer_id)
);

CREATE TABLE CHARACTERS(
act_id INT NOT NULL,
mov_id INT NOT NULL,
charcter_played VARCHAR(75),
CONSTRAINT characters_pk PRIMARY KEY(act_id, mov_id),
CONSTRAINT act_id_fk FOREIGN KEY(act_id) REFERENCES ACTOR(actor_id),
CONSTRAINT mov_id_fk FOREIGN KEY(mov_id) REFERENCES MOVIE(movie_id)
);

CREATE TABLE PRODUCES(
mov_id INT NOT NULL,
prod_id INT NOT NULL,
title VARCHAR(50) NOT NULL,
CONSTRAINT produces_pk PRIMARY KEY(mov_id, prod_id),
CONSTRAINT pro_mov_fk FOREIGN KEY(mov_id) REFERENCES MOVIE(movie_id),
CONSTRAINT prod_fk FOREIGN KEY(prod_id) REFERENCES PRODUCER(producer_id)
);

CREATE TABLE GENRE(
genre_id INT IDENTITY(1,1) NOT NULL UNIQUE,
genre_type VARCHAR(25) NOT NULL
CONSTRAINT genre_pk PRIMARY KEY(genre_id)
);

CREATE TABLE CATEGORIES(
mov_id INT NOT NULL,
genre_id INT NOT NULL,
CONSTRAINT categories_pk PRIMARY KEY(mov_id, genre_id),
CONSTRAINT cat_mov_fk FOREIGN KEY(mov_id) REFERENCES MOVIE(movie_id),
CONSTRAINT cat_genre_fk FOREIGN KEY(genre_id) REFERENCES GENRE(genre_id)
);

INSERT INTO USERS
VALUES ('hoppyr123', 'fir3w00dS', 'Robert', 'Hopkins', 'rhopkins070@gmail.com', '1981-08-25'),
	   ('caboose4', 'IhateBabies3', 'Michael', 'Caboose', 'dumbASrocks@yahoo.com', '1999-06-28'),
	   ('spookyGhost', 'IsayBoo9', 'Casper', 'theFriendlvGhost', 'randomEmail@aol.com', '1995-04-17'),
	   ('murderTh3gods', 'Ghost0fSparta', 'Kratos', 'GodofWar', 'spartanRage@hotmail.com', '1971-01-24'),
	   ('Planck1918', 'blackBodyRad12', 'Max', 'Planck', 'myConstant@tamucc.edu', '1858-04-23'),
	   ('TheCaptain', 'WhiteWhale5', 'Ahab', 'Hook', 'obsession@delmar.edu', '1851-12-18');
	   
INSERT INTO DIRECTOR
VALUES('Ridley','Scott');

INSERT INTO PRODUCER
VALUES('Ridley','Scott');

INSERT INTO GENRE
VALUES ('SCI-FI'),
	   ('DRAMA'),
	   ('WAR'),
	   ('HORROR'),
	   ('ACTION'),
	   ('THILLER'),
	   ('ADVENTURE'),
	   ('HISTORY');

INSERT INTO MOVIE
VALUES ('Blade Runner', 117, '1982-06-25', 1, 'R'),
	   ('Gladiator', 155, '2000-05-05', 1, 'R'),
	   ('Black Hawk Down', 144, '2002-01-18', 1, 'R'),
	   ('Alien', 117, '1979-06-22', 1, 'R');

INSERT INTO PRODUCES
VALUES (2, 1, 'coproducer - uncredited'),
	   (3, 1, 'executive producer - uncredited'),
	   (4, 1, 'producer');
	   
INSERT INTO CATEGORIES
VALUES (2,1), (2,6), (3,5), (3,7), (3,2),
		(4,2), (4,8), (4,3), (5,4), (5,1);
		
INSERT INTO ADMINS
VALUES ('V-GINY', 'DeathSphere12', 'Matt', 'Groening', 'easteregg@gmail.com');

INSERT INTO ACTOR
VALUES ('Harrison', 'Ford'),
	   ('Rutger', 'Hauer'),
	   ('Sean', 'Young'),
	   ('Edward James', 'Olmos'),
	   ('M. Emmet', 'Walsh'),
	   ('Russel', 'Crowe'),
	   ('Joaquin', 'Phoenix'),
	   ('Connie', 'Nielsen'),
	   ('Oliver', 'Reed'),
	   ('Richard', 'Harris'),
	   ('Djimon', 'Hounsou'),
	   ('Josh', 'Hartnett'),
	   ('Ewan', 'McGregor'),
	   ('Tom', 'Sizemore'),
	   ('Eric', 'Bana'),
	   ('Tom', 'Hardy'),
	   ('William', 'Fichtner'),
	   ('Tom', 'Skerritt'),
	   ('Sigourney', 'Weaver'),
	   ('Veronica', 'Cartwright'),
	   ('Harry Dean', 'Stanton'),
	   ('John', 'Hurt');
	   
INSERT INTO CHARACTERS
VALUES (1, 2, 'Rick Deckard'),
	   (2, 2, 'Roy Batty'),
	   (3, 2, 'Rachel'),
	   (4, 2, 'Gaf'),
	   (5, 2, 'Bryant'),
	   (6, 3, 'Maximus'),
	   (7, 3, 'Commodus'),
	   (8, 3, 'Lucilla'),
	   (9, 3, 'Proximo'),
	   (10, 3, 'Marcus Aurelius'),
	   (11, 3, 'Juba'),
	   (12, 4, 'Eversmann'),
	   (13, 4, 'Grimes'),
	   (14, 4, 'McKnight'),
	   (15, 4, 'Hoot'),
	   (16, 4, 'Twombly'),
	   (17, 4, 'Sanderson'),
	   (18, 5, 'Dallas'),
	   (19, 5, 'Ripley'),
	   (20, 5, 'Lambert'),
	   (21, 5, 'Brett'),
	   (22, 5, 'Kane');
	   
INSERT INTO RATINGS
VALUES (1, 2, 10),
	   (1, 3, 8),
	   (1, 4, 7),
	   (1, 5, 4),
	   (2, 2, 6),
	   (2, 3, 8),
	   (2, 4, 9),
	   (2, 5, 8),
	   (3, 2, 9),
	   (3, 3, 5),
	   (3, 4, 7),
	   (3, 5, 8.5),
	   (5, 2, 7.5),
	   (5, 4, 10),
	   (5, 3, 6.5),
	   (6, 5, 9);
	   
INSERT INTO COMMENTS
VALUES (3, 2, 'A dark and visually stunning movie that asks what it means to be human and to have free will.'),
	   (4, 2, 'UNICORN!'),
	   (1, 2, 'Great ending monologue. ‘All those moments will be lost in time, like tears in rain.'),
	   (5, 2, 'Can’t believe Atari is still around in 2019.'),
	   (2, 2, 'Snooze fest.'),
	   (2, 2, 'Fuck Harrison Ford. He is a dick.'),
           (4, 3, 'ARE YOU NOT ENTERTAINED!'),
	   (2, 3, 'Commodus died like a little bitch.'),
	   (1, 3, 'A thoroughly enjoyable movie.'),
	   (3, 3, 'This is one of Russel Crowe’s best performances.'),
	   (1, 4, 'This movie is a modern classic war movie.'),
       	   (4, 4, 'I didn’t know that Legolas was in this movie.'),
	   (4, 4, 'Or that Bane was in this movie.'),
	   (5, 4, 'Who wasn’t in this movie?'),
	   (1, 5, 'This movie will haunt my dreams til the day I die.'),
	   (4, 5, 'I still get freaked out when the chestburster scene plays.'),
	   (5, 5, 'Sigourney Weaver is super hot!!!!'),
	   (3, 5, 'The new Alien movie are not as good as these old ones.');
