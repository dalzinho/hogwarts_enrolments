DROP TABLE students CASCADE;
DROP TABLE houses CASCADE;

CREATE TABLE houses(
house_id SERIAL4 primary key,
house_name varchar(255),
logo_url varchar(255)
);

CREATE TABLE students(
student_id SERIAL4 primary key,
first_name varchar(255),
second_name varchar(255),
house INT4 references houses(house_id),
age INT2 
);