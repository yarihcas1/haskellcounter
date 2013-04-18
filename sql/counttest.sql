drop database counttest;
create database counttest;

use counttest;

drop table counter;
create table counter(
    count int
);

insert into counter(count) values(0);

