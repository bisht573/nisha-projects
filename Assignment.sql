-------------------------SQL Assignment-----------------------------
use model;
create table Employees(
Employee_id int primary key,
First_name varchar(50) not null,
Last_name varchar(50) not null,
Department varchar(50),
Salary int check (salary>0),
Joining_date date not null,
Age int check(age>18)
);
select * from Employees

insert into Employees values
(100,'Ravi','Kumar','IT',20000,'2015-05-01',29);
insert into Employees values(101,'Amit','Sharma','HR',25000,'2019-02-05',25),(102,
'Neha','Kumari','Finance',30000,'2020-05-12',26),(103,'Rahul','Mehta','IT',28000,'2019-06-03',20),
(104,'Pooja','Singh','Sales',24000,'2022-05-01',25),(105,'Simran','Kaur','Marketing',25000,'2023-05-06',29),
(106,'Rohit','Kapoor','IT',30000,'2024-05-07',29),(107,'Riya','Gupta','Sales',23000,'2025-01-01',21);

----------------Questions------------
1. Retrive all employees first name and their dept?

select first_name,department from Employees;
2. Update the salary of all employees in the IT dept by increasing it by 10%?
update Employees set Salary= Salary * 1.10
where Department ='IT';

3. Delete all employee who are older than 30 year?
Delete from Employees where Age>30;
4. Add a new column email to the employees table?
alter table employees
add  email varchar (100);

5. Rename the dept column to dept_name?
exec sp_rename 'employees.email','Email','column';

6. Retrieve the names of employees who joined after january 1,2021?
select first_name,Last_name,Joining_date  from Employees 
where Joining_date >'2015-05-01';
7. Change the data type of salary column to bigint?
alter table employees
alter column salary number;
8. List all employes with their age and salary in descending order of salary?
select first_name,Last_name,age,salary from Employees 
order by Salary desc;
9. Insert a new Employee with the following details ?

10. update age of employee +1 to every employee?
update Employees set Age = Age+1;
select * from Employees 


create table Nisha(
Emp_id int primary key,
Name varchar(30)not null
,Age int check(age>=18),
Salary decimal(10,2) default 25000,
Dept_id int,
constraint  employee_id foreign key(Dept_id)
references employees(Employee_id)
);
select * from nisha

insert into nisha values(07,'Nisha',28,32000,105);
insert into nisha (Emp_id ,Name ,Age ,Dept_id )

Create table students(
student int primary key,
student_name varchar(30),
age int,
class varchar(20));
insert into students values(6,'amit',20,'12th','amit233@gmail.com');
exec sp_rename 'students.student','Student_id','column';
select * from students 
create table Teachers(
Teacher_id int primary key,
Teacher_name varchar(30),
Subject varchar(30)
);
insert into Teachers values(7,'Ms.Sneha', 'polity');
select* from Teachers 
create table Courses(
Course_id int primary key,
Course_name varchar(30),
Teacher_id int,
Foreign key (Teacher_id) references Teachers(Teacher_id)
);
insert into Courses values(106,'Statistics',6);
select * from Courses 
create table Enrollments(
Enrollment_id int primary key,
Student_id int,
Course_id int,
foreign key (Student_id) references Students(Student_id),
foreign key (Course_id) references Courses(course_id)
);
insert into Enrollments values(6,6,106);
select * from Enrollments 
alter table students add email varchar(50);
exec sp_rename 'students.student','Student_id','column';

exec sp_rename 'Teachers.subject', 'Subj_name','column';
select * from Teachers 
alter table Courses alter column Course_name varchar(50);

create table Student1(
student_id int primary key identity (1,1),
student_name varchar(30) not null,
age int,
class varchar(30));
select * from student1 
insert into Student1 values('Neta', 21,'11th');
update Student1 set age =21 where age=2;

select name,salary from nisha  ;
select distinct Age  from nisha;
select *from nisha 
select * from nisha order by Salary desc;
select * from nisha where Salary >27000;
select * from nisha where Dept_id =101 and Salary >27000;

create table employees2(
emp_id int,
name varchar(30),
dept varchar(30),
salary bigint,
Joining_date date);
select * from employees2 
insert into employees2 values(108,'Amit kumar','IT',50000,'2008-05-03');
select name, salary from employees2 where dept ='it';
select * from employees2 where salary >=30000;
select dept,AVG (salary) as avgsalary from employees2 group by dept ;
select  max(salary) as highestsalary from employees2 ;
select * from employees2 where Joining_date >'2019-02-02';
select name, salary from employees2 where salary >(select AVG(salary) from employees2 
where dept ='hr');
select dept ,COUNT(*) as empcount from employees2 group by dept ;
select MAX(salary) as secondhighest from employees2 where salary <
(select MAX(salary) from employees2 );
select * from employees2 order by Joining_date ; 

select * from students 
select student_name,age from students;
select * from students  where age>=18;
 alter table students add course varchar(30);
 update students set course = 'SQL' WHere Student_id =6;
 select * from students where Course ='python';
 select * from students order by age desc;
 select  count(*) as student_name from students where Course='sql' ;
 select AVG (age) as avg_age from students ;
 select * from students where age>17;
 select * from students where age between 12 and 21;
 select * from students where student_name like 's%';
 select * from students where Course <> 'python';
 alter table students add marks int;
 select * from students 
 update students set marks= 70 where Student_id =6;
 select  sum(marks)as total_marks from students ;
 select MIN(marks) as total_marks from students ;
 select Course, COUNT(*) as student_count from students group by Course;
 select Course, AVG(marks) as total_makes from students group by Course;
 update students set marks=marks+5 where Course= 'sql';
 delete from students where marks<60;
 select top 3* from students order by marks desc;
 select * from students order by Course asc , marks desc;
 
 create table employees3(
 emp_id int primary key identity(1,1),
 name varchar(30) not null,
 desig varchar (30) default 'probation',
 dept varchar(30)
 );
 select * from employees3 
 insert into employees3 (name,dept)values('victor', 'deposit');
 select emp_id, name from employees3 ;
 select * from employees3 where dept= 'loan';
 select * from employees3 where emp_id =3;
 select emp_id ,name  from employees3 where emp_id =1;
 update employees3 set dept ='IT'where emp_id =1;
 select 'hye' + 'buddy' as result;
 select SUBSTRING ('Hey buddy',5,9);
  select SUBSTRING ('Hey buddy',5,2);
  select SUBSTRING ('hye buddy, wassup raju', -2,4);
  select REPLACE ('hello ', 'abcd', 'yhn');
  select REPLACE (emp_id,10,'ids')as emp,name from employees3 ;
  select REVERSE ('hello');     bhhhhhh
  select stuff('hey washp', 5,0,'raju')
  select *from employees3 where char_length(name)>5;
  
  select * from students 
  alter table students add  city varchar(30);
  update students set city='UK' where Student_id =6;
  select * from students where city='delhi';
  select * from students where age>15;
  select student_name ,age  from students where age>15;
  select AVG(marks)  as vag_marks from students where course ='sql';
  select MAX(marks) as max_marks from students where course ='python';
  select * from employees2
  select * from students  
  select s.student_name, s.course, s.marks from students s
  join employees2  on s.Student_id =s.student_id;
select COUNT (*)as total_class10_student from students where class= '10th';
select student_name,city from students ;
select * from students where age =14;
select * from students where class ='10th';
select  distinct city from students ;
select * from students order by student_name Asc;
select * from students order by age  desc;
select  name from sys.tables;
select * from employees2 
select * from employees2 where dept ='HR';
select * from employees2 where salary =31000;
select distinct dept from employees2 
select AVG(salary) as avg_salary from employees2 
select MAX(salary) as highest, MIN(salary) as lowest_salary from employees2 ;
select COUNT(*) as total_emp from employees2 where dept='HR';
select * from employees2 where YEAR(joining_date)=2020;
select MAX(salary) as sencond_highest from employees2 where
salary <(select MAX(salary)from employees2 );
select * from employees2 where salary >(select AVG(salary) from employees2 );
select name,salary from employees2 where dept='HR' order by salary desc ;

select * from students 
select * from students where age =16;
select course, COUNT(*) as total_student from students group by course ;
update students set age =22 where student_name ='amit';
select * from Courses 
select s. student_name, c.course_name from students s
join Courses c on s.course = c.Course_name ;
select * from students order by age asc  ;
create table student (
student_id int primary key identity(1,1),
student_name varchar(100) not null,
email varchar(100) unique,
age int);
create table course(
course_id int primary key identity(1,1),
course_name varchar(100)not null,
student_id int,
foreign key (student_id)references student(student_id));
select* from students 
select * from course 
insert into student values('sohan kumar','sohan02@gamil.com',32);
insert into course(course_name ,student_id ) values('Data analysis',5);
select s.student_name, s.email, c.course_name from student s join course 
c on s.student_id = c.student_id ;
select top 2 student_name, age from student order by age desc;
select * from students
select * from students where marks >80;
select student_name  ,course  from students ;
select * from course 
select c.course_name from course c inner join student s on c.course_id=
s.student_id where s.student_name='rohan';
select course , COUNT(Student_id ) as total_student from students group by course ;
select AVG(marks)as avg_marks from students where course ='sql';
select * from students order by marks  desc;
select * from students order by marks asc;
update students set marks=marks +5 where Student_id=1;
select s.student_name, s.marks,c.course_id from students s inner join course c on 
s.student_name=c.course_name ;
select student_name,marks,class from students c where marks =(select 
MAX(marks) from students where course =c.course );
select MAX(marks) as second_high from students where marks <(select MAX(marks) from students );
create view
 high_scorers as 
select student_id,student_name,marks,course from students where marks>60;
select * from students 
select * from high_scorers 
select student_name, marks from students ;
select * from students where marks >80;
select * from students order by age asc;
select top 1 * from students order by marks desc ;
select COUNT (*) as total_students from students 
select AVG(marks) as avg_marks from students ;
update students set marks=95 where student_name ='rohan'; 
select * from students where student_name like 'A%';
select age, COUNT(*) as total_student from students group by age;
select * from students where marks between 70 and 95;
select * from students where student_name like '%a';
select * from students where age <>20;
select top 1 marks from students where marks <(select MAX(marks) from students )
order by marks desc;
select distinct age  from students ;
select * from students where marks <(select AVG(marks) from students );
update students set city = 'MP' where student_name ='sohan';
select * from students 
select student_name, class, course ,city from students ;
---------------------quick revision-----------------------------

create table zee(
emp_id int primary key,
name varchar(30) not null,
salary int check (salary >=5000),
age int check (age>=18),
city varchar(30)
);
select * from zee;
update zee set dept = 'Marketing' where emp_id=107;
alter table zee add  phone_no bigint;
update zee set salary= 60000, city='uk' where emp_id=101 ;
delete zee where name='dipika' 
select * from zee order by salary desc;
select * from zee order by salary Asc;
alter table zee add dept varchar(100);
alter table zee add constraint uq_phone_no unique (phone_no);
insert into zee values(105,'pooja',65000,30,'delhi',6523140780,'Sales');
update zee set salary = 70000 where emp_id=105;
insert into zee values(101,'rakesh',30000,27,'delhi',9485623170);
insert into zee values(102,'riya',31000,27,'mp',9485623101);
insert into zee values(103,'deepak',20000,27,'delhi',9400623170);
insert into zee values(104,'rohan',10000,27,'uk',9785623170);
insert into zee values(105,'dipika',70000,27,'lucknow',4585623170);
insert into zee values(106,'sohan',35000,27,'wast bangal',9885623170);
insert into zee values(107,'mukesh',50000,27,'jharkhand',7885623170);

if not exists (select * from INFORMATION_SCHEMA. TABLES
where TABLE_NAME= 'zeenews')
begin
create table zeenews(
emp_id int primary key identity (1,1),
name varchar (30),
dept_id int, foreign key (dept_id) references zee(emp_id),
age int check (age >=18),
email_id varchar(100) unique,
city nvarchar(50))
end
insert into zeenews values('ranii',107,28,'ranii@123640gmail.com','chennai');
select * from zeenews
select * from zee where salary  >50000;
select * from zee order by salary asc;
select * from zee
select dept, COUNT(*)as total_emp from zee group by dept;
select dept, COUNT(*) as total_emp from zee group by dept having COUNT(*)>1; 
select top 3 * from zee order by salary desc;

create table dept(
dept_id int primary key,
dept_name varchar(50));

create table employeesss(
emp_id int primary key,
name varchar(50),
dept_id int,
foreign key (dept_id) references dept(dept_id) on delete set null
on update set default);

select * from dept 
select * from employeesss 
drop table employeesss
insert into dept values(1001,'HR'),(1002,'IT'),(1003,'Sales');
insert into employeesss  values(101,'ravi',1001),(102,'rahul',1002),(103,'geeta',1003);
update dept set dept_id =1001 where dept_id =1000;
insert into dept values(1004, 'HR');
delete dept where dept_id =1000;
use model
-------------cast and covert-------------------
select CAST(1234 as varchar(10)) as numberastext;
select CONVERT(varchar(10),1234)as numberastext;
select CAST(100 as decimal(10,2))as decimalvalue;
select CONVERT(varchar(10), getdate(),103)as formatteddate;
select CAST('2025-10-24' as DATE) as converteddate;
select CAST('500' as int) as numbervalue;
select CONVERT(datetime, '2025-10-24 14:30:00', 120) as converteddatetime;
select CAST(null as varchar(10)) as result;
select CAST(5 as decimal(10,2)) /2 as result;
select CONVERT(money, '1234.56')as moneyvalue;
select CAST(getdate() as varchar(50)) as dateastext;
select CONVERT(binary(4), 1234) as binaryvalue;
select name, CAST(salary as varchar(20)) as salarytext from zee;
select CONVERT(varchar(10),getdate(), 101) as usdateformat;
----types of funcation-----------------
select SUM(salary)as totalsalary from zee;
select MAX(salary)as totalhigh, MIN(salary) as totalmin from zee;
select COUNT(*) from zee;
select UPPER (name) as uppername from zee;
select SUBSTRING (name,1,3) as shortname from zee;
select GETDATE() as today;
select POWER(5,2) as squre;
use model
select * from zee
select SUM(salary)as total_salary from zee;
select dept,AVG(salary) as avg_salary from zee group by dept;
select MAX(salary) as max_salary,MIN (salary)as min_salary from zee ;
select UPPER(name) as upper_name from zee;
select ROUND(salary,2)as ronud from zee;
select SUBSTRING(name,1,3)as short_name from zee;
select REPLACE(salary,'emp_salary','salary') from zee;
select GETDATE() as today_date;
select CAST(salary as int) as salaryint from zee;
select CONVERT(varchar,getdate(),103) as datestring;

select * from zee
select SUM(salary) as total_salary from zee;
select dept, avg(salary) as dept_wise from zee group by dept;
select MAX(salary) as highest,MIN(salary) as lowest_salary from zee;
select UPPER(name)as upper from zee;
select ROUND(salary,2)as rounded from zee;
select len(name) as length_name from zee;
select GETDATE();
select SUBSTRING(name,1,3) as short_name from zee;
select AVG(salary)from zee;
select * from zee where salary>(select AVG(salary) from zee);
select name,salary,age,dept from zee where salary>(select AVG(salary) from zee);
select name,dept,salary from zee where salary=(select MIN(salary)from zee);
select dept from zee where name='rohan';
select dept,name,salary from zee where dept=(select dept from zee where name='rohan');
select salary from zee where dept='it';
select name,salary,dept from zee where salary> any(select salary from zee where dept='it');
select * from zee;
select * from zeenews

select zee.name,zeenews.city from zee inner join zeenews on zee.emp_id =zeenews.dept_id ;
select zee.name,zeenews .age from zee left join zeenews on zee.emp_id =zeenews .dept_id ;
select MAX(salary)as highest_salary from zee
 where salary <(select MAX(salary)from zee);
 select dept  , count(*)as total_emp from zee group by   dept;
 Alter table zee add  joinig_date date;
 update zee set joinig_date='2015-10-09' where emp_id =107;
 select * from zee where joinig_date>=dateadd(month,-3,getdate());
 select name,COUNT(*) as count_name from zee group by name having COUNT(*)>1;
 insert into zee values(108,'pooja',50000,28,'bihar',9654123652,'sales','2025-01-01');
 select * from zee
 select name,salary from zee where salary >(select AVG(salary)from zee);
 select distinct top 3 salary from zee order by salary desc ;
 
 select dept ,SUM(salary) as total_salary from zee group by dept ;
 
 select * from zee where name like 'r%';
 create table america(
 emp_id int primary key,
 emp_first_name varchar(30),
 emp_last_name varchar(30),
 salary decimal(10,2) check (salary >=10000),
 dep varchar(30),
 age int default 18)
 ;
 select * from america
 insert into america values(1001,'rahul','kumar',15000,'sales',25);
  insert into america values(1002,'neha','kumari',15000,'sales',24);
 insert into america values(1003,'rakesh','negi',18000,'sales',25);

  insert into america values(1006,'mahi','kapoor',18000,'finence',18);
  create table discount(
  emp_id int primary key ,
  product_name varchar(30),
  price decimal (10,2),
  discount decimal(5,2),
  check ((price > 5000 and discount <=50) or (price <=5000 and discount =0)));
select * from discount 

insert into discount values(1002,'cpu',4000,0);
create table studentsss(
roll_no int primary key,
name varchar (30),
percentage decimal (5,2)
,grade as 
        (case when percentage >= 90 then 'A' 
         when percentage >=75 then 'B'
         when percentage >=50 then 'C'
         else 'Fail' end));
select * from studentsss 
 insert into studentsss values(11,'jyoti',80.2);
 select  distinct name from studentsss;
 select * from studentsss where percentage >=65;
 select * from student ;
 select * from employees2 

 select * from employees2 where salary >=40000;
 select name, salary from employees2 where salary >=40000;
 select name, salary from employees2 order by salary desc;
 select top 5 name, salary from employees2 order by salary desc;
 select SUM(salary)as total_salary,avg(salary)as avg_salary,
  max(salary) as mix_salary from employees2 ;
  select dept,avg(salary) as avg_salary from employees2 group by dept  ;
  select dept ,AVG(salary) as highest from employees2 group by dept 
  having AVG(salary)>= 20000;
  select * from zee
  select * from zeenews
  select e.name,e.salary,z.city from zee e inner join zeenews z on e.dept =z.city;
  select z.name, zz.dept_id from zee z left join zeenews zz on z.emp_id =zz.dept_id ;
  select name, salary from zee where salary > (select AVG(salary) from zee );
  select name , salary, case when salary >=45000 then 'high' when salary between
   30000 and 44999 then 'medium'else 'low' end as salary_grade from zee ;
   select YEAR (joinig_date) as joinyear, COUNT(*) as total_employees from zee 
   group by YEAR (joinig_date)order by joinyear;
   select name, salary, RANK() over (order by salary desc)as salaryrank from zee ;
   with deptavg as ( select dept ,AVG(salary) as avgsal from zee 
   group by dept ) select top 3 * from deptavg  order by avgsal desc;
     select * from zee
  select * from zeenews
create table sales(
sale_id int primary key,
custommer_name varchar(30),
product varchar(50),
quantity int,
price decimal (10,2),
sale_date date);

select * from sales;
insert into sales values(104,'pooja kumari','tablet',50,40000,'2024-08-07');
select custommer_name,product from sales ;
select * from sales 
exec sp_rename 'sales.custommer_name','customer_name';
select customer_name from sales where quantity >15 ;
select * from zee 
select customer_name, SUM(quantity * price)as total_sales from sales group by custommer_name ;   
select dept,AVG(salary)as avg_salery from zee group by dept ;
select name,dept from zee  where dept='it';
select top 3 * from zee order by salary desc;
select MONTH(sale_date)as monthnumber,SUM (quantity)as totalquantity from sales group
by MONTH(sale_date)order by monthnumber;
select * from sales 

