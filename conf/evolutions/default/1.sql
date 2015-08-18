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
  constraint pk_Employee primary key (Employee_ID))
;

create table Employee_Type (
  Employee_Type_ID          integer auto_increment not null,
  Employee_Type             varchar(255),
  Rate                      decimal(38),
  Seniority_Multiplier      decimal(38),
  Overtime_Rate             decimal(38),
  constraint pk_Employee_Type primary key (Employee_Type_ID))
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



# --- !Downs

SET FOREIGN_KEY_CHECKS=0;

drop table Employee;

drop table Employee_Type;

drop table Unit;

SET FOREIGN_KEY_CHECKS=1;

