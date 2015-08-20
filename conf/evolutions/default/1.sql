# --- Created by Ebean DDL
# To stop Ebean DDL generation, remove this comment and start using Evolutions

# --- !Ups

create table Assigned_Shift (
  Shift_ID                  integer,
  Employee_ID               integer,
  Date                      date,
  Override_Start            time,
  Override_Duration         time,
  Supervisor                tinyint(1) default 0,
  constraint pk_Assigned_Shift primary key (Shift_ID, Employee_ID))
;

create table Employee (
  Employee_ID               integer auto_increment not null,
  Last_Name                 varchar(255),
  First_Name                varchar(255),
  Salary_Type               varchar(255),
  Specialization            varchar(255),
  Hire_Date                 date,
  Years_Experience          integer,
  user_name                 varchar(255),
  password                  varchar(255),
  unit_id                   integer,
  employee_type_id          integer,
  constraint uq_Employee_user_name unique (user_name),
  constraint pk_Employee primary key (Employee_ID))
;

create table Employee_Type (
  Employee_Type_ID          integer auto_increment not null,
  Employee_Type             varchar(15),
  Level                     integer,
  Rate                      decimal(38),
  Seniority_Multiplier      decimal(38),
  Overtime_Rate             decimal(38),
  constraint ck_Employee_Type_Employee_Type check (Employee_Type in ('Administrator','Director','Doctor','Nurse','ShiftSupervisor','Intern','Resident','Technician')),
  constraint pk_Employee_Type primary key (Employee_Type_ID))
;

create table Location (
  Location_ID               integer auto_increment not null,
  Floor                     integer,
  Room                      integer,
  BedCount                  integer,
  Unit_ID                   integer,
  constraint pk_Location primary key (Location_ID))
;

create table Patient (
  Patient_ID                integer auto_increment not null,
  Last_Name                 varchar(255),
  First_Name                varchar(255),
  Phone_Number              varchar(255),
  Address                   varchar(255),
  Medicare_Number           varchar(255),
  constraint pk_Patient primary key (Patient_ID))
;

create table Treatment_Instance (
  Instance_ID               integer auto_increment not null,
  Treatment_Date            date,
  Patient_ID                integer,
  Employee_ID               integer,
  Treatment_ID              integer,
  Location_ID               integer,
  constraint pk_Treatment_Instance primary key (Instance_ID))
;

create table Shift_Type (
  Shift_Type_ID             integer auto_increment not null,
  Start_Time                time,
  Duration                  integer,
  Unit_ID                   integer,
  constraint pk_Shift_Type primary key (Shift_Type_ID))
;

create table Treatment (
  Treatment_ID              integer auto_increment not null,
  Name                      varchar(255),
  Cost                      decimal(38),
  constraint pk_Treatment primary key (Treatment_ID))
;

create table Unit (
  Unit_ID                   integer auto_increment not null,
  Name                      varchar(255),
  constraint pk_Unit primary key (Unit_ID))
;

alter table Assigned_Shift add constraint fk_Assigned_Shift_shift_1 foreign key (Shift_ID) references Shift_Type (Shift_Type_ID) on delete restrict on update restrict;
create index ix_Assigned_Shift_shift_1 on Assigned_Shift (Shift_ID);
alter table Assigned_Shift add constraint fk_Assigned_Shift_employee_2 foreign key (Employee_ID) references Employee (Employee_ID) on delete restrict on update restrict;
create index ix_Assigned_Shift_employee_2 on Assigned_Shift (Employee_ID);
alter table Employee add constraint fk_Employee_unit_3 foreign key (unit_id) references Unit (Unit_ID) on delete restrict on update restrict;
create index ix_Employee_unit_3 on Employee (unit_id);
alter table Employee add constraint fk_Employee_employeeType_4 foreign key (employee_type_id) references Employee_Type (Employee_Type_ID) on delete restrict on update restrict;
create index ix_Employee_employeeType_4 on Employee (employee_type_id);
alter table Location add constraint fk_Location_unit_5 foreign key (Unit_ID) references Unit (Unit_ID) on delete restrict on update restrict;
create index ix_Location_unit_5 on Location (Unit_ID);
alter table Treatment_Instance add constraint fk_Treatment_Instance_patient_6 foreign key (Patient_ID) references Patient (Patient_ID) on delete restrict on update restrict;
create index ix_Treatment_Instance_patient_6 on Treatment_Instance (Patient_ID);
alter table Treatment_Instance add constraint fk_Treatment_Instance_employee_7 foreign key (Employee_ID) references Employee (Employee_ID) on delete restrict on update restrict;
create index ix_Treatment_Instance_employee_7 on Treatment_Instance (Employee_ID);
alter table Treatment_Instance add constraint fk_Treatment_Instance_treatment_8 foreign key (Treatment_ID) references Treatment (Treatment_ID) on delete restrict on update restrict;
create index ix_Treatment_Instance_treatment_8 on Treatment_Instance (Treatment_ID);
alter table Treatment_Instance add constraint fk_Treatment_Instance_location_9 foreign key (Location_ID) references Location (Location_ID) on delete restrict on update restrict;
create index ix_Treatment_Instance_location_9 on Treatment_Instance (Location_ID);
alter table Shift_Type add constraint fk_Shift_Type_unit_10 foreign key (Unit_ID) references Unit (Unit_ID) on delete restrict on update restrict;
create index ix_Shift_Type_unit_10 on Shift_Type (Unit_ID);



# --- !Downs

SET FOREIGN_KEY_CHECKS=0;

drop table Assigned_Shift;

drop table Employee;

drop table Employee_Type;

drop table Location;

drop table Patient;

drop table Treatment_Instance;

drop table Shift_Type;

drop table Treatment;

drop table Unit;

SET FOREIGN_KEY_CHECKS=1;

