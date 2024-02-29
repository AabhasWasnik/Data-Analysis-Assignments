
# AABHAS WASNIK 

# Q1 - 
drop table university ;
CREATE TABLE university (
ID int primary key,
Name varchar(100)
);

INSERT INTO university VALUES (1, " Pune   University "),
(2, " Mumbai   University "),
(3, " Delhi  University "),
(4, "Madras University"),
(5, "Nagpur University");

set sql_safe_updates=0;
UPDATE university SET Name = REPLACE(Name,'  ','');

SELECT * FROM university;