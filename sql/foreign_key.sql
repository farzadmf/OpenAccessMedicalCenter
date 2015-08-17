USE `OAMC_2.2`;

#alter table employee drop foreign key fk_employee_emptypeID;
Alter Table Employee add constraint fk_employee_emptypeID foreign key (Employee_Type_ID) references employee_type(Employee_Type_ID);

#alter table employee drop foreign key fk_e
alter table employee add constraint fk_employee_unit foreign key (Unit) references unit(unit_id);

alter table employee_services add constraint fk_employeeservice_serviceid foreign key (employee_id) references employee(employee_ID);

alter table employee_services add constraint fk_employeeservice_empID foreign key (service_id) references service_type(service_id);

alter table employee_scheduled_for_patient_treatment_instances add constraint fk_esfpti_empid foreign key (employee_employee_id) references employee(employee_id);

alter table employee_scheduled_for_patient_treatment_instances add constraint fk_esfpti_ptii foreign key (patient_treatment_instances_instance_id) references patient_treatment_instances(instance_id);

alter table assigned_shift add constraint fk_assshift_shiftid foreign key (shift_shift_id) references shift_type(shift_type_id);

alter table assigned_shift add constraint fk_assshift_empid foreign key (employee_employee_id) references employee(employee_id);

alter table beds_assigned_to_shift add constraint fk_bats_assempid foreign key (assigned_shift_employee_id) references assigned_shift(employee_employee_id);

alter table beds_assigned_to_shift add constraint fk_bats_shftid foreign key (shift_id) references assigned_shift(shift_shift_id);

alter table beds_assigned_to_shift add constraint fk_bats_bed foreign key (beds_bed_id, beds_location_id) references beds(bed_id, Location_Location_ID);

alter table patient_treatment_instances add constraint fk_pti_patid foreign key (patient_id) references patient(patient_id);

alter table patient_treatment_instances add constraint fk_pti_empid foreign key (employee_id) references employee(employee_id);

alter table patient_treatment_instances add constraint fk_pti_treatid foreign key (treatment_id) references treatment(treatment_id);

alter table patient_treatment_instances add constraint fk_pti_location foreign key (Location_Location_ID) references Location(Location_id);

alter table shift_type add constraint fk_st_unitid foreign key (Unit_ID) references Unit(Unit_ID);

alter table treatment_history_for_visit add constraint fk_THFV_PTIIID foreign key (Patient_Treatment_Instances_Instance_ID) references patient_treatment_instances(Instance_ID);

alter table treatment_history_for_visit add constraint fk_THFV_visitsID foreign key (Visits_Visit_ID) references Visits(Visit_ID);

alter table Beds add constraint fk_beds_locID foreign key (Location_Location_ID) references Location(Location_ID);

alter table Location add constraint fk_loc_unit foreign key (Unit_ID) references Unit(Unit_ID);

alter table room_supply add constraint fk_RS_loc foreign key (Location_Unit_ID, Location_Floor, Location_Room) references Location(Unit_Unit_ID, Floor, Room);

alter table room_supply add constraint fk_RS_Supply foreign key (Supplies_Internal_Supply_ID) references Supplies(Internal_Supply_ID);

alter table visits add constraint fk_visits_unit foreign key (Unit_Id) references Unit(Unit_ID);

alter table visits add constraint fk_visits_patient foreign key (Patient_ID) references patient(Patient_ID);

alter table required_staff_for_treatment add constraint fk_psft_emp foreign key (Employee_Type_Employee_Type_Id) references employee_type(Employee_Type_ID);

alter table required_staff_for_treatment add constraint fk_psft_Treatment foreign key (Treatment_Treatment_ID) references treatment(treatment_id);

alter table `doctor rotation` add constraint fk_DR_emp foreign key (Doctor_ID) references employee(employee_ID);

alter table `doctor rotation` add constraint fk_dr_unit foreign key (Unit_ID) references Unit(Unit_ID);

alter table patient_treatment_instances_has_supplies add constraint	fk_ptihs_supplies foreign key (Patient_Treatment_Instances_Instance_ID, Patient_Treatment_Instances_Location_Location_ID) references Patient_Treatment_Instance(Instance_ID,Location_Location_ID);

alter table patient_treatment_instances_has_supplies add constraint fk_Ptihs_Supplies foreign key (Supplies_Internal_Supply_ID) references supplies(Internal_Supply_ID);

alter table order_details add constraint fk_OD_supplies foreign key (supply_id) references supplies(Internal_Supplies_ID);

alter table order_details add constraint fk_OD_order foreign key (order_id) references `order`(order_id);

alter table `order` add constraint fk_order_carrier foreign key (carrier_carrier_id) references carrier(carrier_id);

alter table `order` add constraint fk_order_vendors foreign key (vendors_vendor_id) references vendors(vendor_id);