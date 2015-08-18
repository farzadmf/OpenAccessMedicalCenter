# --- Created by Ebean DDL
# To stop Ebean DDL generation, remove this comment and start using Evolutions

# --- !Ups
/*
create table staff (
  id                        bigint auto_increment not null,
  username                  varchar(255) not null,
  email                     varchar(255) not null,
  password                  varchar(255) not null,
  role                      integer,
  first_name                varchar(255),
  last_name                 varchar(255),
  constraint ck_staff_role check (role in (0,1,2,3,4)),
  constraint uq_staff_username unique (username),
  constraint uq_staff_email unique (email),
  constraint pk_staff primary key (id))
;




# --- !Downs

SET FOREIGN_KEY_CHECKS=0;

drop table staff;

SET FOREIGN_KEY_CHECKS=1;
*/
