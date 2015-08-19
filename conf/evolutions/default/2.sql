# --- !Ups
-- Insert Units
INSERT INTO unit(Name) VALUES ('Palliative'), ('Children'), ('Surgical');

-- Insert employee types
INSERT INTO employee_type(Employee_Type, Rate, Seniority_Multiplier, Overtime_Rate) VALUES ('Administrator', 2, 3, 4);
INSERT INTO employee_type(Employee_Type, Rate, Seniority_Multiplier, Overtime_Rate) VALUES ('Director', 2, 3, 4);
INSERT INTO employee_type(Employee_Type, Rate, Seniority_Multiplier, Overtime_Rate) VALUES ('Doctor', 2, 3, 4);
INSERT INTO employee_type(Employee_Type, Rate, Seniority_Multiplier, Overtime_Rate) VALUES ('Nurse', 2, 3, 4);
INSERT INTO employee_type(Employee_Type, Rate, Seniority_Multiplier, Overtime_Rate) VALUES ('ShiftSupervisor', 2, 3, 4);
INSERT INTO employee_type(Employee_Type, Rate, Seniority_Multiplier, Overtime_Rate) VALUES ('Intern', 2, 3, 4);
INSERT INTO employee_type(Employee_Type, Rate, Seniority_Multiplier, Overtime_Rate) VALUES ('Resident', 2, 3, 4);
INSERT INTO employee_type(Employee_Type, Rate, Seniority_Multiplier, Overtime_Rate) VALUES ('Technician', 2, 3, 4);

-- Insert employees
INSERT INTO employee (`Last_Name`,`First_Name`,`Hire_Date`,`Years_Experience`,`user_name`,`password`,`unit_id`,`employee_type_id`) VALUES ('Ayala','Arden','1899-12-30',2,'t5Q7Y6','kTaLjNrj',3,2);
INSERT INTO employee (`Last_Name`,`First_Name`,`Hire_Date`,`Years_Experience`,`user_name`,`password`,`unit_id`,`employee_type_id`) VALUES ('Harper','Wanda','1899-12-30',9,'Nr8dmO','DBCnkb',3,5);
INSERT INTO employee (`Last_Name`,`First_Name`,`Hire_Date`,`Years_Experience`,`user_name`,`password`,`unit_id`,`employee_type_id`) VALUES ('Reed','Lael','1899-12-30',12,'APmbSk','LCouzgo',3,1);
INSERT INTO employee (`Last_Name`,`First_Name`,`Hire_Date`,`Years_Experience`,`user_name`,`password`,`unit_id`,`employee_type_id`) VALUES ('Dunlap','Rhea','1899-12-30',1,'lW2RAG','nDPow',1,2);
INSERT INTO employee (`Last_Name`,`First_Name`,`Hire_Date`,`Years_Experience`,`user_name`,`password`,`unit_id`,`employee_type_id`) VALUES ('Garrison','Dane','1899-12-30',14,'6m0eop','rEBNrh',3,1);
INSERT INTO employee (`Last_Name`,`First_Name`,`Hire_Date`,`Years_Experience`,`user_name`,`password`,`unit_id`,`employee_type_id`) VALUES ('Villarreal','Sasha','1899-12-30',12,'sj08Ui','dOapcmJ',2,3);
INSERT INTO employee (`Last_Name`,`First_Name`,`Hire_Date`,`Years_Experience`,`user_name`,`password`,`unit_id`,`employee_type_id`) VALUES ('Aguilar','Irene','1899-12-30',12,'8lwsPZ','hPEsdzx',2,7);
INSERT INTO employee (`Last_Name`,`First_Name`,`Hire_Date`,`Years_Experience`,`user_name`,`password`,`unit_id`,`employee_type_id`) VALUES ('Smith','Mufutau','1899-12-30',4,'60kPNl','aWyzkHX',3,2);
INSERT INTO employee (`Last_Name`,`First_Name`,`Hire_Date`,`Years_Experience`,`user_name`,`password`,`unit_id`,`employee_type_id`) VALUES ('Lester','Avram','1899-12-30',1,'iU6qhU','EnntTlI',2,3);
INSERT INTO employee (`Last_Name`,`First_Name`,`Hire_Date`,`Years_Experience`,`user_name`,`password`,`unit_id`,`employee_type_id`) VALUES ('Levy','Signe','1899-12-30',12,'ana7fY','lsUXN',1,7);
INSERT INTO employee (`Last_Name`,`First_Name`,`Hire_Date`,`Years_Experience`,`user_name`,`password`,`unit_id`,`employee_type_id`) VALUES ('Norton','Adrienne','1899-12-30',14,'ZkX8PD','elbnN',2,5);
INSERT INTO employee (`Last_Name`,`First_Name`,`Hire_Date`,`Years_Experience`,`user_name`,`password`,`unit_id`,`employee_type_id`) VALUES ('Nguyen','Halee','1899-12-30',17,'IlEkJe','gkGys',3,1);
INSERT INTO employee (`Last_Name`,`First_Name`,`Hire_Date`,`Years_Experience`,`user_name`,`password`,`unit_id`,`employee_type_id`) VALUES ('Hardy','Abigail','1899-12-30',5,'uio7Dk','IEglQGYO',3,4);
INSERT INTO employee (`Last_Name`,`First_Name`,`Hire_Date`,`Years_Experience`,`user_name`,`password`,`unit_id`,`employee_type_id`) VALUES ('Nash','Charlotte','1899-12-30',5,'ajfnaU','HsEAuOvE',1,1);
INSERT INTO employee (`Last_Name`,`First_Name`,`Hire_Date`,`Years_Experience`,`user_name`,`password`,`unit_id`,`employee_type_id`) VALUES ('Graves','Genevieve','1899-12-30',19,'OTZDJj','WqAdYV',3,8);
INSERT INTO employee (`Last_Name`,`First_Name`,`Hire_Date`,`Years_Experience`,`user_name`,`password`,`unit_id`,`employee_type_id`) VALUES ('Reed','Shana','1899-12-30',10,'FJbqOw','HBOUsFI',2,4);
INSERT INTO employee (`Last_Name`,`First_Name`,`Hire_Date`,`Years_Experience`,`user_name`,`password`,`unit_id`,`employee_type_id`) VALUES ('Lucas','Jaden','1899-12-30',19,'awZjRI','WAPRuj',3,8);
INSERT INTO employee (`Last_Name`,`First_Name`,`Hire_Date`,`Years_Experience`,`user_name`,`password`,`unit_id`,`employee_type_id`) VALUES ('Zimmerman','Uriah','1899-12-30',1,'poiRFJ','URtUwd',2,6);
INSERT INTO employee (`Last_Name`,`First_Name`,`Hire_Date`,`Years_Experience`,`user_name`,`password`,`unit_id`,`employee_type_id`) VALUES ('Hahn','Neve','1899-12-30',10,'x93C6a','HOpRL',2,2);
INSERT INTO employee (`Last_Name`,`First_Name`,`Hire_Date`,`Years_Experience`,`user_name`,`password`,`unit_id`,`employee_type_id`) VALUES ('Rodriguez','Maris','1899-12-30',17,'2mIqVW','tBpJXbeQ',3,3);
INSERT INTO employee (`Last_Name`,`First_Name`,`Hire_Date`,`Years_Experience`,`user_name`,`password`,`unit_id`,`employee_type_id`) VALUES ('Frost','Ryan','1899-12-30',11,'fiOWl1','lFkdwvM',3,7);
INSERT INTO employee (`Last_Name`,`First_Name`,`Hire_Date`,`Years_Experience`,`user_name`,`password`,`unit_id`,`employee_type_id`) VALUES ('Cunningham','Richard','1899-12-30',7,'CEdlsn','GquOzn',3,6);
INSERT INTO employee (`Last_Name`,`First_Name`,`Hire_Date`,`Years_Experience`,`user_name`,`password`,`unit_id`,`employee_type_id`) VALUES ('Campbell','Kessie','1899-12-30',3,'0XxsJf','mqtBe',2,2);
INSERT INTO employee (`Last_Name`,`First_Name`,`Hire_Date`,`Years_Experience`,`user_name`,`password`,`unit_id`,`employee_type_id`) VALUES ('Ayala','Philip','1899-12-30',16,'jVCtFe','SdvgIJZJ',2,5);
INSERT INTO employee (`Last_Name`,`First_Name`,`Hire_Date`,`Years_Experience`,`user_name`,`password`,`unit_id`,`employee_type_id`) VALUES ('Quinn','Christopher','1899-12-30',1,'7SVS3D','wIjHjz',1,7);
INSERT INTO employee (`Last_Name`,`First_Name`,`Hire_Date`,`Years_Experience`,`user_name`,`password`,`unit_id`,`employee_type_id`) VALUES ('Hancock','Lucas','1899-12-30',5,'Y6x1Fd','lNfrWEg',3,1);
INSERT INTO employee (`Last_Name`,`First_Name`,`Hire_Date`,`Years_Experience`,`user_name`,`password`,`unit_id`,`employee_type_id`) VALUES ('Lott','Vance','1899-12-30',15,'xF30xK','gQABaL',2,4);
INSERT INTO employee (`Last_Name`,`First_Name`,`Hire_Date`,`Years_Experience`,`user_name`,`password`,`unit_id`,`employee_type_id`) VALUES ('Oconnor','Pandora','1899-12-30',19,'yGfRQT','pmCot',3,6);
INSERT INTO employee (`Last_Name`,`First_Name`,`Hire_Date`,`Years_Experience`,`user_name`,`password`,`unit_id`,`employee_type_id`) VALUES ('Dawson','Kasimir','1899-12-30',1,'3WU0f4','jaLSqAsP',3,7);
INSERT INTO employee (`Last_Name`,`First_Name`,`Hire_Date`,`Years_Experience`,`user_name`,`password`,`unit_id`,`employee_type_id`) VALUES ('Preston','Patrick','1899-12-30',19,'GIVXCG','aDvtTwv',1,3);
INSERT INTO employee (`Last_Name`,`First_Name`,`Hire_Date`,`Years_Experience`,`user_name`,`password`,`unit_id`,`employee_type_id`) VALUES ('Melton','Craig','1899-12-30',15,'MZFapP','domOhjIz',1,6);
INSERT INTO employee (`Last_Name`,`First_Name`,`Hire_Date`,`Years_Experience`,`user_name`,`password`,`unit_id`,`employee_type_id`) VALUES ('Reilly','Kimberly','1899-12-30',5,'LdTz9r','wOLKE',2,8);
INSERT INTO employee (`Last_Name`,`First_Name`,`Hire_Date`,`Years_Experience`,`user_name`,`password`,`unit_id`,`employee_type_id`) VALUES ('Estes','Paula','1899-12-30',15,'Gu3CkW','LqOgagv',1,8);
INSERT INTO employee (`Last_Name`,`First_Name`,`Hire_Date`,`Years_Experience`,`user_name`,`password`,`unit_id`,`employee_type_id`) VALUES ('Horton','Trevor','1899-12-30',12,'ZjJws7','pQfBpUS',1,5);
INSERT INTO employee (`Last_Name`,`First_Name`,`Hire_Date`,`Years_Experience`,`user_name`,`password`,`unit_id`,`employee_type_id`) VALUES ('Mcdaniel','Giselle','1899-12-30',6,'D16Myg','TBdap',2,6);
INSERT INTO employee (`Last_Name`,`First_Name`,`Hire_Date`,`Years_Experience`,`user_name`,`password`,`unit_id`,`employee_type_id`) VALUES ('Clarke','Lisandra','1899-12-30',1,'Hi1kEY','tZOkCF',1,3);
INSERT INTO employee (`Last_Name`,`First_Name`,`Hire_Date`,`Years_Experience`,`user_name`,`password`,`unit_id`,`employee_type_id`) VALUES ('Bartlett','Cassandra','1899-12-30',13,'Sa81aa','YALfk',3,6);
INSERT INTO employee (`Last_Name`,`First_Name`,`Hire_Date`,`Years_Experience`,`user_name`,`password`,`unit_id`,`employee_type_id`) VALUES ('Underwood','Quinn','1899-12-30',11,'5aNfY7','PoQAz',1,3);
INSERT INTO employee (`Last_Name`,`First_Name`,`Hire_Date`,`Years_Experience`,`user_name`,`password`,`unit_id`,`employee_type_id`) VALUES ('Cain','Kiayada','1899-12-30',9,'xxexqP','FdTkfdu',3,8);
INSERT INTO employee (`Last_Name`,`First_Name`,`Hire_Date`,`Years_Experience`,`user_name`,`password`,`unit_id`,`employee_type_id`) VALUES ('Herman','Chadwick','1899-12-30',2,'0ZvSlu','ScAGJNhe',3,7);
INSERT INTO employee (`Last_Name`,`First_Name`,`Hire_Date`,`Years_Experience`,`user_name`,`password`,`unit_id`,`employee_type_id`) VALUES ('Elliott','Forrest','1899-12-30',20,'gTpqAV','flUhNzM',1,2);
INSERT INTO employee (`Last_Name`,`First_Name`,`Hire_Date`,`Years_Experience`,`user_name`,`password`,`unit_id`,`employee_type_id`) VALUES ('Carson','Freya','1899-12-30',11,'hMII7g','FHMSir',1,1);
INSERT INTO employee (`Last_Name`,`First_Name`,`Hire_Date`,`Years_Experience`,`user_name`,`password`,`unit_id`,`employee_type_id`) VALUES ('Barrett','Garrett','1899-12-30',6,'BPIPms','EkRCmAbS',1,7);
INSERT INTO employee (`Last_Name`,`First_Name`,`Hire_Date`,`Years_Experience`,`user_name`,`password`,`unit_id`,`employee_type_id`) VALUES ('Bass','Leonard','1899-12-30',1,'t82vJk','PwAIqU',1,3);
INSERT INTO employee (`Last_Name`,`First_Name`,`Hire_Date`,`Years_Experience`,`user_name`,`password`,`unit_id`,`employee_type_id`) VALUES ('Cox','Howard','1899-12-30',18,'okMZEF','LpYBlv',1,3);
INSERT INTO employee (`Last_Name`,`First_Name`,`Hire_Date`,`Years_Experience`,`user_name`,`password`,`unit_id`,`employee_type_id`) VALUES ('Fuller','Nayda','1899-12-30',17,'Ayil8y','qHINmXSc',1,7);
INSERT INTO employee (`Last_Name`,`First_Name`,`Hire_Date`,`Years_Experience`,`user_name`,`password`,`unit_id`,`employee_type_id`) VALUES ('Gardner','Kiayada','1899-12-30',4,'rSPMt1','MZGNPt',3,7);
INSERT INTO employee (`Last_Name`,`First_Name`,`Hire_Date`,`Years_Experience`,`user_name`,`password`,`unit_id`,`employee_type_id`) VALUES ('Campos','Stuart','1899-12-30',11,'G3XLRa','mxRqCNK',1,1);
INSERT INTO employee (`Last_Name`,`First_Name`,`Hire_Date`,`Years_Experience`,`user_name`,`password`,`unit_id`,`employee_type_id`) VALUES ('Bennett','Simon','1899-12-30',13,'N6OFYe','WsunfU',2,1);
INSERT INTO employee (`Last_Name`,`First_Name`,`Hire_Date`,`Years_Experience`,`user_name`,`password`,`unit_id`,`employee_type_id`) VALUES ('Contreras','Keane','1899-12-30',12,'b6Ou9a','ZLcVwQg',1,5);



# --- !Downs
SET FOREIGN_KEY_CHECKS = 0;
DELETE FROM employee_type;
DELETE FROM employee;
DELETE FROM unit;
SET FOREIGN_KEY_CHECKS = 1;

