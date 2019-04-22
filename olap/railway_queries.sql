/* PS:
Consider a data warehouse for a Railway reservation where there are three dimensions:Train,
Passenger, Time. Fact: Revenue. Demonstrate following OLAP operations : Slice, Dice, Roll up,
Cube and Rank.
*/


create table train_dim(t_number int primary key not null, name varchar(10));
create table passenger_dim(pnr int primary key not null, name varchar(10));
create table time_dim(time_id int primary key not null, year int, month int, day int);

create table railway_fact_table(
    t_number int, 
    pnr int, 
    time_id int,
    ticket_cost int,
    supp_charges int,
    primary key(t_number, pnr, time_id),
    foreign key(t_number) references train_dim(t_number),
    foreign key(t_number) references passenger_dim(pnr),
    foreign key(t_number) references time_dim(time_id)
);

