-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema OAMC_2.2
-- -----------------------------------------------------
Drop schema if exists `oamc_2.2`;
-- -----------------------------------------------------
-- Schema OAMC_2.2
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `OAMC_2.2` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `OAMC_2.2` ;

-- -----------------------------------------------------
-- Table `OAMC_2.2`.`Unit`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `OAMC_2.2`.`Unit` (
  `Unit_ID` INT NOT NULL COMMENT '',
  `Name` VARCHAR(45) NULL COMMENT '',
  PRIMARY KEY (`Unit_ID`)  COMMENT '')
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `OAMC_2.2`.`Employee_Type`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `OAMC_2.2`.`Employee_Type` (
  `Employee_Type_ID` INT NOT NULL COMMENT '',
  `Employee_Type` VARCHAR(45) NOT NULL COMMENT '',
  `Rate` DECIMAL(3,2) NULL COMMENT '',
  `Seniority_Multiplier` DECIMAL(2,2) NULL COMMENT '',
  `Overtime_Rate` VARCHAR(45) NULL COMMENT '',
  `Level` VARCHAR(45) NULL COMMENT '',
  PRIMARY KEY (`Employee_Type_ID`)  COMMENT '')
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `OAMC_2.2`.`Employee`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `OAMC_2.2`.`Employee` (
  `Employee_ID` INT NOT NULL COMMENT '',
  `Last_Name` VARCHAR(45) NULL COMMENT '',
  `First_Name` VARCHAR(45) NULL COMMENT '',
  `Salary_Type` VARCHAR(45) NULL COMMENT '',
  `Specialization` VARCHAR(45) NULL COMMENT '',
  `Unit` INT NOT NULL COMMENT '',
  `Employee_Type_ID` INT NOT NULL COMMENT '',
  `Hire_Date` DATE NULL COMMENT '',
  `Years_Experience` INT NULL COMMENT '',
  PRIMARY KEY (`Employee_ID`)  COMMENT '',
  INDEX `fk_Employee_Unit_idx` (`Unit` ASC)  COMMENT '',
  INDEX `fk_Employee_Employee_Type1_idx` (`Employee_Type_ID` ASC)  COMMENT '')
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `OAMC_2.2`.`Service_Type`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `OAMC_2.2`.`Service_Type` (
  `Service_ID` INT NOT NULL COMMENT '',
  `Service_Name` TINYTEXT NULL COMMENT '',
  `Description` MEDIUMTEXT NULL COMMENT '',
  `Cost` DECIMAL(6,2) NULL COMMENT '',
  PRIMARY KEY (`Service_ID`)  COMMENT '')
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `OAMC_2.2`.`Employee_Services`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `OAMC_2.2`.`Employee_Services` (
  `Service_ID` INT NOT NULL COMMENT '',
  `Employee_ID` INT NOT NULL COMMENT '',
  PRIMARY KEY (`Service_ID`, `Employee_ID`)  COMMENT '',
  INDEX `fk_Employee_Services_Employee1_idx` (`Employee_ID` ASC)  COMMENT '')
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `OAMC_2.2`.`Location`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `OAMC_2.2`.`Location` (
  `Floor` INT NOT NULL COMMENT '',
  `Room` INT NOT NULL COMMENT '',
  `Type` VARCHAR(45) NULL COMMENT '',
  `Unit_Unit_ID` INT NOT NULL COMMENT '',
  `Location_ID` INT NOT NULL,
  PRIMARY KEY (`Location_ID`)  COMMENT '',
  INDEX `fk_Location_Unit2_idx` (`Unit_Unit_ID` ASC)  COMMENT '')
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `OAMC_2.2`.`Beds`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `OAMC_2.2`.`Beds` (
  `Bed_ID` INT NOT NULL COMMENT '',
  `Patient_ID` INT NULL COMMENT '',
  `Location_Location_ID` INT NOT NULL COMMENT '',
  PRIMARY KEY (`Bed_ID`, `Location_Location_ID`)  COMMENT '',
  INDEX `fk_Beds_Location1_idx` (`Location_Location_ID` ASC)  COMMENT '')
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `OAMC_2.2`.`Patient`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `OAMC_2.2`.`Patient` (
  `Patient_ID` INT NOT NULL COMMENT '',
  `Last_Name` VARCHAR(45) NULL COMMENT '',
  `First_Name` VARCHAR(45) NULL COMMENT '',
  `Phone_Number` INT NULL COMMENT '',
  `Address` MEDIUMTEXT NULL COMMENT '',
  `Medicare_Number` VARCHAR(12) NOT NULL COMMENT '',
  PRIMARY KEY (`Patient_ID`)  COMMENT '')
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `OAMC_2.2`.`Treatment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `OAMC_2.2`.`Treatment` (
  `Treatment_ID` INT NOT NULL COMMENT '',
  `Name` VARCHAR(45) NULL COMMENT '',
  `Cost` DECIMAL(7,2) NULL COMMENT '',
  PRIMARY KEY (`Treatment_ID`)  COMMENT '')
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `OAMC_2.2`.`Patient_Treatment_Instances`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `OAMC_2.2`.`Patient_Treatment_Instances` (
  `Instance_ID` INT NOT NULL COMMENT '',
  `Patient_ID` INT NOT NULL COMMENT '',
  `Employee_ID` INT NOT NULL COMMENT '',
  `Treatment_Date` DATE NOT NULL COMMENT '',
  `Treatment_ID` INT NOT NULL COMMENT '',
  `Location_Location_ID` INT NOT NULL COMMENT '',
  PRIMARY KEY (`Instance_ID`, `Location_Location_ID`)  COMMENT '',
  INDEX `fk_Patient_Treatment_Instances_Patient1_idx` (`Patient_ID` ASC)  COMMENT '',
  INDEX `fk_Patient_Treatment_Instances_Treatment1_idx` (`Treatment_ID` ASC)  COMMENT '',
  INDEX `fk_Patient_Treatment_Instances_Employee1_idx` (`Employee_ID` ASC)  COMMENT '',
  INDEX `fk_Patient_Treatment_Instances_Location1_idx` (`Location_Location_ID` ASC)  COMMENT '')
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `OAMC_2.2`.`Medication`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `OAMC_2.2`.`Medication` (
  `Medication_Id` INT NOT NULL COMMENT '',
  `Medication_Name` VARCHAR(45) NULL COMMENT '',
  PRIMARY KEY (`Medication_Id`)  COMMENT '')
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `OAMC_2.2`.`Patient_Treatment_Instances_has_Medication`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `OAMC_2.2`.`Patient_Treatment_Instances_has_Medication` (
  `Patient_Treatment_Instances_Instance_ID` INT NOT NULL COMMENT '',
  `Medication_Id` INT NOT NULL COMMENT '',
  PRIMARY KEY (`Patient_Treatment_Instances_Instance_ID`, `Medication_Id`)  COMMENT '',
  INDEX `fk_Patient_Treatment_Instances_has_Medication_Medication1_idx` (`Medication_Id` ASC)  COMMENT '',
  INDEX `fk_Patient_Treatment_Instances_has_Medication_Patient_Treat_idx` (`Patient_Treatment_Instances_Instance_ID` ASC)  COMMENT '')
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `OAMC_2.2`.`Supplies`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `OAMC_2.2`.`Supplies` (
  `Internal_Supply_ID` INT NOT NULL COMMENT '',
  `Name` TINYTEXT NULL COMMENT '',
  `Description` LONGTEXT NULL COMMENT '',
  `Price_Per_Unit` DECIMAL(6,2) NULL COMMENT '',
  `Expiration_Date` DATE NULL COMMENT '',
  `Main_Category` VARCHAR(45) NULL COMMENT '',
  `Sub_Category` VARCHAR(45) NULL COMMENT '',
  PRIMARY KEY (`Internal_Supply_ID`)  COMMENT '')
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `OAMC_2.2`.`Carrier`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `OAMC_2.2`.`Carrier` (
  `Carrier_ID` INT NOT NULL COMMENT '',
  `Name` VARCHAR(45) NULL COMMENT '',
  `Address` VARCHAR(45) NULL COMMENT '',
  `Phone_Number` INT NULL COMMENT '',
  `Fax_Number` INT NULL COMMENT '',
  `Can_Rush?` TINYINT(1) NULL COMMENT '',
  PRIMARY KEY (`Carrier_ID`)  COMMENT '')
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `OAMC_2.2`.`Vendors`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `OAMC_2.2`.`Vendors` (
  `Vendor_ID` INT NOT NULL COMMENT '',
  `Name` VARCHAR(45) NULL COMMENT '',
  `Address` VARCHAR(45) NULL COMMENT '',
  `Phone_Number` INT NULL COMMENT '',
  `Fax_Number` INT NULL COMMENT '',
  PRIMARY KEY (`Vendor_ID`)  COMMENT '')
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `OAMC_2.2`.`Order`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `OAMC_2.2`.`Order` (
  `Order_ID` INT NOT NULL COMMENT '',
  `Date` DATE NULL COMMENT '',
  `Carrier_Carrier_ID` INT NOT NULL COMMENT '',
  `Vendors_Vendor_ID` INT NOT NULL COMMENT '',
  `Rush?` TINYINT(1) NULL COMMENT '',
  PRIMARY KEY (`Order_ID`, `Carrier_Carrier_ID`, `Vendors_Vendor_ID`)  COMMENT '',
  INDEX `fk_Order_Carrier1_idx` (`Carrier_Carrier_ID` ASC)  COMMENT '',
  INDEX `fk_Order_Vendors1_idx` (`Vendors_Vendor_ID` ASC)  COMMENT '')
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `OAMC_2.2`.`Order_Details`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `OAMC_2.2`.`Order_Details` (
  `Quantity` INT NOT NULL COMMENT '',
  `Received_Quantity` INT NULL COMMENT '',
  `Order_ID` INT NOT NULL COMMENT '',
  `Supply_ID` INT NOT NULL COMMENT '',
  PRIMARY KEY (`Order_ID`, `Supply_ID`)  COMMENT '',
  INDEX `fk_Order_Details_Supplies1_idx` (`Supply_ID` ASC)  COMMENT '')
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `OAMC_2.2`.`Room_Supply`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `OAMC_2.2`.`Room_Supply` (
  `Quantity` INT NOT NULL COMMENT '',
  `Alotment` INT NULL COMMENT '',
  `Supplies_Internal_Supply_ID` INT NOT NULL COMMENT '',
  `Location_Unit_ID` INT NOT NULL COMMENT '',
  `Location_Floor` INT NOT NULL COMMENT '',
  `Location_Room` INT NOT NULL COMMENT '',
  PRIMARY KEY (`Supplies_Internal_Supply_ID`, `Location_Unit_ID`, `Location_Floor`, `Location_Room`)  COMMENT '',
  INDEX `fk_Room_Supply_Location1_idx` (`Location_Unit_ID` ASC, `Location_Floor` ASC, `Location_Room` ASC)  COMMENT '')
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `OAMC_2.2`.`Location`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `OAMC_2.2`.`Location` (
  `Floor` INT NOT NULL COMMENT '',
  `Room` INT NOT NULL COMMENT '',
  `Type` VARCHAR(45) NULL COMMENT '',
  `Unit_Unit_ID` INT NOT NULL COMMENT '',
  `Location_ID` INT NOT NULL,
  PRIMARY KEY (`Location_ID`)  COMMENT '',
  INDEX `fk_Location_Unit2_idx` (`Unit_Unit_ID` ASC)  COMMENT '')
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `OAMC_2.2`.`Staff_Schedule`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `OAMC_2.2`.`Staff_Schedule` (
  `idStaff_Schedule` INT NOT NULL COMMENT '',
  PRIMARY KEY (`idStaff_Schedule`)  COMMENT '')
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `OAMC_2.2`.`Employee_has_Staff_Schedule`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `OAMC_2.2`.`Employee_has_Staff_Schedule` (
  `Employee_Employee_ID` INT NOT NULL COMMENT '',
  `Staff_Schedule_idStaff_Schedule` INT NOT NULL COMMENT '',
  PRIMARY KEY (`Employee_Employee_ID`, `Staff_Schedule_idStaff_Schedule`)  COMMENT '',
  INDEX `fk_Employee_has_Staff_Schedule_Staff_Schedule1_idx` (`Staff_Schedule_idStaff_Schedule` ASC)  COMMENT '',
  INDEX `fk_Employee_has_Staff_Schedule_Employee1_idx` (`Employee_Employee_ID` ASC)  COMMENT '')
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `OAMC_2.2`.`Employee_Scheduled_For_Patient_Treatment_Instances`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `OAMC_2.2`.`Employee_Scheduled_For_Patient_Treatment_Instances` (
  `Employee_Employee_ID` INT NOT NULL COMMENT '',
  `Patient_Treatment_Instances_Instance_ID` INT NOT NULL COMMENT '',
  PRIMARY KEY (`Employee_Employee_ID`, `Patient_Treatment_Instances_Instance_ID`)  COMMENT '',
  INDEX `fk_Employee_has_Patient_Treatment_Instances_Patient_Treatme_idx` (`Patient_Treatment_Instances_Instance_ID` ASC)  COMMENT '',
  INDEX `fk_Employee_has_Patient_Treatment_Instances_Employee1_idx` (`Employee_Employee_ID` ASC)  COMMENT '')
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `OAMC_2.2`.`Required_Staff_for_Treatment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `OAMC_2.2`.`Required_Staff_for_Treatment` (
  `Employee_Type_Employee_Type_ID` INT NOT NULL COMMENT '',
  `Treatment_Treatment_ID` INT NOT NULL COMMENT '',
  PRIMARY KEY (`Employee_Type_Employee_Type_ID`, `Treatment_Treatment_ID`)  COMMENT '',
  INDEX `fk_Employee_Type_has_Treatment_Treatment1_idx` (`Treatment_Treatment_ID` ASC)  COMMENT '',
  INDEX `fk_Employee_Type_has_Treatment_Employee_Type1_idx` (`Employee_Type_Employee_Type_ID` ASC)  COMMENT '')
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `OAMC_2.2`.`Non medical`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `OAMC_2.2`.`Non medical` (
  `Non_Medical_ID` INT NOT NULL COMMENT '',
  PRIMARY KEY (`Non_Medical_ID`)  COMMENT '')
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `OAMC_2.2`.`Nutritional`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `OAMC_2.2`.`Nutritional` (
  `Nutritional_ID` INT NOT NULL COMMENT '',
  PRIMARY KEY (`Nutritional_ID`)  COMMENT '')
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `OAMC_2.2`.`Medical`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `OAMC_2.2`.`Medical` (
  `Medical_ID` INT NOT NULL COMMENT '',
  PRIMARY KEY (`Medical_ID`)  COMMENT '')
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `OAMC_2.2`.`Administrative_Supply`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `OAMC_2.2`.`Administrative_Supply` (
  `idtable2` INT NOT NULL COMMENT '',
  PRIMARY KEY (`idtable2`)  COMMENT '')
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `OAMC_2.2`.`Medication`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `OAMC_2.2`.`Medication` (
  `Medication_Id` INT NOT NULL COMMENT '',
  `Medication_Name` VARCHAR(45) NULL COMMENT '',
  PRIMARY KEY (`Medication_Id`)  COMMENT '')
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `OAMC_2.2`.`basic_patient_material`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `OAMC_2.2`.`basic_patient_material` (
  `idtable4` INT NOT NULL COMMENT '',
  PRIMARY KEY (`idtable4`)  COMMENT '')
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `OAMC_2.2`.`Food`
-- -----------------------------------------------------
/*CREATE TABLE IF NOT EXISTS `OAMC_2.2`.`Food` (
)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `OAMC_2.2`.`Supporting_Devices`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `OAMC_2.2`.`Supporting_Devices` (
)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `OAMC_2.2`.`Surgical_Equipment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `OAMC_2.2`.`Surgical_Equipment` (
)
ENGINE = InnoDB;
*/

-- -----------------------------------------------------
-- Table `OAMC_2.2`.`Patient_Treatment_Instances_has_Supplies`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `OAMC_2.2`.`Patient_Treatment_Instances_has_Supplies` (
  `Patient_Treatment_Instances_Instance_ID` INT NOT NULL COMMENT '',
  `Patient_Treatment_Instances_Location_Location_ID` INT NOT NULL COMMENT '',
  `Supplies_Internal_Supply_ID` INT NOT NULL COMMENT '',
  PRIMARY KEY (`Patient_Treatment_Instances_Instance_ID`, `Patient_Treatment_Instances_Location_Location_ID`, `Supplies_Internal_Supply_ID`)  COMMENT '',
  INDEX `fk_Patient_Treatment_Instances_has_Supplies_Supplies1_idx` (`Supplies_Internal_Supply_ID` ASC)  COMMENT '',
  INDEX `fk_Patient_Treatment_Instances_has_Supplies_Patient_Treatme_idx` (`Patient_Treatment_Instances_Instance_ID` ASC, `Patient_Treatment_Instances_Location_Location_ID` ASC)  COMMENT '')
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `OAMC_2.2`.`Shift_Type`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `OAMC_2.2`.`Shift_Type` (
  `Shift_Type_ID` INT NOT NULL COMMENT '',
  `Start_Time` TIME(0) NULL COMMENT '',
  `Duration` INT NULL COMMENT '',
  `Unit_ID` INT NULL COMMENT '',
  PRIMARY KEY (`Shift_Type_ID`)  COMMENT '',
  INDEX `fk_Shift_Type_Unit1_idx` (`Unit_ID` ASC)  COMMENT '')
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `OAMC_2.2`.`Assigned_Shift`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `OAMC_2.2`.`Assigned_Shift` (
  `Shift_Shift_ID` INT NOT NULL COMMENT '',
  `Employee_Employee_ID` INT NOT NULL COMMENT '',
  `Date` DATE NULL COMMENT '',
  `Override_Start` TIME(0) NULL COMMENT '',
  `Override_Duration` INT NULL COMMENT '',
  `Assigned_Shiftcol` VARCHAR(45) NULL COMMENT '',
  `Supervisor` TINYINT(1) NULL COMMENT '',
  PRIMARY KEY (`Shift_Shift_ID`, `Employee_Employee_ID`)  COMMENT '',
  INDEX `fk_Shift_has_Employee_Employee1_idx` (`Employee_Employee_ID` ASC)  COMMENT '',
  INDEX `fk_Shift_has_Employee_Shift1_idx` (`Shift_Shift_ID` ASC)  COMMENT '')
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `OAMC_2.2`.`Beds_assigned_to_Shift`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `OAMC_2.2`.`Beds_assigned_to_Shift` (
  `Beds_Bed_ID` INT NOT NULL COMMENT '',
  `Beds_Location_ID` INT NOT NULL COMMENT '',
  `Shift_ID` INT NOT NULL COMMENT '',
  `Assigned_Shift_Employee_ID` INT NOT NULL COMMENT '',
  PRIMARY KEY (`Beds_Bed_ID`, `Beds_Location_ID`, `Shift_ID`, `Assigned_Shift_Employee_ID`)  COMMENT '',
  INDEX `fk_Beds_has_Assigned_Shift_Assigned_Shift1_idx` (`Shift_ID` ASC, `Assigned_Shift_Employee_ID` ASC)  COMMENT '',
  INDEX `fk_Beds_has_Assigned_Shift_Beds1_idx` (`Beds_Bed_ID` ASC, `Beds_Location_ID` ASC)  COMMENT '')
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `OAMC_2.2`.`Doctor Rotation`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `OAMC_2.2`.`Doctor Rotation` (
  `Rotation_ID` INT NOT NULL COMMENT '',
  `Start_Date` DATE NULL COMMENT '',
  `End_Date` DATE NULL COMMENT '',
  `Doctor_ID` INT NULL COMMENT '',
  `Unit_ID` INT NULL COMMENT '',
  PRIMARY KEY (`Rotation_ID`)  COMMENT '',
  INDEX `fk_Doctor Rotation_Employee1_idx` (`Doctor_ID` ASC)  COMMENT '',
  INDEX `fk_Doctor Rotation_Unit1_idx` (`Unit_ID` ASC)  COMMENT '')
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `OAMC_2.2`.`Visits (or Patient History)`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `OAMC_2.2`.`Visits` (
  `Visit_ID` INT NOT NULL COMMENT '',
  `Unit_ID` INT NULL COMMENT '',
  `Patient_ID` INT NULL COMMENT '',
  `Date_Admitted` DATE NULL COMMENT '',
  `Date_Discharged` DATE NULL COMMENT '',
  `Stated Reason` MEDIUMTEXT NULL COMMENT '',
  `Treatments_Received` INT NULL COMMENT '',
  PRIMARY KEY (`Visit_ID`)  COMMENT '',
  INDEX `fk_Visits_Unit1_idx` (`Unit_ID` ASC)  COMMENT '',
  INDEX `fk_Visits_Patient1_idx` (`Patient_ID` ASC)  COMMENT '')
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `OAMC_2.2`.`Treatment_History_for_Visit`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `OAMC_2.2`.`Treatment_History_for_Visit` (
  `Patient_Treatment_Instances_Instance_ID` INT NOT NULL COMMENT '',
  `Visits_Visit_ID` INT NOT NULL COMMENT '',
  PRIMARY KEY (`Patient_Treatment_Instances_Instance_ID`, `Visits_Visit_ID`)  COMMENT '',
  INDEX `fk_Patient_Treatment_Instances_has_Visits (or Patient Histo_idx` (`Visits_Visit_ID` ASC)  COMMENT '',
  INDEX `fk_Patient_Treatment_Instances_has_Visits (or Patient Histo_idx1` (`Patient_Treatment_Instances_Instance_ID` ASC)  COMMENT '')
ENGINE = InnoDB;

USE `OAMC_2.2` ;

-- -----------------------------------------------------
-- Placeholder table for view `OAMC_2.2`.`view1`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `OAMC_2.2`.`view1` (`id` INT);

-- -----------------------------------------------------
-- View `OAMC_2.2`.`view1`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `OAMC_2.2`.`view1`;
USE `OAMC_2.2`;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
