CREATE DATABASE wedkarstwo;

CREATE TABLE ryby (
    id int primary key auto_increment,
    nazwa TEXT, 
    wystepowanie TEXT,
    styl_zycia int
);

CREATE TABLE okres_ochronny (
    id int primary key auto_increment,
    ryby_id int,
    od_miesiaca int,
    do_miesiaca int, 
    wymiar_ochronny int,
    foreign key (ryby_id) REFERENCES ryby(id)
);

CREATE TABLE lowisko (
    id int primary key auto_increment,
    ryby_id int,
    akwen text,
    wojewodztwo text,
    rodzaj text,
    foreign key (ryby_id) REFERENCES ryby(id)
);