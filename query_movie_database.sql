select * from genres join movies on genreid;

/* Syntax to create table with query result */
create table query1 as ()

/* Query 1 in assignment */
select genres.name, count(genres.genreid) 
from hasagenre 
join genres on genres.genreid=hasagenre.genreid 
group by genres.genreid

/* Query 2 in assignment */
select genres.name, avg(ratings.ratings) as rating from hasagenre
join genres on genres.genreid=hasagenre.genreid
join ratings on ratings.movieid=hasagenre.movieid
group by(genres.genreid);

/* Query 3 in assignment */
select t.title, t.countofratings
from(select movies.title, count(ratings.userid) as countofratings
	from ratings
	join movies on movies.movieid=ratings.movieid
	group by(movies.movieid)) as t
where t.countofratings >= 10
order by t.title;

/* Query 4 in assignment */
select movies.movieid, movies.title
from movies
join hasagenre on movies.movieid=hasagenre.movieid
join genres on hasagenre.genreid=genres.genreid
where genres.name = 'Comedy'

/* Query 5 in assignment */
select movies.title, avg(ratings.ratings) as average 
from movies
join ratings on ratings.movieid=movies.movieid
group by(movies.movieid)
order by movies.title;

/* Query 6 in assignment */
select avg(ratings.ratings) as average from hasagenre
join genres on genres.genreid=hasagenre.genreid
join ratings on ratings.movieid=hasagenre.movieid
where genres.name = 'Comedy'
group by(genres.genreid);

/* Query 7 in assignment */
select avg(t3.ratings) as average
from (select t1.movieid, t1.title, t1.ratings, t1.genreid as comedyid, t2.genreid as romanceid
	from (select movies.movieid, movies.title, ratings.ratings, ratings.userid, hasagenre.genreid
		from movies
		join ratings on ratings.movieid=movies.movieid
		join hasagenre on ratings.movieid=hasagenre.movieid
		join genres on hasagenre.genreid=genres.genreid
		where genres.name='Comedy') as t1
	join (select movies.movieid, movies.title, ratings.ratings, ratings.userid, hasagenre.genreid
		from movies
		join ratings on ratings.movieid=movies.movieid
		join hasagenre on ratings.movieid=hasagenre.movieid
		join genres on hasagenre.genreid=genres.genreid
		where genres.name='Romance') as t2
	on t1.movieid=t2.movieid) as t3

/* Query 8 in assignment */
select avg(t3.ratings) as average
from (select t1.movieid, t1.title, t1.ratings, t1.genreid as comedyid, t2.genreid as romanceid
	from (select movies.movieid, movies.title, ratings.ratings, ratings.userid, hasagenre.genreid
		from movies
		join ratings on ratings.movieid=movies.movieid
		join hasagenre on ratings.movieid=hasagenre.movieid
		join genres on hasagenre.genreid=genres.genreid
		where genres.name='Comedy') as t1
	join (select movies.movieid, movies.title, ratings.ratings, ratings.userid, hasagenre.genreid
		from movies
		join ratings on ratings.movieid=movies.movieid
		join hasagenre on ratings.movieid=hasagenre.movieid
		join genres on hasagenre.genreid=genres.genreid
		where genres.name!='Romance') as t2
	on t1.movieid=t2.movieid) as t3

/* Query 9 in assignment */
\set v1 2
select ratings.movieid, ratings.ratings as rating
from ratings
where ratings.userid= :v1;

/* Query 10 in assignment */
