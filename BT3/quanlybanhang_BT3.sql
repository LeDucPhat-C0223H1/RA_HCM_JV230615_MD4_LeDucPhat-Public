create database quanlybanhang;
use quanlybanhang;

-- Bai 1
create table khachHang(
maKH varchar(4) primary key ,
tenKH varchar(30) not null ,
diachi varchar(50) ,
ngaysinh date not null,
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
ngayban datetime not null default now() ,
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
insert into nhanVien values
('N001','Hồ Xuân Hùng',1,'Nghệ An','1999-06-18','0974364738','hung@gmail.com','Nghệ An','2020-07-14',null),
('N002','Trịnh công Phúc',1,'Hồ Chí Minh','2000-02-18','0974364928','phuc@gmail.com','Hồ Chí Minh','2021-03-15','N001'),
('N003','Cao Cường',1,'Hà Nam','2001-06-20','0974937738','cuong@gmail.com','Hà Nam','2019-06-20','N002'),
('N004','Lê Đức Phát',1,'Hồ Chí Minh','2004-05-30','097439473','phat@gmail.com','Hồ CHí Minh','2018-04-26','N001'),
('N005','Nguyễn Thị Minh Châu',1,'Hồ Chí Minh','1998-1-18','097438756','Chau@gmail.com','Hồ chí Minh','2022-05-16','N001'),
('N006','Nguyễn Minh Thy',1,'Gia Lai','1998-1-18','097438757','thy@gmail.com','Gia Lai','2023-01-18','N001');

UPDATE nhanVien
SET ngaysinh = '2000-08-28'
WHERE maNV like 'N004';

-- THEM KHACH HANG
insert into khachHang (makh, tenkh, ngaysinh,sdt) values
('KH01','Nguyễn Văn A','2000-08-31','0984727353'),
('KH02','Nguyễn Văn B','1998-06-15','0984227353'),
('KH03','Nguyễn Văn C','2000-02-18','0984527353'),
('KH04','Nguyễn Văn D','1996-05-26','0984627353'),
('KH05','Nguyễn Văn E','1997-09-13','0984827353');

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
INSERT INTO phieuNhap (soPN, maNV, maNCC, ngaynhap, ghichu) values 
('PN01', 'N001', 'NCC01','2023-10-10', 'phieu nhap 01');
INSERT INTO chiTietPhieuNhap (maSP, soPN, soluong, gianhap) values 
('SP01', 'PN01', '10', 6000000),
('SP02', 'PN01', '12', 17000000);

-- Tao phieuNhap PN02
INSERT INTO phieuNhap (soPN, maNV, maNCC, ngaynhap, ghichu) values 
('PN02', 'N002', 'NCC02','2023-10-14', 'phieu nhap 02');
INSERT INTO chiTietPhieuNhap (maSP, soPN, soluong, gianhap) values 
('SP03', 'PN02', '11', 22000000),
('SP04', 'PN02', '14', 1500000);

-- Tao phieuNhap PN03
INSERT INTO phieuNhap (soPN, maNV, maNCC, ngaynhap, ghichu) values 
('PN03', 'N003', 'NCC03','2023-10-15', 'phieu nhap 03');
INSERT INTO chiTietPhieuNhap (maSP, soPN, soluong, gianhap) values 
('SP05', 'PN03', '15', 14000000);

-- ******************
-- Tao phieuXuat PX01
INSERT INTO phieuXuat (soPX, maNV, maKH, ngayban, ghichu) values 
('PX01', 'N005', 'KH01','2023-10-20', 'phieu xuat 01');
INSERT INTO chiTietPhieuXuat (maSP, soPX, soluong, giaban) values 
('SP01', 'PX01', '1', 6200000),
('SP02', 'PX01', '2', 17500000);

-- Tao phieuXuat PX02
INSERT INTO phieuXuat (soPX, maNV, maKH, ngayban, ghichu) values 
('PX02', 'N004', 'KH02','2023-11-2', 'phieu xuat 02');
INSERT INTO chiTietPhieuXuat (maSP, soPX, soluong, giaban) values 
('SP03', 'PX02', '1', 22500000),
('SP04', 'PX02', '1', 1530678);

-- Tao phieuXuat PX03
INSERT INTO phieuXuat (soPX, maNV, maKH, ngayban, ghichu) values 
('PX03', 'N003', 'KH03','2023-12-4', 'phieu xuat 03');
INSERT INTO chiTietPhieuXuat (maSP, soPX, soluong, giaban) values 
('SP02', 'PX03', '3', 17500000),
('SP04', 'PX03', '1', 1530678);

-- Tao phieuXuat PX04
INSERT INTO phieuXuat (soPX, maNV, maKH, ngayban, ghichu) values 
('PX04', 'N002', 'KH02','2023-12-18', 'phieu xuat 04');
INSERT INTO chiTietPhieuXuat (maSP, soPX, soluong, giaban) values 
('SP01', 'PX04', '2', 6200000),
('SP05', 'PX04', '2', 1405678);



-- * Bài 4: Dùng lệnh UPDATE cập nhật dữ liệu các bảng *
-- Cập nhật lại số điện thoại mới cho khách hàng mã KH01
update khachHang set sdt ='0932796671' where maKH like 'kh01';

-- Cập nhật lại địa chỉ mới của nhân viên mã N004
update nhanVien set diachi = 'Thua Thien Hue' where maNV like 'N004';


-- * Bài 5: Dùng lệnh DELETE xóa dữ liệu các bảng *
-- xóa nhân viên
delete from nhanVien where maNV like 'N006';
-- xóa sản phẩm
delete from sanPham where maSP like 'SP06';




-- Bài 6: Dùng lệnh SELECT lấy dữ liệu từ các bảng
-- ***********************************************
-- 6.1: Liệt kê thông tin về nhân viên trong cửa hàng,
-- gồm: mã nhân viên, họ tên nhân viên, giới tính, ngày sinh, địa chỉ, số điện thoại, tuổi. Kết quả sắp xếp theo tuổi
SELECT maNV, hoten, gioitinh, ngaysinh, diachi, dienthoai, year(now()) - year(ngaysinh) as tuoi
FROM nhanVien
ORDER BY tuoi desc;

-- 6.2: Liệt kê các hóa đơn nhập hàng trong tháng 10/2023,
-- gồm thông tin số phiếu nhập, mã nhân viên nhập hàng, họ tên nhân viên, họ tên nhà cung cấp, ngày nhập hàng, ghi chú
SELECT  pn.soPN, pn.maNV, nv.hoten, ncc.tenNCC, pn.ngaynhap
FROM phieuNhap pn 
INNER JOIN nhanVien nv ON pn.maNV = nv.maNV 
INNER JOIN nhaCungCap ncc ON pn.maNCC = ncc.maNCC
WHERE pn.ngaynhap >= '2023-10-1' and  pn.ngaynhap <= '2023-10-30';
-- WHERE pn.ngaynhap between '2023-10-1' and  '2023-10-30';
-- WHERE  month(pn.ngaynhap) = 10 and year(pn.ngaynhap) = 2023;

-- 6.3: Liệt kê tất cả sản phẩm có đơn vị tính là cai, gồm tất cả thông tin về sản phẩm.
SELECT * 
FROM sanPham sp
WHERE sp.donvitinh like 'cai';

-- 6.4: Liệt kê chi tiết nhập hàng trong tháng 10/2023
-- gồm thông tin: số phiếu nhập, mã sản phẩm, tên sản phẩm, loại sản phẩm, đơn vị tính, số lượng, giá nhập, thành tiền.
SELECT ctpn.soPN, ctpn.maSP, sp.tenSP, lsp.tenloaiSP, sp.donvitinh, ctpn.soluong, ctpn.gianhap, ctpn.soluong * ctpn.gianhap as 'thanhtien' 
FROM chiTietPhieuNhap ctpn 
INNER JOIN sanPham sp ON ctpn.maSP = sp.maSP 
INNER JOIN loaiSP lsp ON sp.maloaiSP = lsp.maloaiSP 
INNER JOIN phieuNhap pn ON ctpn.soPN = pn.soPN;

-- 6.5: Liệt kê các nhà cung cấp có giao dịch mua bán trong tháng 10/2023,
-- gồm thông tin: mã nhà cung cấp, họ tên nhà cung cấp, địa chỉ, số điện thoại, email, số phiếu nhập, ngày nhập.
-- Sắp xếp thứ tự theo ngày nhập hàng.
SELECT ncc.maNCC, ncc.tenNCC, ncc.diachi, ncc.dienthoai, ncc.email, pn.soPN, pn.ngaynhap
FROM nhaCungCap ncc
INNER JOIN phieuNhap pn ON ncc.maNCC = pn.maNCC
WHERE month(pn.ngaynhap)=10 and year(pn.ngaynhap)=2023
ORDER BY pn.ngaynhap desc;

-- 6.6: Liệt kê chi tiết hóa đơn bán hàng trong 6 tháng cuối năm 2023
-- gồm thông tin: số phiếu xuất, nhân viên bán hàng, ngày bán, mã sản phẩm, tên sản phẩm, đơn vị tính, số lượng, giá bán, doanh thu.
SELECT ctpx.soPX, nv.hoten as 'nhanVienBanHang', px.ngayban, ctpx.maSP, sp.tenSP, sp.donvitinh, ctpx.soluong, ctpx.giaban, ctpx.soluong * ctpx.giaban as 'doanhThu'
FROM chiTietPhieuXuat ctpx
INNER JOIN phieuXuat px ON ctpx.soPX = px.soPX
INNER JOIN nhanVien nv ON px.maNV = nv.maNV
INNER JOIN sanPham sp ON ctpx.maSP = sp.maSP 
INNER JOIN loaiSP lsp ON sp.maloaiSP = lsp.maloaiSP;

-- 6.7 Hãy in danh sách khách hàng có ngày sinh nhật trong tháng 8 (gồm tất cả thông tin của khách hàng)
SELECT *
FROM khachHang kh
WHERE month(kh.ngaysinh)=8; 

-- 6.8: Liệt kê các hóa đơn bán hàng từ ngày 15/04/2018 đến 15/05/2018
-- gồm các thông tin: số phiếu xuất, nhân viên bán hàng, ngày bán, mã sản phẩm, tên sản phẩm, đơn vị tính, số lượng, giá bán, doanh thu.
SELECT ctpx.soPX, nv.hoten as 'nhanvienbanhang', px.ngayban, ctpx.maSP, sp.tenSP, sp.donvitinh, ctpx.soluong, ctpx.giaban, ctpx.soluong * ctpx.giaban as 'doanhthu'
FROM chiTietPhieuXuat ctpx
INNER JOIN phieuXuat px ON ctpx.soPX = px.soPX
INNER JOIN nhanVien nv ON px.maNV = nv.maNV
INNER JOIN sanPham sp ON ctpx.maSP = sp.maSP 
INNER JOIN loaiSP lsp ON sp.maloaiSP = lsp.maloaiSP
WHERE px.ngayban between '2018-04-15' and '2018-05-15';

-- 6.9: Liệt kê các hóa đơn mua hàng theo từng khách hàng,
-- gồm các thông tin: số phiếu xuất, ngày bán, mã khách hàng, tên khách hàng, trị giá
SELECT px.soPX, px.ngayban, kh.maKH, kh.tenKH, ctpx.soluong * ctpx.giaban as 'trigia'
FROM khachHang kh
INNER JOIN phieuXuat px ON kh.maKH = px.maKH
INNER JOIN chiTietPhieuXuat ctpx ON px.soPX= ctpx.soPX; 

-- 6.10 Cho biết tổng số tivi đã bán trong 6 tháng cuối năm 2023. Thông tin hiển thị: tổng số lượng.
SELECT  sp.maSP, lsp.tenloaiSP, sp.tenSP, SUM(ctpx.soluong) as 'soluong'
FROM chiTietPhieuXuat ctpx
INNER JOIN phieuXuat px ON ctpx.soPX = px.soPX
INNER JOIN sanPham sp ON ctpx.maSP = sp.maSP
INNER JOIN loaiSP lsp ON sp.maloaiSP = lsp.maloaiSP
WHERE sp.maSP = 'SP02' and (px.ngayban between '2023-06-01' and '2023-12-31')
GROUP BY sp.maSP;

-- 6.11: Tổng kết doanh thu theo từng khách hàng theo từng tháng,
-- gồm các thông tin: tháng, mã khách hàng, tên khách hàng, địa chỉ, tổng tiền.
SELECT month(px.ngayban) as 'thang', kh.maKH, kh.tenKH, kh.diachi, ctpx.soluong * ctpx.giaban as 'tongtien'
FROM khachHang kh
INNER JOIN phieuXuat px ON kh.maKH = px.maKH
INNER JOIN chiTietPhieuXuat ctpx ON px.soPX= ctpx.soPX; 

-- 6.12.a: Thống kê tổng số lượng sản phẩm đã bán trong tháng 10 năm 2023,
-- gồm thông tin: năm, tháng, mã sản phẩm, tên sản phẩm, đơn vị tính, tổng số lượng.
SELECT ctpx.maSP, sp.tenSP, sp.donvitinh, SUM(ctpx.soluong) as 'tongsoluong'
FROM chiTietPhieuXuat ctpx
INNER JOIN phieuXuat px ON ctpx.soPX = px.soPX
INNER JOIN sanPham sp ON ctpx.maSP = sp.maSP
WHERE month(px.ngayban)=10
GROUP BY ctpx.maSP;

-- 6.12.b:Thống kê tổng số lượng sản phẩm đã bán theo từng tháng trong năm,
-- gồm thông tin: năm, tháng, mã sản phẩm, tên sản phẩm, đơn vị tính, tổng số lượng.
SELECT year(px.ngayban), month(px.ngayban), ctpx.maSP, sp.tenSP, sp.donvitinh, SUM(ctpx.soluong) as 'tongsoluong'
FROM chiTietPhieuXuat ctpx
INNER JOIN phieuXuat px ON ctpx.soPX = px.soPX
INNER JOIN sanPham sp ON ctpx.maSP = sp.maSP
GROUP BY ctpx.maSP, year(px.ngayban), month(px.ngayban);

-- 6.13: Thống kê doanh thu bán hàng trong trong 6 tháng cuối năm 2023, thông tin hiển thị gồm: tháng, doanh thu
SELECT month(px.ngayban) as 'thang', SUM(ctpx.soluong * ctpx.giaban) as 'doanhthu'
FROM chiTietPhieuXuat ctpx
INNER JOIN phieuXuat px ON ctpx.soPX = px.soPX
WHERE px.ngayban between '2023-06-01' and '2023-12-31'
GROUP BY month(px.ngayban);

-- 6.14: Liệt kê các hóa đơn bán hàng của tháng 10 và tháng 12 năm 2023,
-- gồm các thông tin: số phiếu, ngày bán, họ tên nhân viên bán hàng, họ tên khách hàng, tổng trị giá.
SELECT ctpx.soPX, px.ngayban, nv.hoten as 'nhanvien', kh.tenKH, SUM(ctpx.soluong * ctpx.giaban) as 'tongtrigia'
FROM chiTietPhieuXuat ctpx
INNER JOIN phieuXuat px ON ctpx.soPX = px.soPX
INNER JOIN nhanVien nv ON px.maNV = nv.maNV
INNER JOIN khachHang kh ON px.maKH = kh.maKH
WHERE month(px.ngayban) IN (10,12) and year(px.ngayban) = 2023
-- WHERE (px.ngayban between '2023-10-01' and '2023-10-31') or (px.ngayban between '2023-12-01' and '2023-12-31')
GROUP BY ctpx.soPX;

-- 6.15: Cuối ngày, nhân viên tổng kết các hóa đơn bán hàng trong ngày, thông tin 
-- gồm: số phiếu xuất, mã khách hàng, tên khách hàng, họ tên nhân viên bán hàng, ngày bán, trị giá.
SELECT ctpx.soPX, px.maKH, kh.tenKH, nv.hoten as 'nhanvien', SUM(ctpx.soluong * ctpx.giaban) as 'trigia'
FROM chiTietPhieuXuat ctpx
INNER JOIN phieuXuat px ON ctpx.soPX = px.soPX
INNER JOIN nhanVien nv ON px.maNV = nv.maNV
INNER JOIN khachHang kh ON px.maKH = kh.maKH
-- WHERE day(px.ngayban) = day(now()) and month(px.ngayban) = month(now()) and year(px.ngayban) = year(now())
WHERE px.ngayban between curdate() and now()
GROUP BY ctpx.soPX;

-- 6.16: Thống kê doanh số bán hàng theo từng nhân viên, gồm thông tin: mã nhân 
-- viên, họ tên nhân viên, mã sản phẩm, tên sản phẩm, đơn vị tính, tổng số lượng.
SELECT nv.maNV, nv.hoten, ctpx.maSP, sp.tenSP, sp.donvitinh, ctpx.soluong
FROM nhanVien nv
INNER JOIN phieuXuat px ON nv.maNV = px.maNV
INNER JOIN chiTietPhieuXuat ctpx ON px.soPX = ctpx.soPX
INNER JOIN sanPham sp ON ctpx.maSP = sp.maSP;

-- 6.17: Liệt kê các hóa đơn bán hàng cho khách vãng lai (KH01) trong quý 4/2023, 
-- thông tin gồm số phiếu xuất, ngày bán, mã sản phẩm, tên sản phẩm, đơn vị 
-- tính, số lượng, đơn giá, thành tiền
SELECT px.soPX, px.ngayban, ctpx.maSP, sp.tenSP , sp.donvitinh, ctpx.soluong, ctpx.giaban, ctpx.soluong * ctpx.giaban as 'thanhtien'
FROM khachHang kh
INNER JOIN phieuXuat px ON kh.maKH = px.maKH
INNER JOIN chiTietPhieuXuat ctpx ON px.soPX = ctpx.soPX
INNER JOIN sanPham sp ON ctpx.maSP = sp.maSP
WHERE kh.maKH like 'KH01' and (px.ngayban between '2023-10-01' and '2023-12-31');

-- 6.18: Liệt kê các sản phẩm chưa bán được trong 6 tháng cuối năm 2023, thông tin 
-- gồm: mã sản phẩm, tên sản phẩm, loại sản phẩm, đơn vị tính. 
SELECT sp.maSP, sp.tenSP, lsp.tenloaiSP, sp.donvitinh
FROM sanPham sp
INNER JOIN loaiSP lsp ON sp.maloaiSP = lsp.maloaiSP
WHERE sp.maSP NOT IN (
	SELECT ctpx.maSP
	FROM chiTietPhieuXuat ctpx 
	INNER JOIN phieuXuat px ON px.soPX = ctpx.soPX
	WHERE px.ngayban between '2023-06-01' and '2023-12-31'
);

-- 6.19: Liệt kê danh sách nhà cung cấp không giao dịch mua bán với cửa hàng trong 
-- quý 4/2023, gồm thông tin: mã nhà cung cấp, tên nhà cung cấp, địa chỉ, số điện thoại. 
SELECT ncc.maNCC, ncc.tenNCC, ncc.diachi, ncc.dienthoai
FROM nhaCungCap ncc
WHERE ncc.maNCC NOT IN (
	SELECT ncc.maNCC
	FROM  nhaCungCap ncc
	INNER JOIN phieuNhap pn ON pn.maNCC = ncc.maNCC
	WHERE pn.ngaynhap between '2023-10-01' and '2023-12-31'
);
-- 6.20: Cho biết khách hàng có tổng trị giá đơn hàng lớn nhất trong 6 tháng cuối năm 2023.
SELECT kh.maKH, kh.tenKH, SUM(ctpx.soluong * ctpx.giaban) as 'tongtien'
FROM khachHang kh
INNER JOIN phieuXuat px ON kh.maKH = px.maKH
INNER JOIN chiTietPhieuXuat ctpx ON px.soPX= ctpx.soPX
GROUP BY kh.maKH
ORDER BY SUM(ctpx.soluong * ctpx.giaban) desc
LIMIT 1; 

-- 6.21: Cho biết mã khách hàng và số lượng đơn đặt hàng của mỗi khách hàng.
SELECT kh.maKH, COUNT(kh.maKH) as 'soluongdondathang'
FROM khachHang kh
INNER JOIN phieuXuat px ON px.maKH = kh.maKH
GROUP BY kh.maKH;  

-- 6.22: Cho biết mã nhân viên, tên nhân viên, tên khách hàng kể cả những nhân viên không đại diện bán hàng.
ALTER TABLE nhanVien
ADD viTri bit default 0; -- 0 là công việc khác, 1 là đại diện bán hàng

UPDATE nhanVien 
SET viTri = 1
WHERE maNV IN ('N002', 'N003', 'N004', 'N005');

SELECT nv.maNV, nv.hoten, nv.viTri, kh.tenKH
FROM nhanVien nv
LEFT JOIN phieuXuat px ON nv.maNV = px.maNV
LEFT JOIN khachHang kh ON px.maKH = kh.maKH;

-- 6.23: Cho biết số lượng nhân viên nam, số lượng nhân viên nữ
-- 0 là nữ, 1 là nam
UPDATE nhanVien 
SET gioitinh = 0
WHERE maNV like 'N005';

SELECT nv.gioitinh, COUNT(nv.gioitinh) as 'soluong'
FROM nhanVien nv
GROUP BY nv.gioitinh;

-- 6.24: Cho biết mã nhân viên, tên nhân viên, số năm làm việc của những nhân viên có thâm niên cao nhất.
SELECT nv.maNV, nv.hoten, year(curdate()) - year(nv.ngayvaolam) as 'sonamlamviec'
FROM nhanVien nv
ORDER BY year(curdate()) - year(nv.ngayvaolam) desc;

-- 6.25: Hãy cho biết họ tên của những nhân viên đã đến tuổi về hưu (nam:60 tuổi, nữ: 55 tuổi)
ALTER TABLE nhanVien
ADD trangthailamviec bit default 0; -- 0 là đang làm việc 1 là đã nghỉ hưu

SELECT nv.maNV, nv.hoten, nv.gioitinh, year(curdate()) - year(nv.ngaysinh) as 'tuoihientai', nv.trangThai
FROM nhanVien nv
WHERE nv.gioitinh = 0 and (year(curdate()) - year(nv.ngaysinh) >= 55)  OR  nv.gioitinh = 1 and (year(curdate()) - year(nv.ngaysinh) >= 60);

-- 6.26: Hãy cho biết họ tên của nhân viên và năm về hưu của họ.
SELECT nv.maNV, nv.hoten, nv.gioitinh, 
	CASE 
		WHEN GioiTinh = 1 THEN YEAR(nv.ngaysinh) + 60 -- Nam về hưu ở tuổi 60
		WHEN GioiTinh = 0 THEN YEAR(nv.ngaysinh) + 55 -- Nữ về hưu ở tuổi 55
        ELSE NULL -- Trường hợp khác không xác định
    END AS 'NamVeHuu'
FROM nhanVien nv;
