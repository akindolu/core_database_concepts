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
     ratings    numeric check (ratings > 0) check (ratings <= 5),
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
