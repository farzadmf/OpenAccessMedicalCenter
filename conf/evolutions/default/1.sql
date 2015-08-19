# --- Created by Ebean DDL
# To stop Ebean DDL generation, remove this comment and start using Evolutions

# --- !Ups

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
  Access_Level              integer,
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

create table Treatment_Instances (
  Instance_ID               integer auto_increment not null,
  Treatment_Date            date,
  Patient_ID                integer,
  Employee_ID               integer,
  Treatment_ID              integer,
  Location_ID               integer,
  constraint pk_Treatment_Instances primary key (Instance_ID))
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

alter table Employee add constraint fk_Employee_unit_1 foreign key (unit_id) references Unit (Unit_ID) on delete restrict on update restrict;
create index ix_Employee_unit_1 on Employee (unit_id);
alter table Employee add constraint fk_Employee_employeeType_2 foreign key (employee_type_id) references Employee_Type (Employee_Type_ID) on delete restrict on update restrict;
create index ix_Employee_employeeType_2 on Employee (employee_type_id);
alter table Location add constraint fk_Location_unit_3 foreign key (Unit_ID) references Unit (Unit_ID) on delete restrict on update restrict;
create index ix_Location_unit_3 on Location (Unit_ID);
alter table Treatment_Instances add constraint fk_Treatment_Instances_patient_4 foreign key (Patient_ID) references Patient (Patient_ID) on delete restrict on update restrict;
create index ix_Treatment_Instances_patient_4 on Treatment_Instances (Patient_ID);
alter table Treatment_Instances add constraint fk_Treatment_Instances_employee_5 foreign key (Employee_ID) references Employee (Employee_ID) on delete restrict on update restrict;
create index ix_Treatment_Instances_employee_5 on Treatment_Instances (Employee_ID);
alter table Treatment_Instances add constraint fk_Treatment_Instances_treatment_6 foreign key (Treatment_ID) references Treatment (Treatment_ID) on delete restrict on update restrict;
create index ix_Treatment_Instances_treatment_6 on Treatment_Instances (Treatment_ID);
alter table Treatment_Instances add constraint fk_Treatment_Instances_location_7 foreign key (Location_ID) references Location (Location_ID) on delete restrict on update restrict;
create index ix_Treatment_Instances_location_7 on Treatment_Instances (Location_ID);



# --- !Downs

SET FOREIGN_KEY_CHECKS=0;

drop table Employee;

drop table Employee_Type;

drop table Location;

drop table Patient;

drop table Treatment_Instances;

drop table Treatment;

drop table Unit;

SET FOREIGN_KEY_CHECKS=1;

