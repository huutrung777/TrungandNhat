	create database if not exists quan_ly_ban_hang;
	use quan_ly_ban_hang;
	create table tai_khoan (
    id int auto_increment primary key,
    username varchar(50) not null unique,
    password varchar(255) not null,
    email varchar(100) not null unique,
    role enum('admin', 'khachhang') default 'khachhang'
	);

	create table nguoi_dung (
    ma_nd int auto_increment primary key,
    ma_tk int not null,
    ho_ten varchar(50) not null,
    so_dien_thoai varchar(15),
    gioi_tinh enum('nam', 'nu'),
    ngay_sinh date,
    constraint fk_nguoi_dung_tai_khoan
        foreign key (ma_tk) references tai_khoan(id)
        on delete cascade
	);

	create table danh_muc (
    id int auto_increment primary key,
    ten_danh_muc varchar(50) not null
	);

	create table san_pham (
    ma_sp int auto_increment primary key,
    ten_sp varchar(100) not null,
    so_luong int not null,
    gia_ban decimal(10,2) not null,
    anh varchar(255),
    danh_muc_id int,
    constraint fk_san_pham_danh_muc
        foreign key (danh_muc_id) references danh_muc(id)
	);

	create table don_hang (
    ma_dh int auto_increment primary key,
    ma_nd int not null,
    ngay_dat datetime default current_timestamp,
    trang_thai enum('cho_xac_nhan', 'dang_giao', 'hoan_thanh', 'da_huy')
        default 'cho_xac_nhan',
    tong_tien decimal(12,2) not null,
    dia_chi_giao_hang varchar(255) not null,
    constraint fk_don_hang_nguoi_dung
        foreign key (ma_nd) references nguoi_dung(ma_nd)
        on delete cascade
	);

insert into tai_khoan(username, password, email, role)
values 
('trung', '0905652288', 'trung123@gmail.com', 'admin'),
('nhat', '123', 'nhat@gmail.com', 'admin');
select * from tai_khoan;
select * from san_pham;
select * from tai_khoan;
