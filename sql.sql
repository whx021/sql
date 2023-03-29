select database();

create table emp
(
    id              int                 comment '编号',
    workno          varchar(10)         comment '工号',
    name            varchar(10)         comment '姓名',
    gender          char(1)             comment '性别',
    age             tinyint unsigned    comment '年龄',
    idcard          char(18)            comment '身份证号',
    workaddress     varchar(50)         comment '工作地址',
    entrydate       date                comment '入职时间'
) comment '员工表';

insert into emp(id, workno, name, gender, age, idcard, workaddress, entrydate)
VALUES (1, '1', '柳岩', '女', 20, '123456789012345678', '北京', '2000-01-01'),
       (2, '2', '张无忌', '男', 18, '123456789012345670', '北京', '2005-09-01'),
       (3, '3', '韦一笑', '女', 38, '123456789012345670', '上海', '2005-08-01'),
       (4, '4', '赵敏', '女', 18, '123456789012345670', '北京', '2009-12-01'),
       (5, '5', '小昭', '女', 16, '123456789012345678', '上海', '2007-07-01'),
       (6, '6', '杨逍', '男', 28, '12345678901234567X', '北京', '2006-01-01'),
       (7, '7', '范瑶', '男', 40, '123456789012345670', '北京', '2005-05-01'),
       (8, '8', '黛绮丝', '女', 38, '123456789012345670', '天津', '2015-05-01'),
       (9, '9', '范凉凉', '女', 45, '123456789012345678', '北京', '2010-04-01'),
       (10, '10', '陈友谅', '男', 53, '123456789012345670', '上海', '2011-01-01'),
       (11, '11', '张士诚', '男', 55, '123456789012345670', '江苏', '2015-05-01'),
       (12, '12', '常遇春', '男', 32, '123456789012345670', '北京', '2004-02-01'),
       (13, '13', '张三丰', '男', 88, '123456789012345678', '江苏', '2020-11-01'),
       (14, '14', '灭绝', '女', 65, '123456789012345670', '西安', '2019-05-01'),
       (15, '15', '胡青牛', '男', 70, '12345678901234567X', '西安', '2018-04-01'),
       (16, '16', '周芷若', '女', 18, null, '北京', '2012-06-01');

-- basic queries
select name, workno, age from emp;

select id, workno, name, gender, age, idcard, workaddress, entrydate from emp;
select * from emp;

select workaddress from emp;
select workaddress as '工作地址' from emp;
select workaddress '工作地址' from emp;
select distinct workaddress '工作地址' from emp;


-- conditional queries
select * from emp where age = 88;

select * from emp where age < 20;

select * from emp where age <= 20;

select * from emp where idcard is null;

select * from emp where idcard is not null;

select * from emp where age != 88;
select * from emp where age <> 88;

select * from emp where age >= 15 && age <= 20;
select * from emp where age >= 15 and age <= 20;
select * from emp where age between 15 and 20;

select * from emp where gender = '女' and age < 25;

select * from emp where age = 18 or age = 20 or age = 40;
select * from emp where age in(18, 20, 40);

-- '_' : represents a character
-- '%' : represents any character
select * from emp where name like '__';

select * from emp where idcard like '_________________X';
select * from emp where idcard like '%X';


-- aggregate functions
select count(*) from emp;
select count(idcard) from emp;

select avg(age) from emp;

select max(age) from emp;

select min(age) from emp;

select sum(age) from emp where workaddress = '西安';


-- group queries
-- where : 分组前过滤 filter before grouping
-- having : 分组后过滤 filter after grouping
-- order of execution : where -> group -> having
-- group queries the group field and aggregate functions
select gender, count(*) from emp group by gender;

select gender, avg(age) from emp group by gender;

select workaddress, count(*) address_count from emp where age < 45 group by workaddress having address_count > 3;

-- order queries
select * from emp order by age asc;
select * from emp order by age;
select * from emp order by age desc;

select * from emp order by entrydate desc;

select * from emp order by age asc, entrydate desc;
select * from emp order by age asc, entrydate asc;


-- paginated queries
select * from emp limit 0, 10;
select * from emp limit 10;

select * from emp limit 10, 10;


-- practice
select * from emp where gender = '女' and age in(20, 21, 22, 23);

select * from emp where gender = '男' and ( age between 20 and 40 ) and name like '___';

select gender, count(*) from emp where age < 60 group by gender;

select name, age from emp where age <= 35 order by age asc, entrydate desc;

select * from emp where gender = '男' and (age between 20 and 40) order by age asc, entrydate asc limit 5;

/**
        Data Query Language
  write order       execute order
    select              step 4
    from                step 1
    where               step 2
    group by            step 3
    having              step 7
    order by            step 5
    limit               step 6
 */

select e.name ename, e.age eage from emp e where e.age > 15 order by eage asc;