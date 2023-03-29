-- character functions
select concat('Hello', ' Mysql');

select lower('Hello');

select upper('Hello');

select lpad('01', 5, '-');

select rpad('01', 5, '-');

select trim('  Hello  Mysql  ');

select substring('Hello Mysql', 1, 5);

update emp set workno = lpad(workno, 5, '0');


-- numeric function
select ceil(1.1);

select floor(1.9);

select mod(5, 4);

select rand();

select round(2.344, 2);

# 生成6位随机数验证码
select lpad(round(rand()*1000000, 0), 6, '0');


-- date functions
select curdate();

select curtime();

select now();

select year(now());

select month(now());

select day(now());

select date_add(now(), interval 70 year);

select datediff('2023-01-01', '2023-10-01');

select name, datediff(now(), entrydate) as 'entrydays' from emp order by entrydays desc;


-- process control functions
select if (true, 'OK', 'ERROR');

select ifnull ('OK', 'DEFAULT');
select ifnull ('', 'DEFAULT');
select ifnull (null, 'DEFAULT');

select
    name,
    case workaddress
        when '北京' then '一线城市'
        when '上海' then '一线城市'
        else '二线城市' end
        as '工作地址'
from emp;

create table score (
    id          int             comment 'ID',
    name        varchar(20)     comment '姓名',
    math        int             comment '数学',
    english     int             comment '英语',
    chinese     int             comment '语文'
) comment '';
insert into score(id, name, math, english, chinese) values
(1, 'Tom', 67, 88, 95),
(2, 'Rose', 23, 66, 90),
(3, 'Jack', 56, 98, 76);

select
    id,
    name,
    (case when score.math >= 85 then '优秀' when score.math >= 60 then '及格' else '不及格' end ) '数学',
    (case when score.english >= 85 then '优秀' when score.english >= 60 then '及格' else '不及格' end ) '英语',
    (case when score.chinese >= 85 then '优秀' when score.chinese >= 60 then '及格' else '不及格' end ) '语文'
from score;