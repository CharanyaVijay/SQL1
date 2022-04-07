create table Student
(
matric_no char(8) primary key,
first_name varchar(50) not null,
last_name varchar(50) not null,
date_of_birth date
);

insert into student values ('40001010','Daniel','Radcliffe','1989-07-23');
insert into student values ('40001011','Emma','Watson','1990-04-15');
insert into student values ('40001012,'Rupert','Grint','1988-10-24');

create table module
(
module_code char(8) primary key,
module_title varchar(50) not null,
level int not null,
credits int not null default 20
);

insert into module(module_code, module_title, level) values('HUF07101', 'Herbology',7,20)
insert into module(module_code, module_title, level) values('SLY07102', 'Defense Against the Dark Arts',7,20)
insert into module(module_code, module_title, level) values('HUF08102', 'History of Magic',8,20)

create table registration
(
matric_no char(8),
module_code char(8),
result decimal(4,1),
primary key (matric_no,module_code),
foreign key (matric_no) references student(matric_no),
foreign key references (module_code)  module(module_code)
);

insert into registration values('40001010','SLY07102',90)
insert into registration values('40001010','HUF07101',40)
insert into registration values('40001010','HUF08102',null)
insert into registration values('40001011','SLY07102',99)
insert into registration values('40001011','HUF08102',null)
insert into registration values('40001012','SLY07102',20)
insert into registration values('40001012','HUF07101',20)

select last_name,
first_name,
case 
when result>=70
then 'M'
when result>=40 and result<=69
then 'P'
when result<=39
then 'F'
end as Result
from student s
join result r
on s.matric_no=r.matric_no
where module_code='SLY07102';

create table modinst
(
module_code char(8),
ayr varchar(8),
tri varchar(4),
primary key (module_code,ayr,tri),
foreign key references (module_code)  module(module_code)
);

ALTER TABLE registration ADD ayr varchar(8);
ALTER TABLE registration ADD tri varchar(4);

UPDATE registration
SET ayr= 2015/6,  tri='TRI2';

UPDATE registration
SET ayr= 2016/7,  tri='TRI1'
where module_code='HUF07101';

ALTER TABLE registration
ADD FOREIGN KEY (ayr) REFERENCES modinst(ayr);

ALTER TABLE registration
ADD FOREIGN KEY (tri) REFERENCES modinst(tri);




