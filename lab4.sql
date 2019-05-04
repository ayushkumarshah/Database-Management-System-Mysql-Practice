drop database ayush_school;
create database ayush_school;
use ayush_school;

CREATE TABLE payscale (
  position varchar(45) ,
  salary INT ,
  grade VARCHAR(45) ,
  PRIMARY KEY (position));

CREATE TABLE teacher (
  teacher_id VARCHAR(45),
  name VARCHAR(45) ,
  salary INT ,
  joining_date DATE,
  birthdate DATE ,
  position varchar(45) ,
  PRIMARY KEY (teacher_id),
  foreign key (position) references payscale(position)
  );

CREATE TABLE class (
  class_scheduleno varchar(45),
  teacher_id VARCHAR(45),
  room_no VARCHAR(45),
  PRIMARY KEY (class_scheduleno),
foreign key (teacher_id) references teacher(teacher_id)
  );

INSERT INTO payscale (position, salary, grade) 
VALUES ('HOD', '20000', '64'),
	 ('Professor', '15000', '62'),
	 ('Assosciate Professor', '14000', '59'),
	 ('Assistant Professor', '14500', '60'),
	 ('Lecturer', '12000', '57');

INSERT INTO teacher (teacher_id, name, salary, joining_date, birthdate, position) 
VALUES ('KA07L001', 'Kathilin ', '15000', '2007-05-05', '1987-06-07', 'Professor'),
('JA09P003', 'James', '12000', '2011-02-01', '1990-01-02', 'Lecturer'),
('DE95H001', 'Devoluder', '20000', '1995-06-04', '1955-05-04', 'HOD'),
('PU05AS005', 'Pujan ', '14500', '2012-07-07', '1980-01-01', 'Assistant Professor'),
('BI00AC004', 'Bikash', '14000', '2000-04-02', '1975-03-05', 'Assosciate Professor'),
('JS09P003', 'Janesh', '15000', '2016-01-01', '1991-01-02', 'Lecturer');

INSERT INTO class (class_scheduleno, teacher_id, room_no) VALUES ('402L01', 'KA07L001', '402A'),
('200P02', 'JA09P003', '200B'),
('304AS03', 'PU05AS005', '304C'),
('401AC04', 'BI00AC004', '401A'),
('102H05', 'DE95H001', '102B');


select name from teacher where birthdate=(select min(birthdate) from teacher);
select name,teacher_id from teacher where salary<(select salary from teacher where name='Kathilin');
select * from teacher where salary=any (select salary from teacher where joining_date<'2010-12-31');
select * from teacher where salary>any(select salary from teacher where position='Lecturer');
select * from teacher where salary>all(select salary from teacher where position='Lecturer');
select * from teacher where (position=(select position from teacher where name='James') and salary=(select salary from teacher where name='James'));
select name from teacher natural join class;
select name,salary,grade from teacher natural join payscale;
select name, class_scheduleno from teacher natural join class;
select teacher_id,name from teacher where(DATE_ADD( birthdate, INTERVAL 60 YEAR )<'2018-08-08');
select * from teacher join class ;
create view payscale_view as select position, salary from payscale;
create view teacher_view as select * from teacher;
create view class_view as select * from class;
update teacher_view set position='Assistant Professor' where name='Devoluder';
select teacher_id, name , (salary)*12 as avg_salary from teacher_view where joining_date='2016-01-01' and name='Janesh'; 
select position,count(position) as count_position from teacher_view group by position;



