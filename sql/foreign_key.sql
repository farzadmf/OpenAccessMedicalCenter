USE `OAMC_2.2`;

#alter table employee drop foreign key fk_employee_emptypeID;
Alter Table Employee add constraint fk_employee_emptypeID foreign key (Employee_Type_ID) references employee_type(Employee_Type_ID);

#alter table employee drop foreign key fk_e
alter table employee add constraint fk_employee_unit foreign key (Unit) references unit(unit_id);

alter table employee_services add constraint fk_employeeservice_serviceid foreign key (employee_id) references employee(employee_ID);

alter table employee_services add constraint fk_employeeservice_empID foreign key (service_id) references service_type(service_id);

alter table employee_scheduled_for_patient_treatment_instances add constraint fk_esfpti_empid foreign key (employee_employee_id) references employee(employee_id);

alter table employee_scheduled_for_patient_treatment_instances add constraint fk_esfpti_ptii foreign key (patient_treatment_instance_instance) references patient_treatment_instances(instance_id);

alter table assigned_shift add constraint fk_assshift_shiftid foreign key (shift_shift_id) references shift_type(shift_type_id);

alter table assigned_shift add constraint fk_assshift_empid foreign key (employee_employee_id) references employee(employee_id);

alter table 