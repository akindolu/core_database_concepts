create table query1 as (
select genres.name, count(genres.genreid) as moviecount
from hasagenre 
join genres on genres.genreid=hasagenre.genreid 
group by genres.genreid
);

create table query2 as (
select genres.name, avg(ratings.rating) as rating 
from movies
join hasagenre on hasagenre.movieid=movies.movieid
join genres on genres.genreid=hasagenre.genreid
join ratings on ratings.movieid=hasagenre.movieid
group by(genres.genreid)
);

create table query3 as (
select t.title, t.countofratings
from(select movies.title, count(ratings.userid) as countofratings
	from ratings
	join movies on movies.movieid=ratings.movieid
	group by(movies.movieid)) as t
where t.countofratings >= 10
order by t.title
);

create table query4 as (
select movies.movieid, movies.title
from movies
join hasagenre on movies.movieid=hasagenre.movieid
join genres on hasagenre.genreid=genres.genreid
where genres.name = 'Comedy'
);

create table query5 as (
select movies.title, avg(ratings.rating) as average 
from movies
join ratings on ratings.movieid=movies.movieid
group by(movies.movieid)
order by movies.title
);

create table query6 as (
select avg(ratings.rating) as average 
from hasagenre
join genres on genres.genreid=hasagenre.genreid
join ratings on ratings.movieid=hasagenre.movieid
where genres.name = 'Comedy'
group by(genres.genreid)
);

create table query7 as (
select avg(t3.rating) as average
from (select t1.movieid, t1.title, t1.rating, t1.genreid as comedyid, t2.genreid as romanceid
	from (select movies.movieid, movies.title, ratings.rating, ratings.userid, hasagenre.genreid
		from movies
		join ratings on ratings.movieid=movies.movieid
		join hasagenre on ratings.movieid=hasagenre.movieid
		join genres on hasagenre.genreid=genres.genreid
		where genres.name='Comedy') as t1
	join (select movies.movieid, movies.title, ratings.rating, ratings.userid, hasagenre.genreid
		from movies
		join ratings on ratings.movieid=movies.movieid
		join hasagenre on ratings.movieid=hasagenre.movieid
		join genres on hasagenre.genreid=genres.genreid
		where genres.name='Romance') as t2
	on t1.movieid=t2.movieid) as t3
);

create table query8 as (
select avg(t3.rating) as average
from (select t1.movieid, t1.title, t1.rating, t1.genreid as comedyid, t2.genreid as romanceid
	from (select movies.movieid, movies.title, ratings.rating, ratings.userid, hasagenre.genreid
		from movies
		join ratings on ratings.movieid=movies.movieid
		join hasagenre on ratings.movieid=hasagenre.movieid
		join genres on hasagenre.genreid=genres.genreid
		where genres.name='Comedy') as t1
	join (select movies.movieid, movies.title, ratings.rating, ratings.userid, hasagenre.genreid
		from movies
		join ratings on ratings.movieid=movies.movieid
		join hasagenre on ratings.movieid=hasagenre.movieid
		join genres on hasagenre.genreid=genres.genreid
		where genres.name!='Romance') as t2
	on t1.movieid=t2.movieid) as t3
);

create table query9 as (
select ratings.movieid, ratings.rating as rating
from ratings
where ratings.userid= :v1
);

