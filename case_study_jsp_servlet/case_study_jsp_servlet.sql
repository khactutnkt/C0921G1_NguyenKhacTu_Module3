drop database if exists case_study_jsp_servlet;
create database case_study_jsp_servlet;
use case_study_jsp_servlet;

create table `position`(
	position_id int primary key,
    position_name varchar(45)
);

create table education_degree(
	education_degree_id int primary key,
    education_degree_name varchar(45)
);

create table division(
	division_id int primary key,
    division_name varchar(45)
);

create table `role`(
	role_id int primary key,
    role_name varchar(255)
);

create table `user`(
	username varchar(255) primary key,
    `password` varchar(255)
);

create table user_role(
	role_id int,
    username varchar(255),
    foreign key (role_id) references role (role_id),
    foreign key (username) references `user` (username),
    primary key (role_id, username)
);

create table employee(
	employee_id int primary key,
    employee_name varchar(45),
    employee_birthday date,
    employee_id_card varchar(45),
    employee_salary double,
    employee_phone varchar(45),
    employee_email varchar(45),
    employee_address varchar(45),
    position_id int,
    education_degree_id int,
    division_id int,
    username varchar(255),
    exist int default 1,
    -- exist = 1 : tồn tại, exist = 0 : đã xóa
    foreign key (position_id) references `position` (position_id),
    foreign key (education_degree_id) references education_degree (education_degree_id),
    foreign key (division_id) references division (division_id),
    foreign key (username) references `user` (username)
);

create table customer_type(
	customer_type_id int primary key,
    customer_type_name varchar(45)
);

create table customer(
	customer_id varchar(10) primary key,
    customer_type_id int,
    customer_name varchar(45),
    customer_birthday date,
    customer_gender bit(1),
    customer_id_card varchar(45),
    customer_phone varchar(45),
    customer_email varchar(45),
    customer_address varchar(45),
    exist int default 1,
    -- exist = 1 : tồn tại, exist = 0 : đã xóa
    foreign key (customer_type_id) references customer_type (customer_type_id)
);

create table rent_type(
	rent_type_id int primary key,
    rent_type_name varchar(45),
    rent_type_cost double
);

create table service_type(
	service_type_id int primary key,
    service_type_name varchar(45)
);

create table service(
	service_id varchar(10) primary key,
    service_name varchar(45),
    service_area int,
    service_cost double,
    service_max_people int,
    rent_type_id int,
    service_type_id int,
    standard_room varchar(45),
    description_other_convenience varchar(45),
    pool_area double,
    number_of_floors int,
    exist int default 1,
    -- exist = 1 : tồn tại, exist = 0 : đã xóa
    foreign key (rent_type_id) references rent_type (rent_type_id),
    foreign key (service_type_id) references service_type (service_type_id)
);

create table contract(
	contract_id int primary key,
    contract_start_date datetime,
    contract_end_date datetime,
    contract_deposit double,
    contract_total_money double,
    employee_id int,
    customer_id varchar(10),
    service_id varchar(10),
    foreign key (employee_id) references employee (employee_id),
    foreign key (customer_id) references customer (customer_id),
    foreign key (service_id) references service (service_id)
);

create table attach_service(
	attach_service_id int primary key,
    attach_service_name varchar(45),
    attach_service_cost double,
    attach_service_unit int,
    attach_service_status varchar(45)
);



create table contract_detail(
	contract_detail_id int primary key,
    contract_id int,
    attach_service_id int,
    quantity int,
    foreign key (contract_id) references contract (contract_id),
    foreign key (attach_service_id) references attach_service (attach_service_id)
);


insert into attach_service
values
(1, "as1", 10000, 10, "status1"),
(2, "as2", 20000, 20, "status2"),
(3, "as3", 30000, 30, "status3"),
(4, "as4", 40000, 40, "status4");


insert into rent_type
values 
(1, "rent_type1", 1000),
(2, "rent_type2", 2000),
(3, "rent_type3", 3000),
(4, "rent_type4", 4000);

insert into service_type
values
(1, "service_type1"),
(2, "service_type2"),
(3, "service_type3"),
(4, "service_type4");

insert into service
values
("DV-0001", "Villa", 1000, 11000, 5, 1, 1, "stabdard1", "description1", 100, 5, 1),
("DV-0002", "House", 2000, 22000, 6, 2, 2, "stabdard2", "description2", 200, 6, 1),
("DV-0003", "Room", 3000, 33000, 7, 3, 3, "stabdard3", "description3", 300, 7, 1);

insert into position
values
(1, "position1"),
(2, "position2"),
(3, "position3"),
(4, "position4");

insert into education_degree
values
(1, "education_degree1"),
(2, "education_degree2"),
(3, "education_degree3"),
(4, "education_degree4");

insert into division
values
(1, "division1"),
(2, "division2"),
(3, "division3"),
(4, "division4");

insert into role
values
(1, "role1"),
(2, "role2"),
(3, "role3"),
(4, "role4");

insert into user
values
("username1", "password1"),
("username2", "password2"),
("username3", "password3"),
("username4", "password4"),
("username5", "password5");

insert into user_role
values
(1, "username1"),
(2, "username2"),
(3, "username3"),
(4, "username4");

insert into employee
values
(1, "Nguyễn Văn An", "2000-12-12", "111111111", 11000, "0900111111", "vanan@gmail.com", "Đà Nẵng", 1, 1, 1, "username1", 1),
(2, "Nguyễn Ngọc Anh", "1998-11-11", "222222222", 22000, "0900111111", "ngocanh@gmail.com", "Quảng Trị", 1, 1, 1, "username2", 1),
(3, "Hoàng Dung", "2002-10-10", "333333333", 33000, "0900333333", "hoangdung@gmail.com", "Đà Nẵng", 1, 1, 1, "username3", 1),
(4, "Trần văn Kỷ", "2000-06-06", "444444444", 44000, "0900444444", "tranvanky@gmail.com", "Hà Nội", 1, 1, 1, "username4", 1),
(5, "Nguyễn Hiền", "2001-03-03", "555555555", 55000, "0900555555", "nguyenhien@gmail.com", "Đà Nẵng", 1, 1, 1, "username5", 1);

insert into customer_type
values
(1, "customer_type1"),
(2, "customer_type2"),
(3, "customer_type3"),
(4, "customer_type4"),
(5, "customer_type5");

insert into customer
values
("KH-0001", 1, "Lê Minh", "2000-06-12", 1, "666666666", "033111111", "leminh@gmail.com", "Đà Nẵng", 1),
("KH-0002", 2, "Lê Thuận", "2001-11-11", 1, "777777777", "033222222", "leminh@gmail.com", "Đà Nẵng", 1),
("KH-0003", 3, "Lê Hồng", "2002-08-02", 1, "888888888", "033333333", "leminh@gmail.com", "Đà Nẵng", 1),
("KH-0004", 4, "Lê Nhân", "2000-07-11", 1, "999999999", "03344444444", "leminh@gmail.com", "Đà Nẵng", 1);

insert into contract
values
(1, "2021-12-12", "2022-12-27", 11000, 19000, 1, "KH-0001", "DV-0001"),
(2, "2021-12-31", "2022-01-10", 12000, 29000, 2, "KH-0002", "DV-0002"),
(3, "2022-01-03", "2022-01-17", 13000, 39000, 3, "KH-0003", "DV-0003");

insert into contract_detail
values
(1, 1, 1, 10),
(2, 2, 2, 20),
(3, 3, 3, 30);