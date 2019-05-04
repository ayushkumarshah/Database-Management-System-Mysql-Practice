drop database ayush;
create database ayush;
use ayush;
create table Branch(branch_id char(50) primary key,staff_id char(50),branch_add char(50),assets int);
create table Customer(cust_id char(50) primary key,cust_name char(50),cust_add char(50),cust_phone char(50), cust_dob date);
create table Loan(loan_number int primary key,branch_id char(50),amount int);
create table Borrower(cust_id char(50) primary key,loan_number int);
create table Account(account_number char(50) primary key,branch_id char(50),balance int);
create table Depositor(cust_id char(50) primary key,account_number int);
create table Staff(staff_id char(50) primary key,staff_name char(50),staff_add char(50));
insert into Branch values('BNPB001','BS001','Banepa',12000),
			 ('KTMA102','AKS002','Kathmandu',10000),
			 ('BKTA120','AN102','Bhaktapur',8000),
			 ('LLTR120','RM145','Lalitpur',13000),
			 ('KAVE180','ES182','Kavre',7000),
			 ('JNKA052','AS150','Janakpur',5000),
			 ('POKS130','SP102','Pokhara',4500),
			 ('MAKP050','PP089','Makwanpur',4000),
			 ('HTDP780','PK082','Hetauda',8000),
			 ('BTNA120','AA102','Biratnagar',7000);

insert into Customer values('BNPA001','Ayush Kumar Shah','Banepa',0614481509,'2054-02-06'),
			 ('KTMB102','Bibash Shrestha','Kathmandu',014663125,'2052-03-06'),
			 ('BKTR120','Rajan Mali','Bhaktapur',0614413225,'2054-02-29'),
			 ('LLTA120','Araju Nepal','Lalitpur',015541236,'2054-07-06'),
			 ('KAVS180','Sunil Prajapati','Kavre',0214412569,'2055-12-06'),
			 ('JNKE052','Eva Shrestha','Janakpur',0416631259,'2054-11-15'),
			 ('POKP130','Prakash Poudyal','Pokhara',0514456987,'2045-06-15'),
			 ('NAKP050','Prerana Khatiwoda','Nayasadak',0714123658,'2054-01-06'),
			 ('HTDR780','Rajan Kalwar','Hetauda',0146631259,'2052-03-06'),
			 ('BTNB120','Akash Amatya','Biratnagar',0146631259,'2052-03-06');

insert into Loan values(1001,'BNPB001',12000),
			 (1043,'KTMA102',10000),
			 (1020,'BKTA120',8000),
			 (1019,'LLTR120',13000),
			 (1044,'KAVE180',7000),
			 (1021,'JNKA052',5000),
			 (1065,'POKS130',4500),
			 (1077,'MAKP050',4000),
			 (1022,'HTDP780',8000),
			 (1031,'BTNA120',7000);


insert into Borrower values('BNPA001',1005),
			 ('KTMB102',1004),
			 ('BKTR120',1048),
			 ('LLTA120',1098),
			 ('KAVS180',1047),
			 ('JNKE052',1052),
			 ('POKP130',1074),
			 ('MAKP050',1022),
			 ('HTDR780',1041),
			 ('BTNB120',1001);

insert into Account values('474D','BNPB001',12000),
			 ('833A','KTMA102',10000),
			 ('005S','BKTA120',8000),
			 ('177B','LLTR120',13000),
			 ('547A','KAVE180',7000),
			 ('855W','JNKA052',5000),
			 ('122D','POKS130',4500),
			 ('474E','MAKP050',4000),
			 ('885B','HTDP780',8000),
			 ('455C','BTNA120',7000);

insert into Depositor values('BNPA001',8323),
			 ('KTMB102',4746),
			 ('BKTR120',8854),
			 ('LLTA120',9985),
			 ('KAVS180',1123),
			 ('JNKE052',4112),
			 ('POKP130',7745),
			 ('MAKP050',6658),
			 ('HTDR780',6586),
			 ('BTNB120',8547);

insert into Staff values('BNPA001','Ayush Kumar Shah','Banepa'),
			 ('KTMB102','Bibash Shrestha','Kathmandu'),
			 ('BKTR120','Rajan Mali','Bhaktapur'),
			 ('LLTA120','Araju Nepal','Lalitpur'),
			 ('KAVS180','Smith','Kavre'),
			 ('JNKE052','Eva Shrestha','Janakpur'),
			 ('POKP130','Prakash Poudyal','Pokhara'),
			 ('MAKP050','Prerana Khatiwoda','Makwanpur'),
			 ('HTDR780','Rajan Kalwar','Hetauda'),
			 ('BTNB120','Akash Amatya','Biratnagar');

select * from Branch;
select * from Customer;
select * from Loan;
select * from Borrower;
select * from Account;
select * from Depositor;
select * from Staff;

alter table Staff add designation char(50);

select * from Staff;

UPDATE Staff SET designation='Manager' Where staff_add in ('Banepa' ,'Kathmandu');
UPDATE Staff SET designation='Assistant' Where staff_add in ('Bhaktapur','Lalitpur', 'Kavre','Janakpur','Pokhara');
UPDATE Staff SET designation='Officer' Where staff_add in ('Makwanpur','Hetauda');
UPDATE Staff SET designation='Guard' Where staff_add in ('Biratnagar');

select * from Staff;

delete from Staff where staff_name = 'Smith';

select * from Staff;

select account_number from account where balance = (select MAX(balance) from account);

update Account set balance=balance-5000	where account_number='005S';

select balance from Account where account_number='005S';

select * from Customer where cust_dob=(select max(cust_dob) from Customer);

select branch_id from Loan where amount>10000;

select count(cust_name) from Customer where cust_add='Nayasadak';

drop database ayush;
