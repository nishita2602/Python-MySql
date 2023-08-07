use odin_db;
create table Program(ProgramId int Primary key, ProgramName varchar(20));
create table Cohort(CohortId int Primary key, CohortName varchar(20),StartDate date, EndDate date);
CREATE TABLE Program_Cohort (
    ProgramId1 INTEGER,
    CohortId1 INTEGER,
    FOREIGN KEY (ProgramId1) REFERENCES Program(ProgramId),
    FOREIGN KEY (CohortId1) REFERENCES Cohort(CohortId)
);
Insert into Program
values(1,'DS'),(2,'FS');
Insert into Cohort
values(1,'DS22','2022-12-31','2023-06-30'),(2,'DS23','2023-01-31','2023-07-31'),
(3,'FS22','2022-12-31','2023-06-30'),(4,'FS23','2023-01-31','2023-07-31');
SELECT* from program_cohort;
insert into program_cohort
values(1,1),(1,2),(2,3),(2,4);
update Cohort
set StartDate='2023-04-22'
where CohortId=1;
update Cohort
set EndDate='2023-08-22'
where CohortID=1;
drop table program_cohort;
drop table program;
drop table Cohort;
drop database odin_db;