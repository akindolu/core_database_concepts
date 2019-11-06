/* USE THIS COMMAND TO RUN THE SQL SCRIPT IN PSQL SHELL AFTER CONNECTING TO THE DATABASE
/*  >@E:\Documents\Coursera\Data_Systems\1_Core_Database_Concepts\week2\create_movie_database.sql/* create database


drop table if exists ratings;
drop table if exists tags;
drop table if exists hasagenre;
drop table if exists users;
drop table if exists movies;
drop table if exists taginfo;
drop table if exists genres;

create table if not exists users
    (userid     int,
     name       text,
     primary key (userid));
     
create table if not exists movies
    (movieid    int,
     title      text,
     primary key (movieid));

create table if not exists taginfo
    (tagid      int,
     content    text,
     primary key (tagid));

create table if not exists genres
    (genreid    int,
     name       text,
     primary key (genreid));

create table if not exists ratings
    (userid     int,
     movieid    int,
     rating    numeric check (rating > 0) check (rating <= 5),
     timestamp  bigint,
     primary key (userid, movieid),
     foreign key(userid) references users (userid)
        on delete cascade,
     foreign key(movieid) references movies (movieid)
        on delete cascade);

create table if not exists tags
    (userid     int,
     movieid    int,
     tagid      int,
     timestamp  bigint,
     primary key (userid, movieid, tagid),
     foreign key(userid) references users (userid)
        on delete cascade,
     foreign key(movieid) references movies (movieid)
        on delete cascade,
     foreign key(tagid) references taginfo (tagid)
        on delete cascade);

create table if not exists hasagenre
    (movieid    int,
     genreid    int,
     primary key (movieid, genreid),
     foreign key(movieid) references movies (movieid)
        on delete cascade,
     foreign key(genreid) references genres (genreid)
        on delete cascade);

copy users from 'E:\Documents\Coursera\Data_Systems\1_Core_Database_Concepts\week2\users.dat' using delimiters '%' with null as '\null';
copy movies from 'E:\Documents\Coursera\Data_Systems\1_Core_Database_Concepts\week2\movies.dat' using delimiters '%' with null as '\null';
copy taginfo from 'E:\Documents\Coursera\Data_Systems\1_Core_Database_Concepts\week2\taginfo.dat' using delimiters '%' with null as '\null';
copy genres from 'E:\Documents\Coursera\Data_Systems\1_Core_Database_Concepts\week2\genres.dat' using delimiters '%' with null as '\null';
copy ratings from 'E:\Documents\Coursera\Data_Systems\1_Core_Database_Concepts\week2\ratings.dat' using delimiters '%' with null as '\null';
copy tags from 'E:\Documents\Coursera\Data_Systems\1_Core_Database_Concepts\week2\tags.dat' using delimiters '%' with null as '\null';
copy hasagenre from 'E:\Documents\Coursera\Data_Systems\1_Core_Database_Concepts\week2\hasagenre.dat' using delimiters '%' with null as '\null';