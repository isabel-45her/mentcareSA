Create Database  If NOT EXISTS physician;
USE physician;
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



INSERT INTO PHYSICIAN_INFO (Phys_id, Phys_name, Phys_email, Phys_phone)
VALUES (123456, Dr. John Smith, drjohnsmith@email.com, 5552223333)
INSERT INTO MED_FACILITY (Fac_id, Fac_address, Fac_name, Fac_phone)
VALUES (10, 123 Main St, Braircliff Hospital, 5555555555)
INSERT INTO WORKS_AT (Phys_id, Fac_id, Off_phone, Room_no)
VALUES (123456, 10, 5552224444, 255)

INSERT INTO PHYSICIAN_INFO (Phys_id, Phys_name, Phys_email, Phys_phone)
VALUES (213452, Dr. Jane Black, drjaneblack@email.com, 7776668888)
INSERT INTO MED_FACILITY (Fac_id, Fac_address, Fac_name, Fac_phone)
VALUES (10, 123 Main St, Braircliff Hospital, 5555555555)
INSERT INTO WORKS_AT (Phys_id, Fac_id, Off_phone, Room_no)
VALUES (213452, 10, 5551112222, 264)

INSERT INTO PHYSICIAN_INFO (Phys_id, Phys_name, Phys_email, Phys_phone)
VALUES (234451, Dr. Doug Dunbar, drdougdunbar@email.com, 2223334444)
INSERT INTO MED_FACILITY (Fac_id, Fac_address, Fac_name, Fac_phone)
VALUES (11, 432 Maple St, Greenlawn Hospital, 2222222222)
INSERT INTO WORKS_AT (Phys_id, Fac_id, Off_phone, Room_no)
VALUES (234451, 11, 2221114343, 104)

INSERT INTO PHYSICIAN_INFO (Phys_id, Phys_name, Phys_email, Phys_phone)
VALUES (213452, Dr. Rebecca Regan, drrebeccaregan@email.com, 1119998888)
INSERT INTO MED_FACILITY (Fac_id, Fac_address, Fac_name, Fac_phone)
VALUES (12, 561 Clay Road, GoldValley Hospital, 1111111111)
INSERT INTO WORKS_AT (Phys_id, Fac_id, Off_phone, Room_no)
VALUES (213452, 12, 1112324444, 301)
