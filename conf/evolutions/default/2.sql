# --- !Ups
-- Insert Units
INSERT INTO unit(Name) VALUES ('Palliative'), ('Children'), ('Surgical');

-- Insert employee types
INSERT INTO employee_type(Employee_Type, Rate, Seniority_Multiplier, Overtime_Rate, Access_Level) VALUES ('Administrator', 2, 3, 4, 5);
INSERT INTO employee_type(Employee_Type, Rate, Seniority_Multiplier, Overtime_Rate, Access_Level) VALUES ('Director', 2, 3, 4, 6);
INSERT INTO employee_type(Employee_Type, Rate, Seniority_Multiplier, Overtime_Rate, Access_Level) VALUES ('Doctor', 2, 3, 4, 4);
INSERT INTO employee_type(Employee_Type, Rate, Seniority_Multiplier, Overtime_Rate, Access_Level) VALUES ('Nurse', 2, 3, 4, 1);
INSERT INTO employee_type(Employee_Type, Rate, Seniority_Multiplier, Overtime_Rate, Access_Level) VALUES ('ShiftSupervisor', 2, 3, 4, 2);
INSERT INTO employee_type(Employee_Type, Rate, Seniority_Multiplier, Overtime_Rate, Access_Level) VALUES ('Intern', 2, 3, 4, 3);
INSERT INTO employee_type(Employee_Type, Rate, Seniority_Multiplier, Overtime_Rate, Access_Level) VALUES ('Resident', 2, 3, 4, 3);
INSERT INTO employee_type(Employee_Type, Rate, Seniority_Multiplier, Overtime_Rate, Access_Level) VALUES ('Technician', 2, 3, 4, 0);

-- Insert employeeList
-- INSERT INTO employee (`Last_Name`,`First_Name`,`Hire_Date`,`Years_Experience`,`user_name`,`password`,`unit_id`,`employee_type_id`) VALUES ('Ayala','Arden','1899-12-30',2,'t5Q7Y6','kTaLjNrj',3,2);
-- INSERT INTO employee (`Last_Name`,`First_Name`,`Hire_Date`,`Years_Experience`,`user_name`,`password`,`unit_id`,`employee_type_id`) VALUES ('Harper','Wanda','1899-12-30',9,'Nr8dmO','DBCnkb',3,5);
-- INSERT INTO employee (`Last_Name`,`First_Name`,`Hire_Date`,`Years_Experience`,`user_name`,`password`,`unit_id`,`employee_type_id`) VALUES ('Reed','Lael','1899-12-30',12,'APmbSk','LCouzgo',3,1);
-- INSERT INTO employee (`Last_Name`,`First_Name`,`Hire_Date`,`Years_Experience`,`user_name`,`password`,`unit_id`,`employee_type_id`) VALUES ('Dunlap','Rhea','1899-12-30',1,'lW2RAG','nDPow',1,2);
-- INSERT INTO employee (`Last_Name`,`First_Name`,`Hire_Date`,`Years_Experience`,`user_name`,`password`,`unit_id`,`employee_type_id`) VALUES ('Garrison','Dane','1899-12-30',14,'6m0eop','rEBNrh',3,1);
-- INSERT INTO employee (`Last_Name`,`First_Name`,`Hire_Date`,`Years_Experience`,`user_name`,`password`,`unit_id`,`employee_type_id`) VALUES ('Villarreal','Sasha','1899-12-30',12,'sj08Ui','dOapcmJ',2,3);
-- INSERT INTO employee (`Last_Name`,`First_Name`,`Hire_Date`,`Years_Experience`,`user_name`,`password`,`unit_id`,`employee_type_id`) VALUES ('Aguilar','Irene','1899-12-30',12,'8lwsPZ','hPEsdzx',2,7);
-- INSERT INTO employee (`Last_Name`,`First_Name`,`Hire_Date`,`Years_Experience`,`user_name`,`password`,`unit_id`,`employee_type_id`) VALUES ('Smith','Mufutau','1899-12-30',4,'60kPNl','aWyzkHX',3,2);
-- INSERT INTO employee (`Last_Name`,`First_Name`,`Hire_Date`,`Years_Experience`,`user_name`,`password`,`unit_id`,`employee_type_id`) VALUES ('Lester','Avram','1899-12-30',1,'iU6qhU','EnntTlI',2,3);
-- INSERT INTO employee (`Last_Name`,`First_Name`,`Hire_Date`,`Years_Experience`,`user_name`,`password`,`unit_id`,`employee_type_id`) VALUES ('Levy','Signe','1899-12-30',12,'ana7fY','lsUXN',1,7);
-- INSERT INTO employee (`Last_Name`,`First_Name`,`Hire_Date`,`Years_Experience`,`user_name`,`password`,`unit_id`,`employee_type_id`) VALUES ('Norton','Adrienne','1899-12-30',14,'ZkX8PD','elbnN',2,5);
-- INSERT INTO employee (`Last_Name`,`First_Name`,`Hire_Date`,`Years_Experience`,`user_name`,`password`,`unit_id`,`employee_type_id`) VALUES ('Nguyen','Halee','1899-12-30',17,'IlEkJe','gkGys',3,1);
-- INSERT INTO employee (`Last_Name`,`First_Name`,`Hire_Date`,`Years_Experience`,`user_name`,`password`,`unit_id`,`employee_type_id`) VALUES ('Hardy','Abigail','1899-12-30',5,'uio7Dk','IEglQGYO',3,4);
-- INSERT INTO employee (`Last_Name`,`First_Name`,`Hire_Date`,`Years_Experience`,`user_name`,`password`,`unit_id`,`employee_type_id`) VALUES ('Nash','Charlotte','1899-12-30',5,'ajfnaU','HsEAuOvE',1,1);
-- INSERT INTO employee (`Last_Name`,`First_Name`,`Hire_Date`,`Years_Experience`,`user_name`,`password`,`unit_id`,`employee_type_id`) VALUES ('Graves','Genevieve','1899-12-30',19,'OTZDJj','WqAdYV',3,8);
-- INSERT INTO employee (`Last_Name`,`First_Name`,`Hire_Date`,`Years_Experience`,`user_name`,`password`,`unit_id`,`employee_type_id`) VALUES ('Reed','Shana','1899-12-30',10,'FJbqOw','HBOUsFI',2,4);
-- INSERT INTO employee (`Last_Name`,`First_Name`,`Hire_Date`,`Years_Experience`,`user_name`,`password`,`unit_id`,`employee_type_id`) VALUES ('Lucas','Jaden','1899-12-30',19,'awZjRI','WAPRuj',3,8);
-- INSERT INTO employee (`Last_Name`,`First_Name`,`Hire_Date`,`Years_Experience`,`user_name`,`password`,`unit_id`,`employee_type_id`) VALUES ('Zimmerman','Uriah','1899-12-30',1,'poiRFJ','URtUwd',2,6);
-- INSERT INTO employee (`Last_Name`,`First_Name`,`Hire_Date`,`Years_Experience`,`user_name`,`password`,`unit_id`,`employee_type_id`) VALUES ('Hahn','Neve','1899-12-30',10,'x93C6a','HOpRL',2,2);
-- INSERT INTO employee (`Last_Name`,`First_Name`,`Hire_Date`,`Years_Experience`,`user_name`,`password`,`unit_id`,`employee_type_id`) VALUES ('Rodriguez','Maris','1899-12-30',17,'2mIqVW','tBpJXbeQ',3,3);
-- INSERT INTO employee (`Last_Name`,`First_Name`,`Hire_Date`,`Years_Experience`,`user_name`,`password`,`unit_id`,`employee_type_id`) VALUES ('Frost','Ryan','1899-12-30',11,'fiOWl1','lFkdwvM',3,7);
-- INSERT INTO employee (`Last_Name`,`First_Name`,`Hire_Date`,`Years_Experience`,`user_name`,`password`,`unit_id`,`employee_type_id`) VALUES ('Cunningham','Richard','1899-12-30',7,'CEdlsn','GquOzn',3,6);
-- INSERT INTO employee (`Last_Name`,`First_Name`,`Hire_Date`,`Years_Experience`,`user_name`,`password`,`unit_id`,`employee_type_id`) VALUES ('Campbell','Kessie','1899-12-30',3,'0XxsJf','mqtBe',2,2);
-- INSERT INTO employee (`Last_Name`,`First_Name`,`Hire_Date`,`Years_Experience`,`user_name`,`password`,`unit_id`,`employee_type_id`) VALUES ('Ayala','Philip','1899-12-30',16,'jVCtFe','SdvgIJZJ',2,5);
-- INSERT INTO employee (`Last_Name`,`First_Name`,`Hire_Date`,`Years_Experience`,`user_name`,`password`,`unit_id`,`employee_type_id`) VALUES ('Quinn','Christopher','1899-12-30',1,'7SVS3D','wIjHjz',1,7);
-- INSERT INTO employee (`Last_Name`,`First_Name`,`Hire_Date`,`Years_Experience`,`user_name`,`password`,`unit_id`,`employee_type_id`) VALUES ('Hancock','Lucas','1899-12-30',5,'Y6x1Fd','lNfrWEg',3,1);
-- INSERT INTO employee (`Last_Name`,`First_Name`,`Hire_Date`,`Years_Experience`,`user_name`,`password`,`unit_id`,`employee_type_id`) VALUES ('Lott','Vance','1899-12-30',15,'xF30xK','gQABaL',2,4);
-- INSERT INTO employee (`Last_Name`,`First_Name`,`Hire_Date`,`Years_Experience`,`user_name`,`password`,`unit_id`,`employee_type_id`) VALUES ('Oconnor','Pandora','1899-12-30',19,'yGfRQT','pmCot',3,6);
-- INSERT INTO employee (`Last_Name`,`First_Name`,`Hire_Date`,`Years_Experience`,`user_name`,`password`,`unit_id`,`employee_type_id`) VALUES ('Dawson','Kasimir','1899-12-30',1,'3WU0f4','jaLSqAsP',3,7);
-- INSERT INTO employee (`Last_Name`,`First_Name`,`Hire_Date`,`Years_Experience`,`user_name`,`password`,`unit_id`,`employee_type_id`) VALUES ('Preston','Patrick','1899-12-30',19,'GIVXCG','aDvtTwv',1,3);
-- INSERT INTO employee (`Last_Name`,`First_Name`,`Hire_Date`,`Years_Experience`,`user_name`,`password`,`unit_id`,`employee_type_id`) VALUES ('Melton','Craig','1899-12-30',15,'MZFapP','domOhjIz',1,6);
-- INSERT INTO employee (`Last_Name`,`First_Name`,`Hire_Date`,`Years_Experience`,`user_name`,`password`,`unit_id`,`employee_type_id`) VALUES ('Reilly','Kimberly','1899-12-30',5,'LdTz9r','wOLKE',2,8);
-- INSERT INTO employee (`Last_Name`,`First_Name`,`Hire_Date`,`Years_Experience`,`user_name`,`password`,`unit_id`,`employee_type_id`) VALUES ('Estes','Paula','1899-12-30',15,'Gu3CkW','LqOgagv',1,8);
-- INSERT INTO employee (`Last_Name`,`First_Name`,`Hire_Date`,`Years_Experience`,`user_name`,`password`,`unit_id`,`employee_type_id`) VALUES ('Horton','Trevor','1899-12-30',12,'ZjJws7','pQfBpUS',1,5);
-- INSERT INTO employee (`Last_Name`,`First_Name`,`Hire_Date`,`Years_Experience`,`user_name`,`password`,`unit_id`,`employee_type_id`) VALUES ('Mcdaniel','Giselle','1899-12-30',6,'D16Myg','TBdap',2,6);
-- INSERT INTO employee (`Last_Name`,`First_Name`,`Hire_Date`,`Years_Experience`,`user_name`,`password`,`unit_id`,`employee_type_id`) VALUES ('Clarke','Lisandra','1899-12-30',1,'Hi1kEY','tZOkCF',1,3);
-- INSERT INTO employee (`Last_Name`,`First_Name`,`Hire_Date`,`Years_Experience`,`user_name`,`password`,`unit_id`,`employee_type_id`) VALUES ('Bartlett','Cassandra','1899-12-30',13,'Sa81aa','YALfk',3,6);
-- INSERT INTO employee (`Last_Name`,`First_Name`,`Hire_Date`,`Years_Experience`,`user_name`,`password`,`unit_id`,`employee_type_id`) VALUES ('Underwood','Quinn','1899-12-30',11,'5aNfY7','PoQAz',1,3);
-- INSERT INTO employee (`Last_Name`,`First_Name`,`Hire_Date`,`Years_Experience`,`user_name`,`password`,`unit_id`,`employee_type_id`) VALUES ('Cain','Kiayada','1899-12-30',9,'xxexqP','FdTkfdu',3,8);
-- INSERT INTO employee (`Last_Name`,`First_Name`,`Hire_Date`,`Years_Experience`,`user_name`,`password`,`unit_id`,`employee_type_id`) VALUES ('Herman','Chadwick','1899-12-30',2,'0ZvSlu','ScAGJNhe',3,7);
-- INSERT INTO employee (`Last_Name`,`First_Name`,`Hire_Date`,`Years_Experience`,`user_name`,`password`,`unit_id`,`employee_type_id`) VALUES ('Elliott','Forrest','1899-12-30',20,'gTpqAV','flUhNzM',1,2);
-- INSERT INTO employee (`Last_Name`,`First_Name`,`Hire_Date`,`Years_Experience`,`user_name`,`password`,`unit_id`,`employee_type_id`) VALUES ('Carson','Freya','1899-12-30',11,'hMII7g','FHMSir',1,1);
-- INSERT INTO employee (`Last_Name`,`First_Name`,`Hire_Date`,`Years_Experience`,`user_name`,`password`,`unit_id`,`employee_type_id`) VALUES ('Barrett','Garrett','1899-12-30',6,'BPIPms','EkRCmAbS',1,7);
-- INSERT INTO employee (`Last_Name`,`First_Name`,`Hire_Date`,`Years_Experience`,`user_name`,`password`,`unit_id`,`employee_type_id`) VALUES ('Bass','Leonard','1899-12-30',1,'t82vJk','PwAIqU',1,3);
-- INSERT INTO employee (`Last_Name`,`First_Name`,`Hire_Date`,`Years_Experience`,`user_name`,`password`,`unit_id`,`employee_type_id`) VALUES ('Cox','Howard','1899-12-30',18,'okMZEF','LpYBlv',1,3);
-- INSERT INTO employee (`Last_Name`,`First_Name`,`Hire_Date`,`Years_Experience`,`user_name`,`password`,`unit_id`,`employee_type_id`) VALUES ('Fuller','Nayda','1899-12-30',17,'Ayil8y','qHINmXSc',1,7);
-- INSERT INTO employee (`Last_Name`,`First_Name`,`Hire_Date`,`Years_Experience`,`user_name`,`password`,`unit_id`,`employee_type_id`) VALUES ('Gardner','Kiayada','1899-12-30',4,'rSPMt1','MZGNPt',3,7);
-- INSERT INTO employee (`Last_Name`,`First_Name`,`Hire_Date`,`Years_Experience`,`user_name`,`password`,`unit_id`,`employee_type_id`) VALUES ('Campos','Stuart','1899-12-30',11,'G3XLRa','mxRqCNK',1,1);
-- INSERT INTO employee (`Last_Name`,`First_Name`,`Hire_Date`,`Years_Experience`,`user_name`,`password`,`unit_id`,`employee_type_id`) VALUES ('Bennett','Simon','1899-12-30',13,'N6OFYe','WsunfU',2,1);
-- INSERT INTO employee (`Last_Name`,`First_Name`,`Hire_Date`,`Years_Experience`,`user_name`,`password`,`unit_id`,`employee_type_id`) VALUES ('Contreras','Keane','1899-12-30',12,'b6Ou9a','ZLcVwQg',1,5);


-- ====================================================================================================================
INSERT INTO `employee` (`Last_Name`,`First_Name`,`Hire_Date`,`Years_Experience`,`user_name`,`password`,`unit_id`,`employee_type_id`) VALUES ("May","Riggs","2010-06-04",14,"MWQ58D6HG","JCG97KPB1UQ",2,5);
INSERT INTO `employee` (`Last_Name`,`First_Name`,`Hire_Date`,`Years_Experience`,`user_name`,`password`,`unit_id`,`employee_type_id`) VALUES ("Ramona","Matthews","2011-09-18",15,"SLD65M1JL","BCG03AHH4VH",3,4);
INSERT INTO `employee` (`Last_Name`,`First_Name`,`Hire_Date`,`Years_Experience`,`user_name`,`password`,`unit_id`,`employee_type_id`) VALUES ("Kaseem","Hunter","2014-06-05",5,"GXT51Q2SP","HQO07AVO6BB",3,5);
INSERT INTO `employee` (`Last_Name`,`First_Name`,`Hire_Date`,`Years_Experience`,`user_name`,`password`,`unit_id`,`employee_type_id`) VALUES ("Kimberley","Pugh","2011-04-24",6,"ZNK09G8FB","KIO22FPY6KL",3,8);
INSERT INTO `employee` (`Last_Name`,`First_Name`,`Hire_Date`,`Years_Experience`,`user_name`,`password`,`unit_id`,`employee_type_id`) VALUES ("Adele","Glass","2012-02-26",18,"KWB42Q4NF","ELR91NFQ5JJ",3,3);
INSERT INTO `employee` (`Last_Name`,`First_Name`,`Hire_Date`,`Years_Experience`,`user_name`,`password`,`unit_id`,`employee_type_id`) VALUES ("Iola","Evans","2010-11-12",12,"SSF91G1FT","SLF49URD8RM",2,4);
INSERT INTO `employee` (`Last_Name`,`First_Name`,`Hire_Date`,`Years_Experience`,`user_name`,`password`,`unit_id`,`employee_type_id`) VALUES ("Kieran","Finley","2010-10-14",1,"BNV84D9PT","YJW83SYT4PE",3,3);
INSERT INTO `employee` (`Last_Name`,`First_Name`,`Hire_Date`,`Years_Experience`,`user_name`,`password`,`unit_id`,`employee_type_id`) VALUES ("Samson","Ashley","2010-11-11",10,"XRW84G5VD","YGH68QUB5FB",1,1);
INSERT INTO `employee` (`Last_Name`,`First_Name`,`Hire_Date`,`Years_Experience`,`user_name`,`password`,`unit_id`,`employee_type_id`) VALUES ("Austin","Knox","2012-10-19",9,"PTN01R0SH","BEP54MWT2IM",2,2);
INSERT INTO `employee` (`Last_Name`,`First_Name`,`Hire_Date`,`Years_Experience`,`user_name`,`password`,`unit_id`,`employee_type_id`) VALUES ("Arden","Chambers","2010-06-11",7,"YGL27G4CB","LTH46XIW1PB",2,3);
INSERT INTO `employee` (`Last_Name`,`First_Name`,`Hire_Date`,`Years_Experience`,`user_name`,`password`,`unit_id`,`employee_type_id`) VALUES ("Haley","Hickman","2013-02-12",11,"NXB72X3VH","ZPX49UXW5LQ",2,4);
INSERT INTO `employee` (`Last_Name`,`First_Name`,`Hire_Date`,`Years_Experience`,`user_name`,`password`,`unit_id`,`employee_type_id`) VALUES ("Anjolie","Lopez","2011-11-17",6,"GFL00P7MS","HZI64QXS3WI",2,5);
INSERT INTO `employee` (`Last_Name`,`First_Name`,`Hire_Date`,`Years_Experience`,`user_name`,`password`,`unit_id`,`employee_type_id`) VALUES ("Kevin","Bullock","2010-09-14",20,"KLK57T4PK","NCF73XZO7JR",2,7);
INSERT INTO `employee` (`Last_Name`,`First_Name`,`Hire_Date`,`Years_Experience`,`user_name`,`password`,`unit_id`,`employee_type_id`) VALUES ("Xavier","Obrien","2012-05-11",20,"XQW09F9LD","XRO36QYQ3BI",2,1);
INSERT INTO `employee` (`Last_Name`,`First_Name`,`Hire_Date`,`Years_Experience`,`user_name`,`password`,`unit_id`,`employee_type_id`) VALUES ("Ahmed","Herrera","2014-05-28",19,"KHX34W9BY","VZJ75ITZ3LO",2,1);
INSERT INTO `employee` (`Last_Name`,`First_Name`,`Hire_Date`,`Years_Experience`,`user_name`,`password`,`unit_id`,`employee_type_id`) VALUES ("Alexis","Franklin","2013-05-26",1,"XJH27C5QS","BXX49BGZ4IT",2,8);
INSERT INTO `employee` (`Last_Name`,`First_Name`,`Hire_Date`,`Years_Experience`,`user_name`,`password`,`unit_id`,`employee_type_id`) VALUES ("Gage","Craig","2011-09-19",15,"DML14X6YG","UMX26VBT2TG",2,3);
INSERT INTO `employee` (`Last_Name`,`First_Name`,`Hire_Date`,`Years_Experience`,`user_name`,`password`,`unit_id`,`employee_type_id`) VALUES ("Salvador","Whitehead","2013-02-07",18,"KXC77W7FT","QPA74WEG5SF",1,2);
INSERT INTO `employee` (`Last_Name`,`First_Name`,`Hire_Date`,`Years_Experience`,`user_name`,`password`,`unit_id`,`employee_type_id`) VALUES ("Ross","Hines","2010-08-01",8,"KHR61N0CF","JCX02YYF9XC",1,4);
INSERT INTO `employee` (`Last_Name`,`First_Name`,`Hire_Date`,`Years_Experience`,`user_name`,`password`,`unit_id`,`employee_type_id`) VALUES ("Katelyn","Duran","2014-01-29",4,"JHH04N9LJ","PMI17OST7RX",1,2);
INSERT INTO `employee` (`Last_Name`,`First_Name`,`Hire_Date`,`Years_Experience`,`user_name`,`password`,`unit_id`,`employee_type_id`) VALUES ("Portia","Roberts","2011-04-26",14,"ZNG91Z0ZJ","LZA76RKQ2SX",1,6);
INSERT INTO `employee` (`Last_Name`,`First_Name`,`Hire_Date`,`Years_Experience`,`user_name`,`password`,`unit_id`,`employee_type_id`) VALUES ("Mariko","Flores","2012-08-09",20,"YRR73D7QW","WUN60RNW2EA",2,2);
INSERT INTO `employee` (`Last_Name`,`First_Name`,`Hire_Date`,`Years_Experience`,`user_name`,`password`,`unit_id`,`employee_type_id`) VALUES ("Cooper","Dodson","2014-03-17",1,"LBY77J6VP","KMY72VIV5ZY",1,2);
INSERT INTO `employee` (`Last_Name`,`First_Name`,`Hire_Date`,`Years_Experience`,`user_name`,`password`,`unit_id`,`employee_type_id`) VALUES ("Eric","Hodges","2013-07-05",13,"LFP03P1XM","ZXO33ATT4FG",2,4);
INSERT INTO `employee` (`Last_Name`,`First_Name`,`Hire_Date`,`Years_Experience`,`user_name`,`password`,`unit_id`,`employee_type_id`) VALUES ("Alea","Webb","2010-07-28",10,"CMR62M8CW","IWV22GFH8XW",3,6);
INSERT INTO `employee` (`Last_Name`,`First_Name`,`Hire_Date`,`Years_Experience`,`user_name`,`password`,`unit_id`,`employee_type_id`) VALUES ("Tyrone","Hebert","2014-06-06",4,"CKZ80B5QB","XJV50SZN4XV",1,1);
INSERT INTO `employee` (`Last_Name`,`First_Name`,`Hire_Date`,`Years_Experience`,`user_name`,`password`,`unit_id`,`employee_type_id`) VALUES ("Mariko","Benson","2014-03-13",18,"CBM01X5DG","UHZ83JLO0CJ",1,7);
INSERT INTO `employee` (`Last_Name`,`First_Name`,`Hire_Date`,`Years_Experience`,`user_name`,`password`,`unit_id`,`employee_type_id`) VALUES ("Rinah","Caldwell","2013-09-25",11,"GPY39T9FV","APQ88QQU0YN",1,8);
INSERT INTO `employee` (`Last_Name`,`First_Name`,`Hire_Date`,`Years_Experience`,`user_name`,`password`,`unit_id`,`employee_type_id`) VALUES ("Aimee","Graham","2014-01-08",7,"FKK37L7WP","EZN15TSY7OI",1,1);
INSERT INTO `employee` (`Last_Name`,`First_Name`,`Hire_Date`,`Years_Experience`,`user_name`,`password`,`unit_id`,`employee_type_id`) VALUES ("Grady","Estes","2010-11-18",2,"CDG26L3HL","WQG93VSX6SG",2,7);
INSERT INTO `employee` (`Last_Name`,`First_Name`,`Hire_Date`,`Years_Experience`,`user_name`,`password`,`unit_id`,`employee_type_id`) VALUES ("Amos","Wall","2011-12-25",19,"RSH20R6LM","AEC25WTE8JZ",1,1);
INSERT INTO `employee` (`Last_Name`,`First_Name`,`Hire_Date`,`Years_Experience`,`user_name`,`password`,`unit_id`,`employee_type_id`) VALUES ("Dominic","Richards","2014-01-08",14,"MCG17D6RF","XZB96SGO7PQ",1,1);
INSERT INTO `employee` (`Last_Name`,`First_Name`,`Hire_Date`,`Years_Experience`,`user_name`,`password`,`unit_id`,`employee_type_id`) VALUES ("Shelley","Oconnor","2013-09-23",9,"KCW49B6GY","EHI85GCO6OW",2,2);
INSERT INTO `employee` (`Last_Name`,`First_Name`,`Hire_Date`,`Years_Experience`,`user_name`,`password`,`unit_id`,`employee_type_id`) VALUES ("Bryar","Witt","2013-12-31",4,"VNK96N4NL","GRM31OPT2WS",2,7);
INSERT INTO `employee` (`Last_Name`,`First_Name`,`Hire_Date`,`Years_Experience`,`user_name`,`password`,`unit_id`,`employee_type_id`) VALUES ("Ella","Rutledge","2011-05-05",13,"DYX47L5KH","VMN31YSY7CZ",1,6);
INSERT INTO `employee` (`Last_Name`,`First_Name`,`Hire_Date`,`Years_Experience`,`user_name`,`password`,`unit_id`,`employee_type_id`) VALUES ("Alexander","Burton","2014-02-20",17,"WRP16S8FJ","HGC60DCK2HX",3,8);
INSERT INTO `employee` (`Last_Name`,`First_Name`,`Hire_Date`,`Years_Experience`,`user_name`,`password`,`unit_id`,`employee_type_id`) VALUES ("Quentin","Jennings","2013-09-12",16,"SNB36V4CQ","JAZ58FZR9RG",2,5);
INSERT INTO `employee` (`Last_Name`,`First_Name`,`Hire_Date`,`Years_Experience`,`user_name`,`password`,`unit_id`,`employee_type_id`) VALUES ("Magee","Henderson","2010-11-27",17,"MJM78C5JF","INM45MTI0GT",2,8);
INSERT INTO `employee` (`Last_Name`,`First_Name`,`Hire_Date`,`Years_Experience`,`user_name`,`password`,`unit_id`,`employee_type_id`) VALUES ("Ferris","Shepherd","2013-09-22",6,"VBY63M7LL","HOC36RDK4OU",1,1);
INSERT INTO `employee` (`Last_Name`,`First_Name`,`Hire_Date`,`Years_Experience`,`user_name`,`password`,`unit_id`,`employee_type_id`) VALUES ("Armand","Haney","2013-06-10",19,"HKG77X8ND","YBJ86FTK4EI",1,3);
INSERT INTO `employee` (`Last_Name`,`First_Name`,`Hire_Date`,`Years_Experience`,`user_name`,`password`,`unit_id`,`employee_type_id`) VALUES ("Cassidy","Chambers","2013-03-23",12,"FHC29K4PY","TFX21UZG7EB",1,6);
INSERT INTO `employee` (`Last_Name`,`First_Name`,`Hire_Date`,`Years_Experience`,`user_name`,`password`,`unit_id`,`employee_type_id`) VALUES ("Dara","Harris","2013-05-04",1,"PHG84L8CB","ZBU12AHZ9DA",1,2);
INSERT INTO `employee` (`Last_Name`,`First_Name`,`Hire_Date`,`Years_Experience`,`user_name`,`password`,`unit_id`,`employee_type_id`) VALUES ("Stella","Little","2010-12-07",14,"XPR07V5RT","FLW23KFD0HQ",3,4);
INSERT INTO `employee` (`Last_Name`,`First_Name`,`Hire_Date`,`Years_Experience`,`user_name`,`password`,`unit_id`,`employee_type_id`) VALUES ("Michelle","Shields","2010-06-16",17,"KTH61G3CL","THU22CCZ8SM",3,6);
INSERT INTO `employee` (`Last_Name`,`First_Name`,`Hire_Date`,`Years_Experience`,`user_name`,`password`,`unit_id`,`employee_type_id`) VALUES ("Philip","Tanner","2012-02-21",17,"XJS07Y4KG","LYX82QKP9YX",3,8);
INSERT INTO `employee` (`Last_Name`,`First_Name`,`Hire_Date`,`Years_Experience`,`user_name`,`password`,`unit_id`,`employee_type_id`) VALUES ("Lani","Benjamin","2010-04-06",1,"BZC73Z7SN","JKD02RHB4RT",2,4);
INSERT INTO `employee` (`Last_Name`,`First_Name`,`Hire_Date`,`Years_Experience`,`user_name`,`password`,`unit_id`,`employee_type_id`) VALUES ("Hilel","Cooke","2012-09-02",10,"NGL18Y5KV","CBR37MVK4FU",1,5);
INSERT INTO `employee` (`Last_Name`,`First_Name`,`Hire_Date`,`Years_Experience`,`user_name`,`password`,`unit_id`,`employee_type_id`) VALUES ("Plato","Mann","2013-10-18",16,"MXL60K6NX","GXB92PZN8EB",2,1);
INSERT INTO `employee` (`Last_Name`,`First_Name`,`Hire_Date`,`Years_Experience`,`user_name`,`password`,`unit_id`,`employee_type_id`) VALUES ("Doris","Lopez","2011-01-24",17,"QDY00M7GV","UGV68INI3MO",3,2);
INSERT INTO `employee` (`Last_Name`,`First_Name`,`Hire_Date`,`Years_Experience`,`user_name`,`password`,`unit_id`,`employee_type_id`) VALUES ("Pascale","Herrera","2013-11-01",8,"BYR40L7ZM","CZP82BBI2EL",2,3);
-- ====================================================================================================================

# --- !Downs
SET FOREIGN_KEY_CHECKS = 0;
DELETE FROM employee_type;
DELETE FROM employee;
DELETE FROM unit;
SET FOREIGN_KEY_CHECKS = 1;

