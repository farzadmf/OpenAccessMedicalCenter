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
  `Unit_ID` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(45) NULL,
  PRIMARY KEY (`Unit_ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `OAMC_2.7`.`Employee_Type`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `OAMC_2.7`.`Employee_Type` (
  `Employee_Type_ID` INT NOT NULL AUTO_INCREMENT,
  `Employee_Type` VARCHAR(45) NOT NULL,
  `Rate` DECIMAL(8,2) NULL,
  `Seniority_Multiplier` DECIMAL(8,2) NULL,
  `Overtime_Rate` VARCHAR(45) NULL,
  `Level` INT NULL,
  `Salary_Type` VARCHAR(45) NULL,
  PRIMARY KEY (`Employee_Type_ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `OAMC_2.7`.`Employee`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `OAMC_2.7`.`Employee` (
  `Employee_ID` INT NOT NULL AUTO_INCREMENT,
  `Last_Name` VARCHAR(45) NULL,
  `First_Name` VARCHAR(45) NULL,
  `Specialization` VARCHAR(45) NULL,
  `Unit_ID` INT NULL,
  `Employee_Type_ID` INT NOT NULL,
  `Hire_Date` DATE NULL,
  `Years_Experience` INT NULL,
  `Password` VARCHAR(45) NOT NULL,
  `Phone Number` VARCHAR(45) NULL,
  `Address` VARCHAR(45) NULL,
  PRIMARY KEY (`Employee_ID`),
  INDEX `fk_Employee_Unit_idx` (`Unit_ID` ASC),
  INDEX `fk_Employee_Employee_Type1_idx` (`Employee_Type_ID` ASC),
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
  `Service_ID` INT NOT NULL AUTO_INCREMENT,
  `Service_Name` TINYTEXT NULL,
  `Description` MEDIUMTEXT NULL,
  `Cost` DECIMAL(6,2) NULL,
  PRIMARY KEY (`Service_ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `OAMC_2.7`.`Employee_Service`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `OAMC_2.7`.`Employee_Service` (
  `Service_ID` INT NOT NULL,
  `Employee_ID` INT NOT NULL,
  PRIMARY KEY (`Service_ID`, `Employee_ID`),
  INDEX `fk_Employee_Services_Employee1_idx` (`Employee_ID` ASC),
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
  `Patient_ID` INT NOT NULL AUTO_INCREMENT,
  `Last_Name` VARCHAR(45) NULL,
  `First_Name` VARCHAR(45) NULL,
  `Phone_Number` VARCHAR(45) NULL,
  `Address` MEDIUMTEXT NULL,
  `Medicare_Number` VARCHAR(12) NOT NULL,
  PRIMARY KEY (`Patient_ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `OAMC_2.7`.`Location`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `OAMC_2.7`.`Location` (
  `Unit_ID` INT NOT NULL,
  `Floor` INT NULL,
  `Room` INT NOT NULL,
  `Bedcount` INT NULL,
  `Location_ID` INT NOT NULL AUTO_INCREMENT,
  `Usage` VARCHAR(45) NULL,
  PRIMARY KEY (`Location_ID`),
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
  `Bed_ID` INT NOT NULL AUTO_INCREMENT,
  `Patient_ID` INT NULL,
  `Location_ID` INT NOT NULL,
  PRIMARY KEY (`Bed_ID`),
  INDEX `fk_Beds_Location1_idx` (`Location_ID` ASC),
  INDEX `fk_Beds_Patient1_idx` (`Patient_ID` ASC),
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
  `Treatment_ID` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(45) NULL,
  `Cost` DECIMAL(7,2) NULL,
  `Duration` INT NULL,
  PRIMARY KEY (`Treatment_ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `OAMC_2.7`.`Treatment_Instance`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `OAMC_2.7`.`Treatment_Instance` (
  `Instance_ID` INT NOT NULL AUTO_INCREMENT,
  `Patient_ID` INT NOT NULL,
  `Employee_ID` INT NOT NULL,
  `Treatment_Date` DATETIME NOT NULL,
  `Treatment_ID` INT NOT NULL,
  `Location_ID` INT NOT NULL,
  PRIMARY KEY (`Instance_ID`),
  INDEX `fk_Patient_Treatment_Instances_Patient1_idx` (`Patient_ID` ASC),
  INDEX `fk_Patient_Treatment_Instances_Treatment1_idx` (`Treatment_ID` ASC),
  INDEX `fk_Patient_Treatment_Instances_Employee1_idx` (`Employee_ID` ASC),
  INDEX `fk_Patient_Treatment_Instances_Location1_idx` (`Location_ID` ASC),
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
  `Internal_Supply_ID` INT NOT NULL AUTO_INCREMENT,
  `Name` TINYTEXT NULL,
  `Description` LONGTEXT NULL,
  `Price_Per_Unit` DECIMAL(6,2) NULL,
  `Expiration_Date` DATE NULL,
  `Main_Category` VARCHAR(45) NULL,
  `Sub_Category` VARCHAR(45) NULL,
  PRIMARY KEY (`Internal_Supply_ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `OAMC_2.7`.`Carrier`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `OAMC_2.7`.`Carrier` (
  `Carrier_ID` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(45) NULL,
  `Address` VARCHAR(45) NULL,
  `Phone_Number` VARCHAR(45) NULL,
  `Fax_Number` INT NULL,
  `Can_Rush?` TINYINT(1) NULL,
  PRIMARY KEY (`Carrier_ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `OAMC_2.7`.`Vendor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `OAMC_2.7`.`Vendor` (
  `Vendor_ID` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(45) NULL,
  `Address` VARCHAR(45) NULL,
  `Phone_Number` VARCHAR(45) NULL,
  `Fax_Number` VARCHAR(45) NULL,
  PRIMARY KEY (`Vendor_ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `OAMC_2.7`.`Order`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `OAMC_2.7`.`Order` (
  `Order_ID` INT NOT NULL AUTO_INCREMENT,
  `Date` DATE NULL,
  `Carrier_ID` INT NULL,
  `Vendor_ID` INT NOT NULL,
  `Rush?` TINYINT(1) NULL,
  PRIMARY KEY (`Order_ID`),
  INDEX `fk_Order_Carrier1_idx` (`Carrier_ID` ASC),
  INDEX `fk_Order_Vendors1_idx` (`Vendor_ID` ASC),
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
  `Quantity` INT NOT NULL,
  `Received_Quantity` INT NULL,
  `Order_ID` INT NOT NULL,
  `Supply_ID` INT NOT NULL,
  PRIMARY KEY (`Order_ID`, `Supply_ID`),
  INDEX `fk_Order_Details_Supplies1_idx` (`Supply_ID` ASC),
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
  `Quantity` INT NOT NULL,
  `Alotment` INT NULL,
  `Supply_ID` INT NOT NULL,
  `Location_ID` INT NOT NULL,
  PRIMARY KEY (`Supply_ID`, `Location_ID`),
  INDEX `fk_Room_Supply_Location1_idx` (`Location_ID` ASC),
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
  `Employee_Type_ID` INT NOT NULL,
  `Treatment_ID` INT NOT NULL,
  PRIMARY KEY (`Employee_Type_ID`, `Treatment_ID`),
  INDEX `fk_Employee_Type_has_Treatment_Treatment1_idx` (`Treatment_ID` ASC),
  INDEX `fk_Employee_Type_has_Treatment_Employee_Type1_idx` (`Employee_Type_ID` ASC),
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
  `Patient_Treatment_ID` INT NOT NULL,
  `Supply_ID` INT NOT NULL,
  PRIMARY KEY (`Patient_Treatment_ID`, `Supply_ID`),
  INDEX `fk_Patient_Treatment_Instances_has_Supplies_Supplies1_idx` (`Supply_ID` ASC),
  INDEX `fk_Patient_Treatment_Instances_has_Supplies_Patient_Treatme_idx` (`Patient_Treatment_ID` ASC),
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
  `Shift_Type_ID` INT NOT NULL AUTO_INCREMENT,
  `Start_Time` TIME(0) NULL,
  `Duration` INT NULL,
  `Unit_ID` INT NULL,
  PRIMARY KEY (`Shift_Type_ID`),
  INDEX `fk_Shift_Type_Unit1_idx` (`Unit_ID` ASC),
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
  `Shift_ID` INT NOT NULL,
  `Employee_ID` INT NOT NULL,
  `Date` DATE NULL,
  `Override_Start` TIME(0) NULL,
  `Override_Duration` INT NULL,
  `Supervisor` TINYINT(1) NULL,
  PRIMARY KEY (`Shift_ID`, `Employee_ID`),
  INDEX `fk_Shift_has_Employee_Employee1_idx` (`Employee_ID` ASC),
  INDEX `fk_Shift_has_Employee_Shift1_idx` (`Shift_ID` ASC),
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
  `Bed_ID` INT NOT NULL,
  `Shift_ID` INT NOT NULL,
  PRIMARY KEY (`Bed_ID`, `Shift_ID`),
  INDEX `fk_Beds_has_Assigned_Shift_Assigned_Shift1_idx` (`Shift_ID` ASC),
  INDEX `fk_Beds_has_Assigned_Shift_Beds1_idx` (`Bed_ID` ASC),
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
  `Rotation_ID` INT NOT NULL AUTO_INCREMENT,
  `Start_Date` DATE NULL,
  `End_Date` DATE NULL,
  `Doctor_ID` INT NULL,
  `Unit_ID` INT NULL,
  PRIMARY KEY (`Rotation_ID`),
  INDEX `fk_Doctor Rotation_Employee1_idx` (`Doctor_ID` ASC),
  INDEX `fk_Doctor Rotation_Unit1_idx` (`Unit_ID` ASC),
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
  `Visit_ID` INT NOT NULL AUTO_INCREMENT,
  `Unit_ID` INT NULL,
  `Patient_ID` INT NULL,
  `Date_Admitted` DATE NULL,
  `Date_Discharged` DATE NULL,
  `Stated_Reason` MEDIUMTEXT NULL,
  `Treatments_Received` INT NULL,
  PRIMARY KEY (`Visit_ID`),
  INDEX `fk_Visits_Unit1_idx` (`Unit_ID` ASC),
  INDEX `fk_Visits_Patient1_idx` (`Patient_ID` ASC),
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
  `Patient_Treatment_ID` INT NOT NULL,
  `Visit_ID` INT NOT NULL,
  PRIMARY KEY (`Patient_Treatment_ID`, `Visit_ID`),
  INDEX `fk_Patient_Treatment_Instances_has_Visits (or Patient Histo_idx` (`Visit_ID` ASC),
  INDEX `fk_Patient_Treatment_Instances_has_Visits (or Patient Histo_idx1` (`Patient_Treatment_ID` ASC),
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
