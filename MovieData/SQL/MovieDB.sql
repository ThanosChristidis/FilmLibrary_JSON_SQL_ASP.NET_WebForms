create database MovieData;

create table movie(
	movie_id int not null,
	poster_path varchar(100) null,
	original_title varchar(100) not null,
	title varchar(100) not null,
	overview varchar(500) null
	primary key (movie_id)
);

create table director(
	director_id int not null,
	name varchar(100) not null,
	imdb_link varchar(100) not null
	primary key (director_id)
);

create table moviedirector(
movie_id int not null,
director_id int not null,
constraint PK_MD primary key (movie_id, director_id),
constraint FK_movie_id foreign key (movie_id) references [dbo].[movie]([movie_id]),
constraint FK_director_id foreign key (director_id) references [dbo].[director]([director_id]));

declare @movie varchar(max)

select @movie =
	BulkColumn
	from openrowset(bulk'C:\Users\User\Desktop\MovieData\MovieData\JSON Data\movie.json', single_blob) json


if (ISJSON(@movie)=1)
	begin
		print 'JSON file is valid';

		insert into movie
		select *
		from OPENJSON(@movie, '$.movie')
		with(
			movie_id int '$.movie_id',
			poster_path varchar(100) '$.poster_path',
			original_title varchar(100) '$.original_title',
			title varchar(100) '$.title',
			overview varchar(500) '$.overview'
		)
	end 
else
	begin
		print 'JSON file is invalid'
	end

declare @director varchar(max)

select @director =
	BulkColumn
	from openrowset(bulk'C:\Users\User\Desktop\MovieData\MovieData\JSON Data\director.json', single_blob) json


if (ISJSON(@director)=1)
	begin
		print 'JSON file is valid';

		insert into director
		select *
		from OPENJSON(@director, '$.director')
		with(
			director_id int '$.director_id',
			name varchar(100) '$.name',
			imdb_link varchar(100) '$.imdb_link'
		)
	end 
else
	begin
		print 'JSON file is invalid'
	end


insert into moviedirector(movie_id, director_id) 
values(1,1),(1,2),(2,3),(3,4),(4,5),(5,6),(6,7),(7,8);
