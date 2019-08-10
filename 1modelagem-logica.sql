-- DROP DATABASE DIGIMEDIC;
CREATE DATABASE DIGIMEDIC;
USE DIGIMEDIC;

CREATE TABLE IF NOT EXISTS PersonType (
	Id INT PRIMARY KEY AUTO_INCREMENT,
    Description VARCHAR(20) NOT NULL,
    CreateDate DATETIME,
    ModifyDate TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
    IsActive CHAR(1) DEFAULT 1
);

CREATE TABLE IF NOT EXISTS Person (
	Id INT PRIMARY KEY AUTO_INCREMENT,
    PersonTypeId INT NOT NULL,
	CreateDate DATETIME,
    ModifyDate TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
    IsActive CHAR(1) DEFAULT 1
);

CREATE TABLE IF NOT EXISTS PhysicalPerson (
	PhysicalPersonId INT PRIMARY KEY,
    Name VARCHAR(50),
    Avatar BLOB,
    CPF VARCHAR(11) UNIQUE,
    RG VARCHAR(20),
    Gender CHAR(1),
    DateOfBirth date,
    Nacionality VARCHAR(20),
    CreateDate DATETIME,
    ModifyDate TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
    IsActive CHAR(1) DEFAULT 1
);

CREATE TABLE IF NOT EXISTS LegalPerson (
	LegalPersonId INT PRIMARY KEY,
    FantasyName VARCHAR(50),
    SocialReason VARCHAR(50),
    CNPJ VARCHAR(14) UNIQUE,
    StateRegistration VARCHAR(20),
    DateFoundation date,
    CreateDate DATETIME,
    ModifyDate TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
    IsActive CHAR(1) DEFAULT 1
);

CREATE TABLE IF NOT EXISTS MedicalUnit (
	MedicalUnitId INT PRIMARY KEY,
    CreateDate DATETIME,
    ModifyDate TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
    IsActive CHAR(1) DEFAULT 1
);

CREATE TABLE IF NOT EXISTS MedicalAgreement (
	Id INT PRIMARY KEY AUTO_INCREMENT,
    Description VARCHAR(30),
	CreateDate DATETIME,
    ModifyDate TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
    IsActive CHAR(1) DEFAULT 1
);

CREATE TABLE IF NOT EXISTS HealthPlan (
	Id INT PRIMARY KEY AUTO_INCREMENT,
    MedicalAgreementId INT,
    Name VARCHAR(30)
);

CREATE TABLE IF NOT EXISTS Patient (
	PatientId INT PRIMARY KEY,
    HealthPlanId INT,
    CNS VARCHAR(20),
    IMC CHAR(5)
);

CREATE TABLE IF NOT EXISTS Specialty (
	Id INT PRIMARY KEY AUTO_INCREMENT,
	description VARCHAR(60),
    observation VARCHAR(30),
    CBO char(6),
    CreateDate DATETIME,
    ModifyDate TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
    IsActive CHAR(1) DEFAULT 1
);


CREATE TABLE IF NOT EXISTS HealthProfessional (
	HealthProfessionalId INT
);

CREATE TABLE IF NOT EXISTS Professional_has_Specialties (
	HealthProfessionalId INT,
    MedicalUnitId INT,
    rqe VARCHAR(10),
    _organization VARCHAR(10),
    register VARCHAR (10),
    uf CHAR(2)
);

CREATE TABLE IF NOT EXISTS Unit_has_Professional (
	HealthProfessionalId INT,
    SpecialtyId INT
);

CREATE TABLE IF NOT EXISTS AccessProfiles (
	Id INT PRIMARY KEY AUTO_INCREMENT,
	description VARCHAR(10),
    CreateDate DATETIME,
    ModifyDate TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
    IsActive CHAR(1) DEFAULT 1
);


CREATE TABLE IF NOT EXISTS User (
	UserId INT PRIMARY KEY,
	Password VARCHAR(16)
);


CREATE TABLE IF NOT EXISTS UserProfiles (
	AccessProfilesId INT,
    UserId INT
);

CREATE TABLE IF NOT EXISTS Appointment (
	Id INT PRIMARY KEY AUTO_INCREMENT,
    MedicalUnitId INT,
    PatientId INT,
    HealthProfessionalId INT,
    SpecialtyId INT
);


INSERT INTO PersonType (Description) VALUES ('PESSOA FÍSICA');
INSERT INTO PersonType (Description) VALUES ('PESSOA JURÍDICA');

ALTER TABLE Person ADD CONSTRAINT fk_person_type FOREIGN KEY (PersonTypeId) REFERENCES PersonType (Id);
ALTER TABLE PhysicalPerson ADD CONSTRAINT fk_physical_person FOREIGN KEY (PhysicalPersonId) REFERENCES Person (Id);
ALTER TABLE LegalPerson ADD CONSTRAINT fk_legal_person FOREIGN KEY (LegalPersonId) REFERENCES Person (Id);
ALTER TABLE MedicalUnit ADD CONSTRAINT fk_medical_unit FOREIGN KEY (MedicalUnitId) REFERENCES Person (Id);
ALTER TABLE HealthPlan ADD CONSTRAINT fk_health_plan FOREIGN KEY (MedicalAgreementId) REFERENCES MedicalAgreement (Id);
ALTER TABLE Patient ADD CONSTRAINT fk_patient FOREIGN KEY (PatientId) REFERENCES Person (Id);
ALTER TABLE Patient ADD CONSTRAINT fk_patient_heath_plan FOREIGN KEY (HealthPlanId) REFERENCES HealthPlan (Id);
ALTER TABLE HealthProfessional ADD CONSTRAINT fk_health_professional FOREIGN KEY (HealthProfessionalId) REFERENCES Person (Id);
ALTER TABLE Appointment ADD CONSTRAINT fk_appointment_medical_Unit FOREIGN KEY (MedicalUnitId) REFERENCES MedicalUnit (MedicalUnitId);
ALTER TABLE Appointment ADD CONSTRAINT fk_appointment_patient FOREIGN KEY (PatientId) REFERENCES Patient (PatientId);
ALTER TABLE Appointment ADD CONSTRAINT fk_appointment_professional FOREIGN KEY (HealthProfessionalId) REFERENCES HealthProfessional (HealthProfessionalId);
ALTER TABLE Appointment ADD CONSTRAINT fk_appointment_Specialty FOREIGN KEY (SpecialtyId) REFERENCES Specialty (Id);
ALTER TABLE Professional_has_Specialties ADD CONSTRAINT fk_specialty_professional FOREIGN KEY (HealthProfessionalId) REFERENCES HealthProfessional (HealthProfessionalId);
ALTER TABLE User ADD CONSTRAINT fk_user FOREIGN KEY (UserId) REFERENCES PhysicalPerson (PhysicalPersonId);
ALTER TABLE UserProfiles ADD CONSTRAINT fk_user_profiles FOREIGN KEY (AccessProfilesId) REFERENCES AccessProfiles(Id);
ALTER TABLE UserProfiles ADD CONSTRAINT fk_profiles_user FOREIGN KEY (UserId) REFERENCES User (UserId);
ALTER TABLE Unit_has_Professional ADD CONSTRAINT fk_Professional_Unit FOREIGN KEY (HealthProfessionalId) REFERENCES HealthProfessional (HealthProfessionalId);
ALTER TABLE Unit_has_Professional ADD CONSTRAINT fk_Unit_Professional FOREIGN KEY (SpecialtyId) REFERENCES Specialty (Id);

