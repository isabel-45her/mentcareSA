CREATE SCHEMA IF NOT EXISTS `mentcareDB` DEFAULT CHARACTER SET utf8 ;
USE `mentcareDB` ;

CREATE TABLE LOGIN (
    Username VARCHAR(6),
-- The username is the patient/physican ID (Pat_Id/Phys_id respectively)
    Psswrd VARCHAR(20),
    PRIMARY KEY (Username)
);

CREATE TABLE PAT_EMERGENCY (
    Em_Id VARCHAR(6),
    Pat_Id VARCHAR(6),
    Ename VARCHAR(25),
    EEmail VARCHAR(25),
    Relation VARCHAR(15),
    PRIMARY KEY (Em_Id),
    KEY (Pat_Id),
    FOREIGN KEY (Pat_Id)
        REFERENCES PAT_INFO (Pat_Id)
);

CREATE TABLE TREATMENT (
    Treat_Id VARCHAR(6),
    Treat_Name VARCHAR(20),
    Details VARCHAR(45),
    Date_Started DATE,
    PRIMARY KEY (Treat_Id)
);

-- The following table is named "PCONDITION" because "CONDITION" is an existing SQL term
CREATE TABLE PCONDITION (
    Cond_Id VARCHAR(6),
    Cond_Name VARCHAR(25),
    Date_Diagnosed DATE,
    Diagnosed_By VARCHAR(6),
    Treat_Id VARCHAR(6),
    PRIMARY KEY (Cond_Id),
    KEY (Diagnosed_By),
    FOREIGN KEY (Diagnosed_By)
        REFERENCES PHYSICIAN_INFO (Phys_id),
    KEY (Treat_Id),
    FOREIGN KEY (Treat_Id)
        REFERENCES TREATMENT (Treat_Id)
);

CREATE TABLE PAT_INFO (
    Pat_Id VARCHAR(6),
    Pname VARCHAR(25),
    DOB DATE,
    Gender BOOLEAN,
    SSN INT,
    Blood_Type VARCHAR(3),
    Pphone VARCHAR(15),
    PEmail VARCHAR(20),
    Organ_donor BOOLEAN,
    PAddress VARCHAR(45),
    Weight INT,
    Height INT,
    Notes VARCHAR(45),
    EmerContact VARCHAR(20),
    EmerContactId VARCHAR(6),
    Cond_Name VARCHAR(25),
    Cond_Id VARCHAR(6),
    AssignedDoctor VARCHAR(6),
    AssignedDoctorId VARCHAR(6),
    PRIMARY KEY (Pat_Id),
    KEY (EmerContact),
    FOREIGN KEY (EmerContact)
        REFERENCES PAT_EMERGENCY (Ename),
    KEY (EmerContactId),
    FOREIGN KEY (EmerContactId)
        REFERENCES PAT_EMERGENCY (Em_Id),
    KEY (Cond_Name),
    FOREIGN KEY (Cond_Name)
        REFERENCES PCONDITION (Cond_Name),
    KEY (Cond_Id),
    FOREIGN KEY (Cond_Id)
        REFERENCES PCONDITION (Cond_id),
    KEY (AssignedDoctor),
    FOREIGN KEY (AssignedDoctor)
        REFERENCES PHYSICIAN_INFO (Phys_name),
    KEY (AssignedDoctorId),
    FOREIGN KEY (AssignedDoctorId)
        REFERENCES PHYSICIAN_INFO (Phys_id)
);

CREATE TABLE MEDICATION (
    Med_Id VARCHAR(6),
    Prescribed_By VARCHAR(25),
    Med_Name VARCHAR(15),
    Dosage_Details VARCHAR(45),
    PRIMARY KEY (Med_Id),
    KEY (Prescribed_By),
    FOREIGN KEY (Prescribed_By)
        REFERENCES PHYSICIAN_INFO (Phys_Name)
);

CREATE TABLE PRESCRIBED (
    Treatment_Treat_Id VARCHAR(6),
    Medication_Med_Id VARCHAR(6),
    KEY (Treatment_Treat_Id),
    FOREIGN KEY (Treatment_Treat_Id)
        REFERENCES TREATMENT (Treat_Id),
    KEY (Medication_Med_Id),
    FOREIGN KEY (Medication_Med_Id)
        REFERENCES MEDICATION (Med_Id)
);

CREATE TABLE PHYSICIAN_INFO (
    Phys_id VARCHAR(6),
    Phys_name VARCHAR(25),
    Phys_email VARCHAR(20),
    Phys_phone VARCHAR(15),
    PRIMARY KEY (Phys_id)
);

CREATE TABLE MED_FACILITY (
    Fac_id VARCHAR(6),
    Fac_address VARCHAR(30),
    Fac_name VARCHAR(15),
    Fac_phone VARCHAR(15),
    PRIMARY KEY (Fac_id)
);

CREATE TABLE WORKS_AT (
    Phys_id VARCHAR(6),
    Fac_id VARCHAR(6),
    Off_phone VARCHAR(15),
    Room_no VARCHAR(4),
    KEY (Phys_id),
    FOREIGN KEY (Phys_id)
        REFERENCES PHYSICIAN_INFO (Phys_id),
    KEY (Fac_id),
    FOREIGN KEY (Fac_id)
        REFERENCES MED_FACILITY (Fac_id)
);
