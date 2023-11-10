create database quanlysinhvien_BT7_A;
use quanlysinhvien_BT7_a;

create table Students(
	studentID 	int primary key,
    studentName varchar(50),
    age 		int,
    email		varchar(100)
);

create table Classes(
	classID 	int primary key,
    className 	varchar(50)
);

create table ClassStudent(
	studentID 	int,
    classID 	int,
    primary key (studentID,classID),
    constraint fk_classStudent_studentID foreign key(studentID) references Student(studentID),
    constraint fk__classStudent_classID foreign key(classID) references Classes(classID)
);

create table Subjects(
	subjectID 	int primary key,
    subjectName varchar(50)
);

create table Marks(
	mark		int,
    subjectID	int,
    studentID	int,
    constraint fk_marks_subjectID foreign key (subjectID) references Subjects(subjectID),
    constraint fk_marks_studentID foreign key (studentID) references Student(studentID)
);

insert into Students (studentID, studentName, age, email)
values 	
	(1, 'Nguyen Quang An'	, 18, 'an@yahoo.com'),
	(2, 'Nguyen Cong Vinh'	, 20, 'vinh@gmail.com'),
	(3, 'Nguyen Van Quyen'	, 19, 'quyen@abc'),
	(4, 'Pham Thanh Binh'	, 25, 'binh@com'),
	(5, 'Nguyen Van Tai Em'	, 30, 'taiem@sport.vn');

insert into Classes (classID, className)
values
	(1, 'C0706L'),
    (2, 'C0708G');

insert into ClassStudent (studentID, classID)
values
	(1,	1),
    (2,	1),
    (3,	2),
    (4,	2),
    (5,	2);
    
insert into Subjects (subjectID, subjectName)
values
	(1, 'SQL'),
    (2, 'Java'),
    (3, 'C'),
    (4, 'Visual Basic');
    
insert into Marks (mark, subjectID, studentID)
values
	(8,	 1,	 1),
    (4,	 2,	 1),
    (9,	 1,	 1),
    (7,	 1,  3),
    (3,	 1,	 4),
    (5,	 2,	 5),
    (8,	 3,	 3),
    (1,	 3,	 5),
    (3,	 2,	 4);
    
-- 1. Hien thi danh sach tat ca cac hoc vien 
SELECT *
FROM Students;

-- 2. Hien thi danh sach tat ca cac mon hoc
SELECT *
FROM Subjects;

-- 3. Tinh diem trung binh 
SELECT StudentID, AVG(Mark) AS DiemTrungBinh
FROM Marks
GROUP BY StudentID;

-- 4. Hien thi mon hoc nao co hoc sinh thi duoc diem cao nhat
SELECT S.SubjectName, M.MaxMark
FROM Subjects AS S
JOIN 
	(	
		SELECT SubjectID, MAX(Mark) AS MaxMark
		FROM Marks
		GROUP BY SubjectID
	) 
AS M ON S.SubjectID = M.SubjectID;
               
-- 5. Danh so thu tu cua diem theo chieu giam
SELECT Mark, DENSE_RANK() OVER (ORDER BY Mark DESC) AS ThuTuGiam
FROM Marks
ORDER BY Mark DESC;

-- 6. Thay doi kieu du lieu cua cot SubjectName trong bang Subjects thanh varchar(max)
ALTER TABLE Subjects
	MODIFY SubjectName varchar(255);
    
-- 7. Cap nhat them dong chu « Day la mon hoc «  vao truoc cac ban ghi tren cot SubjectName trong bang Subjects
UPDATE Subjects
SET SubjectName = CONCAT('Day la mon hoc ', SubjectName);

-- 8. Viet Check Constraint de kiem tra do tuoi nhap vao trong bang Student yeu cau Age >15 va Age < 50
ALTER TABLE Students
ADD CONSTRAINT CHK_AgeRange CHECK (Age > 15 AND Age < 50);

-- 9. Loai bo tat ca quan he giua cac bang
ALTER TABLE ClassStudent
    DROP CONSTRAINT FK_StudentID;
    
ALTER TABLE ClassStudent
    DROP CONSTRAINT FK_ClassID;

ALTER TABLE Marks
    DROP CONSTRAINT FK_SubjectID;

ALTER TABLE Marks
    DROP CONSTRAINT FK_StudentID_Marks;
    
-- 10. Xoa hoc vien co StudentID la 1
DELETE
FROM ClassStudent
WHERE StudentID = 1;

DELETE
FROM Marks
WHERE StudentID = 1;

DELETE
FROM Students
WHERE StudentID = 1;

-- 11. Trong bang Student them mot column Status co kieu du lieu la Bit va co gia tri Default la 1
ALTER TABLE Students
    ADD Status BIT DEFAULT 1;
    
-- 12. Cap nhap gia tri Status trong bang Student thanh 0
UPDATE Students
SET Status = 0;

    
