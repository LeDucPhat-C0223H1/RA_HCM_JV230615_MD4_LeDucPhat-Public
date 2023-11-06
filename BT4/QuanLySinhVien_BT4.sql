Create Database QuanLyDiemSV CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci;
use QuanLyDiemSV;
/*=============DANH MUC KHOA==============*/
Create table DMKhoa(
	MaKhoa char(2) primary key,
	TenKhoa nvarchar(30)not null
);
/*==============DANH MUC SINH VIEN============*/
Create table DMSV(
MaSV char(3) not null primary key,
HoSV nvarchar(15) not null,
TenSV nvarchar(7)not null,
Phai nchar(7),
NgaySinh datetime not null,
NoiSinh nvarchar (20),
MaKhoa char(2),
HocBong float
);
/*===================MON HOC========================*/
create table DMMH(
MaMH char (2) not null,
TenMH nvarchar (25)not null,
SoTiet tinyint,
Constraint DMMH_MaMH_pk primary key(MaMH)
);
/*=====================KET QUA===================*/
Create table KetQua
(
MaSV char(3) not null,
MaMH char (2)not null ,
LanThi tinyint,
Diem decimal(4,2),
Constraint KetQua_MaSV_MaMH_LanThi_pk primary key (MaSV,MaMH,LanThi)
);
/*==========================TAO KHOA NGOAI==============================*/
Alter table dmsv
add Constraint DMKhoa_MaKhoa_fk foreign key (MaKhoa)
References DMKhoa (MaKhoa);
Alter table KetQua
add constraint KetQua_MaSV_fk foreign key (MaSV) references DMSV (MaSV);
Alter table KetQua
add constraint DMMH_MaMH_fk foreign key (MaMH) references DMMH (MaMH);
/*==================NHAP DU LIEU====================*/
/*==============NHAP DU LIEU DMMH=============*/
Insert into DMMH(MaMH,TenMH,SoTiet)
values('01','Cơ Sở Dữ Liệu',45);
Insert into DMMH(MaMH,TenMH,SoTiet)
values('02','Trí Tuệ Nhân Tạo',45);
Insert into DMMH(MaMH,TenMH,SoTiet)
values('03','Truyền Tin',45);
Insert into DMMH(MaMH,TenMH,SoTiet)
values('04','Đồ Họa',60);
Insert into DMMH(MaMH,TenMH,SoTiet)
values('05','Văn Phạm',60);
Insert into DMMH(MaMH,TenMH,SoTiet)
values('06','Ngôn Ngữ Máy',40);
/*==============NHAP DU LIEU DMKHOA=============*/
Insert into DMKhoa(MaKhoa,TenKhoa)
values('AV','Anh Văn');
Insert into DMKhoa(MaKhoa,TenKhoa)
values('TH','Tin Học');
Insert into DMKhoa(MaKhoa,TenKhoa)
values('TR','Triết');
Insert into DMKhoa(MaKhoa,TenKhoa)
values('VL','Vật Lý');
/*==============NHAP DU LIEU DMSV=============*/
Insert into DMSV
values('A01','Nguyễn Thị','Hải','Nữ','1990-03-20','Hà Nội','TH',130000);
Insert into DMSV(MaSV,HoSV,TenSV,Phai,NgaySinh,NoiSinh,MaKhoa,HocBong)
values('A02','Trần Văn','Chính','Nam','1992-12-24','Bình Định','VL',150000);
Insert into DMSV(MaSV,HoSV,TenSV,Phai,NgaySinh,NoiSinh,MaKhoa,HocBong)
values('A03','Lê Thu Bạch','Yến','Nữ','1990-02-21','TP Hồ Chí Minh','TH',170000);
Insert into DMSV(MaSV,HoSV,TenSV,Phai,NgaySinh,NoiSinh,MaKhoa,HocBong)
values('A04','Trần Anh','Tuấn','Nam','1990-12-20','Hà Nội','AV',80000);
Insert into DMSV(MaSV,HoSV,TenSV,Phai,NgaySinh,NoiSinh,MaKhoa,HocBong)
values('B01','Trần Thanh','Mai','Nữ','1991-08-12','Hải Phòng','TR',0);
Insert into DMSV(MaSV,HoSV,TenSV,Phai,NgaySinh,NoiSinh,MaKhoa,HocBong)
values('B02','Trần Thị Thu','Thủy','Nữ','1991-01-02','TP Hồ Chí Minh','AV',0);
Insert into DMSV(MaSV,HoSV,TenSV,Phai,NgaySinh,NoiSinh,MaKhoa,HocBong)

values('B03','Lê Nam','Khánh','Nam','1990-06-02','Hà Nội','AV',160000);
Insert into DMSV(MaSV,HoSV,TenSV,Phai,NgaySinh,NoiSinh,MaKhoa,HocBong)
values('B04','Lê Hoài','Tâm','Nam','1990-02-07','Hà Nội','TH',180000);
Insert into DMSV(MaSV,HoSV,TenSV,Phai,NgaySinh,NoiSinh,MaKhoa,HocBong)
values('B05','Lê Vân','Mây','Nữ','2000-03-19','Phú Yên','AV',0);
Insert into DMSV(MaSV,HoSV,TenSV,Phai,NgaySinh,NoiSinh,MaKhoa,HocBong)
values('C01','Quách Duy','Vũ','Nam','1990-02-01','Bình Định','TR',0);
Insert into DMSV(MaSV,HoSV,TenSV,Phai,NgaySinh,NoiSinh,MaKhoa,HocBong)
values('C02','Đào Huy ','Quân','Nam','1990-01-01','Huế','TR',0);
Insert into DMSV(MaSV,HoSV,TenSV,Phai,NgaySinh,NoiSinh,MaKhoa,HocBong)
values('C03','Nguyền Hoàng ','Hải','Nam','1993-06-05','Nghệ An','VL',500000);
Insert into DMSV(MaSV,HoSV,TenSV,Phai,NgaySinh,NoiSinh,MaKhoa,HocBong)
values('C04','Dương Hải ','Phong','Nam','1993-07-16','Thái Bình','VL',500000);
Insert into DMSV(MaSV,HoSV,TenSV,Phai,NgaySinh,NoiSinh,MaKhoa,HocBong)
values('D01','Nguyền Duy ','Anh','Nam','1994-08-14','Đồng Tháp','TR',210000);
Insert into DMSV(MaSV,HoSV,TenSV,Phai,NgaySinh,NoiSinh,MaKhoa,HocBong)
values('D02','Cao Mỹ ','Linh','Nữ','1994-07-23','Cà Mau','TR',220000);


/*==============NHAP DU LIEU BANG KET QUA=============*/
Insert into KetQua(MaSV,MaMH,LanThi,Diem)
values('A01','01',1,3);
Insert into KetQua(MaSV,MaMH,LanThi,Diem)
values('A01','01',2,6);
Insert into KetQua(MaSV,MaMH,LanThi,Diem)
values('A01','02',2,6);
Insert into KetQua(MaSV,MaMH,LanThi,Diem)
values('A01','03',1,5);
Insert into KetQua(MaSV,MaMH,LanThi,Diem)
values('A02','01',1,4.5);
Insert into KetQua(MaSV,MaMH,LanThi,Diem)
values('A02','01',2,7);
Insert into KetQua(MaSV,MaMH,LanThi,Diem)
values('A02','03',1,10);
Insert into KetQua(MaSV,MaMH,LanThi,Diem)
values('A02','05',1,9);
Insert into KetQua(MaSV,MaMH,LanThi,Diem)
values('A03','01',1,2);
Insert into KetQua(MaSV,MaMH,LanThi,Diem)
values('A03','01',2,5);
Insert into KetQua(MaSV,MaMH,LanThi,Diem)
values('A03','03',1,2.5);
Insert into KetQua(MaSV,MaMH,LanThi,Diem)
values('A03','03',2,4);
Insert into KetQua(MaSV,MaMH,LanThi,Diem)
values('A04','05',2,10);
Insert into KetQua(MaSV,MaMH,LanThi,Diem)
values('B01','01',1,7);
Insert into KetQua(MaSV,MaMH,LanThi,Diem)
values('B01','03',1,2.5);
Insert into KetQua(MaSV,MaMH,LanThi,Diem)
values('B01','03',2,5);
Insert into KetQua(MaSV,MaMH,LanThi,Diem)
values('B02','02',1,6);
Insert into KetQua(MaSV,MaMH,LanThi,Diem)
values('B02','04',1,10);

-- 1. Liệt kê danh sách sinh viên, gồm các thông tin sau: Mã sinh viên, Họ sinh 
-- viên, Tên sinh viên, Học bổng. Danh sách sẽ được sắp xếp theo thứ tự Mã 
-- sinh viên tăng dần
Select sv.masv, sv.hosv, sv.tensv, sv.hocbong 
From DMSV sv
Order by sv.masv;

-- 2. Danh sách các sinh viên gồm thông tin sau: Mã sinh viên, họ tên sinh viên, 
-- Phái, Ngày sinh. Danh sách sẽ được sắp xếp theo thứ tự Nam/Nữ.
Select sv.masv, sv.hosv, sv.tensv, sv.phai, sv.ngaysinh 
From DMSV sv
Order by sv.phai;

-- 3. Thông tin các sinh viên gồm: Họ tên sinh viên, Ngày sinh, Học bổng. Thông 
-- tin sẽ được sắp xếp theo thứ tự Ngày sinh tăng dần và Học bổng giảm dần.
Select sv.hosv, sv.tensv, sv.ngaysinh, sv.hocbong 
From DMSV sv
Order by sv.ngaysinh;

Select sv.hosv, sv.tensv, sv.ngaysinh, sv.hocbong 
From DMSV sv
Order by sv.hocbong desc;

-- 4. Danh sách các môn học có tên bắt đầu bằng chữ T, gồm các thông tin: Mã 
-- môn, Tên môn, Số tiết.
Select mh.mamh, mh.tenmh, mh.sotiet 
From DMMH mh
Where mh.tenmh like 'T%';

-- 5. Liệt kê danh sách những sinh viên có chữ cái cuối cùng trong tên là I, gồm 
-- các thông tin: Họ tên sinh viên, Ngày sinh, Phái.
Select sv.hosv, sv.tensv, sv.ngaysinh, sv.phai
From DMSV sv
Where sv.tensv like '%i' ;

-- 6. Danh sách những khoa có ký tự thứ hai của tên khoa có chứa chữ N, gồm 
-- các thông tin: Mã khoa, Tên khoa.
Select dmk.makhoa, dmk.tenkhoa
From DMKhoa dmk
Where dmk.tenkhoa like '_n%';

-- 7. Liệt kê những sinh viên mà họ có chứa chữ Thị.
Select *
From DMSV sv
Where sv.hosv like '%Thị%' ;

-- 8. Cho biết danh sách các sinh viên có học bổng lớn hơn 100,000, gồm các 
-- thông tin: Mã sinh viên, Họ tên sinh viên, Mã khoa, Học bổng. Danh sách sẽ
-- được sắp xếp theo thứ tự Mã khoa giảm dần
Select sv.masv, sv.hosv, sv.tensv, dmk.makhoa, sv.hocbong
From DMSV sv
Inner join DMKhoa dmk on sv.makhoa = dmk.makhoa
Where sv.hocbong > 100000
Order by dmk.makhoa desc;

-- 9. Liệt kê các sinh viên có học bổng từ 150,000 trở lên và sinh ở Hà Nội, gồm 
-- các thông tin: Họ tên sinh viên, Mã khoa, Nơi sinh, Học bổng.
Select sv.hosv, sv.tensv, dmk.makhoa, sv.noisinh, sv.hocbong
From DMSV sv
Inner join DMKhoa dmk on sv.makhoa = dmk.makhoa
Where sv.hocbong > 150000 and (sv.noisinh like 'Hà Nội');

-- 10.Danh sách các sinh viên của khoa Anh văn và khoa Vật lý, gồm các thông 
-- tin: Mã sinh viên, Mã khoa, Phái.
Select sv.masv , dmk.makhoa, sv.phai
From DMSV sv
Inner join DMKhoa dmk on sv.makhoa = dmk.makhoa
Where (dmk.tenkhoa like 'Anh Văn') or (dmk.tenkhoa like 'Vật Lý');

-- 11.Cho biết những sinh viên có ngày sinh từ ngày 01/01/1991 đến ngày 
-- 05/06/1992 gồm các thông tin: Mã sinh viên, Ngày sinh, Nơi sinh, Học 
-- bổng.
Select sv.masv, sv.ngaysinh, sv.hocbong
From DMSV sv
Where sv.ngaysinh between '1991-01-01' and '1992-06-05';

-- 12.Danh sách những sinh viên có học bổng từ 80.000 đến 150.000, gồm các 
-- thông tin: Mã sinh viên, Ngày sinh, Phái, Mã khoa.
Select sv.masv, sv.ngaysinh, sv.phai, dmk.makhoa
From DMSV sv
Inner join DMKhoa dmk on sv.makhoa = dmk.makhoa
Where sv.hocbong between 80000 and 150000;

-- 13.Cho biết những môn học có số tiết lớn hơn 30 và nhỏ hơn 45, gồm các thông 
-- tin: Mã môn học, Tên môn học, Số tiết.
Select mh.mamh, mh.tenmh, mh.sotiet
From DMMH mh
Where mh.sotiet > 30 and mh.sotiet < 45;

-- 14.Liệt kê những sinh viên nam của khoa Anh văn và khoa tin học, gồm các 
-- thông tin: Mã sinh viên, Họ tên sinh viên, tên khoa, Phái.
Select sv.masv , sv.hosv, sv.tensv, dmk.tenkhoa, sv.phai
From DMSV sv
Inner join DMKhoa dmk on sv.makhoa = dmk.makhoa
Where (dmk.tenkhoa like 'Anh Văn') or (dmk.tenkhoa like 'Tin Học');

-- 15.Liệt kê những sinh viên nữ, tên có chứa chữ N
Select *
From DMSV sv
Where sv.phai like 'Nữ' and (sv.tensv like '%n%');

-- 16.Danh sách sinh viên có nơi sinh ở Hà Nội và sinh vào tháng 02, gồm các 
-- thông tin: Họ sinh viên, Tên sinh viên, Nơi sinh, Ngày sinh.
Select sv.hosv, sv.tensv, sv.noisinh, sv.ngaysinh
From DMSV sv
Where (sv.noisinh like 'Hà Nội') and (month(sv.ngaysinh)=2);

-- 17.Cho biết những sinh viên có tuổi lớn hơn 20, thông tin gồm: Họ tên sinh 
-- viên, Tuổi, Học bổng.
Select sv.hosv, sv.tensv, sv.ngaysinh, year(now()) - year(sv.ngaysinh) as tuoi, sv.hocbong 
From DMSV sv
Where year(now()) - year(sv.ngaysinh) > 20;

-- 18.Danh sách những sinh viên có tuổi từ 20 đến 25, thông tin gồm: Họ tên sinh 
-- viên, Tuổi, Tên khoa.
Select sv.hosv, sv.tensv, sv.ngaysinh, year(now()) - year(sv.ngaysinh) as tuoi, dmk.tenkhoa 
From DMSV sv
Inner join DMKhoa dmk on sv.makhoa = dmk.makhoa
Where (year(now()) - year(sv.ngaysinh) >20) and (year(now()) - year(sv.ngaysinh) <=25);

-- 19.Danh sách sinh viên sinh vào mùa xuân năm 1990, gồm các thông tin: Họ
-- tên sinh viên, Phái, Ngày sinh.
Select sv.hosv, sv.tensv, sv.phai, sv.ngaysinh
From DMSV sv
Where sv.ngaysinh between '1990-01-01' and '1990-03-31';

-- 20.Cho biết thông tin về mức học bổng của các sinh viên, gồm: Mã sinh viên, 
-- Phái, Mã khoa, Mức học bổng. Trong đó, mức học bổng sẽ hiển thị là “Học
-- bổng cao” nếu giá trị của field học bổng lớn hơn 500,000 và ngược lại hiển 
-- thị là “Mức trung bình”
Select sv.masv, sv.phai, sv.hocbong,
	CASE 
		WHEN sv.hocbong = 0 THEN 'Không có'
		WHEN sv.hocbong < 500000 THEN 'Mức trung bình'
        WHEN sv.hocbong >= 500000 THEN 'Học bổng cao' 
        ELSE NULL -- Trường hợp khác không xác định
    END AS loaihocbong
From DMSV sv
Order by sv.hocbong desc;

-- 21.Cho biết tổng số sinh viên của toàn trường
Select count(sv.masv) as soluongsinhvien
From DMSV sv;

-- 22.Cho biết tổng sinh viên và tổng sinh viên nữ.
Select 'tổng cộng' as '', count(sv.masv) as 'số lượng'
From DMSV sv
union
Select 'nữ', count(sv.masv) from DMSV sv where sv.phai like 'nữ';

-- 23.Cho biết tổng số sinh viên của từng khoa.
Select sv.makhoa, count(sv.makhoa) as soluong
From DMSV sv
Group by sv.makhoa;

-- 24.Cho biết số lượng sinh viên học từng môn.
Select kq.mamh, mh.tenmh, count(kq.mamh) as soluong
From DMSV sv
Inner join KetQua kq on sv.masv = kq.masv
Inner join DMMH mh on kq.mamh = mh.mamh
Group by kq.mamh;

-- 25.Cho biết số lượng môn học mà sinh viên đã học(tức tổng số môn học có 
-- trong bảng kq)
Select sv.masv, sv.hosv, sv.tensv, count(kq.mamh) as 'soluongmonhoc'
From DMSV sv
Inner join KetQua kq on sv.masv = kq.masv
Group by sv.masv;

-- 26.Cho biết tổng số học bổng của mỗi khoa.
Select sv.makhoa, count(sv.masv) as 'soluong'
From DMSV sv
Where sv.hocbong > 0
Group by sv.makhoa;

-- 27.Cho biết học bổng cao nhất của mỗi khoa.
Select sv.makhoa, max(sv.hocbong) as 'hocbongcaonhat'
From DMSV sv
Where sv.hocbong > 0
Group by sv.makhoa;

-- 28.Cho biết tổng số sinh viên nam và tổng số sinh viên nữ của mỗi khoa.

/* Select nam.makhoa, nam.nam, nu.nu
From 
(Select sv.makhoa, count(sv.masv) as 'nam'
From DMSv sv
Where sv.phai like 'nam'
Group by sv.makhoa) as nam

left join 

(Select sv.makhoa, count(sv.masv) as 'nu'
From DMSv sv
Where sv.phai like 'nữ'
Group by sv.makhoa) as nu

on nam.makhoa = nu.makhoa;*/

Select sv.makhoa, sv.phai ,count(sv.masv) as 'soluong'
From DMSV sv
Group by sv.makhoa, sv.phai
Order by sv.makhoa;


-- 29.Cho biết số lượng sinh viên theo từng độ tuổi.
Select year(now()) - year(sv.ngaysinh) as tuoi, count(sv.masv) as 'soluong'
From DMSV sv
Group by year(now()) - year(sv.ngaysinh);

-- 30.Cho biết những năm sinh nào có 2 sinh viên đang theo học tại trường.
Select year(sv.ngaysinh) as 'nam sinh co 2 sinh vien dang theo hoc'
From DMSV sv
Group by year(sv.ngaysinh)
Having count(sv.masv) = 2;

-- 31.Cho biết những nơi nào có hơn 2 sinh viên đang theo học tại trường.
Select sv.noisinh as 'noi sinh co hon 2 sinh vien dang theo hoc'
From DMSV sv
Group by sv.noisinh
Having count(sv.masv) > 2;

-- 32.Cho biết những môn nào có trên 3 sinh viên dự thi.
Select mh.tenmh as 'nhung mon co tren 3 sinh vien du thi'
From KetQua kq
Inner join DMMH mh on kq.mamh = mh.mamh
Group by kq.mamh
Having count(kq.masv) > 3;

-- 33.Cho biết những sinh viên thi lại 2 lan tro len.
Select concat(sv.hosv, ' ', sv.tensv)  as 'nhung sinh vien thi lai 2 lan tro len'
From KetQua kq
Inner join DMSV sv on kq.masv = sv.masv
Group by kq.masv, kq.mamh
Having count(kq.mamh) >= 2;


-- 34.Cho biết những sinh viên có điểm trung bình lần 1 trên 7.0
Select concat(sv.hosv, ' ', sv.tensv) as 'ho va ten', avg(kq.diem) as 'diem trung binh'
From KetQua kq
Inner join DMSV sv on kq.masv = sv.masv
Where kq.lanthi = 1
Group by kq.masv
Having avg(kq.diem) > 7;

-- 35.Cho biết danh sách các sinh viên rớt (<4) trên 2 môn ở lần thi 1.
Select concat(sv.hosv, ' ', sv.tensv) as 'sinh vien rot tren 2 mon o lan thi 1'
From KetQua kq
Inner join DMSV sv on kq.masv = sv.masv
Where kq.lanthi = 1 and kq.diem < 4
Group by kq.masv
Having count(kq.diem) >= 2;

-- 36.Cho biết danh sách những khoa có nhiều hơn 2 sinh viên nam
Select dmk.tenkhoa as 'khoa co nhieu hon 2 sinh vien nam'
From DMSV sv
Inner join DMKhoa dmk on sv.makhoa = dmk.makhoa
Where sv.phai like 'nam'
Group by sv.makhoa
Having count(sv.masv) > 2;

-- 37.Cho biết những khoa có 2 học sinh đạt học bổng từ 200.000 đến 300.000.
Select dmk.tenkhoa as 'khoa co nhieu hon 2 sinh vien dat hoc bong tu 200000 - 300000'
From DMSV sv
Inner join DMKhoa dmk on sv.makhoa = dmk.makhoa
Where sv.hocbong between 200000 and 300000
Group by sv.makhoa
Having count(sv.masv) >= 2;

-- 38.Cho biết số lượng sinh viên đậu và số lượng sinh viên rớt (<4) của từng môn 
-- trong lần thi 1.
-- Select kq.mamh, count(kq.diem) as 'so luong sinh vien thi rot o lan  1'
-- From KetQua kq
-- Where kq.lanthi = 1 and kq.diem < 4
-- Group by kq.mamh;

-- Select kq.mamh, count(kq.diem) as 'so luong sinh vien thi dau o lan 1'
-- From KetQua kq
-- Where kq.lanthi = 1 and kq.diem > 4
-- Group by kq.mamh;

Select mh.tenmh, if(kq.diem < 4, 'đậu', 'rớt') as 'kết quả', count(kq.diem) as 'soluong'
From KetQua kq
Inner join DMMH mh on kq.mamh = mh.mamh
Group by kq.mamh, if(kq.diem < 4, 'đậu', 'rớt'); 

-- 39.Cho biết sinh viên nào có học bổng cao nhất.
Select concat(sv.hosv, ' ', sv.tensv) as 'sinh vien co hoc bong cao nhat', sv.hocbong
From DMSV sv
Where sv.hocbong = (
	Select max(sv.hocbong) from DMSV sv)
;

-- 40.Cho biết sinh viên nào có điểm thi lần 1 môn cơ sở dữ liệu cao nhất.
Select concat(sv.hosv, ' ', sv.tensv) as 'sinh viên có điểm thi lần 1 môn cơ sở dữ liệu cao nhất', kq.diem
From KetQua kq
Inner join DMSV sv on kq.masv = sv.masv 
Where kq.lanthi = 1 and kq.mamh like '01' and kq.diem =(
	Select max(kq.diem)
	From KetQua kq
	Where kq.lanthi = 1 and kq.mamh like '01'
	)
;

-- 41.Cho biết sinh viên khoa anh văn có tuổi lớn nhất.   
select concat(sv.hosv, ' ', sv.tensv) as ' sinh viên khoa anh văn có tuổi lớn nhất', year(now()) - year(sv.ngaysinh) as 'tuoi'
From DMSV sv
where year(now()) - year(sv.ngaysinh) = (
	Select max(year(now()) - year(sv.ngaysinh))
	From DMSV sv 
	Where sv.makhoa like 'AV')
;

-- 42.Cho biết khoa nào có đông sinh viên nhất.
Select dmk.tenkhoa as 'khoa có đông sinh viên nhất', count(sv.masv) as 'soluong' 
From DMSV sv
Inner join DMKhoa dmk on sv.makhoa = dmk.makhoa 
Group by sv.makhoa
Having count(sv.masv) = (
	Select count(sv.masv)
	From DMSV sv
	Group by sv.makhoa
	Order by count(sv.masv) desc limit 1
)
;

/*-------------------------------------*/
#43
SELECT sv.MaKhoa, count(sv.Phai) solg
FROM dmkhoa k
LEFT JOIN dmsv sv ON sv.MaKhoa = k.MaKhoa
WHERE sv.Phai LIKE ('Nữ')
GROUP BY k.MaKhoa
HAVING solg = 2;

#44
SELECT mh.TenMH
FROM ketqua kq
         INNER JOIN dmmh mh ON mh.MaMH = kq.MaMH
WHERE kq.LanThi = 1
  AND kq.Diem < 5
GROUP BY (mh.TenMH)
ORDER BY count(mh.TenMH) DESC
LIMIT 1;

#45
SELECT sv.TenSV,
       r.kq
FROM dmsv sv
         INNER JOIN dmkhoa k ON k.MaKhoa = sv.MaKhoa
         INNER JOIN (SELECT kq.MaSV MaSV,
                            kq.MaMH,
                            mh.TenMH,
                            kq.Diem Kq
                     FROM ketqua kq
                              INNER JOIN dmmh mh ON mh.MaMH = kq.MaMH
                     WHERE mh.TenMH LIKE ('Văn Phạm')) AS r ON r.MaSV = sv.MaSV
WHERE k.TenKhoa LIKE ('Anh Văn');

#46
SELECT *
FROM dmsv sv2
WHERE sv2.NoiSinh IN (SELECT sv.NoiSinh FROM dmsv sv WHERE sv.TenSV LIKE ('Hải'));

#47
SELECT *
FROM dmsv sv1
         INNER JOIN dmkhoa k ON k.MaKhoa = sv1.MaKhoa
WHERE k.TenKhoa NOT LIKE ('Anh Văn')
  AND sv1.HocBong > ALL (SELECT sv.HocBong
                         FROM dmsv sv
                                  INNER JOIN dmkhoa k ON k.MaKhoa = sv.MaKhoa
                         WHERE k.TenKhoa LIKE ('Anh Văn'));


#48
SELECT *
FROM dmsv sv1
         INNER JOIN dmkhoa k ON k.MaKhoa = sv1.MaKhoa
WHERE k.TenKhoa NOT LIKE ('Anh Văn')
  AND sv1.HocBong > ANY (SELECT sv.HocBong
                         FROM dmsv sv
                                  INNER JOIN dmkhoa k ON k.MaKhoa = sv.MaKhoa
                         WHERE k.TenKhoa LIKE ('Anh Văn'));

#49
SELECT kq.MaSV,
       kq.Diem
FROM ketqua kq
         INNER JOIN dmmh mh ON mh.MaMH = kq.MaMH
WHERE kq.LanThi = 2
  AND mh.TenMH LIKE ('Cơ Sở Dữ Liệu')
HAVING kq.Diem >= ALL (SELECT kq.Diem
                       FROM ketqua kq
                                INNER JOIN dmmh mh ON mh.MaMH = kq.MaMH
                       WHERE kq.LanThi = 1
                         AND mh.TenMH LIKE ('Cơ Sở Dữ Liệu'));

#50
SELECT sv.TenSV,
       mh.TenMH,
       kq.Diem
FROM ketqua kq
         INNER JOIN dmsv sv ON sv.MaSV = kq.MaSV
         INNER JOIN dmmh mh ON mh.MaMH = kq.MaMH
WHERE kq.Diem >= ALL (SELECT max(kq.Diem)
                      FROM ketqua kq
                               INNER JOIN dmmh mh ON mh.MaMH = kq.MaMH
                      GROUP BY mh.TenMH);

#51
SELECT k.MaKhoa,
       k.TenKhoa,
       count(sv.MaKhoa) solg
FROM dmkhoa k
         LEFT JOIN dmsv sv ON sv.MaKhoa = k.MaKhoa
GROUP BY k.MaKhoa
HAVING solg = 0;

#52
SELECT *
FROM dmsv
WHERE MaSV NOT IN (SELECT kq.MaSV
                   FROM ketqua kq
                            INNER JOIN dmmh mh ON mh.MaMH = kq.MaMH
                   WHERE mh.TenMH LIKE ('Cơ Sở Dữ Liệu')
                   GROUP BY kq.MaSV);

#53
SELECT *
FROM (SELECT MaSV, MaMH
      FROM ketqua
      WHERE LanThi = 2) AS A
         LEFT JOIN
     (SELECT MaSV, MaMH
      FROM ketqua
      WHERE LanThi = 1
      ORDER BY MaSV) AS B ON B.MaSV = A.MaSV AND B.MaMH = B.MaMH
HAVING B.MaSV IS NULL
ORDER BY A.MaSV;

#54
SELECT mh.TenMH
FROM dmmh mh
         LEFT JOIN
     (SELECT DISTINCT kq.MaMH MaMH, kq.MaSV MSV
      FROM ketqua kq
      WHERE kq.MaSV IN (SELECT sv.MaSV
                        FROM dmsv sv
                                 INNER JOIN dmkhoa k ON k.MaKhoa = sv.MaKhoa
                        WHERE k.TenKhoa LIKE ('Anh Văn'))) AS B ON B.MaMH = mh.MaMH
WHERE B.MSV IS NULL;

#55
SELECT sv.MaSV, sv.TenSV
FROM dmsv sv
         INNER JOIN dmkhoa k ON k.MaKhoa = sv.MaKhoa
WHERE k.TenKhoa LIKE ('Anh Văn')
  AND sv.MaSV NOT IN (SELECT kq.MaSV
                      FROM ketqua kq
                               INNER JOIN dmmh mh ON mh.MaMH = kq.MaMH
                      WHERE mh.TenMH LIKE ('Văn Phạm'));

#56
SELECT sv.MaSV, concat(sv.HoSV, '', sv.TenSV) HoTen, kq.MaMH, kq.Diem, kq.LanThi
FROM dmsv sv
         LEFT JOIN ketqua kq ON kq.MaSV = sv.MaSV
WHERE kq.Diem > 5;

#57
SELECT *
FROM dmsv sv
         INNER JOIN dmkhoa k ON k.MaKhoa = sv.MaKhoa
WHERE k.TenKhoa LIKE ('Anh Văn')
  AND sv.HocBong > 0;

#58
SELECT k.TenKhoa,
       count(sv.HocBong) so_lg
FROM dmsv sv
         INNER JOIN dmkhoa k ON k.MaKhoa = sv.MaKhoa
WHERE sv.HocBong > 0
GROUP BY k.TenKhoa
HAVING count(sv.HocBong)
           IN (SELECT max(A.so_lg) AS `Max`
               FROM (SELECT k.TenKhoa, count(sv.HocBong) so_lg
                     FROM dmsv sv
                              INNER JOIN dmkhoa k ON k.MaKhoa = sv.MaKhoa
                     WHERE sv.HocBong > 0
                     GROUP BY k.TenKhoa) AS A);

#59
SELECT DISTINCT kq.MaSV,
                count(kq.MaSV) solg
FROM ketqua kq
GROUP BY kq.MaSV
ORDER BY count(kq.MaSV) DESC
LIMIT 3;

#60
SELECT DISTINCT MaMH,
                count(MaMH) slg
FROM ketqua kq
GROUP BY MaMH
ORDER BY MaMH
LIMIT 1;

#61
SELECT DISTINCT A.MaSV
FROM (SELECT DISTINCT MaSV, MaMH
      FROM quanlydiemsv.ketqua
      WHERE MaSV NOT LIKE ('A02')
      ORDER BY MaSV) AS A
         INNER JOIN
     (SELECT DISTINCT MaMH
      FROM ketqua kq
      WHERE MaSV = 'A02') AS B ON B.MaMH = A.MaMH;

#62
SELECT A.MaSV
FROM (SELECT DISTINCT MaSV, MaMH
      FROM quanlydiemsv.ketqua
      WHERE MaSV NOT LIKE ('A02')
      ORDER BY MaSV) AS A
WHERE A.MaMH = ALL
      (SELECT DISTINCT MaMH
       FROM ketqua kq
       WHERE MaSV = 'A02');