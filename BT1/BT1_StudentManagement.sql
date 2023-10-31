-- Tạo database
CREATE SCHEMA `student-management` ;

-- Xóa database
-- DROP DATABASE `student-management`;

CREATE TABLE `student-management`.`class`(
  `id` INT primary key auto_increment,
  `name` VARCHAR(45));
  
  CREATE TABLE `student-management`.`teacher`(
  `id` INT primary key auto_increment,
  `name` VARCHAR(45),
  `age` INT,
  `country` VARCHAR(45));