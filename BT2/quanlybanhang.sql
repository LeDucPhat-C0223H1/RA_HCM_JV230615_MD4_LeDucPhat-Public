create database quanlybanhang;
use quanlybanhang;

-- Bai 1
create table khachHang(
maKH varchar(4) primary key ,
tenKH varchar(30) not null ,
diachi varchar(50) ,
ngaysinh date ,
sdt varchar(11) unique
);

create table nhanVien(
maNV varchar(4) primary key ,
hoten varchar(30) not null , 
gioitinh bit not null ,
diachi varchar(50) not null ,
ngaysinh date not null ,
dienthoai varchar(11) unique ,
email varchar(255) unique ,
noisinh varchar(20) not null ,
ngayvaolam date , 
maNQL varchar(4)
);

create table nhaCungCap(
maNCC varchar(5) primary key ,
tenNCC varchar(50) not null ,
diachi varchar(50) , 
dienthoai varchar(11) not null unique ,
email varchar(255) unique ,
website varchar(100)
);

create table loaiSP(
maloaiSP varchar(4) primary key ,
tenloaiSP varchar(30) not null ,
ghichu varchar(100) not null
);

create table sanPham(
maSP varchar(4) primary key , 
maloaiSP varchar(4) not null ,
tenSP varchar(50) not null ,
donvitinh varchar(10) not null ,
ghichu varchar(100) 
);

create table phieuNhap(
soPN varchar(5) primary key ,
maNV varchar(4) not null ,
maNCC varchar(5) not null ,
ngaynhap datetime not null default now() ,
ghichu varchar(100)
);

create table chiTietPhieuNhap(
maSP varchar(4) not null ,
soPN varchar(5) not null ,
soluong int not null default 0,
gianhap double not null check(gianhap>=0),
primary key(maSP, soPN)
);

create table phieuXuat(
soPX varchar(5) primary key ,
maNV varchar(4) not null ,
maKH varchar(5) not null ,
ngayban datetime not null ,
ghichu text
);

create table chiTietPhieuXuat(
soPX varchar(4) not null ,
maSP varchar(5) not null ,
soluong int not null check(soluong>=0) ,
giaban double not null check(giaban>=0),
primary key(maSP, soPX) 
);

-- Bai 2
ALTER TABLE sanPham 
ADD CONSTRAINT fk_maloaiSP foreign key (maloaiSP) references loaiSP (maloaiSP);

ALTER TABLE phieuNhap 
ADD CONSTRAINT fk_PN_maNV foreign key (maNV) references nhanVien (maNV),
ADD CONSTRAINT fk_PN_maNCC foreign key (maNCC) references nhaCungCap (maNCC);

ALTER TABLE chiTietPhieuNhap 
ADD CONSTRAINT fk_CTPN_maSP foreign key (maSP) references sanPham (maSP),
ADD CONSTRAINT fk_CTPN_soPN foreign key (soPN) references phieuNhap (soPN);

ALTER TABLE phieuXuat 
ADD CONSTRAINT fk_PX_maNV foreign key (maNV) references nhanVien (maNV),
ADD CONSTRAINT fk_PX_maKH foreign key (maKH) references khachHang (maKH);

ALTER TABLE chiTietPhieuXuat 
ADD CONSTRAINT fk_CTPX_maSP foreign key (soPX) references phieuXuat (soPX),
ADD CONSTRAINT fk_CTPX_soPN foreign key (maSP) references sanPham (maSP);

-- Bai 3a
-- THEM NHAN VIEN
insert into nhanvien values
('N001','Hồ Xuân Hùng',1,'Nghệ An','1999-06-18','0974364738','hung@gmail.com','Nghệ An',null,null),
('N002','Trịnh công Phúc',1,'Hồ Chí Minh','2000-02-18','0974364928','phuc@gmail.com','Hồ Chí Minh',null,'N001'),
('N003','Cao Cường',1,'Hà Nam','2001-06-20','0974937738','cuong@gmail.com','Hà Nam',null,'N002'),
('N004','Lê Đức Phát',1,'Hồ Chí Minh','2004-05-30','097439473','phat@gmail.com','Hồ CHí Minh',null,'N001'),
('N005','Nguyễn Thị Minh Châu',1,'Hồ Chí Minh','1998-1-18','097438756','Chau@gmail.com','Hồ chí Minh',null,'N001'),
('N006','Nguyễn Minh Thy',1,'Gia Lai','1998-1-18','097438757','thy@gmail.com','Gia Lai',null,'N001');

-- THEM KHACH HANG
insert into khachHang (makh,tenkh,sdt) values
('KH01','Nguyễn Văn A','0984727353'),
('KH02','Nguyễn Văn B','0984227353'),
('KH03','Nguyễn Văn C','0984527353'),
('KH04','Nguyễn Văn D','0984627353'),
('KH05','Nguyễn Văn E','0984827353');

-- THEM NHA CUNG CAP
insert into nhaCungCap (maNCC, tenNCC, diachi, dienthoai, email) values
('NCC01','Asama','Phu Nhuan','38475687','asama@gmail.com'),
('NCC02','Martin','Go Vap','38476687','martin@gmail.com'),
('NCC03','Yaedea','Binh Thanh','38474687','yeadea@gmail.com'),
('NCC04','Cookoo','Quan 7','38473687','cookoo@gmail.com'),
('NCC05','CJten','Quan 12','38472687','cjten@gmail.com');

-- THEM LOAI SAN PHAM
insert into loaiSP (maloaiSP, tenloaiSP, ghichu) values
('L01', 'Laptop', 'may tinh xach tay'),
('L02', 'Tivi', 'truyen hinh mau'),
('L03', 'Air Conditional', 'may dieu hoa'),
('L04', 'Infrared Stove', 'bep hong ngoai'),
('L05', 'Smart Watch', 'tai nghe khong day');

-- THEM SAN PHAM
insert into sanPham (maSP, maloaiSP, tenSP, donvitinh) values
('SP01', 'L01', 'dell 6533', 'cai'),
('SP02', 'L02', 'sony ex650', 'cai'),
('SP03', 'L03', 'daikin 2.0hp', 'cai'),
('SP04', 'L04', 'magic hot638', 'cai'),
('SP05', 'L01', 'apple watch 7', 'cai'),
('SP06', 'L04', 'osaka redhot', 'cai');

-- Bai 3b
-- Tao phieuNhap PN01
INSERT INTO phieuNhap (soPN, maNV, maNCC, ghichu) values 
('PN01', 'N001', 'NCC01', 'phieu nhap 01');

-- THEM 2 chiTietPhieuNhap CHO PN01
INSERT INTO chiTietPhieuNhap (maSP, soPN, soluong, gianhap) values 
('SP01', 'PN01', '2', 6000000),
('SP02', 'PN01', '3', 17000000);


-- Tao phieuNhap PN02
INSERT INTO phieuNhap (soPN, maNV, maNCC, ghichu) values 
('PN02', 'N002', 'NCC02', 'phieu nhap 02');

-- THEM 2 chiTietPhieuNhap CHO PN01
INSERT INTO chiTietPhieuNhap (maSP, soPN, soluong, gianhap) values 
('SP03', 'PN02', '2', 22000000),
('SP04', 'PN02', '2', 1500000);


-- * Bài 4: Dùng lệnh UPDATE cập nhật dữ liệu các bảng *
-- Cập nhật lại số điện thoại mới cho khách hàng mã KH01
update khachHang set sdt ='0932796671' where maKH like 'kh01';

-- Cập nhật lại địa chỉ mới của nhân viên mã N004
update nhanVien set diachi = 'Thua Thien Hue' where maNV like 'N004';


-- * Bài 5: Dùng lệnh DELETE xóa dữ liệu các bảng *
-- xóa nhân viên
delete from nhanVien where maNV like 'N006';
-- xóa sản phẩm
delete from sanPham where maSP like 'SP06'