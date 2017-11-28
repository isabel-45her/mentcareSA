-- MySQL Script generated by MySQL Workbench
-- Sat Nov 11 07:11:02 2017
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema PatientView
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema PatientView
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mentcareDB` DEFAULT CHARACTER SET utf8 ;
USE `mentcareDB` ;

-- -----------------------------------------------------
-- Table `PatientView`.`Pat_Emergency`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mentcareDB`.`Pat_Emergency` (
  `Pssn` VARCHAR(45) NOT NULL,
  `Ename` VARCHAR(45) NULL,
  `EEmail` VARCHAR(45) NULL,
  `Relation` VARCHAR(45) NULL,
  PRIMARY KEY (`Pssn`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PatientView`.`Treatment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mentcareDB`.`Treatment` (
  `Treat_Id` VARCHAR(45) NOT NULL,
  `Treat_Name` VARCHAR(45) NULL,
  `Details` VARCHAR(45) NULL,
  `Date_Started` VARCHAR(45) NULL,
  PRIMARY KEY (`Treat_Id`),
  UNIQUE INDEX `Treat_Id_UNIQUE` (`Treat_Id` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PatientView`.`Condition`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mentcareDB`.`Condition` (
  `Cond_Id` INT NOT NULL,
  `Cond_Name` VARCHAR(45) NULL,
  `Date_Diagnosed` VARCHAR(45) NULL,
  `Diagnosed_By` VARCHAR(45) NULL,
  `Treatment_Treat_Id` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Cond_Id`),
  INDEX `fk_Condition_Treatment1_idx` (`Treatment_Treat_Id` ASC),
  UNIQUE INDEX `Cond_Id_UNIQUE` (`Cond_Id` ASC),
  CONSTRAINT `fk_Condition_Treatment1`
    FOREIGN KEY (`Treatment_Treat_Id`)
    REFERENCES `PatientView`.`Treatment` (`Treat_Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PatientView`.`Pat_Info`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mentcareDB`.`Pat_Info` (
  `Pname` INT NOT NULL,
  `DOB` VARCHAR(45) NULL,
  `Gender` VARCHAR(45) NULL,
  `SSN` INT NULL,
  `Blood_Type` VARCHAR(45) NULL,
  `Pphone` VARCHAR(45) NULL,
  `PEmail` VARCHAR(45) NULL,
  `Organ_donor` VARCHAR(45) NULL,
  `PAddress` VARCHAR(45) NULL,
  `Weight` VARCHAR(45) NULL,
  `Height` VARCHAR(45) NULL,
  `Notes` VARCHAR(45) NULL,
  `Pat_Infocol` VARCHAR(45) NULL,
  `Pat_Emergency_Pssn` VARCHAR(45) NOT NULL,
  `Condition_Cond_Id` INT NOT NULL,
  PRIMARY KEY (`Pname`),
  INDEX `fk_Pat_Info_Pat_Emergency_idx` (`Pat_Emergency_Pssn` ASC),
  INDEX `fk_Pat_Info_Condition1_idx` (`Condition_Cond_Id` ASC),
  UNIQUE INDEX `Pname_UNIQUE` (`Pname` ASC),
  CONSTRAINT `fk_Pat_Info_Pat_Emergency`
    FOREIGN KEY (`Pat_Emergency_Pssn`)
    REFERENCES `PatientView`.`Pat_Emergency` (`Pssn`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Pat_Info_Condition1`
    FOREIGN KEY (`Condition_Cond_Id`)
    REFERENCES `PatientView`.`Condition` (`Cond_Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PatientView`.`Medication`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mentcareDB`.`Medication` (
  `Med_Id` VARCHAR(45) NOT NULL,
  `Prescribed_By` VARCHAR(45) NULL,
  `Med_Name` VARCHAR(45) NULL,
  `Dosage_Details` VARCHAR(45) NULL,
  PRIMARY KEY (`Med_Id`),
  UNIQUE INDEX `Med_Id_UNIQUE` (`Med_Id` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PatientView`.`Doctor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mentcareDB`.`Doctor` (
  `Phys_Id` VARCHAR(45) NOT NULL,
  `Phys_Office_Phone` VARCHAR(45) NULL,
  `Phys_Personal_Phone` VARCHAR(45) NULL,
  `Phys_Email` VARCHAR(45) NULL,
  `Phys_Name` VARCHAR(45) NULL,
  `Pat_Info_Pname` INT NOT NULL,
  `Pat_Info_Pname1` INT NOT NULL,
  PRIMARY KEY (`Phys_Id`, `Pat_Info_Pname`),
  INDEX `fk_Doctor_Pat_Info1_idx` (`Pat_Info_Pname` ASC),
  UNIQUE INDEX `Phys_Id_UNIQUE` (`Phys_Id` ASC),
  INDEX `fk_Doctor_Pat_Info2_idx` (`Pat_Info_Pname1` ASC),
  CONSTRAINT `fk_Doctor_Pat_Info1`
    FOREIGN KEY (`Pat_Info_Pname`)
    REFERENCES `PatientView`.`Pat_Info` (`Pname`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Doctor_Pat_Info2`
    FOREIGN KEY (`Pat_Info_Pname1`)
    REFERENCES `PatientView`.`Pat_Info` (`Pname`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PatientView`.`Prescribed`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mentcareDB`.`Prescribed` (
  `Treatment_Treat_Id` VARCHAR(45) NOT NULL,
  `Medication_Med_Id` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Treatment_Treat_Id`, `Medication_Med_Id`),
  INDEX `fk_Treatment_has_Medication_Medication1_idx` (`Medication_Med_Id` ASC),
  INDEX `fk_Treatment_has_Medication_Treatment1_idx` (`Treatment_Treat_Id` ASC),
  CONSTRAINT `fk_Treatment_has_Medication_Treatment1`
    FOREIGN KEY (`Treatment_Treat_Id`)
    REFERENCES `PatientView`.`Treatment` (`Treat_Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Treatment_has_Medication_Medication1`
    FOREIGN KEY (`Medication_Med_Id`)
    REFERENCES `PatientView`.`Medication` (`Med_Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
-- Create Database  If NOT EXISTS physician;
-- USE physician;
CREATE TABLE PHYSICIAN_INFO
(Phys_id varchar(6),
Phys_name varchar(25),
Phys_email varchar(20),
Phys_phone varchar(15),
PRIMARY KEY (Phys_id));
CREATE TABLE MED_FACILITY
(Fac_id varchar(6),
Fac_address varchar(30),
Fac_name varchar(15),
Fac_phone varchar(15),
PRIMARY KEY (Fac_id));
CREATE TABLE WORKS_AT
(Phys_id varchar(6),
Fac_id varchar(6),
Off_phone varchar(15),
Room_no varchar(4),
KEY (Phys_id),
FOREIGN KEY (Phys_id) REFERENCES PHYSICIAN_INFO (Phys_id),
KEY (Fac_id),
FOREIGN KEY (Fac_id) REFERENCES MED_FACILITY (Fac_id));