/*
For a super market chain, consider the following dimensions, namely product, store, time,
promotion. The schema contains a central fact table with sales facts Design star schema for this
application. Also show OLAP operations.
*/

-- Create Tables
 create table product(product_id int primary key, name varchar(50), cost int);
create table store(store_id int primary key, province varchar(50), country varchar(50));
create table promotion(promo_id int primary key, province varchar(50), country varchar(50), cost int);
create table time(time_id int primary key, year int, month int, day int);
create table fact_table(product_id int, store_id int, promo_id int, time_id int, constraint pk_fact_table primary key(product_id, store_id, promo_id, time_id));

-- Inserting data into tables
insert into product values(1, 'Red Gear Gaming Mouse', 12150);
insert into product values(2, 'Razer BlackWidow Elite', 12800);
insert into product values(3, 'Acer Predator X21', 600000);
insert into product values(4, 'Asus ROG Centurion 7.1.', 40000);

insert into time values(1, 2019, 4, 18);
insert into time values(2, 2019, 4, 19);
insert into time values(3, 2019, 4, 20);
insert into time values(4, 2019, 5, 2);
insert into time values(5, 2019, 5, 5);

insert into store values(1, 'NYC', 'USA');
insert into store values(2, 'Mumbai', 'India');

insert into promotion values(1, 'NYC', 'USA', 5000);
insert into promotion values(2, 'Mumbai', 'India', 4000);

insert into fact_table values(1, 1, 1, 1);
insert into fact_table values(2, 2, 1, 3);
insert into fact_table values(1, 3, 1, 4);
insert into fact_table values(2, 3, 1, 5);
insert into fact_table values(1, 2, 2, 3);
insert into fact_table values(1, 3, 2, 4);
insert into fact_table values(2, 1, 2, 3);
insert into fact_table values(1, 1, 3, 2);
insert into fact_table values(1, 2, 3, 4);
insert into fact_table values(2, 1, 4, 5);
insert into fact_table values(1, 3, 5, 2);
