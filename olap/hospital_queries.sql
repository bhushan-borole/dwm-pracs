-- Hospital management

-- tables creation:
create table doctor(doctor_id int primary key, dname varchar(50), dphone varchar(10), specialization varchar(20));
create table patient(patient_id int primary key, pname varchar(50), pphone varchar(10), pgender char(1));
create table time(time_id int primary key, year int(4), month int(2), day int(2));
create table fact_table(doctor_id int, patient_id int, time_id int, charges int, count int, constraint pk_fact_table primary key(doctor_id, patient_id, time_id));

-- data insertion:
insert into patient values(1, 'mandar acharekar', '2309473956', 'M');
insert into patient values(2, 'bhushan borole', '2309473956', 'M');
insert into patient values(3, 'sunny d''souza', '2309476357', 'M');

insert into doctor values(1, 'rishabh bhatnagar', '8888989238', 'radiologist');
insert into doctor values(2, 'vinay deshmukh', '8888983238', 'cardiologist');

insert into time values(1, 2019, 4, 18);
insert into time values(2, 2019, 4, 19);
insert into time values(3, 2019, 4, 20);
insert into time values(4, 2019, 5, 2);
insert into time values(5, 2019, 5, 5);

insert into fact_table values(1, 1, 1, 20000, 1);
insert into fact_table values(2, 2, 1, 2000, 2);
insert into fact_table values(1, 3, 1, 5000, 3);
insert into fact_table values(2, 3, 1, 7000, 4);
insert into fact_table values(1, 2, 2, 8000, 5);
insert into fact_table values(1, 3, 2, 3000, 6);
insert into fact_table values(2, 1, 2, 2000, 7);
insert into fact_table values(1, 1, 3, 7000, 8);
insert into fact_table values(1, 2, 3, 14000, 9);
insert into fact_table values(2, 1, 4, 4000, 10);
insert into fact_table values(1, 3, 5, 6000, 11);


-- 1. CUBE operation:
select time_id, doctor_id, patient_id, avg(charges)  
from fact_table
group by cube(time_id, doctor_id, patient_id);

-- 2. SLICE:
select doctor_id, patient_id, avg(charges)  
from fact_table
where time_id=1
group by cube(time_id, doctor_id, patient_id);

-- 3. DICE:  # check it once.
select doctor_id, patient_id, avg(charges)  
from fact_table
where time_id=3
  and patient_id=2
  and doctor_id=1
group by cube(time_id, doctor_id, patient_id);

-- 4. ROLLUP
select year, month, day, patient_id, doctor_id, sum(charges)  
from fact_table, time
group by patient_id, doctor_id, rollup(year, month, day);

-- 5. RANK AND DENSE RANK:
select time_id, patient_id, doctor_id, charges,
       rank() over(order by charges) as rank,
       dense_rank() over(order by charges) as dense_rank
from fact_table order by rank asc;

