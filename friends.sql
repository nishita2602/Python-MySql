create database friends_db;
use friends_db;
create table friends_char(apart_ID int primary key ,First_Name varchar(20),Last_Name varchar(20),Profession varchar(20),Hobby varchar(20));
INSERT INTO friends_char (apartment_number, first_name, last_name, profession, quirky_trait)
VALUES (20, "Monica", "Geller", "Chef", "Cleaning"),
       (20, "Rachel", "Green", "Shopper", "Fashion"),
       (19, "Chandler", "Bing", "Data curator", "Sarcasm"),
       (19, "Joey", "Tribbiani", "Actor", "Eating"),
       (13, "Ross", "Geller", "Paleontologist", "Marriage"),
       (15, "Phoebe", "Buffay", "Masseuse", "Smelly cat");
Select* from friends_char;
UPDATE friends_char
SET profession = 'Professor',
    Hobby = 'Divorce'
WHERE first_name = 'Ross' AND last_name = 'Geller';
Update friends_char
set profession='jnr copywriter'
where first_name='Chandler';
Alter table friends_char change column Hobby quirky_trait varchar(200);
Select*from friends_char;
Alter table friends_char add column spouse varchar(100);
UPDATE friends_char
SET spouse = 'Chandler'
WHERE first_name = 'Monica';
Alter table friends_char drop column spouse;
SELECT * FROM friends_db.friends_char;
use friends_db;
UPDATE friends_char
set spouse='Ross'
where First_name='Rachel';
update friends_char
set spouse='Monica'
where First_name='Chandler';
update friends_char
set spouse='Rachel'
where First_name='Ross';
update friends_char
set spouse='Mark'
where First_name='Phoebe';
update friends_char
set spouse='NA'
where First_name='Joey';
Select * from friends_char;
use friends_db;
Create table episodes(ep_id int,ep_name varchar(200),duration time,date_rel date);
Alter table episodes add column first_name1 varchar(20);
select* from episodes;
INSERT INTO episodes
VALUES (1, 'The First One', '02:35:36', '1994-09-22','Monica');
use friends_db;
Select* from episodes;
Insert into episodes
Values(2,'The One with the Sonogram at the End','00:40:30','1994-09-27','Rachel');
Insert into episodes
Values(3,	'The One with the Thumb','00:40:28','1994-09-30','Phoebe'),
(4,'The one with George Stephanopoulos','00:40:23','1994-02-23','Rachel');
select *, upper(first_name1) from episodes;
Select *, length(first_name1) from episodes;
Select concat(first_name1,"ji") from episodes;
Select left(first_name1,4)from episodes;
Select right(first_name1,3) from episodes;
select *, locate(first_name1,"Monica") from episodes;
select*,left(first_name1,4),locate('ac', first_name1) from episodes;
select mid(first_name1,2,6) from episodes;
select substr(first_name1,3,6) from episodes;
select*, replace (first_name1,'Monica','Monica Bing') from episodes;
select count(*) from episodes
where  month(date_rel)=09;
select mid('Nishita',1,5);
select left('Nishita',5),locate("ta",'Nishita');
select right('Nishita',4),locate('shi','Nishita');
select left('Nishita',3),locate('shi','Nishita');
use friends_db;
Select episodes.first_name1, friends_char.First_Name from episodes inner join friends_char on  episodes.first_name1=friends_char.First_Name;
Select * from episodes inner join friends_char on  episodes.first_name1=friends_char.First_Name;
Select * from episodes left join friends_char on  episodes.first_name1=friends_char.First_Name;
Select distinct apart_ID from friends_char;
Select distinct first_name1 from episodes;
Select distinct quirky_trait from friends_char;
use friends_db;
select * from episodes right join friends_char on episodes.first_name1=friends_char.first_Name;
