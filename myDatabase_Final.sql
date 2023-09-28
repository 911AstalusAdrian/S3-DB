drop table Payment;
drop table Booking;
drop table Screening;
drop table IsScreened;
drop table Seat;
drop table MovieRoom;
drop table Cinema;
drop table PlaysIn;
drop table Actor;
drop table Movie;
drop table Client;
drop table CreditCard;


create table CreditCard(
	CardID varchar(10) primary key,
	CardNumber varchar(20),
	ExpMonth int,
	ExpYear int,
	CVC int
)

create table Client(
	UserID varchar(10) primary key,
	UserFName varchar(30),
	UserLName varchar(30),
	UserGender varchar(1),
	UserEmail varchar(30),
	PhoneNumber varchar(30),
	UserCard varchar(10) unique foreign key (UserCard) references CreditCard(CardID) 
)

create table Movie(
	MovieID int primary key,
	Title varchar(50),
	Director varchar(30),
	Duration int,
	Rating float
)

create table Actor(
	ActorID varchar(10) primary key,
	ActorFName varchar(30),
	ActorLName varchar(30),
	ActorDoB date,
	ActorBirthCountry varchar(100)
)

create table PlaysIn(
	actID varchar(10),
	movID int,
	primary key(actID, movID),
	foreign key (actID) references Actor(ActorID),
	foreign key (movID) references Movie(MovieID)
)

create table Cinema(
	CinemaID int primary key,
	CinemaName varchar(30),
	RoomsNumber int,
	City varchar(30)
)

create table MovieRoom(
	RoomID varchar(10) primary key,
	RoomCapacity int,
	RoomType varchar(50),
	CID int foreign key references Cinema(CinemaID)
)

create table Seat(
	SeatID int primary key,
	SeatRow int,
	SeatNumber int,
	SeatType varchar(50),
	RID varchar(10) foreign key references MovieRoom(RoomID)
)

create table IsScreened(
	movID int,
	cinID int,
	primary key(movID, cinID),
	foreign key (cinID) references Cinema(CinemaID),
	foreign key (movID) references Movie(MovieID)
)

create table Screening(
	ScreeningID int primary key,
	DateOfScreening date,
	MID int foreign key references Movie(MovieID),
	RID varchar(10) foreign key references MovieRoom(RoomID)
)

create table Booking(
	BookingID int primary key,
	SeatsNumber int,
	UsrID varchar(10) foreign key references Client(UserID),
	ScrID int foreign key references Screening(ScreeningID)
)

create table Payment(
	PaymentID int primary key,
	PaymentAmount int,
	CardUsed varchar(10) foreign key references Client(UserCard),
	BookingNo int unique foreign key references Booking(BookingID)
)



insert into CreditCard
values
	('Card01', '123678', 11, 2024, 333),
	('Card02', '833477', 05, 2023, 993),
	('Card03', '654626', 02, 2025, 494),
	('Card04', '608703', 03, 2024, 921),
	('Card05', '107364', 08, 2024, 572),
	('Card06', '734584', 11, 2025, 825),
	('Card07', '876543', 01, 2026, 207),
	('Card08', '028724', 03, 2025, 758),
	('Card09', '978015', 06, 2024, 007),
	('Card10', '876540', 12, 2024, 803),
	('Card11', '396001', 10, 2024, 020)

insert into Client
values
	('User01', 'Ion', 'Popescu', 'M', 'ionpop@gmail.com', '0726456331', 'Card01'),
	('User02', 'Elena', 'Marinescu', 'F', 'mari.elena1993@yahoo.com', '0265411456','Card02'),
	('User03', 'Adrian', 'Astalus', 'M',  'astalus.adrian1703@gmail.com', '0754523136', 'Card04'),
	('User04', 'Teodora', 'Cojocaru', 'F', 'teoc@gmail.com', '0763646299', 'Card05'),
	('User05', 'Mariana', 'Popescu', 'F', 'mpopescu77@outlook.com', '0265411456', 'Card07'),
	('User06', 'Alexandru', 'David', 'M', 'dvd_alex@gmail.com', '0764656442', 'Card09'),
	('User07', 'Bianca', 'Jeler', 'F', 'just.a.random.email@gmail.com', '0583993672', 'Card08'),
	('User08', 'Antonie', 'Ionescu', 'M', 'ionescutony007@yahoo.com', '0646603363', 'Card10'),
	('User09', 'Jack', 'Potter', 'M', 'thePotterJack@icloud.com', '0765105063', 'Card03')
	-- violates referential integrity constraints?
	--('User10', 'Fname', 'Lname', 'FnameLname@email.com', '0987654321', 'Card04')

insert into Movie
values
	(1001, 'The Eternals', 'Chloe Zhao', 157, 6.5),
	(1002, 'Dune', 'Denis Villeneuve', 155, 8.2),
	(1003, 'James Bond: No Time to Die', 'Cary Joji Fukunaga', 163, 7.5),
	(1004, 'Avengers: Endgame', 'Russo Brothers', 181, 8.4),
	(1005, 'Justice League', 'Jack Snyder', 242, 8.1),
	(1006, 'Interstellar', 'Cristopher Nolan', 169, 8.6),
	(1007, 'Pulp Fiction', 'Quentin Tarantino', 154, 8.9),
	(1008, 'Tenet', 'Cristopher Nolan', 150, 7.4),
	(1009, '1917', 'Sam Mendes', 119, 8.3),
	(1010, 'The Hateful Eight', 'Quentin Tarantino', 168, 7.8),
	(1011, '12 Yeas a Slave', 'Steve McQueen', 134, 8.1),
	(1012, 'Ex Machina', 'Alex Garland', 108, 7.7)	

insert into Actor
values
	('Actor001', 'Oscar', 'Isaac', '1979-03-09', 'Guatemala'),
	('Actor002', 'Timothée', 'Chalamet', '1995-12-27', 'USA'),
	('Actor003', 'Angelina', 'Jolie', '1975-06-04', 'USA'),
	('Actor004', 'Idris', 'Elba', '1972-09-06', 'UK'),
	('Actor005', 'Salma', 'Hayek', '1966-09-02', 'Mexico'),
	('Actor006', 'Kit', 'Harrington', '1986-12-26', 'UK'),
	('Actor007', 'Daniel', 'Craig', '1968-03-02', 'UK'),
	('Actor008', 'Michael', 'Caine', '1933-03-14', 'UK'),
	('Actor009', 'Samuel L.', 'Jackson', '1948-12-21', 'USA')

insert into PlaysIn
values
	('Actor001', 1002),
	('Actor001', 1012),
	('Actor002', 1002),
	('Actor002', 1006),
	('Actor003', 1001),
	('Actor005', 1001),
	('Actor006', 1001),
	('Actor007', 1003),
	('Actor008', 1006),
	('Actor009', 1004),
	('Actor009', 1007),
	('Actor009', 1010)

insert into Cinema
values
	(901, 'Cinema City', 4, 'Cluj-Napoca'),
	(902, 'Cinema Mega',10, 'Cluj-Napoca'),
	(903, 'Cinema City', 5, 'Targu Mures'),
	(904, 'Cinema National', 5, 'Sibiu'),
	(905, 'Cinema City', 8, 'Brasov'),
	(906, 'Cinema Mega', 12, 'Bucuresti'),
	(907, 'Cinema City', 6, 'Iasi'),
	(908, 'Cinema City', 4, 'Alba Iulia'),
	(909, 'Cinema National', 7, 'Bucuresti')

insert into MovieRoom
values
	('R1-901', 60, '2D', 901),
	('R2-901', 40, '3D', 901),
	('R3-901', 35, '4D', 901),
	('R1-902', 80, '3D', 902),
	('R2-902', 100, '2D', 902),
	('R3-902', 70, '3D', 902),
	('R1-903', 55, '3D', 903),
	('R2-903', 50, '4D', 903),
	('R1-904', 60, '3D', 904),
	('R1-905', 100, '2D', 905),
	('R2-905', 120, '3D', 905),
	('R3-905', 90, '4D', 905),
	('R4-905', 110, '3D', 905),
	('R1-906', 150, '2D', 906),
	('R2-906', 130, '3D', 906),
	('R1-909', 80, '2D', 909),
	('R2-909', 70, '3D', 909)

insert into IsScreened
values
	(1001, 902),
	(1001, 903),
	(1001, 905),
	(1001, 906),
	(1001, 907),
	(1001, 908),
	(1002, 905),
	(1002, 906),
	(1002, 901),
	(1007, 904),
	(1007, 909),
	(1004, 902),
	(1004, 906),
	(1004, 908),
	(1008, 901),
	(1008, 903),
	(1008, 905),
	(1012, 905),
	(1012, 908)
 
insert into Screening
values
	(3001, '2021-11-05', 1001, 'R2-902'),
	(3002, '2021-11-05', 1004, 'R1-902'),
	(3003, '2021-11-05', 1001, 'R1-903'),
	(3004, '2021-11-06', 1001, 'R2-902'),
	(3005, '2021-11-10', 1012, 'R3-905'),
	(3006, '2021-11-07', 1012, 'R2-905'),
	(3007, '2021-11-07', 1012, 'R2-905'),
	(3008, '2021-11-08', 1008, 'R1-901')
	
insert into Booking
values
	(4001, 2, 'User01', 3001),
	(4002, 3, 'User01', 3005),
	(4003, 5, 'User07', 3008),
	(4004, 2, 'User08', 3001),
	(4005, 1, 'User03', 3004),
	(4006, 8, 'User04', 3006)


-- Update 1
update Cinema
set City = 'Bucuresti'
where RoomsNumber >= 10

-- Update 2
alter table Movie
add PopularNow varchar(5)

update Movie
set PopularNow = 'Yes'
where Title in ('The Eternals', 'Dune', 'James Bond: No Time to Die', 'Tenet', 'Pulp Fiction')

update Movie
set PopularNow = 'No'
where PopularNow is null

-- Update 3
update CreditCard
set ExpMonth = 05, ExpYear = 2025
where CardID = 'Card02' or CardNumber = '608703'


-- Delete 1
delete from Movie
where Duration between 100 and 120

-- Delete 2
delete from Client
where UserEmail like '%icloud.com'


		-- Queries with UNION[ALL] and OR

-- get the the movies that are longer than 160 minutes or are screened on in cinema 905
select M.MovieID
from Movie M
where M.Duration > 160
union
select S.movID
from IsScreened S
where S.cinID = 905

-- get the movies that are directed by Quentin Tarantino or Christopher Nolan
select M.Title
from Movie M
where M.Director = 'Quentin Tarantino' or M.Director = 'Cristopher Nolan'


		-- Queries with INTERSECT and IN

-- get the cinema IDs of cinemas  from Bucuresti that have 3D or 4D movie rooms
select MR.CID as Cinemas
from MovieRoom MR
where MR.RoomType in ('3D', '4D')
intersect
select C.CinemaID
from Cinema C
where C.City = 'Bucuresti'

-- same Query, but using IN this time
select MR.CID as Cinemas
from MovieRoom MR
where MR.RoomType in ('3D', '4D') and MR.CID in
	(select C.CinemaID
	from Cinema C
	where C.City = 'Bucuresti')


		-- Queries with EXCEPT and NOT IN

-- get the names of the Movies that are directed by Quentin Tarantino or Cristopher Nolan but have a rating smaller than 8.0
select M.Title
from Movie M
where M.Director in ('Quentin Tarantino', 'Cristopher Nolan')
except
select M.Title
from Movie M
where M.Rating > 8.0

-- get the maximum number of rooms from cinemas not from Bucuresti or Cluj Napoca
select MAX(C.RoomsNumber)
from Cinema C
where C.City not in ('Bucuresti', 'Cluj-Napoca')


		-- Queries with INNER JOIN, LEFT JOIN, RIGHT JOIN, FULL JOIN

-- list of Actors you can see in cinemas in Cluj-Napoca (INNER JOIN)
select A.ActorFName, A.ActorLName
from Actor A
inner  join PlaysIn PIn on A.ActorID = PIn.actID
inner join IsScreened SC on PIn.movID = SC.movID
inner join Cinema C on SC.cinID = C.CinemaID and C.City = 'Cluj-Napoca'

-- users email and card number whose card expire in 2025 (LEFT JOIN)
select C.UserID, C.UserEmail, CC.CardNumber
from Client C
left join CreditCard CC on CC.CardID = C.UserCard and CC.ExpYear = 2026

-- list of movies that are currently screened (RIGHT JOIN)
select distinct M.Title
from Movie M
right join IsScreened S
on M.MovieID = S.movID

-- list of each movie and the cinema where it is displayed (FULL JOIN)
select M.Title, C.CinemaName, C.City
from Movie M
full join IsScreened SC on M.MovieID = SC.movID
full join Cinema C on C.CinemaID = SC.cinID
order by C.City desc


		-- Queries with the IN operator and a subquery in the WHERE clause

-- get the id and title of the movies that show on cinemas that are not in Bucuresti or Cluj Napoca
select M.MovieID as ID, Title as MovieTitle
from Movie M
where M.MovieID in(
	select distinct S.movID
	from IsScreened S
	where S.cinID in 
	(	select C.CinemaID
		from Cinema C
		where C.City not in ('Bucuresti', 'Cluj-Napoca')))

-- get the Movies that have actors that are not from UK or USA
select M.Title
from Movie M, Actor A
where M.MovieID in(
	select P.movID
	from PlaysIn P
	where P.actID in(
		select A.ActorID
		from Actor A where A.ActorBirthCountry not in ('UK', 'USA')))


		-- Queries with the EXISTS operator and a subquery in the WHERE clause
-- Actors that do not play in any of the movies 
select A.ActorFName, A.ActorLName
from Actor A
where not exists(
	select P.actID
	from PlaysIn P
	where A.ActorID = P.actID)

-- Cinemas from the Cinema City franchise that have information about their Movie Rooms
select C.CinemaID, C.CinemaName, C.City
from Cinema C
where exists(
	select C.CinemaID
	from MovieRoom MR
	where C.CinemaID = MR.CID and C.CinemaName = 'Cinema City')


		-- Queries with a subquery in the FROM clause

-- top 3 biggest 2D rooms
select C.*, wr.RoomID
from (
	select top 3 *
	from MovieRoom MR
	where MR.RoomType = '2D'
	order by MR.RoomCapacity desc
	)wr, Cinema C
where wr.CID = C.CinemaID


select xz.UserFName, xz.UserLName, xz.PhoneNumber
from(
	select * 
	from Client C, CreditCard CC
	where CC.CardID = C.UserCard  and CC.ExpYear <= 2024
	)xz
where xz.UserEmail like '%@gmail.com'


		-- 4 queries with the GROUP BY clause, 3 of which also contain the HAVING clause; 
		-- 2 of the latter will also have a subquery in the HAVING clause; 

-- capacities of 3D and 2D rooms that are bigger than the biggest 4D room capacity
select MR.RoomCapacity as InitialCapacity, MR.RoomCapacity/2 as CovidRestrictedCapacity
from MovieRoom MR
where MR.RoomType in ('3D', '2D') and MR.RoomCapacity > (
	select max(M2.RoomCapacity)
	from MovieRoom M2
	where M2.RoomType = '4D')
group by MR.RoomCapacity


-- movies that are currently screened in at least 3 cinemas
select M.Title
from IsScreened S, Movie M, Cinema C
where S.cinID = C.CinemaID and S.movID = M.MovieID
group by M.Title
having count(*) >= 3

-- existing room capacities bigger than the average room capacity
select MR.RoomCapacity
from Cinema C, MovieRoom MR
where C.CinemaID = MR.CID
group by MR.RoomCapacity
having MR.RoomCapacity > (
	select avg(MR2.RoomCapacity)
	from MovieRoom MR2)

-- IDs of actors that appear in more movies than Angelina Jolie	
select A.ActorID
from Actor A, PlaysIn P
where A.ActorID = P.actID
group by A.ActorID
having count(*) > (
	select count(A2.ActorID)
	from Actor A2
	where A2.ActorFName = 'Angelina' and A2.ActorLName='Jolie')


		-- 4 queries using ANY and ALL to introduce a subquery in the WHERE clause (2 queries per operator); 
		--rewrite 2 of them with aggregation operators, and the other 2 with IN / [NOT] IN.

-- get top 3 movies that have a better rating than all of Denis Villeneuve's movies
select top 3 M1.Title, M1.Rating
from Movie M1
where M1.Rating > all (
	select M2.Rating
	from Movie M2
	where M2.Director = 'Denis Villeneuve')
order by M1.Rating desc

-- rewritten using aggregation operators
select top 3 M1.Title, M1.Rating
from Movie M1
where M1.Rating > (
	select max(M2.Rating)
	from Movie M2
	where M2.Director = 'Denis Villeneuve')
order by M1.Rating desc

-- get the 3D Movie Rooms that have a bigger capacity than any of the 2D Movie Rooms
select MR.RoomID, MR.RoomType
from MovieRoom MR
where MR.RoomType = '3D' and MR.RoomCapacity > any(
	select MR2.RoomCapacity
	from MovieRoom MR2
	where MR2.RoomType = '2D'
)

-- rewritten using aggregation operators
select MR.RoomID, MR.RoomType
from MovieRoom MR
where MR.RoomType = '3D' and MR.RoomCapacity > (
	select min(MR2.RoomCapacity)
	from MovieRoom MR2
	where MR2.RoomType = '2D')


-- get the Clients whose credit cards expire before 2025
select C.UserFName, C.UserLName
from Client C
where C.UserCard = any(
	select CC.CardID
	from CreditCard CC
	where CC.ExpYear = 2023 or CC.ExpYear = 2024)

-- rewritten using IN
select C.UserFName, C.UserLName
from Client C
where C.UserCard in (
	select CC.CardID
	from CreditCard CC
	where CC.ExpYear = 2023 or CC.ExpYear = 2024)

-- get the Cinema franchises that have rooms with less than 60 capacity
select distinct C.CinemaName
from Cinema C, MovieRoom MR
where C.CinemaID = MR.CID  and MR.RoomCapacity = any(
	select MR2.RoomCapacity
	from MovieRoom MR2
	where  MR2.RoomCapacity <= 60)


select distinct C.CinemaName
from Cinema C, MovieRoom MR
where C.CinemaID = MR.CID and MR.RoomCapacity not in(
	select MR2.RoomCapacity
	from MovieRoom MR2
	where MR2.RoomCapacity > 60)
go

-- ----- LAB 3 Assignment -----


create or alter proc uspCreateTable
as
	create table CriticsReview(
		CriticID varchar(15),
		CriticRating int,
		CriticComment varchar(200),
		ReviewsMovie int,
		constraint PK_Critic primary key (CriticID)
	)
	print N'create table procedure completed'
go


create or alter proc uspDeleteTable
as
	drop table CriticsReview
	print N'delete table procedure completed'
go


create or alter proc uspModifyColumnType
as
	alter table CriticsReview
	alter column CriticRating float
	print N'modify column type procedure completed'
go


create or alter proc uspRevertColumnType
as
	alter table CriticsReview
	alter column CriticRating int
	print N'revert column type procedure completed'
go


create or alter proc uspAddColumn
as
	alter table CriticsReview
	add WorksFor varchar(50)
	print N'add column procedure completed'
go


create or alter proc uspRemoveColumn
as
	alter table CriticsReview
	drop column WorksFor
	print N'remove column procedure completed'
go


create or alter proc uspAddForeignKey
as
	alter table CriticsReview
	add constraint FK_MovieID foreign key (ReviewsMovie) references Movie(MovieID)
	print N'add foreign key procedure completed'
go


create or alter proc uspRemoveForeignKey
as
	alter table CriticsReview
	drop FK_MovieID
	print N'remove foreign key procedure completed'
go


create or alter proc uspAddDefaultConstraint
as
	alter table CriticsReview
	add constraint defComment
	default 'Good Movie' for CriticComment
	print N'add default constraint procedure completed'
go


create or alter proc uspRemoveDefaultConstraint
as
	alter table CriticsReview
	drop defComment
	print N'remove default constraint procedure completed'
go


create or alter proc uspAddCandidateKey
as
	alter table CriticsReview
	add constraint UK_CriticReviews unique(CriticID, ReviewsMovie)
	print N'add candidate key procedure completed'
go


create or alter proc uspDropCandidateKey
as
	alter table CriticsReview
	drop UK_CriticReviews
	print N'drop candidate key procedure completed'
go


create or alter proc uspAddPrimaryKey
as
	alter table CriticsReview
	add constraint PK_Critic primary key (CriticID)
	print N'add primary key procedure completed'
go


create or alter proc uspDropPrimaryKey
as
	alter table CriticsReview
	drop PK_Critic
	print N'remove primary key procedure completed'
go

-- table that stores the current Version of the database (starting at 1)
create table VersionTracker(
	currentVersion int
)
insert into VersionTracker values(1)
go

drop table VersionTracker


create table VersionProcedures(
	VFrom int,
	VTo int,
	primary key(VFrom, VTo),
	ProcName varchar(100)
)
insert into VersionProcedures
values
	(1,2,'uspCreateTable'),
	(2,1,'uspDeleteTable'),
	(2,3,'uspModifyColumnType'),
	(3,2,'uspRevertColumnType'),
	(3,4,'uspAddColumn'),
	(4,3,'uspRemoveColumn'),
	(4,5,'uspAddForeignKey'),
	(5,4,'uspRemoveForeignKey'),
	(5,6,'uspAddDefaultConstraint'),
	(6,5,'uspRemoveDefaultConstraint'),
	(6,7,'uspAddCandidateKey'),
	(7,6,'uspDropCandidateKey'),
	(7,8,'uspDropPrimaryKey'),
	(8,7,'uspAddPrimaryKey')

select * from VersionProcedures

go


create or alter procedure uspSelectVersion(@version int)
as
	declare @currentVer int -- int that stores the current version
	declare @proc varchar(100) -- varchar used to get the name of a procedure
	
	-- we get the current version
	select @currentVer = VT.currentVersion
	from VersionTracker VT

	if @version > (select max(VP.VTo) from VersionProcedures VP)
		raiserror('Invalid version',10, 1)

	-- case where we have to decrease the version
	while @currentVer > @version begin

		-- get the procedure's name
		select @proc = VP.ProcName
		from VersionProcedures VP
		where VP.VFrom = @currentVer and VP.VTo = @currentVer-1

		-- execute the procedure and decrease the current version
		exec(@proc)
		set @currentVer = @currentVer - 1
	end


	-- case where we have to increase the version
	while @currentVer < @version begin
		
		-- get the procedure's name
		select @proc = VP.ProcName
		from VersionProcedures VP
		where VP.VFrom = @currentVer and VP.VTo = @currentVer+1

		-- execute the procedure and increase the current version
		exec(@proc)
		set @currentVer = @currentVer + 1
	end

	-- update the version stored in the VersionTracker
	update VersionTracker
	set currentVersion = @version
go


create or alter procedure uspResetToOne as
	execute uspDeleteTable
	update VersionTracker
	set currentVersion = 1
go


execute uspSelectVersion 1
select * from VersionTracker

select * from CriticsReview
go

---------- LAB 4 ---------- 

if exists (select * from dbo.sysobjects where id = object_id(N'[FK_TestRunTables_Tables]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)

ALTER TABLE [TestRunTables] DROP CONSTRAINT FK_TestRunTables_Tables

GO


if exists (select * from dbo.sysobjects where id = object_id(N'[FK_TestTables_Tables]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)

ALTER TABLE [TestTables] DROP CONSTRAINT FK_TestTables_Tables

GO


if exists (select * from dbo.sysobjects where id = object_id(N'[FK_TestRunTables_TestRuns]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)

ALTER TABLE [TestRunTables] DROP CONSTRAINT FK_TestRunTables_TestRuns

GO


if exists (select * from dbo.sysobjects where id = object_id(N'[FK_TestRunViews_TestRuns]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)

ALTER TABLE [TestRunViews] DROP CONSTRAINT FK_TestRunViews_TestRuns

GO


if exists (select * from dbo.sysobjects where id = object_id(N'[FK_TestTables_Tests]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)

ALTER TABLE [TestTables] DROP CONSTRAINT FK_TestTables_Tests

GO


if exists (select * from dbo.sysobjects where id = object_id(N'[FK_TestViews_Tests]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)

ALTER TABLE [TestViews] DROP CONSTRAINT FK_TestViews_Tests

GO


if exists (select * from dbo.sysobjects where id = object_id(N'[FK_TestRunViews_Views]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)

ALTER TABLE [TestRunViews] DROP CONSTRAINT FK_TestRunViews_Views

GO


if exists (select * from dbo.sysobjects where id = object_id(N'[FK_TestViews_Views]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)

ALTER TABLE [TestViews] DROP CONSTRAINT FK_TestViews_Views

GO


if exists (select * from dbo.sysobjects where id = object_id(N'[Tables]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)

drop table [Tables]

GO


if exists (select * from dbo.sysobjects where id = object_id(N'[TestRunTables]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)

drop table [TestRunTables]

GO


if exists (select * from dbo.sysobjects where id = object_id(N'[TestRunViews]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)

drop table [TestRunViews]

GO


if exists (select * from dbo.sysobjects where id = object_id(N'[TestRuns]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)

drop table [TestRuns]

GO


if exists (select * from dbo.sysobjects where id = object_id(N'[TestTables]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)

drop table [TestTables]

GO


if exists (select * from dbo.sysobjects where id = object_id(N'[TestViews]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)

drop table [TestViews]

GO


if exists (select * from dbo.sysobjects where id = object_id(N'[Tests]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)

drop table [Tests]

GO


if exists (select * from dbo.sysobjects where id = object_id(N'[Views]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)

drop table [Views]

GO


CREATE TABLE [Tables] (

	[TableID] [int] IDENTITY (1, 1) NOT NULL ,

	[Name] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL 

) ON [PRIMARY]

GO


CREATE TABLE [TestRunTables] (

	[TestRunID] [int] NOT NULL ,

	[TableID] [int] NOT NULL ,

	[StartAt] [datetime] NOT NULL ,

	[EndAt] [datetime] NOT NULL 

) ON [PRIMARY]

GO


CREATE TABLE [TestRunViews] (

	[TestRunID] [int] NOT NULL ,

	[ViewID] [int] NOT NULL ,

	[StartAt] [datetime] NOT NULL ,

	[EndAt] [datetime] NOT NULL 

) ON [PRIMARY]

GO


CREATE TABLE [TestRuns] (

	[TestRunID] [int] IDENTITY (1, 1) NOT NULL ,

	[Description] [nvarchar] (2000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,

	[StartAt] [datetime] NULL ,

	[EndAt] [datetime] NULL 

) ON [PRIMARY]

GO


CREATE TABLE [TestTables] (

	[TestID] [int] NOT NULL ,

	[TableID] [int] NOT NULL ,

	[NoOfRows] [int] NOT NULL ,

	[Position] [int] NOT NULL 

) ON [PRIMARY]

GO


CREATE TABLE [TestViews] (

	[TestID] [int] NOT NULL ,

	[ViewID] [int] NOT NULL 

) ON [PRIMARY]

GO


CREATE TABLE [Tests] (

	[TestID] [int] IDENTITY (1, 1) NOT NULL ,

	[Name] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL 

) ON [PRIMARY]

GO


CREATE TABLE [Views] (

	[ViewID] [int] IDENTITY (1, 1) NOT NULL ,

	[Name] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL 

) ON [PRIMARY]

GO


ALTER TABLE [Tables] WITH NOCHECK ADD 

	CONSTRAINT [PK_Tables] PRIMARY KEY  CLUSTERED 

	(

		[TableID]

	)  ON [PRIMARY] 

GO


ALTER TABLE [TestRunTables] WITH NOCHECK ADD 

	CONSTRAINT [PK_TestRunTables] PRIMARY KEY  CLUSTERED 

	(

		[TestRunID],

		[TableID]

	)  ON [PRIMARY] 

GO


ALTER TABLE [TestRunViews] WITH NOCHECK ADD 

	CONSTRAINT [PK_TestRunViews] PRIMARY KEY  CLUSTERED 

	(

		[TestRunID],

		[ViewID]

	)  ON [PRIMARY] 

GO


ALTER TABLE [TestRuns] WITH NOCHECK ADD 

	CONSTRAINT [PK_TestRuns] PRIMARY KEY  CLUSTERED 

	(

		[TestRunID]

	)  ON [PRIMARY] 

GO


ALTER TABLE [TestTables] WITH NOCHECK ADD 

	CONSTRAINT [PK_TestTables] PRIMARY KEY  CLUSTERED 

	(

		[TestID],

		[TableID]

	)  ON [PRIMARY] 

GO


ALTER TABLE [TestViews] WITH NOCHECK ADD 

	CONSTRAINT [PK_TestViews] PRIMARY KEY  CLUSTERED 

	(

		[TestID],

		[ViewID]

	)  ON [PRIMARY] 

GO


ALTER TABLE [Tests] WITH NOCHECK ADD 

	CONSTRAINT [PK_Tests] PRIMARY KEY  CLUSTERED 

	(

		[TestID]

	)  ON [PRIMARY] 

GO


ALTER TABLE [Views] WITH NOCHECK ADD 

	CONSTRAINT [PK_Views] PRIMARY KEY  CLUSTERED 

	(

		[ViewID]

	)  ON [PRIMARY] 

GO


ALTER TABLE [TestRunTables] ADD 

	CONSTRAINT [FK_TestRunTables_Tables] FOREIGN KEY 

	(

		[TableID]

	) REFERENCES [Tables] (

		[TableID]

	) ON DELETE CASCADE  ON UPDATE CASCADE ,

	CONSTRAINT [FK_TestRunTables_TestRuns] FOREIGN KEY 

	(

		[TestRunID]

	) REFERENCES [TestRuns] (

		[TestRunID]

	) ON DELETE CASCADE  ON UPDATE CASCADE 

GO


ALTER TABLE [TestRunViews] ADD 

	CONSTRAINT [FK_TestRunViews_TestRuns] FOREIGN KEY 

	(

		[TestRunID]

	) REFERENCES [TestRuns] (

		[TestRunID]

	) ON DELETE CASCADE  ON UPDATE CASCADE ,

	CONSTRAINT [FK_TestRunViews_Views] FOREIGN KEY 

	(

		[ViewID]

	) REFERENCES [Views] (

		[ViewID]

	) ON DELETE CASCADE  ON UPDATE CASCADE 

GO


ALTER TABLE [TestTables] ADD 

	CONSTRAINT [FK_TestTables_Tables] FOREIGN KEY 

	(

		[TableID]

	) REFERENCES [Tables] (

		[TableID]

	) ON DELETE CASCADE  ON UPDATE CASCADE ,

	CONSTRAINT [FK_TestTables_Tests] FOREIGN KEY 

	(

		[TestID]

	) REFERENCES [Tests] (

		[TestID]

	) ON DELETE CASCADE  ON UPDATE CASCADE 

GO


ALTER TABLE [TestViews] ADD 

	CONSTRAINT [FK_TestViews_Tests] FOREIGN KEY 

	(

		[TestID]

	) REFERENCES [Tests] (

		[TestID]

	),

	CONSTRAINT [FK_TestViews_Views] FOREIGN KEY 

	(

		[ViewID]

	) REFERENCES [Views] (

		[ViewID]

	)

GO



delete from Tests
delete from Views
delete from Tables
delete from TestTables
delete from TestViews
delete from TestRunTables
delete from TestRunViews
delete from TestRuns
go


create or alter procedure addToTables (@tableName varchar(50)) as
	if @tableName in (select Name from Tables) begin
		print 'Table already added in Tables'
		return
	end
    if @tableName not in (select TABLE_NAME from INFORMATION_SCHEMA.TABLES) begin
        print 'Table does not exist in the DB'
        return
    end
    insert into Tables (Name) values (@tableName)
go

create or alter procedure addToViews (@viewName varchar(50)) as
	if @viewName in (select Name from Views) begin
		print 'View already added in Views'
		return
	end
	if @viewName not in (select TABLE_NAME from INFORMATION_SCHEMA.VIEWS) begin
		print 'This view does not exist in the DB'
		return
	end
	insert into Views (Name) values (@viewName)
go


create or alter procedure addToTests (@testName varchar(50)) as
	if @testName in (select Name from Tests) begin
		print 'Test already added in Tests'
		return
	end
	insert into Tests (Name) values (@testName)
go

--- connecting a table to a test
create or alter procedure TableToTest (@tableName varchar(50), @testName varchar(50), @insertRows int, @index int) as
	--print 'Add table to test'
	-- checking if the table is valid
	if @tableName not in (select Name from Tables) begin
		raiserror('Non existent table', 1, 1)
		return
	end
	-- checking if the test is valid
	if @testName not in (select Name from Tests) begin
		raiserror('Non existent test run', 1, 1)
		return
	end
	-- checking if the index is valid
	if exists(
		select *
		from TestTables TT inner join Tests T on TT.TestID = T.TestID
		where T.Name = @testName and Position = @index
	) begin
		raiserror('Invalid position', 1, 1)
		return
	end
	-- actual connect
	insert into TestTables (TestID, TableID, NoOfRows, Position) values(
		(select T.TestID from Tests T where T.Name = @testName),
		(select T2.TableID from Tables T2 where T2.Name = @tableName),
		@insertRows,
		@index
	)
go

--- connecting a view to a test
create or alter procedure ViewToTest(@viewName varchar(50), @testName varchar(50)) as
	--print 'Add view to test'
	-- checking if the view is valid
	if @viewName not in (select Name from Views) begin
		raiserror('Non existent view', 1, 1)
		return
	end
	-- checking if the test is valid
	if @testName not in (select Name from Tests) begin
		raiserror('Non existent test run', 1, 1)
		return
	end
	-- actual connect
	insert into TestViews (TestID, ViewID) values (
		(select T.TestID from Tests T where T.Name = @testName),
		(select V.ViewID from Views V where V.Name = @viewName)
	)
go

--- creating a random string
create or alter procedure randomString @str varchar(20) output as
	declare @length as int
	declare @allChars as varchar(55)
	declare @allCharsLen as int
	set @allChars = 'abcdefghijklmnopqrstuvxyzABCDEFGHIJKLMNOPQRSTUVXYZ'
	set @allCharsLen = LEN(@allChars)
	set @length = FLOOR(RAND() * (10 - 1) + 10)
	set @str = ''
	while @length > 0 begin
		set @str = @str + SUBSTRING(@allChars, CONVERT(int, RAND() * @allCharsLen) + 1, 1)
		set @length = @length - 1
	end
go


--- populate a table with a nr of rows
create or alter procedure populateTable(@tableName varchar(50), @nrRows int) as
begin
	-- getting each column's name and data type for the table
	declare columns_cursor scroll cursor for
		select COLUMN_NAME, DATA_TYPE
		from INFORMATION_SCHEMA.COLUMNS
		where TABLE_NAME = @tableName

	declare @insertStatement as varchar(max)
	declare @colName as varchar(50)
	declare @dataType as varchar(10)
	declare @integer as int
	declare @string as varchar(50)

	declare @hasPk as int

	open columns_cursor
	while @nrRows > 0 begin
		set @hasPk = 0
		set @insertStatement = 'INSERT INTO ' + @tableName + ' VALUES('
		fetch first from columns_cursor into @colName, @dataType
		while @@FETCH_STATUS = 0 begin
			
			-- check if column is PK
			-- to make things easier, PK will always be of type int, and we can use @nrRows for it
			if exists(select *
				from INFORMATION_SCHEMA.CONSTRAINT_COLUMN_USAGE c
				where c.CONSTRAINT_NAME like 'PK%' and @colName = c.COLUMN_NAME and @tableName = c.TABLE_NAME
			) begin
				set @hasPk = 1
				set @insertStatement = @insertStatement + CAST(@nrRows as varchar(10)) + ','
			end

			-- check if column is FK
			else if exists(select * 
				from INFORMATION_SCHEMA.CONSTRAINT_COLUMN_USAGE c
				where c.CONSTRAINT_NAME like 'FK%' and @colName = c.COLUMN_NAME and @tableName = c.TABLE_NAME
			) begin

				-- find the referenced table
				declare @referencedTable as varchar(50)
				select @referencedTable = [name]
				from sys.tables T
				where T.object_id = (
					select referenced_object_id
					from sys.foreign_keys FK
					where FK.name = (
						select C.CONSTRAINT_NAME
						from INFORMATION_SCHEMA.CONSTRAINT_COLUMN_USAGE C
						where @colName = C.COLUMN_NAME and C.TABLE_NAME = @tableName and C.CONSTRAINT_NAME like 'FK%'
					)
				)

				---- GET THE COLUMN IT REFERENCES ? ? ? ?
				declare @referencedColumn as varchar(50)
				set @referencedColumn = (select KCU.COLUMN_NAME from INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE TU
				inner join INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS RC on TU.CONSTRAINT_NAME = rc.CONSTRAINT_NAME
				inner join INFORMATION_SCHEMA.KEY_COLUMN_USAGE KCU on RC.UNIQUE_CONSTRAINT_NAME = KCU.CONSTRAINT_NAME
				where TU.TABLE_NAME = @tableName)


				if @dataType = 'int' begin
					declare @getReferenceMaxID as nvarchar(100)
					set @getReferenceMaxID = N'select @maxID = MAX(' + @referencedColumn + ') from ' + @referencedTable
					declare @maxID as int
					exec sp_executesql @getReferenceMaxID, N'@maxID int output', @maxID OUTPUT
					set @integer = FLOOR(RAND() * (@maxID) + 1)
					set @insertStatement = @insertStatement + CAST(@integer as varchar(10)) + ','
				end

				else if @dataType = 'varchar' begin
					declare @getReferenceString as nvarchar(200)
					set @getReferenceString = N'select top 1 @string = [' + @referencedColumn + '] from ' + @referencedTable + ' t where t.' + @referencedColumn + ' = t.' + @referencedColumn + 'order by newid()'
					exec sp_executesql @getReferenceString, N'@string varchar(50) output', @string output
					set @insertStatement = @insertStatement + '''' + @string + ''','
				end
			end
			
			
			-- column not a PK nor a FK
			else begin
				-- column is an int
				if @dataType = 'int' begin
					set @integer = FLOOR(RAND() * (3001-1) + 1)
					set @insertStatement = @insertStatement + CAST(@integer as varchar(10)) + ','
				end
				-- column is varchar
				else if @dataType = 'varchar' begin
					exec randomString @str = @string output
					set @insertStatement = @insertStatement + '''' + @string + '''' + ','
				end
			end
			
			
			
			fetch next from columns_cursor into @colName, @dataType
		end
		set @insertStatement = LEFT(@insertStatement, len(@insertStatement)-1) + ')'
		exec (@insertStatement)
		--select @insertStatement
		set @nrRows = @nrRows - 1
	end
	
	close columns_cursor
	deallocate columns_cursor
end
go


-- deleting the contents of a table
create or alter procedure clearTable(@tableName varchar(50)) as begin
	exec('delete from ' + @tableName)
end
go

--- run the test
create or alter procedure runTest(@testName varchar(50)) as
	-- check if we have the test
	if @testName not in (select Name from Tests) begin
		raiserror('Invalid test.', 1, 1)
		return
	end

	declare @table varchar(50)
	declare @rows int
	declare @index int
	declare @view varchar(50)
	declare @viewCommand varchar(100)
	declare @startTime datetime2
	declare @endTime datetime2

	-- get the test id
	declare @tID int
	select @tID = T.TestID from Tests T where T.Name = @testName

	-- set a new test run ID
	declare @tRunID int
	set @tRunID = (select max(TR.TestRunID)+1 from TestRuns TR)
	if @tRunID is null
		set @tRunID = 0

	-- create a cursor for the tables
	declare tables_cursor cursor scroll for
		select T.Name, TT.NoOfRows, TT.Position
		from Tables T inner join TestTables TT on T.TableID = TT.TableID
		where TT.TestID = @tID
		order by TT.Position

	-- create a cursor for the views
	declare views_cursor cursor scroll for
		select V.Name
		from Views V join TestViews TV on V.ViewID = TV.ViewID
		where TV.TestID = @tID

	-- clear my tables
	open tables_cursor
	fetch last from tables_cursor into @table, @rows, @index
	while @@FETCH_STATUS = 0 begin
		exec clearTable @tableName = @table
		fetch prior from tables_cursor into @table, @rows, @index
	end
	close tables_cursor

	-- start test timing
	declare @TestStartTime datetime2
	set @TestStartTime = SYSDATETIME()

	-- add the TestRun
	set identity_insert TestRuns ON
	insert into TestRuns(TestRunID, Description, StartAt) values (@tRunID, 'Result for: ' + @testName, @TestStartTime)
	set identity_insert TestRuns OFF

	-- record the insert
	open tables_cursor
	fetch tables_cursor into @table, @rows, @index
	while @@FETCH_STATUS = 0 begin
		set @startTime = SYSDATETIME()
		exec populateTable @tableName = @table, @nrRows = @rows
		set @endTime = SYSDATETIME()
		insert into TestRunTables(TestRunID, TableID, StartAt, EndAt) values (@tRunID, (select TableID from Tables where Name=@table), @startTime, @endTime)
		fetch tables_cursor into @table, @rows, @index
	end
	close tables_cursor
	deallocate tables_cursor

	-- record the views
	open views_cursor
	fetch views_cursor into @view
	while @@FETCH_STATUS = 0 begin
		set @viewCommand = 'select * from ' + @view
		set @startTime = SYSDATETIME()
		exec (@viewCommand)
		set @endTime = SYSDATETIME()
		insert into TestRunViews(TestRunID, ViewID, StartAt, EndAt) values (@tRunID, (select ViewID from Views where Name=@view), @startTime, @endTime)
		fetch views_cursor into @view
	end
	close views_cursor
	deallocate views_cursor

	update TestRuns
	set EndAt = SYSDATETIME()
	where TestRunID = @tRunID
go




-------- test 1 ----------------
create or alter view getCardsOlderThan2000 as
	select CC.CardNumber, cast(ExpMonth as varchar(10)) + '/' + cast(ExpYear as varchar(10)) as ExpDate
	from CreditCard CC
	where CC.ExpYear > 2000
go

exec addToTables 'CreditCard'
exec addToViews 'getCardsOlderThan2000'
exec addToTests 'test1'
exec TableToTest 'CreditCard', 'test1', 2000, 1
exec ViewToTest 'getCardsOlderThan2000', 'test1'
exec runTest 'test1'


select * from CreditCard
select * from getCardsOlderThan2000
select * from TestRuns



------------- test 2 ---------------
create table MovieReview(
	ReviewID int primary key,
	ReviewedMovie int foreign key references Movie(MovieID),
	ReviewerName varchar(50),
	ActualReview varchar(50),
	ActualGrade int
)

alter table Movie
	drop column Rating

go
create or alter view getMovieWithReview as
	select M.Title, MR.ActualGrade
	from Movie M inner Join MovieReview MR on M.MovieID = MR.ReviewedMovie
	where MR.ActualGrade > 100
go

exec addToTables 'Movie'
exec addToTables 'MovieReview'
exec addToViews 'getMovieWIthReview'
exec addToTests 'test2'
exec TableToTest 'Movie', 'test2', 2500, 1
exec TableToTest 'MovieReview', 'test2', 1700, 2
exec ViewToTest 'getMovieWithReview', 'test2'
exec runTest 'test2'

select * from Movie
select * from MovieReview
select * from TestRuns
select * from TestRunTables
select * from getMovieWithReview



--------- test 3 -------------
create table ActorByIntID(
	ActorID int primary key,
	ActorFName varchar(30),
	ActorLName varchar(30),
	ActorBirthCountry varchar(100)
)

create table ActorOpinion(
	AOID int primary key,
	TheActor int foreign key references ActorByIntID(ActorID),
	ActorReview varchar(100),
	ActorRating int
)


go
create or alter view AvgActorRating as
	select A.ActorID, AVG(AO.ActorRating) as AvgRating
	from ActorByIntID A inner join ActorOpinion AO on A.ActorID = AO.TheActor
	group by A.ActorID
go

exec addToTables 'ActorByIntID'
exec addToTables 'ActorOpinion'
exec addToViews 'AvgActorRating'
exec addToTests 'test3'
exec TableToTest 'ActorByIntID', 'test3', 2500, 1
exec TableToTest 'ActorOpinion', 'test3', 2000, 2
exec ViewToTest ' AvgActorRating', 'test3'
exec runTest 'test3'


select * from ActorByIntID
select * from ActorOpinion
select * from AvgActorRating
select * from TestRuns




------------------------ LAB 5 ---------------

create table Ta(
	aid int primary key,
	a2 int unique,
	ax int
)
drop table Ta

create table Tb(
	bid int primary key,
	b2 int,
	bx int
)
drop table Tb

create table Tc(
	cid int primary key,
	aid int foreign key references Ta(aid),
	bid int foreign key references Tb(bid)
)
drop table Tc

go
create or alter procedure initializeTa(@rowCount int) as
begin
	delete from Ta
	declare @uniqueVal int
	declare @axVal int
	set @uniqueVal = 2
	while @rowCount > 0 begin
		set @axVal = RAND()*(1000-10) + 10  -- random number between 10 and 1000
		insert into Ta values (@rowCount, @uniqueVal, @axVal)
		set @uniqueVal = @uniqueVal + 2
		set @rowCount = @rowCount - 1
	end
end
exec initializeTa 10000
select * from Ta


go 
create or alter procedure initializeTb(@rowCount int) as
begin
	delete from Tb
	declare @b2Val int
	declare @bxVal int
	while @rowCount > 0 begin
		set @b2Val = RAND()*(2000-1) + 1 -- random number between 1 and 2000
		set @bxVal = RAND()*(10000-1) + 1 -- random number between 1 and 10.000
		insert into Tb values (@rowCount, @b2Val, @bxVal)
		set @rowCount = @rowCount - 1
	end
end
exec initializeTb 13000
select * from Tb


go
create or alter procedure initializeTc(@rowCount int) as
begin
delete from Tc
	declare @valueFromTa int
	declare @valueFromTb int
	while @rowCount > 0 begin
		set @valueFromTa = (select top 1 aid from Ta order by NEWID())
		set @valueFromTb = (select top 1 bid from Tb order by NEWID())
		insert into Tc values (@rowCount, @valueFromTa, @valueFromTb)
		set @rowCount = @rowCount - 1
	end
end
exec initializeTc 5000
select * from Tc


-- a)
create nonclustered index indexOnTa on Ta(ax)
drop index indexOnTa on Ta

select * from Ta order by aid		-- Clustered Index Scan
select * from Ta where aid < 100	-- Clustered Index Seek
select ax from Ta order by ax		-- Nonclustered Index Scan (w/ indexOnTa)
select a2 from Ta where a2 = 140	-- Nonclustered Index Seek (without the need of indexOnTa)
select ax from Ta where ax = 140	-- Nonclustered Index Seek (indexOnTa needed)
select ax from Ta where a2 = 140	-- Key Lookup

-- b)
select * from Tb where b2 = 101		-- Clustered Index Scan (No View); Time: 0.003502
create nonclustered index indexOnTb on Tb(b2) include (bid, bx)
drop index indexOnTb on Tb
select * from Tb where b2 = 101		-- Nonclustered Index Seek (With indexOnTb); Time: 0.0032831

-- c)
-- INDEXES
create nonclustered index indexOnTa on Ta(ax)
drop index indexOnTa on Ta
create nonclustered index indexOnTb on Tb(b2) include (bid, bx)
drop index indexOnTb on Tb

go
create or alter view myView as
	select top 100 Tb.b2, Ta.ax
	from Tc join Ta on Tc.aid = Ta.aid join Tb on Tc.bid = Tb.bid
	where Tb.b2 > 1500 and Ta.ax < 100


select * from myView	-- 0.167125 without Indexes
						-- 0.133582 with Indexes