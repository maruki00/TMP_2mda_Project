/*drop database if exists sn;*/
create database if not exists sn;
use sn; begin;
drop table if exists users;
drop table if exists comments;
drop table if exists login;
drop table if exists user_login;
drop table if exists posts;
drop table if exists likes;
drop table if exists messages;
drop table if exists followers;

create table users(
    id int primary key AUTO_INCREMENT,
    password varchar(255) not null,
    accessToken varchar(255) not null,
    address_email varchar(55) not null,
    phone_number varchar(25) not null,
    username varchar(25) not null unique,
    fullname varchar(55) not null,
    last_access varchar(25) not null ,
    role int  default 1
);
create table posts(
    id int primary key AUTO_INCREMENT,
    post_body varchar(255) not null,
    posted_date varchar(15) not null,
    user_id int not null,
    foreign key (user_id) references users(id)
);
create table comments(
    id int primary key AUTO_INCREMENT,
    comment_body varchar(255) not null, 
    commented_date date not null,
    user_id int, 
    post_id int,
    foreign key (user_id) references users(id),
    foreign key (post_id) references posts(id)
);
create table likes(
    id int primary key AUTO_INCREMENT,
    user_id int,
    post_id int,
    foreign key(user_id) references users(id),
    foreign key(post_id) references posts(id)
);
create table followers(
    id int primary key AUTO_INCREMENT,
    follower_from_user_id int,
    followed_to_user_id int,
    foreign key(follower_from_user_id) references users(id),
    foreign key(followed_to_user_id) references users(id)
);


create table messages(
    id int primary key AUTO_INCREMENT,
    message varchar(255) not null,
    messaged_date date not null,
    user_id_from int,
    user_id_to int,
    foreign key(user_id_from) references users(id),
    foreign key(user_id_to) references users(id)
);

create table login(
    id int primary key AUTO_INCREMENT,
    password varchar(255) not null,
    accessToken varchar(255) not null,
    address_email varchar(55) not null,
    phone_number varchar(25) not null
);
create table user_login(
    user_id int not null,
    login_id int not null
);
alter table user_login add unique(user_id,login_id);
