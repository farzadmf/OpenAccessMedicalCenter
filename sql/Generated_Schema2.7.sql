-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema OAMC_2.7
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `OAMC_2.7` ;

-- -----------------------------------------------------
-- Schema OAMC_2.7
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `OAMC_2.7` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `OAMC_2.7` ;

-- -----------------------------------------------------
-- Table `OAMC_2.7`.`Unit`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `OAMC_2.7`.`Unit` (
  `Unit_ID` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `Name` VARCHAR(45) NULL COMMENT '',
  PRIMARY KEY (`Unit_ID`)  COMMENT '')
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `OAMC_2.7`.`Employee_Type`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `OAMC_2.7`.`Employee_Type` (
  `Employee_Type_ID` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `Employee_Type` VARCHAR(45) NOT NULL COMMENT '',
  `Rate` DECIMAL(8,2) NULL COMMENT '',
  `Seniority_Multiplier` DECIMAL(8,2) NULL COMMENT '',
  `Overtime_Rate` VARCHAR(45) NULL COMMENT '',
  `Level` VARCHAR(45) NULL COMMENT '',
  PRIMARY KEY (`Employee_Type_ID`)  COMMENT '')
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `OAMC_2.7`.`Employee`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `OAMC_2.7`.`Employee` (
  `Employee_ID` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `Last_Name` VARCHAR(45) NULL COMMENT '',
  `First_Name` VARCHAR(45) NULL COMMENT '',
  `Salary_Type` VARCHAR(45) NULL COMMENT '',
  `Specialization` VARCHAR(45) NULL COMMENT '',
  `Unit_ID` INT NULL COMMENT '',
  `Employee_Type_ID` INT NOT NULL COMMENT '',
  `Hire_Date` DATE NULL COMMENT '',
  `Years_Experience` INT NULL COMMENT '',
  `Password` VARCHAR(45) NOT NULL COMMENT '',
  `Phone Number` VARCHAR(45) NULL COMMENT '',
  `Address` VARCHAR(45) NULL COMMENT '',
  PRIMARY KEY (`Employee_ID`)  COMMENT '',
  INDEX `fk_Employee_Unit_idx` (`Unit_ID` ASC)  COMMENT '',
  INDEX `fk_Employee_Employee_Type1_idx` (`Employee_Type_ID` ASC)  COMMENT '',
  CONSTRAINT `fk_Employee_Unit`
    FOREIGN KEY (`Unit_ID`)
    REFERENCES `OAMC_2.7`.`Unit` (`Unit_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Employee_Employee_Type1`
    FOREIGN KEY (`Employee_Type_ID`)
    REFERENCES `OAMC_2.7`.`Employee_Type` (`Employee_Type_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `OAMC_2.7`.`Service_Type`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `OAMC_2.7`.`Service_Type` (
  `Service_ID` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `Service_Name` TINYTEXT NULL COMMENT '',
  `Description` MEDIUMTEXT NULL COMMENT '',
  `Cost` DECIMAL(6,2) NULL COMMENT '',
  PRIMARY KEY (`Service_ID`)  COMMENT '')
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `OAMC_2.7`.`Employee_Service`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `OAMC_2.7`.`Employee_Service` (
  `Service_ID` INT NOT NULL COMMENT '',
  `Employee_ID` INT NOT NULL COMMENT '',
  PRIMARY KEY (`Service_ID`, `Employee_ID`)  COMMENT '',
  INDEX `fk_Employee_Services_Employee1_idx` (`Employee_ID` ASC)  COMMENT '',
  CONSTRAINT `fk_Employee_Services_Employee1`
    FOREIGN KEY (`Employee_ID`)
    REFERENCES `OAMC_2.7`.`Employee` (`Employee_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Employee_Services_Service_Type1`
    FOREIGN KEY (`Service_ID`)
    REFERENCES `OAMC_2.7`.`Service_Type` (`Service_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `OAMC_2.7`.`Patient`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `OAMC_2.7`.`Patient` (
  `Patient_ID` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `Last_Name` VARCHAR(45) NULL COMMENT '',
  `First_Name` VARCHAR(45) NULL COMMENT '',
  `Phone_Number` VARCHAR(45) NULL COMMENT '',
  `Address` MEDIUMTEXT NULL COMMENT '',
  `Medicare_Number` VARCHAR(12) NOT NULL COMMENT '',
  PRIMARY KEY (`Patient_ID`)  COMMENT '')
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `OAMC_2.7`.`Location`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `OAMC_2.7`.`Location` (
  `Unit_ID` INT NOT NULL COMMENT '',
  `Floor` INT NULL COMMENT '',
  `Room` INT NOT NULL COMMENT '',
  `Bedcount` INT NULL COMMENT '',
  `Location_ID` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `Usage` VARCHAR(45) NULL COMMENT '',
  PRIMARY KEY (`Location_ID`)  COMMENT '',
  CONSTRAINT `fk_Location_Unit1`
    FOREIGN KEY (`Unit_ID`)
    REFERENCES `OAMC_2.7`.`Unit` (`Unit_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `OAMC_2.7`.`Bed`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `OAMC_2.7`.`Bed` (
  `Bed_ID` INT NOT NULL COMMENT '',
  `Patient_ID` INT NULL COMMENT '',
  `Location_ID` INT NOT NULL COMMENT '',
  PRIMARY KEY (`Bed_ID`)  COMMENT '',
  INDEX `fk_Beds_Location1_idx` (`Location_ID` ASC)  COMMENT '',
  INDEX `fk_Beds_Patient1_idx` (`Patient_ID` ASC)  COMMENT '',
  CONSTRAINT `fk_Beds_Location1`
    FOREIGN KEY (`Location_ID`)
    REFERENCES `OAMC_2.7`.`Location` (`Location_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Beds_Patient1`
    FOREIGN KEY (`Patient_ID`)
    REFERENCES `OAMC_2.7`.`Patient` (`Patient_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `OAMC_2.7`.`Treatment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `OAMC_2.7`.`Treatment` (
  `Treatment_ID` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `Name` VARCHAR(45) NULL COMMENT '',
  `Cost` DECIMAL(7,2) NULL COMMENT '',
  `Duration` INT NULL COMMENT '',
  PRIMARY KEY (`Treatment_ID`)  COMMENT '')
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `OAMC_2.7`.`Treatment_Instance`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `OAMC_2.7`.`Treatment_Instance` (
  `Instance_ID` INT NOT NULL COMMENT '',
  `Patient_ID` INT NOT NULL COMMENT '',
  `Employee_ID` INT NOT NULL COMMENT '',
  `Treatment_Date` DATETIME NOT NULL COMMENT '',
  `Treatment_ID` INT NOT NULL COMMENT '',
  `Location_ID` INT NOT NULL COMMENT '',
  PRIMARY KEY (`Instance_ID`)  COMMENT '',
  INDEX `fk_Patient_Treatment_Instances_Patient1_idx` (`Patient_ID` ASC)  COMMENT '',
  INDEX `fk_Patient_Treatment_Instances_Treatment1_idx` (`Treatment_ID` ASC)  COMMENT '',
  INDEX `fk_Patient_Treatment_Instances_Employee1_idx` (`Employee_ID` ASC)  COMMENT '',
  INDEX `fk_Patient_Treatment_Instances_Location1_idx` (`Location_ID` ASC)  COMMENT '',
  CONSTRAINT `fk_Patient_Treatment_Instances_Patient1`
    FOREIGN KEY (`Patient_ID`)
    REFERENCES `OAMC_2.7`.`Patient` (`Patient_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Patient_Treatment_Instances_Treatment1`
    FOREIGN KEY (`Treatment_ID`)
    REFERENCES `OAMC_2.7`.`Treatment` (`Treatment_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Patient_Treatment_Instances_Employee1`
    FOREIGN KEY (`Employee_ID`)
    REFERENCES `OAMC_2.7`.`Employee` (`Employee_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Patient_Treatment_Instances_Location1`
    FOREIGN KEY (`Location_ID`)
    REFERENCES `OAMC_2.7`.`Location` (`Location_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `OAMC_2.7`.`Supply`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `OAMC_2.7`.`Supply` (
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
-- Table `OAMC_2.7`.`Carrier`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `OAMC_2.7`.`Carrier` (
  `Carrier_ID` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `Name` VARCHAR(45) NULL COMMENT '',
  `Address` VARCHAR(45) NULL COMMENT '',
  `Phone_Number` VARCHAR(45) NULL COMMENT '',
  `Fax_Number` INT NULL COMMENT '',
  `Can_Rush?` TINYINT(1) NULL COMMENT '',
  PRIMARY KEY (`Carrier_ID`)  COMMENT '')
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `OAMC_2.7`.`Vendor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `OAMC_2.7`.`Vendor` (
  `Vendor_ID` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `Name` VARCHAR(45) NULL COMMENT '',
  `Address` VARCHAR(45) NULL COMMENT '',
  `Phone_Number` VARCHAR(45) NULL COMMENT '',
  `Fax_Number` VARCHAR(45) NULL COMMENT '',
  PRIMARY KEY (`Vendor_ID`)  COMMENT '')
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `OAMC_2.7`.`Order`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `OAMC_2.7`.`Order` (
  `Order_ID` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `Date` DATE NULL COMMENT '',
  `Carrier_ID` INT NULL COMMENT '',
  `Vendor_ID` INT NOT NULL COMMENT '',
  `Rush?` TINYINT(1) NULL COMMENT '',
  PRIMARY KEY (`Order_ID`)  COMMENT '',
  INDEX `fk_Order_Carrier1_idx` (`Carrier_ID` ASC)  COMMENT '',
  INDEX `fk_Order_Vendors1_idx` (`Vendor_ID` ASC)  COMMENT '',
  CONSTRAINT `fk_Order_Carrier1`
    FOREIGN KEY (`Carrier_ID`)
    REFERENCES `OAMC_2.7`.`Carrier` (`Carrier_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Order_Vendors1`
    FOREIGN KEY (`Vendor_ID`)
    REFERENCES `OAMC_2.7`.`Vendor` (`Vendor_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `OAMC_2.7`.`Order_Detail`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `OAMC_2.7`.`Order_Detail` (
  `Quantity` INT NOT NULL COMMENT '',
  `Received_Quantity` INT NULL COMMENT '',
  `Order_ID` INT NOT NULL COMMENT '',
  `Supply_ID` INT NOT NULL COMMENT '',
  PRIMARY KEY (`Order_ID`, `Supply_ID`)  COMMENT '',
  INDEX `fk_Order_Details_Supplies1_idx` (`Supply_ID` ASC)  COMMENT '',
  CONSTRAINT `fk_Order_Details_Order1`
    FOREIGN KEY (`Order_ID`)
    REFERENCES `OAMC_2.7`.`Order` (`Order_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Order_Details_Supplies1`
    FOREIGN KEY (`Supply_ID`)
    REFERENCES `OAMC_2.7`.`Supply` (`Internal_Supply_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `OAMC_2.7`.`Room_Supply`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `OAMC_2.7`.`Room_Supply` (
  `Quantity` INT NOT NULL COMMENT '',
  `Alotment` INT NULL COMMENT '',
  `Supply_ID` INT NOT NULL COMMENT '',
  `Location_ID` INT NOT NULL COMMENT '',
  PRIMARY KEY (`Supply_ID`, `Location_ID`)  COMMENT '',
  INDEX `fk_Room_Supply_Location1_idx` (`Location_ID` ASC)  COMMENT '',
  CONSTRAINT `fk_Room_Supply_Supplies1`
    FOREIGN KEY (`Supply_ID`)
    REFERENCES `OAMC_2.7`.`Supply` (`Internal_Supply_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Room_Supply_Location1`
    FOREIGN KEY (`Location_ID`)
    REFERENCES `OAMC_2.7`.`Location` (`Location_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `OAMC_2.7`.`Treatment_Staff`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `OAMC_2.7`.`Treatment_Staff` (
  `Employee_Type_ID` INT NOT NULL COMMENT '',
  `Treatment_ID` INT NOT NULL COMMENT '',
  PRIMARY KEY (`Employee_Type_ID`, `Treatment_ID`)  COMMENT '',
  INDEX `fk_Employee_Type_has_Treatment_Treatment1_idx` (`Treatment_ID` ASC)  COMMENT '',
  INDEX `fk_Employee_Type_has_Treatment_Employee_Type1_idx` (`Employee_Type_ID` ASC)  COMMENT '',
  CONSTRAINT `fk_Employee_Type_has_Treatment_Employee_Type1`
    FOREIGN KEY (`Employee_Type_ID`)
    REFERENCES `OAMC_2.7`.`Employee_Type` (`Employee_Type_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Employee_Type_has_Treatment_Treatment1`
    FOREIGN KEY (`Treatment_ID`)
    REFERENCES `OAMC_2.7`.`Treatment` (`Treatment_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `OAMC_2.7`.`Treatment_Supply`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `OAMC_2.7`.`Treatment_Supply` (
  `Patient_Treatment_ID` INT NOT NULL COMMENT '',
  `Supply_ID` INT NOT NULL COMMENT '',
  PRIMARY KEY (`Patient_Treatment_ID`, `Supply_ID`)  COMMENT '',
  INDEX `fk_Patient_Treatment_Instances_has_Supplies_Supplies1_idx` (`Supply_ID` ASC)  COMMENT '',
  INDEX `fk_Patient_Treatment_Instances_has_Supplies_Patient_Treatme_idx` (`Patient_Treatment_ID` ASC)  COMMENT '',
  CONSTRAINT `fk_Patient_Treatment_Instances_has_Supplies_Patient_Treatment1`
    FOREIGN KEY (`Patient_Treatment_ID`)
    REFERENCES `OAMC_2.7`.`Treatment_Instance` (`Instance_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Patient_Treatment_Instances_has_Supplies_Supplies1`
    FOREIGN KEY (`Supply_ID`)
    REFERENCES `OAMC_2.7`.`Supply` (`Internal_Supply_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `OAMC_2.7`.`Shift_Type`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `OAMC_2.7`.`Shift_Type` (
  `Shift_Type_ID` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `Start_Time` TIME(0) NULL COMMENT '',
  `Duration` INT NULL COMMENT '',
  `Unit_ID` INT NULL COMMENT '',
  PRIMARY KEY (`Shift_Type_ID`)  COMMENT '',
  INDEX `fk_Shift_Type_Unit1_idx` (`Unit_ID` ASC)  COMMENT '',
  CONSTRAINT `fk_Shift_Type_Unit1`
    FOREIGN KEY (`Unit_ID`)
    REFERENCES `OAMC_2.7`.`Unit` (`Unit_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `OAMC_2.7`.`Assigned_Shift`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `OAMC_2.7`.`Assigned_Shift` (
  `Shift_ID` INT NOT NULL COMMENT '',
  `Employee_ID` INT NOT NULL COMMENT '',
  `Date` DATE NULL COMMENT '',
  `Override_Start` TIME(0) NULL COMMENT '',
  `Override_Duration` INT NULL COMMENT '',
  `Supervisor` TINYINT(1) NULL COMMENT '',
  PRIMARY KEY (`Shift_ID`, `Employee_ID`)  COMMENT '',
  INDEX `fk_Shift_has_Employee_Employee1_idx` (`Employee_ID` ASC)  COMMENT '',
  INDEX `fk_Shift_has_Employee_Shift1_idx` (`Shift_ID` ASC)  COMMENT '',
  CONSTRAINT `fk_Shift_has_Employee_Shift1`
    FOREIGN KEY (`Shift_ID`)
    REFERENCES `OAMC_2.7`.`Shift_Type` (`Shift_Type_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Shift_has_Employee_Employee1`
    FOREIGN KEY (`Employee_ID`)
    REFERENCES `OAMC_2.7`.`Employee` (`Employee_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `OAMC_2.7`.`Bed_Assigned_to_Shift`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `OAMC_2.7`.`Bed_Assigned_to_Shift` (
  `Bed_ID` INT NOT NULL COMMENT '',
  `Shift_ID` INT NOT NULL COMMENT '',
  PRIMARY KEY (`Bed_ID`, `Shift_ID`)  COMMENT '',
  INDEX `fk_Beds_has_Assigned_Shift_Assigned_Shift1_idx` (`Shift_ID` ASC)  COMMENT '',
  INDEX `fk_Beds_has_Assigned_Shift_Beds1_idx` (`Bed_ID` ASC)  COMMENT '',
  CONSTRAINT `fk_Beds_has_Assigned_Shift_Beds1`
    FOREIGN KEY (`Bed_ID`)
    REFERENCES `OAMC_2.7`.`Bed` (`Bed_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Beds_has_Assigned_Shift_Assigned_Shift1`
    FOREIGN KEY (`Shift_ID`)
    REFERENCES `OAMC_2.7`.`Assigned_Shift` (`Shift_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `OAMC_2.7`.`Doctor_Rotation`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `OAMC_2.7`.`Doctor_Rotation` (
  `Rotation_ID` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `Start_Date` DATE NULL COMMENT '',
  `End_Date` DATE NULL COMMENT '',
  `Doctor_ID` INT NULL COMMENT '',
  `Unit_ID` INT NULL COMMENT '',
  PRIMARY KEY (`Rotation_ID`)  COMMENT '',
  INDEX `fk_Doctor Rotation_Employee1_idx` (`Doctor_ID` ASC)  COMMENT '',
  INDEX `fk_Doctor Rotation_Unit1_idx` (`Unit_ID` ASC)  COMMENT '',
  CONSTRAINT `fk_Doctor Rotation_Employee1`
    FOREIGN KEY (`Doctor_ID`)
    REFERENCES `OAMC_2.7`.`Employee` (`Employee_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Doctor Rotation_Unit1`
    FOREIGN KEY (`Unit_ID`)
    REFERENCES `OAMC_2.7`.`Unit` (`Unit_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `OAMC_2.7`.`Visit`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `OAMC_2.7`.`Visit` (
  `Visit_ID` INT NOT NULL COMMENT '',
  `Unit_ID` INT NULL COMMENT '',
  `Patient_ID` INT NULL COMMENT '',
  `Date_Admitted` DATE NULL COMMENT '',
  `Date_Discharged` DATE NULL COMMENT '',
  `Stated_Reason` MEDIUMTEXT NULL COMMENT '',
  `Treatments_Received` INT NULL COMMENT '',
  PRIMARY KEY (`Visit_ID`)  COMMENT '',
  INDEX `fk_Visits_Unit1_idx` (`Unit_ID` ASC)  COMMENT '',
  INDEX `fk_Visits_Patient1_idx` (`Patient_ID` ASC)  COMMENT '',
  CONSTRAINT `fk_Visits_Unit1`
    FOREIGN KEY (`Unit_ID`)
    REFERENCES `OAMC_2.7`.`Unit` (`Unit_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Visits_Patient1`
    FOREIGN KEY (`Patient_ID`)
    REFERENCES `OAMC_2.7`.`Patient` (`Patient_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `OAMC_2.7`.`Treatment_History`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `OAMC_2.7`.`Treatment_History` (
  `Patient_Treatment_ID` INT NOT NULL COMMENT '',
  `Visit_ID` INT NOT NULL COMMENT '',
  PRIMARY KEY (`Patient_Treatment_ID`, `Visit_ID`)  COMMENT '',
  INDEX `fk_Patient_Treatment_Instances_has_Visits (or Patient Histo_idx` (`Visit_ID` ASC)  COMMENT '',
  INDEX `fk_Patient_Treatment_Instances_has_Visits (or Patient Histo_idx1` (`Patient_Treatment_ID` ASC)  COMMENT '',
  CONSTRAINT `fk_Patient_Treatment_Instances_has_Visits (or Patient History1`
    FOREIGN KEY (`Patient_Treatment_ID`)
    REFERENCES `OAMC_2.7`.`Treatment_Instance` (`Instance_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Patient_Treatment_Instances_has_Visits (or Patient History2`
    FOREIGN KEY (`Visit_ID`)
    REFERENCES `OAMC_2.7`.`Visit` (`Visit_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
