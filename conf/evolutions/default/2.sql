# --- !Ups
INSERT INTO unit(Name) VALUES ('Palliative'), ('Children'), ('Surgical');

INSERT INTO employee_type(Employee_Type, Rate, Seniority_Multiplier, Overtime_Rate) VALUES ('Administrator', 2, 3, 4);
INSERT INTO employee_type(Employee_Type, Rate, Seniority_Multiplier, Overtime_Rate) VALUES ('Director', 2, 3, 4);
INSERT INTO employee_type(Employee_Type, Rate, Seniority_Multiplier, Overtime_Rate) VALUES ('Doctor', 2, 3, 4);
INSERT INTO employee_type(Employee_Type, Rate, Seniority_Multiplier, Overtime_Rate) VALUES ('Nurse', 2, 3, 4);
INSERT INTO employee_type(Employee_Type, Rate, Seniority_Multiplier, Overtime_Rate) VALUES ('ShiftSupervisor', 2, 3, 4);
INSERT INTO employee_type(Employee_Type, Rate, Seniority_Multiplier, Overtime_Rate) VALUES ('Intern', 2, 3, 4);
INSERT INTO employee_type(Employee_Type, Rate, Seniority_Multiplier, Overtime_Rate) VALUES ('Resident', 2, 3, 4);
INSERT INTO employee_type(Employee_Type, Rate, Seniority_Multiplier, Overtime_Rate) VALUES ('Technician', 2, 3, 4);

INSERT INTO employee(user_name, password) VALUES ('user', 'pass');




# --- !Downs
SET FOREIGN_KEY_CHECKS = 0;
DELETE FROM employee_type;
DELETE FROM employee;
DELETE FROM unit;
SET FOREIGN_KEY_CHECKS = 1;

