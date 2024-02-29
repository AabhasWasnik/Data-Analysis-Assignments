
# AABHAS WASNIK 

# Q1 -  
drop table facility ;
CREATE TABLE facility (
Facility_ID int not null,
Name varchar(100),
State varchar(100),
Country varchar(100)
);
ALTER TABLE facility MODIFY COLUMN Facility_ID int primary key auto_increment;
ALTER TABLE facility ADD COLUMN city varchar(100) not null after name;
describe facility;