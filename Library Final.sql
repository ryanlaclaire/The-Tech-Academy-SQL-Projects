create database Library

use Library
go

create table LibraryBranch (
	BranchID int primary key not null identity(1, 1),
	BranchName varchar(50) not null,
	Address varchar(225)
);

create  table Publisher (
	PublisherName varchar(225) primary key not null,
	Address varchar(225) not null,
	Phone varchar(50) not null
);

create table Books (
	BookID int primary key not null identity (1000, 1),
	Title varchar(225),
	PublisherName varchar(225) not null constraint fk_PubName foreign key references Publisher(PublisherName) on update cascade on delete cascade
);

create table Borrower (
	CardNo int primary key not null identity(100, 1),
	Name varchar(100) not null,
	Address varchar(225) not null,
	Phone varchar(50) not null
);

create table BookCopies (
	BookID int not null constraint fk_BookID foreign key references Books(BookID) on update cascade on delete cascade,
	BranchID int not null constraint fk_BranchID foreign key references LibraryBranch(BranchID) on update cascade on delete cascade,
	NumberOfCopies int not null
);

create table BookLoans (
	BookID int not null constraint fk_BookID2 foreign key references Books(BookID) on update cascade on delete cascade,
	BranchID int not null constraint fk_BranchID2 foreign key references LibraryBranch(BranchID) on update cascade on delete cascade,
	CardNo int not null constraint fk_CardNo foreign key references Borrower(CardNo) on update cascade on delete cascade,
	DateOut date,
	DateDue date
);

create table BookAuthors (
	BookID int not null constraint fk_BookID3 foreign key references Books(BookID) on update cascade on delete cascade,
	AuthorName varchar(225) not null
);

insert into LibraryBranch
	values
	('Central', '900 N Ashley Dr, Tampa, FL 33602'),
	('Sharpstown', '8916 N Blvd, Tampa, FL 33604'),
	('Town N Country', '7606 Paula Dr #120, Tampa, FL 33615'),
	('Port Tampa', '4902 W Commerce St, Tampa, FL 33616')
;

insert into Publisher
	values
	('Doubleday Publishing', '1745 Broadway, New York, NY 10019', '(212) 940-7390'),
	('Grant Publishing', 'PO Box 187 19 Surrey Lane Hampton Falls, NH 03844', '(603) 778-7191'),
	('Ballantine Books', '1745 Broadway, New York, NY 10019', '212-782-9000'),
	('Del Rey Books', '1745 Broadway, New York, NY 10019', '212-782-9000'),
	('HarperCollins Publishers', '195 Broadway, New York, NY 10007', '212-207-7000'),
	('Penguin Random House', '1745 Broadway, New York, NY 10019', '212-782-9000')
;

insert into Books
	values
	('Pet Semetary', 'Doubleday Publishing'),
	('The Gunslinger', 'Grant Publishing'),
	('A Spell for Chameleon', 'Ballantine Books'),
	('On a Pale Horse', 'Del Rey Books'),
	('Bearing an Hour Glass', 'Del Rey Books'),
	('The Reckoning', 'Penguin Random House'),
	('The Whistler', 'Penguin Random House'),
	('The Sword of Shannara', 'Penguin Random House'),
	('The Elfstones of Shannara', 'Penguin Random House'),
	('Dead Until Dark', 'Penguin Random House'),
	('Living Dead in Dallas', 'Penguin Random House'),
	('Dead Witch Walking', 'HarperCollins Publishers'),
	('The Good, The Bad, and The Undead', 'HarperCollins Publishers'),
	('The Ruins of Gorlan', 'Penguin Random House'),
	('The Burning Bridge', 'Penguin Random House'),
	('The Lion, The Witch and The Wardrobe', 'HarperCollins Publishers'),
	('Prince Caspian', 'HarperCollins Publishers'),
	('Lord Fouls Bane', 'HarperCollins Publishers'),
	('The Illearth War', 'HarperCollins Publishers'),
	('The Power that Preserves', 'HarperCollins Publishers'),
	('The Lost Tribe', 'Doubleday Publishing')
;

insert into BookAuthors
	values
	(1001, 'Stephen King'),
	(1002, 'Stephen King'),
	(1003, 'Piers Anthony'),
	(1004, 'Piers Anthony'),
	(1005, 'Piers Anthony'),
	(1006, 'John Grisham'),
	(1007, 'John Grisham'),
	(1008, 'Terry Brooks'),
	(1009, 'Terry Brooks'),
	(1010, 'Charlaine Harris'),
	(1011, 'Charlaine Harris'),
	(1012, 'Kim Harrison'),
	(1013, 'Kim Harrison'),
	(1014, 'John Flanagan'),
	(1015, 'John Flanagan'),
	(1016, 'C.S. Lewis'),
	(1017, 'C.S. Lewis'),
	(1018, 'Stephen R. Donaldson'),
	(1019, 'Stephen R. Donaldson'),
	(1020, 'Stephen R. Donaldson'),
	(1021, 'John Smith')
;

insert into Borrower
	values 
	('John Doe','385 Stephens St, Tampa, FL 33980','727-325-9865'),
	('Adam Sandler','4877 Peacock Lane, Tampa, FL 33989','727-644-5123'),
	('Mary Shelley','867 Huntington Ave, Tampa, FL 33635','727-548-7315'),
	('George Washington','253 Zenith Cir, Tampa, FL 33635','727-645-6589'),
	('Colonel Sanders','748 Steam Rd, Tampa, FL 33898','727-653-5142'),
	('George Jefferson','384 Long Blvd, Tampa, FL 33901','727-644-6521'),
	('Fred Flintstone','9390 Sheldon Ave, Tampa, FL 33909','727-314-7727'),
	('Laura Croft','5724 Lost Lane, Tampa, FL 33707','727-325-6985'),
	('Calvin Klein','978 Johnson St, Tampa, FL 33980','727-325-1453'),
	('Harry Potter','14 Privet Dr, Tampa, FL 33989','727-644-5874'),
	('Jack Reacher','69 Jackson Ave, Tampa, FL 33635','727-548-4659')
;

insert into BookCopies
	values
	(1001, 1, 2),
	(1002, 1, 2),
	(1003, 1, 2),
	(1004, 1, 3),
	(1005, 1, 3),
	(1006, 1, 2),
	(1007, 1, 2),
	(1008, 1, 3),
	(1009, 1, 3),
	(1010, 1, 4),
	(1011, 1, 4),
	(1012, 1, 3),
	(1013, 1, 3),
	(1014, 1, 3),
	(1015, 1, 3),
	(1016, 1, 2),
	(1017, 1, 2),
	(1018, 1, 2),
	(1019, 1, 3),
	(1020, 1, 3),
	(1021, 1, 3),
	(1001, 2, 2),
	(1002, 2, 2),
	(1006, 2, 3),
	(1007, 2, 3),
	(1012, 2, 2),
	(1013, 2, 2),
	(1014, 2, 3),
	(1015, 2, 3),
	(1016, 2, 4),
	(1021, 2, 4),
	(1001, 3, 2),
	(1002, 3, 2),
	(1004, 3, 3),
	(1005, 3, 3),
	(1006, 3, 2),
	(1007, 3, 2),
	(1008, 3, 3),
	(1009, 3, 3),
	(1016, 3, 4),
	(1017, 3, 4),
	(1004, 4, 2),
	(1005, 4, 2),
	(1008, 4, 3),
	(1009, 4, 3),
	(1011, 4, 2),
	(1012, 4, 2),
	(1018, 4, 3),
	(1019, 4, 3),
	(1020, 4, 4),
	(1021, 4, 4)
;

insert into BookLoans
	values
	(1001, 1, 100, '2018-11-02', '2018-11-16'),
	(1002, 1, 100, '2018-11-02', '2018-11-16'),
	(1003, 1, 100, '2018-11-02', '2018-11-16'),
	(1004, 1, 100, '2018-11-02', '2018-11-16'),
	(1005, 1, 100, '2018-11-02', '2018-11-16'),  /*7*/
	(1010, 1, 100, '2018-11-02', '2018-11-16'),
	(1011, 1, 100, '2018-11-02', '2018-11-16'),
	
	(1004, 1, 101, '2018-11-10', '2018-11-24'),
	(1005, 1, 101, '2018-11-10', '2018-11-24'),
	(1006, 1, 101, '2018-11-10', '2018-11-24'),
	(1007, 1, 101, '2018-11-10', '2018-11-24'),
	(1012, 1, 101, '2018-11-10', '2018-11-24'),  /*8*/
	(1013, 1, 101, '2018-11-10', '2018-11-24'),
	(1016, 1, 101, '2018-11-10', '2018-11-24'),
	(1021, 1, 101, '2018-11-10', '2018-11-24'),
	
	(1002, 1, 107, '2018-11-12', '2018-11-26'),
	(1014, 1, 107, '2018-11-12', '2018-11-26'),
	(1015, 1, 107, '2018-11-12', '2018-11-26'),  /*4*/
	(1018, 1, 107, '2018-11-12', '2018-11-26'),

	(1001, 2, 102, '2018-11-02', '2018-11-16'),
	(1002, 2, 102, '2018-11-02', '2018-11-16'),
	(1006, 2, 102, '2018-11-02', '2018-11-16'),
	(1007, 2, 102, '2018-11-12', '2018-11-26'),
	(1014, 2, 102, '2018-11-12', '2018-11-26'),  /*8*/
	(1015, 2, 102, '2018-11-12', '2018-11-26'),
	(1016, 2, 102, '2018-11-12', '2018-11-26'),
	(1021, 2, 102, '2018-11-12', '2018-11-26'),

	(1001, 2, 103, '2018-11-12', '2018-11-26'),
	(1002, 2, 103, '2018-11-12', '2018-11-26'),
	(1012, 2, 103, '2018-11-12', '2018-11-26'),  /*4*/
	(1021, 2, 103, '2018-11-12', '2018-11-26'),

	(1012, 2, 105, '2018-11-13', '2018-11-28'),
	(1013, 2, 105, '2018-11-13', '2018-11-28'),  /*3*/
	(1016, 2, 105, '2018-11-13', '2018-11-28'),
	
	(1004, 3, 104, '2018-11-12', '2018-11-26'),
	(1005, 3, 104, '2018-11-12', '2018-11-26'),
	(1008, 3, 104, '2018-11-12', '2018-11-26'),
	(1009, 3, 104, '2018-11-12', '2018-11-26'),  /*6*/
	(1016, 3, 104, '2018-11-12', '2018-11-26'),
	(1017, 3, 104, '2018-11-12', '2018-11-26'),

	(1002, 3, 105, '2018-11-13', '2018-11-28'),
	(1006, 3, 105, '2018-11-13', '2018-11-28'),  /*3*/
	(1007, 3, 105, '2018-11-13', '2018-11-28'),

	(1008, 4, 108, '2018-11-12', '2018-11-26'),
	(1009, 4, 108, '2018-11-12', '2018-11-26'),
	(1011, 4, 108, '2018-11-12', '2018-11-26'),  /*4*/
	(1012, 4, 108, '2018-11-12', '2018-11-26'),

	(1018, 4, 106, '2018-11-13', '2018-11-28'),
	(1019, 4, 106, '2018-11-13', '2018-11-28'),
	(1020, 4, 106, '2018-11-13', '2018-11-28'),  /*4*/
	(1021, 4, 106, '2018-11-13', '2018-11-28')
;

select lb.BranchName, bk.Title, sum(bc.NumberofCopies) as '# of Copies'
	from LibraryBranch as lb
	inner join BookCopies as bc on lb.BranchID = bc.BranchID
	inner join Books as bk on bc.BookID = bk.BookID
	where bk.Title = 'The Lost Tribe' and lb.BranchName = 'Sharpstown'
	group by lb.BranchName, bk.Title;

select lb.BranchName, bk.Title, sum(bc.NumberofCopies) as '# of Copies'
	from LibraryBranch as lb
	full outer join BookCopies as bc on lb.BranchID = bc.BranchID
	full outer join Books as bk on bc.BookID = bk.BookID
	where bk.Title = 'The Lost Tribe'
	group by lb.BranchName, bk.Title;

select bor.Name
	from Borrower as bor
	left join BookLoans as bl on bor.CardNo = bl.CardNo
	where bl.CardNo is null;

select bk.Title, bor.Name, bor.Address
	from Books as bk
	inner join BookLoans as bl on bk.BookID = bl.BookID
	inner join LibraryBranch as lb on bl.BranchID = lb.BranchID
	inner join Borrower as bor on bl.CardNo = bor.CardNo
	where lb.BranchName = 'Sharpstown' and bl.DateDue = '2018-11-16';

select lb.BranchName, count(bl.BookID) as '# of Books Out'
	from LibraryBranch as lb
	inner join BookLoans as bl on lb.BranchID = bl.BranchID
	group by lb.BranchName;

select bor.Name, bor.Address, count(bl.BookID) as '# of Books Borrowed'
	from Borrower as bor
	inner join BookLoans as bl on bor.CardNo = bl.CardNo
	group by bor.Name, bor.Address
	having count(bl.BookID) >5;

select bk.Title, bc.NumberOfCopies
	from Books as bk
	inner join BookCopies as bc on bk.BookID = bc.BookID
	inner join LibraryBranch as lb on bc.BranchID = lb.BranchID
	inner join BookAuthors as ba on bk.BookID = ba.BookID
	where lb.BranchName = 'Central' and ba.AuthorName = 'Stephen King';