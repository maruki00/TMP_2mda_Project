create database sn; do
use sn;
create table users(
    id int primary key not null unique,
    username varchar(25) not null,
    password varchar(55) not null,
    accessToken varchar(255) not null,
    fullname varchar(55) not null,
    address_email varchar(55) not null,
    phone_number varchar(25) not null,
    last_access varchar(25) not null ,
    role int not null default 1
);
create table posts(
    id int primary key not null unique,
    post_body text not null,
    posted_date date not null,
    user_id int not null,
    foreign key (user_id) references users(id)
);
create table comments(
    id int primary key not null unique,
    comment_body varchar(255) not null, 
    commented_date date not null,
    user_id int, 
    post_id int,
    foreign key (user_id) references users(id),
    foreign key (post_id) references posts(id)
);
create table likes(
    id int primary key not null unique,
    user_id int,
    post_id int,
    foreign key(user_id) references users(id),
    foreign key(post_id) references posts(id)
);
create table followers(
    int id primary key not null,
    follower_user_id int,
    followed_user_id int,
    foreign key(follower_user_id) references users(id),
    foreign key(followed_user_id) references users(id)
);
create table messages(
    id int primary key not null,
    message varchar(255) not null,
    messaged_date date not null,
    user_id_from int,
    user_id_to int,
    foreign key(user_id_from) references users(id),
    foreign key(user_id_to) references users(id)
);