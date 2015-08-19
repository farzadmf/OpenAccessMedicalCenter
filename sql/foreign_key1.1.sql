USE `OAMC_2.6`;

#alter table employee drop foreign key fk_employee_emptypeID;

Alter Table Employee add constraint fk_employee_emptypeID foreign key (Employee_Type_ID) references employee_type(Employee_Type_ID) on update cascade;

#alter table employee drop foreign key fk_e

alter table employee add constraint fk_employee_unit foreign key (Unit_ID) references unit(unit_id) on update cascade;

alter table employee_service add constraint fk_employeeservice_serviceid foreign key (employee_id) references employee(employee_ID) on delete cascade on update cascade;

alter table employee_service add constraint fk_employeeservice_empID foreign key (service_id) references service_type(service_id) on delete cascade on update cascade;

alter table employee_schedule add constraint fk_esfpti_empid foreign key (employee_id) references employee(employee_id) on delete cascade on update cascade;

alter table employee_schedule add constraint fk_esfpti_ptii foreign key (treatment_instance_id) references treatment_instance(instance_id) on delete cascade on update cascade;

alter table assigned_shift add constraint fk_assshift_shiftid foreign key (shift_id) references shift_type(shift_type_id) on delete cascade on update cascade;

alter table assigned_shift add constraint fk_assshift_empid foreign key (employee_id) references employee(employee_id) on delete cascade on update cascade;

alter table bed_assigned_to_shift add constraint fk_bats_shftid foreign key (shift_id) references assigned_shift(shift_id) on delete cascade on update cascade;

alter table bed_assigned_to_shift add constraint fk_bats_bed foreign key (bed_id) references bed(bed_id) on delete cascade on update cascade;

alter table treatment_instance add constraint fk_pti_patid foreign key (patient_id) references patient(patient_id) on delete cascade on update cascade;

alter table treatment_instance add constraint fk_pti_empid foreign key (employee_id) references employee(employee_id) on delete cascade on update cascade;

alter table treatment_instance add constraint fk_pti_treatid foreign key (treatment_id) references treatment(treatment_id) on delete cascade on update cascade;

alter table treatment_instance add constraint fk_pti_location foreign key (Location_ID) references Location(Location_id) on delete cascade on update cascade;

alter table shift_type add constraint fk_st_unitid foreign key (Unit_ID) references Unit(Unit_ID) on delete cascade on update cascade;

alter table treatment_history add constraint fk_THFV_visitsID foreign key (Visit_ID) references Visit(Visit_ID) on delete cascade on update cascade;

alter table Bed add constraint fk_beds_locID foreign key (Location_ID) references Location(Location_ID) on delete cascade on update cascade;

alter table Location add constraint fk_loc_unit foreign key (Unit_ID) references Unit(Unit_ID) on delete cascade on update cascade;

alter table room_supply add constraint fk_RS_loc foreign key (Location_ID) references Location(Location_ID) on delete cascade on update cascade;

alter table room_supply add constraint fk_RS_Supply foreign key (Supply_ID) references Supply(Internal_Supply_ID) on delete cascade on update cascade;

alter table visit add constraint fk_visits_unit foreign key (Unit_Id) references Unit(Unit_ID) on delete cascade on update cascade;

alter table visit add constraint fk_visits_patient foreign key (Patient_ID) references patient(Patient_ID) on delete cascade on update cascade;

alter table treatment_staff add constraint fk_psft_emp foreign key (Employee_Type_Id) references employee_type(Employee_Type_ID) on delete cascade on update cascade;

alter table treatment_staff add constraint fk_psft_Treatment foreign key (Treatment_ID) references treatment(treatment_id) on delete cascade on update cascade;

alter table doctor_rotation add constraint fk_DR_emp foreign key (Doctor_ID) references employee(employee_ID) on delete cascade on update cascade;

alter table doctor_rotation add constraint fk_dr_unit foreign key (Unit_ID) references Unit(Unit_ID) on delete cascade on update cascade;

alter table treatment_supply add constraint	fk_ptihs_pti foreign key (Patient_Treatment_ID) references Treatment_Instance(Instance_ID) on delete cascade on update cascade;

alter table treatment_supply add constraint fk_Ptihs_Supplies foreign key (Supply_ID) references supply(Internal_Supply_ID) on delete cascade on update cascade;

alter table order_detail add constraint fk_OD_supplies foreign key (supply_id) references supply(Internal_Supply_ID) on delete cascade on update cascade;

alter table order_detail add constraint fk_OD_order foreign key (order_id) references `order`(order_id) on delete cascade on update cascade;

alter table `order` add constraint fk_order_carrier foreign key (carrier_id) references carrier(carrier_id) on delete cascade on update cascade;

alter table `order` add constraint fk_order_vendors foreign key (vendor_id) references vendor(vendor_id) on delete cascade on update cascade;
