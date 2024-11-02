-- Database Queries
DROP DATABASE IF EXISTS NationalHealthDB;
CREATE DATABASE NationalHealthDB;
USE NationalHealthDB;

-- Table Queries
-- Patients Table
SELECT * FROM Patients;

-- Declaring NULL values in the Race Column in the Patients Table
SELECT Race,
Coalesce (' ', 'N/A') From Patients;

SELECT * FROM patients
WHERE race IS NULL;

Select race, Replace(Race,'Null','N/A')
From Patients;

-- Doctors Table
SELECT * FROM Doctors;

-- Hospitals Table
SELECT * FROM Hospitals;

-- Medicalhistory Table
SELECT * FROM Medicalhistory;


-- Joins for Medicalhistory and Medications
SELECT * FROM Medicalhistory AS MEH
INNER JOIN Medications AS MED
ON MEH.PatientID = MED.PatientID
ORDER BY  MEH.HospitalID;

-- Medications Table
SELECT * FROM Medications;

-- Visits Table
SELECT * FROM Visits;

-- Joining the visits table with the appointments table for better tracking of patient consultations and hospital visits
SELECT * 
FROM visits AS V
LEFT JOIN appointments AS APP
ON V.PATIENTID = APP.PATIENTID
AND V.HOSPITALID = APP.HOSPITALID;

-- LabResults Table
SELECT * FROM LabResults;

-- Immunizations Table
SELECT * FROM Immunizations;

-- Appointments Table
SELECT * FROM Appointments;

-- Healthprograms Table
SELECT * FROM Healthprograms;

-- Medicationscatalog Table
SELECT * FROM Medicationscatalog;

-- Suppliers Table
SELECT * FROM Suppliers;

-- Purchaseorders Table
SELECT * FROM Purchaseorders;

-- Orderdetails Table
SELECT * FROM Orderdetails;

-- Inventory Table
SELECT * FROM Inventory;

-- Shipments Table
SELECT * FROM Shipments;

-- Joining shipments and shipmentdetails tables for efficient tracking of shipments for hospitals
SELECT * 
FROM shipments AS shp
LEFT JOIN shipmentdetails AS shpd
ON shp.orderid = shpd.shipmentid
AND shp.HOSPITALID = shpd.HOSPITALID;


-- Shipmentdetails Table
SELECT * FROM Shipmentdetails;

-- Shipmentdetails Table
SELECT * FROM Distribution;



-- Table Information
-- Patients Table
CREATE TABLE Patients (
    PatientID INT PRIMARY KEY NOT NULL,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    DateOfBirth DATE NOT NULL,
    Gender VARCHAR(10) NOT NULL,
    ContactNumber VARCHAR(20) NOT NULL,
    Province VARCHAR(20) NOT NULL,
    Address VARCHAR(100) NOT NULL,
    NationalID VARCHAR(20) NOT NULL
);

INSERT INTO Patients (PatientID, FirstName, LastName, DateOfBirth, Gender, ContactNumber, Province, Address, NationalID)
VALUES
(1, 'Thabo', 'Mokoena', '1985-04-12', 'Male', '0821234567', 'Gauteng', '123 Main St, Johannesburg', '8504121234082'),
(2, 'Naledi', 'Dlamini', '1990-07-23', 'Female', '0832345678', 'KwaZulu-Natal', '456 Beach Rd, Durban', '9007232345083'),
(3, 'Sipho', 'Nkosi', '1978-11-05', 'Male', '0843456789', 'Western Cape', '789 Mountain View, Cape Town', '7811053456084'),
(4, 'Zanele', 'Khumalo', '1982-02-14', 'Female', '0854567890', 'Eastern Cape', '101 River Rd, Port Elizabeth', '8202144567085'),
(5, 'Lerato', 'Mabaso', '1995-09-30', 'Female', '0865678901', 'Free State', '202 Sunset Blvd, Bloemfontein', '9509305678086'),
(6, 'Mandla', 'Zulu', '1988-06-18', 'Male', '0876789012', 'Mpumalanga', '303 Forest Dr, Nelspruit', '8806186789087'),
(7, 'Palesa', 'Molefe', '1992-12-25', 'Female', '0887890123', 'Limpopo', '404 Hilltop St, Polokwane', '9212257890088'),
(8, 'Kagiso', 'Motsepe', '1983-03-08', 'Male', '0898901234', 'North West', '505 Valley Rd, Rustenburg', '8303088901089'),
(9, 'Bongani', 'Sithole', '1975-08-19', 'Male', '0809012345', 'Northern Cape', '606 Desert St, Kimberley', '7508199012090'),
(10, 'Ayanda', 'Ngcobo', '1998-05-15', 'Female', '0810123456', 'Gauteng', '707 City Center, Pretoria', '9805150123091');

-- Adding Race column to Patients table
ALTER TABLE Patients ADD Race VARCHAR(20);

-- Inserting diversified South African data for Patients
INSERT INTO Patients (PatientID, FirstName, LastName, DateOfBirth, Gender, ContactNumber, Province, Address, NationalID, Race)
VALUES
(11, 'Amogelang', 'Seoka', '1993-05-22', 'Male', '0712345678', 'Limpopo', '123 Village Rd, Tzaneen', '9305221234085', 'Black'),
(12, 'Michael', 'van Wyk', '1980-08-15', 'Male', '0723456789', 'Western Cape', '456 Vineyard St, Stellenbosch', '8008152345086', 'White'),
(13, 'Nisha', 'Naidoo', '1985-12-10', 'Female', '0734567890', 'KwaZulu-Natal', '789 Lotus St, Pietermaritzburg', '8512103456087', 'Indian'),
(14, 'Fatima', 'Essop', '1991-02-19', 'Female', '0745678901', 'Western Cape', '101 Bo-Kaap St, Cape Town', '9102194567088', 'Coloured'),
(15, 'Teboho', 'Molefe', '1975-07-07', 'Male', '0756789012', 'Gauteng', '202 Constitution Hill, Johannesburg', '7507075678089', 'Black'),
(16, 'Sara', 'Solomon', '1998-03-11', 'Female', '0767890123', 'Eastern Cape', '303 Harbor Rd, East London', '9803116789090', 'White'),
(17, 'Kgomotso', 'Mahlangu', '1992-09-25', 'Female', '0778901234', 'Mpumalanga', '404 Bush St, Nelspruit', '9209257890089', 'Black'),
(18, 'Iqbal', 'Khan', '1984-11-17', 'Male', '0789012345', 'Gauteng', '505 Crown Rd, Johannesburg', '8411178901090', 'Indian'),
(19, 'Abigail', 'Botha', '1979-06-30', 'Female', '0790123456', 'Free State', '606 Sunrise Blvd, Bloemfontein', '7906309012091', 'White'),
(20, 'Lindiwe', 'Mthembu', '1996-04-08', 'Female', '0710123456', 'KwaZulu-Natal', '707 Kingsway, Durban', '9604080123092', 'Black');

INSERT INTO Patients (PatientID, FirstName, LastName, DateOfBirth, Gender, ContactNumber, Province, Address, NationalID)
VALUES
(21, 'Sipho', 'Dlamini', '1980-03-15', 'Male', '0712345678', 'Gauteng', '123 Main Street, Johannesburg', '8501234567890'),
(22, 'Thandi', 'Nkosi', '1992-06-22', 'Female', '0822345678', 'KwaZulu-Natal', '456 Elm Street, Durban', '9204561234567'),
(23, 'Liam', 'Smith', '1985-09-05', 'Male', '0732345678', 'Western Cape', '789 Pine Avenue, Cape Town', '8507891234563'),
(24, 'Ayesha', 'Khan', '1990-12-30', 'Female', '0842345678', 'Eastern Cape', '123 Maple Drive, Port Elizabeth', '9102345678901'),
(25, 'Zodwa', 'Mthembu', '1975-01-18', 'Female', '0752345678', 'Free State', '456 Oak Road, Bloemfontein', '8504567890123'),
(26, 'Thabo', 'Mokgothu', '1988-05-29', 'Male', '0762345678', 'Mpumalanga', '789 Cedar Street, Nelspruit', '9207891234565'),
(27, 'Sizwe', 'Phiri', '1995-02-14', 'Male', '0672345678', 'Limpopo', '101 Birch Lane, Polokwane', '8301234567892'),
(28, 'Nomsa', 'Sithole', '1983-07-27', 'Female', '0682345678', 'North West', '202 Spruce Road, Mahikeng', '8404561234560'),
(29, 'Peter', 'Van Wyk', '1989-11-10', 'Male', '0692345678', 'Northern Cape', '303 Willow Street, Kimberley', '8607894561238'),
(30, 'Lindiwe', 'Zuma', '1994-08-22', 'Female', '0712345679', 'Gauteng', '404 Cherry Avenue, Pretoria', '8901234567891'),
(31, 'Musa', 'Tshabalala', '1981-04-03', 'Male', '0722345679', 'KwaZulu-Natal', '505 Fig Street, Pietermaritzburg', '8204567890124'),
(32, 'Khosi', 'Mokhantso', '1986-10-12', 'Female', '0832345679', 'Western Cape', '606 Peach Drive, Stellenbosch', '9107891234568'),
(33, 'Nokuthula', 'Mthethwa', '1998-05-14', 'Female', '0842345680', 'Eastern Cape', '707 Lemon Street, East London', '8501234567895'),
(34, 'Karabo', 'Mokonyane', '1978-09-20', 'Male', '0752345680', 'Free State', '808 Grape Road, Bloemfontein', '8904561234562'),
(35, 'Tumi', 'Malema', '1991-06-16', 'Female', '0762345680', 'Mpumalanga', '909 Cranberry Lane, Mbombela', '8307891234569'),
(36, 'Bongani', 'Masondo', '1984-11-08', 'Male', '0672345680', 'Limpopo', '1010 Kiwi Street, Thohoyandou', '8401234567894'),
(37, 'Palesa', 'Ndlovu', '1996-03-30', 'Female', '0682345680', 'North West', '1111 Avocado Road, Rustenburg', '8204567890120'),
(38, 'Andile', 'Gumede', '1982-02-24', 'Male', '0692345680', 'Northern Cape', '1212 Banana Avenue, Upington', '8607894561239'),
(39, 'Lerato', 'Mahlangu', '1997-07-15', 'Female', '0712345681', 'Gauteng', '1313 Melon Street, Johannesburg', '8901234567896'),
(40, 'Vusi', 'Khumalo', '1990-12-11', 'Male', '0722345681', 'KwaZulu-Natal', '1414 Coconut Road, Durban', '9104561234569'),
(41, 'Nandi', 'Banda', '1987-01-29', 'Female', '0832345681', 'Western Cape', '1515 Apple Drive, Cape Town', '8507894567897'),
(42, 'Tshiamo', 'Nkwe', '1989-10-07', 'Male', '0842345682', 'Eastern Cape', '1616 Pear Street, Port Elizabeth', '8201234567895'),
(43, 'Kagiso', 'Molapo', '1993-04-19', 'Female', '0752345682', 'Free State', '1717 Cherry Lane, Bloemfontein', '8904567890127'),
(44, 'Vusimuzi', 'Madonsela', '1985-08-21', 'Male', '0762345682', 'Mpumalanga', '1818 Watermelon Avenue, Nelspruit', '8307891234563'),
(45, 'Refilwe', 'Sibeko', '1991-09-16', 'Female', '0672345682', 'Limpopo', '1919 Papaya Road, Polokwane', '8401234567891'),
(46, 'Simphiwe', 'Tshehla', '1994-06-23', 'Male', '0682345683', 'North West', '2020 Blackberry Street, Mahikeng', '8604561234562'),
(47, 'Zoleka', 'Peters', '1980-02-09', 'Female', '0692345683', 'Northern Cape', '2121 Blueberry Road, Kimberley', '8901234567893'),
(48, 'Jabu', 'Mavuso', '1992-01-04', 'Male', '0712345684', 'Gauteng', '2222 Pineapple Street, Pretoria', '9104561234560'),
(49, 'Gugu', 'Khanyile', '1988-07-18', 'Female', '0722345684', 'KwaZulu-Natal', '2323 Tangerine Avenue, Pietermaritzburg', '8207894561234'),
(50, 'Kabelo', 'Sikhosana', '1996-11-12', 'Male', '0832345684', 'Western Cape', '2424 Cantaloupe Drive, Stellenbosch', '8604567890125'),
(51, 'Tebogo', 'Dube', '1983-10-27', 'Female', '0842345685', 'Eastern Cape', '2525 Guava Street, East London', '8901234567892'),
(52, 'Mpho', 'Nzimande', '1990-05-06', 'Male', '0752345685', 'Free State', '2626 Mulberry Lane, Bloemfontein', '9104561234568'),
(53, 'Lesedi', 'Matlala', '1984-12-15', 'Female', '0762345685', 'Mpumalanga', '2727 Fig Avenue, Mbombela', '8507894567891'),
(54, 'Karabo', 'Dube', '1995-06-17', 'Male', '0672345685', 'Limpopo', '2828 Lemon Road, Thohoyandou', '8904567890124'),
(55, 'Nontobeko', 'Khanyile', '1991-03-08', 'Female', '0682345686', 'North West', '2929 Peppadew Drive, Rustenburg', '8201234567896'),
(56, 'Themba', 'Twala', '1987-07-28', 'Male', '0692345686', 'Northern Cape', '3030 Tomato Street, Upington', '8604561234567'),
(57, 'Anele', 'Dlamini', '1982-09-14', 'Female', '0712345687', 'Gauteng', '3131 Avocado Street, Johannesburg', '8901234567899'),
(58, 'Nokuthula', 'Matlala', '1989-08-02', 'Male', '0722345687', 'KwaZulu-Natal', '3232 Mango Road, Durban', '9104561234564'),
(59, 'Bongiwe', 'Mashaba', '1994-01-01', 'Female', '0832345687', 'Western Cape', '3333 Watermelon Avenue, Cape Town');


-- Doctors Table
CREATE TABLE Doctors (
    DoctorID INT PRIMARY KEY NOT NULL,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Province VARCHAR(20) NOT NULL,
    Specialty VARCHAR(50) NOT NULL,
    ContactNumber VARCHAR(20) NOT NULL,
    Email VARCHAR(100) NOT NULL,
    LicenseNumber VARCHAR(20) NOT NULL
);


INSERT INTO Doctors (DoctorID, FirstName, LastName, Province, Specialty, ContactNumber, Email, LicenseNumber) VALUES
(1, 'Thabo', 'Mokoena', 'Gauteng', 'Cardiology', '0123456789', 'thabo.mokoena@example.com', 'GP123456'),
(2, 'Ayesha', 'Patel', 'KwaZulu-Natal', 'Pediatrics', '0987654321', 'ayesha.patel@example.com', 'KZN654321'),
(3, 'Sipho', 'Ngcobo', 'Eastern Cape', 'Neurology', '0112233445', 'sipho.ngcobo@example.com', 'EC112233'),
(4, 'Lerato', 'Mabaso', 'Free State', 'Orthopedics', '0223344556', 'lerato.mabaso@example.com', 'FS334455'),
(5, 'Johan', 'van der Merwe', 'Western Cape', 'General Surgery', '0334455667', 'johan.vdmerwe@example.com', 'WC445566'),
(6, 'Fatima', 'Khan', 'Limpopo', 'Dermatology', '0445566778', 'fatima.khan@example.com', 'LP556677'),
(7, 'Mandla', 'Zulu', 'Mpumalanga', 'Ophthalmology', '0556677889', 'mandla.zulu@example.com', 'MP667788'),
(8, 'Emily', 'Smith', 'Northern Cape', 'Psychiatry', '0667788990', 'emily.smith@example.com', 'NC778899'),
(9, 'Nokuthula', 'Dlamini', 'North West', 'Gynecology', '0778899001', 'nokuthula.dlamini@example.com', 'NW889900'),
(10, 'David', 'Goldstein', 'Gauteng', 'Oncology', '0889900112', 'david.goldstein@example.com', 'GP990011');

-- Adding Race column to Doctors table
ALTER TABLE Doctors ADD Race VARCHAR(20);

-- Inserting racially diversified South African data for Doctors
INSERT INTO Doctors (DoctorID, FirstName, LastName, Province, Specialty, ContactNumber, Email, LicenseNumber, Race)
VALUES
(11, 'Jabulani', 'Mabaso', 'Gauteng', 'Cardiology', '0821234567', 'jabulani.mabaso@example.com', 'GP123457', 'Black'),
(12, 'Elena', 'Pretorius', 'Western Cape', 'Orthopedics', '0832345678', 'elena.pretorius@example.com', 'WC334456', 'White'),
(13, 'Rajesh', 'Reddy', 'KwaZulu-Natal', 'Dermatology', '0843456789', 'rajesh.reddy@example.com', 'KZN456789', 'Indian'),
(14, 'Zainab', 'Isaacs', 'Western Cape', 'Psychiatry', '0854567890', 'zainab.isaacs@example.com', 'WC556677', 'Coloured'),
(15, 'Mpho', 'Mokoena', 'Free State', 'Gynecology', '0865678901', 'mpho.mokoena@example.com', 'FS667788', 'Black'),
(16, 'Karl', 'Steyn', 'Northern Cape', 'Neurology', '0876789012', 'karl.steyn@example.com', 'NC778899', 'White'),
(17, 'Farhana', 'Patel', 'Gauteng', 'Pediatrics', '0887890123', 'farhana.patel@example.com', 'GP890123', 'Indian'),
(18, 'Siphelele', 'Ndlovu', 'KwaZulu-Natal', 'Oncology', '0898901234', 'siphelele.ndlovu@example.com', 'KZN912345', 'Black'),
(19, 'Carmen', 'Jacobs', 'Western Cape', 'General Surgery', '0809012345', 'carmen.jacobs@example.com', 'WC934567', 'Coloured'),
(20, 'John', 'Smith', 'Mpumalanga', 'Orthopedics', '0810123456', 'john.smith@example.com', 'MP101112', 'White');


-- Hospitals Table
CREATE TABLE Hospitals (
    HospitalID INT PRIMARY KEY NOT NULL,
    Name VARCHAR(100) NOT NULL,
    Address VARCHAR(200) NOT NULL,
    Province VARCHAR(20) NOT NULL,
    ContactNumber VARCHAR(20) NOT NULL,
    Type VARCHAR(50) NOT NULL
);

INSERT INTO Hospitals (HospitalID, Name, Address, Province, ContactNumber, Type) VALUES
(1, 'Groote Schuur Hospital', 'Main Rd, Observatory, Cape Town, 7925', 'Western Cape', '0214049111', 'Public'),
(2, 'Chris Hani Baragwanath Hospital', '26 Chris Hani Rd, Diepkloof, Johannesburg, 1864', 'Gauteng', '0119338000', 'Public'),
(3, 'Netcare Milpark Hospital', '9 Guild Rd, Parktown West, Johannesburg, 2193', 'Gauteng', '0114805600', 'Private'),
(4, 'Inkosi Albert Luthuli Central Hospital', '800 Bellair Rd, Cato Manor, Durban, 4091', 'KwaZulu-Natal', '0312401000', 'Public'),
(5, 'Life St George’s Hospital', '40 Park Dr, Central, Gqeberha, 6001', 'Eastern Cape', '0413926111', 'Private'),
(6, 'Polokwane Provincial Hospital', 'Cnr Dorp & Hospital St, Polokwane, 0700', 'Limpopo', '0152875000', 'Public'),
(7, 'MediClinic Nelspruit', '1 Louise St, Sonheuwel Central, Mbombela, 1201', 'Mpumalanga', '0137590500', 'Private'),
(8, 'Kimberley Hospital Complex', 'Du Toitspan Rd, Belgravia, Kimberley, 8301', 'Northern Cape', '0538029111', 'Public'),
(9, 'North West Private Hospital', '1A Meyer St, Wilkoppies, Klerksdorp, 2571', 'North West', '0184687000', 'Private'),
(10, 'Universitas Academic Hospital', '1 Logeman St, Universitas, Bloemfontein, 9301', 'Free State', '0514059111', 'Public');

-- Inserting more hospitals from various provinces
INSERT INTO Hospitals (HospitalID, Name, Address, Province, ContactNumber, Type) VALUES
(11, 'Tshwane District Hospital', 'Dr Savage Rd, Pretoria, 0002', 'Gauteng', '0123540000', 'Public'),
(12, 'Lenmed Ethekwini Hospital', 'Riverhorse Valley, Durban, 4001', 'KwaZulu-Natal', '0315812000', 'Private'),
(13, 'Cecil John Rhodes Memorial Hospital', 'Rhodes St, Kimberley, 8301', 'Northern Cape', '0538317000', 'Public'),
(14, 'Zululand Private Hospital', '56 Durnacol St, Vryheid, 3100', 'KwaZulu-Natal', '0349899100', 'Private'),
(15, 'Witbank General Hospital', 'Steenkamp St, Emalahleni, 1035', 'Mpumalanga', '0136539000', 'Public'),
(16, 'Arwyp Medical Centre', '20 Pine Ave, Kempton Park, 1619', 'Gauteng', '0119221000', 'Private'),
(17, 'Mthatha General Hospital', 'Nelson Mandela Dr, Mthatha, 5100', 'Eastern Cape', '0475024000', 'Public'),
(18, 'Netcare Unitas Hospital', 'Clifton Ave, Centurion, 0157', 'Gauteng', '0126778000', 'Private'),
(19, 'Piet Retief Provincial Hospital', 'Joubert St, Piet Retief, 2380', 'Mpumalanga', '0178262080', 'Public'),
(20, 'Bethal Hospital', 'Chris Hani Rd, Bethal, 2310', 'Mpumalanga', '0176474555', 'Public');

-- Medical Records
-- MedicalHistory Table
CREATE TABLE MedicalHistory (
    HistoryID INT PRIMARY KEY NOT NULL,
    PatientID INT NOT NULL,
    Province VARCHAR(20) NOT NULL,
    HospitalID INT NOT NULL,
    Illness VARCHAR(100) NOT NULL,
    DiagnosisDate DATE NOT NULL,
    Notes TEXT NOT NULL,
    FOREIGN KEY (PatientID) REFERENCES Patients(PatientID)
);

INSERT INTO MedicalHistory (HistoryID, PatientID, Province, HospitalID, Illness, DiagnosisDate, Notes) VALUES
(1, 1, 'Gauteng', 2, 'Hypertension', '2023-01-15', 'Patient advised to reduce salt intake and monitor blood pressure regularly.'),
(2, 2, 'KwaZulu-Natal', 4, 'Asthma', '2022-11-20', 'Prescribed inhaler and advised to avoid allergens.'),
(3, 3, 'Western Cape', 1, 'Diabetes', '2021-05-10', 'Patient put on insulin therapy and dietary changes recommended.'),
(4, 4, 'Eastern Cape', 5, 'Arthritis', '2023-03-22', 'Physical therapy sessions scheduled.'),
(5, 5, 'Free State', 10, 'Migraine', '2022-07-18', 'Prescribed medication for pain relief and advised to avoid triggers.'),
(6, 6, 'Mpumalanga', 7, 'Allergies', '2023-02-05', 'Patient advised to take antihistamines and avoid known allergens.'),
(7, 7, 'Limpopo', 6, 'Hypertension', '2021-09-30', 'Regular monitoring and lifestyle changes recommended.'),
(8, 8, 'North West', 9, 'Back Pain', '2022-12-12', 'Referred to orthopedic specialist for further evaluation.'),
(9, 9, 'Northern Cape', 8, 'Chronic Bronchitis', '2023-04-25', 'Patient advised to quit smoking and prescribed bronchodilators.'),
(10, 10, 'Gauteng', 3, 'Depression', '2022-10-05', 'Referred to psychiatrist and started on antidepressants.');

-- Medications Table
CREATE TABLE Medications (
    MedicationID INT PRIMARY KEY NOT NULL,
    PatientID INT NOT NULL,
    Province VARCHAR(20) NOT NULL,
    HospitalID INT NOT NULL,
    MedicationName VARCHAR(100) NOT NULL,
    Dosage VARCHAR(50) NOT NULL,
    StartDate DATE NOT NULL,
    EndDate DATE NOT NULL,
    FOREIGN KEY (PatientID) REFERENCES Patients(PatientID)
);

INSERT INTO Medications (MedicationID, PatientID, Province, HospitalID, MedicationName, Dosage, StartDate, EndDate) VALUES
(1, 1, 'Gauteng', 2, 'Lisinopril', '10mg', '2023-01-16', '2023-07-16'),
(2, 2, 'KwaZulu-Natal', 4, 'Salbutamol Inhaler', '2 puffs', '2022-11-21', '2023-11-21'),
(3, 3, 'Western Cape', 1, 'Metformin', '500mg', '2021-05-11', '2022-05-11'),
(4, 4, 'Eastern Cape', 5, 'Ibuprofen', '400mg', '2023-03-23', '2023-09-23'),
(5, 5, 'Free State', 10, 'Sumatriptan', '50mg', '2022-07-19', '2023-01-19'),
(6, 6, 'Mpumalanga', 7, 'Cetirizine', '10mg', '2023-02-06', '2023-08-06'),
(7, 7, 'Limpopo', 6, 'Amlodipine', '5mg', '2021-10-01', '2022-04-01'),
(8, 8, 'North West', 9, 'Paracetamol', '500mg', '2022-12-13', '2023-06-13'),
(9, 9, 'Northern Cape', 8, 'Tiotropium', '18mcg', '2023-04-26', '2023-10-26'),
(10, 10, 'Gauteng', 3, 'Sertraline', '50mg', '2022-10-06', '2023-04-06');

INSERT INTO Medications (MedicationID, PatientID, Province, HospitalID, MedicationName, Dosage, StartDate, EndDate) VALUES
(11, 11, 'Gauteng', 2, 'Atorvastatin', '20mg', '2023-03-10', '2023-09-10'),  
(12, 12, 'KwaZulu-Natal', 4, 'Montelukast', '10mg', '2022-08-01', '2023-08-01'), 
(13, 13, 'Eastern Cape', 5, 'Omeprazole', '40mg', '2021-12-15', '2022-06-15'),  
(14, 14, 'Limpopo', 6, 'Aspirin', '75mg', '2023-05-20', '2023-11-20'), 
(15, 15, 'Western Cape', 1, 'Losartan', '50mg', '2023-04-05', '2023-10-05'), 
(16, 16, 'Free State', 10, 'Levothyroxine', '100mcg', '2022-07-25', '2023-01-25'),
(17, 17, 'Mpumalanga', 7, 'Clopidogrel', '75mg', '2021-11-30', '2022-05-30'), 
(18, 18, 'North West', 9, 'Simvastatin', '20mg', '2022-01-10', '2022-07-10'), 
(19, 19, 'Northern Cape', 8, 'Metoprolol', '50mg', '2023-06-01', '2023-12-01'), 
(20, 20, 'Gauteng', 3, 'Fluoxetine', '20mg', '2022-09-15', '2023-03-15'); 

-- Visits Table
CREATE TABLE Visits (
    VisitID INT PRIMARY KEY NOT NULL,
    PatientID INT NOT NULL,
    Province VARCHAR(20) NOT NULL,
    HospitalID INT NOT NULL,
    VisitDate DATE NOT NULL,
    Reason VARCHAR(100) NOT NULL,
    DoctorID INT NOT NULL,
    Notes TEXT NOT NULL,
    FOREIGN KEY (PatientID) REFERENCES Patients(PatientID),
    FOREIGN KEY (DoctorID) REFERENCES Doctors(DoctorID),
    FOREIGN KEY (HospitalID) REFERENCES Hospitals(HospitalID)
);

INSERT INTO Visits (VisitID, PatientID, Province, HospitalID, VisitDate, Reason, DoctorID, Notes) VALUES
-- Rows 1 to 10
(1, 1, 'Gauteng', 2, '2023-01-15', 'Routine Check-up', 1, 'Patient in good health, no issues reported.'),
(2, 2, 'KwaZulu-Natal', 4, '2023-02-10', 'Flu Symptoms', 2, 'Prescribed bed rest and medication for flu symptoms.'),
(3, 3, 'Western Cape', 1, '2023-03-22', 'Blood Pressure Check', 5, 'Blood pressure slightly elevated, advised monitoring.'),
(4, 4, 'Eastern Cape', 5, '2023-04-17', 'Back Pain', 3, 'Prescribed physical therapy for chronic back pain.'),
(5, 5, 'Free State', 10, '2023-05-19', 'Migraine', 4, 'Prescribed medication for migraine relief.'),
(6, 6, 'Mpumalanga', 7, '2023-06-12', 'Allergy Symptoms', 7, 'Antihistamines prescribed, patient advised to avoid allergens.'),
(7, 7, 'Limpopo', 6, '2023-07-08', 'High Blood Pressure', 6, 'Patient advised to make lifestyle changes and prescribed medication.'),
(8, 8, 'North West', 9, '2023-08-14', 'Knee Pain', 9, 'Referred to orthopedic specialist for evaluation.'),
(9, 9, 'Northern Cape', 8, '2023-09-23', 'Chronic Cough', 8, 'Patient prescribed bronchodilators and advised to quit smoking.'),
(10, 10, 'Gauteng', 3, '2023-10-01', 'Depression Symptoms', 10, 'Patient referred to psychiatrist, started on antidepressants.'),

-- Rows 11 to 20
(11, 1, 'Gauteng', 2, '2023-11-11', 'Follow-up Check-up', 1, 'Patient stable, blood pressure under control.'),
(12, 2, 'KwaZulu-Natal', 4, '2023-12-01', 'Asthma Flare-up', 2, 'Inhaler dosage adjusted, patient advised to avoid allergens.'),
(13, 3, 'Western Cape', 1, '2023-12-15', 'Diabetes Monitoring', 5, 'Blood sugar levels within range, continue insulin therapy.'),
(14, 4, 'Eastern Cape', 5, '2023-12-20', 'Arthritis Pain', 3, 'Patient referred to physical therapy for ongoing management.'),
(15, 5, 'Free State', 10, '2023-12-25', 'Headache', 4, 'Prescribed pain relief, advised hydration and rest.'),
(16, 6, 'Mpumalanga', 7, '2023-12-28', 'Rash', 7, 'Prescribed topical cream for rash, advised follow-up in 2 weeks.'),
(17, 7, 'Limpopo', 6, '2024-01-05', 'Chest Pain', 6, 'Patient referred for ECG, advised to monitor symptoms.'),
(18, 8, 'North West', 9, '2024-01-10', 'Back Pain', 9, 'Patient advised on exercises and posture improvements.'),
(19, 9, 'Northern Cape', 8, '2024-01-15', 'Bronchitis', 8, 'Continued bronchodilator treatment, follow-up in 1 month.'),
(20, 10, 'Gauteng', 3, '2024-01-18', 'Follow-up for Depression', 10, 'Patient responding well to treatment, no side effects.'),

-- Rows 21 to 30
(21, 1, 'Gauteng', 2, '2024-01-25', 'General Check-up', 1, 'Routine check-up, patient in stable condition.'),
(22, 2, 'KwaZulu-Natal', 4, '2024-02-01', 'Cough and Cold', 2, 'Prescribed cough syrup and rest.'),
(23, 3, 'Western Cape', 1, '2024-02-05', 'Foot Pain', 5, 'Referred to podiatrist for further evaluation.'),
(24, 4, 'Eastern Cape', 5, '2024-02-10', 'Neck Pain', 3, 'Patient given exercises for pain relief, referred to specialist.'),
(25, 5, 'Free State', 10, '2024-02-15', 'Migraine', 4, 'Prescribed additional migraine medication, advised follow-up.'),
(26, 6, 'Mpumalanga', 7, '2024-02-20', 'Allergic Reaction', 7, 'Given antihistamines, advised to avoid triggers.'),
(27, 7, 'Limpopo', 6, '2024-02-22', 'Follow-up for High Blood Pressure', 6, 'Blood pressure under control, no issues.'),
(28, 8, 'North West', 9, '2024-02-25', 'Hip Pain', 9, 'Patient referred for X-ray to assess damage.'),
(29, 9, 'Northern Cape', 8, '2024-02-28', 'Fatigue', 8, 'Patient referred for blood tests, advised rest and hydration.'),
(30, 10, 'Gauteng', 3, '2024-03-01', 'Anxiety', 10, 'Psychiatrist prescribed medication for anxiety management.'),

-- Rows 31 to 40
(31, 1, 'Gauteng', 2, '2024-03-05', 'Chest Infection', 1, 'Patient prescribed antibiotics, follow-up in 2 weeks.'),
(32, 2, 'KwaZulu-Natal', 4, '2024-03-10', 'Allergic Rhinitis', 2, 'Patient given nasal spray, advised to monitor symptoms.'),
(33, 3, 'Western Cape', 1, '2024-03-15', 'High Cholesterol', 5, 'Diet changes recommended, patient put on statins.'),
(34, 4, 'Eastern Cape', 5, '2024-03-20', 'Shoulder Pain', 3, 'Physical therapy prescribed for shoulder pain relief.'),
(35, 5, 'Free State', 10, '2024-03-25', 'Tension Headache', 4, 'Prescribed relaxation exercises and pain relief.'),
(36, 6, 'Mpumalanga', 7, '2024-03-30', 'Skin Rash', 7, 'Prescribed ointment, advised to avoid irritants.'),
(37, 7, 'Limpopo', 6, '2024-04-01', 'Follow-up for Chest Pain', 6, 'ECG results normal, patient stable.'),
(38, 8, 'North West', 9, '2024-04-05', 'Back Pain', 9, 'Patient given exercises to manage pain, referred to specialist.'),
(39, 9, 'Northern Cape', 8, '2024-04-10', 'Chronic Cough', 8, 'Bronchodilator treatment continued, advised regular follow-up.'),
(40, 10, 'Gauteng', 3, '2024-04-15', 'Depression', 10, 'Patient referred for therapy, medication adjusted.');


-- LabResults Table
CREATE TABLE LabResults (
    LabResultID INT PRIMARY KEY NOT NULL,
    PatientID INT NOT NULL,
    Province VARCHAR(20) NOT NULL,
    HospitalID INT NOT NULL,
    TestName VARCHAR(100) NOT NULL,
    TestDate DATE NOT NULL,
    Result VARCHAR(100) NOT NULL,
    Notes TEXT NOT NULL,
    FOREIGN KEY (PatientID) REFERENCES Patients(PatientID),
    FOREIGN KEY (HospitalID) REFERENCES Hospitals(HospitalID)
);
 
INSERT INTO LabResults (LabResultID, PatientID, Province, HospitalID, TestName, TestDate, Result, Notes) 
VALUES
(1, 1, 'Gauteng', 2, 'Blood Pressure', '2023-01-15', '140/90', 'Slightly elevated. Monitor regularly.'),
(2, 2, 'KwaZulu-Natal', 4, 'Lung Function Test', '2023-02-20', 'Normal', 'Test performed using spirometry.'),
(3, 3, 'Western Cape', 1, 'HbA1c', '2023-03-05', '6.5%', 'Indicates pre-diabetes. Dietary changes suggested.'),
(4, 4, 'Eastern Cape', 5, 'Rheumatoid Factor', '2023-01-22', 'Negative', 'No evidence of rheumatoid arthritis.'),
(5, 5, 'Free State', 10, 'MRI Brain', '2023-04-14', 'Normal', 'No abnormalities detected in MRI scan.'),
(6, 6, 'Mpumalanga', 7, 'Allergy Panel', '2023-02-15', 'Positive for Dust Mites', 'Patient advised to minimize exposure.'),
(7, 7, 'Limpopo', 6, 'Blood Glucose', '2023-05-12', '7.2 mmol/L', 'Slightly elevated. Recheck in 6 months.'),
(8, 8, 'North West', 9, 'X-Ray Back', '2023-03-25', 'Minor Degeneration', 'Refer to orthopedic specialist.'),
(9, 9, 'Northern Cape', 8, 'Pulmonary Function Test', '2023-04-30', 'Reduced Function', 'Advise smoking cessation immediately.'),
(10, 10, 'Gauteng', 3, 'Thyroid Function Test', '2023-05-10', 'Normal', 'No abnormalities found in TSH levels.'),
(11, 1, 'Gauteng', 2, 'Cholesterol', '2023-06-10', 'High', 'Prescribe statins. Monitor lipid profile.'),
(12, 2, 'KwaZulu-Natal', 4, 'Skin Allergy Test', '2023-05-18', 'Negative', 'No reaction to common allergens.'),
(13, 3, 'Western Cape', 1, 'Liver Function Test', '2023-06-01', 'Normal', 'No signs of liver disease.'),
(14, 4, 'Eastern Cape', 5, 'Complete Blood Count', '2023-04-10', 'Anemia Detected', 'Recommend iron supplements.'),
(15, 5, 'Free State', 10, 'CT Scan Head', '2023-06-18', 'Normal', 'No abnormalities in scan.'),
(16, 6, 'Mpumalanga', 7, 'Allergy Test', '2023-03-22', 'Positive for Pollen', 'Patient advised to take antihistamines.'),
(17, 7, 'Limpopo', 6, 'Urine Test', '2023-04-17', 'Normal', 'No signs of infection.'),
(18, 8, 'North West', 9, 'Bone Density Scan', '2023-06-05', 'Osteopenia Detected', 'Recommend calcium and vitamin D supplements.'),
(19, 9, 'Northern Cape', 8, 'Blood Sugar', '2023-05-26', '8.0 mmol/L', 'Diabetic range. Refer to endocrinologist.'),
(20, 10, 'Gauteng', 3, 'Electrocardiogram (ECG)', '2023-06-20', 'Normal', 'No signs of cardiac issues.'),
(21, 1, 'Gauteng', 2, 'Kidney Function Test', '2023-07-15', 'Normal', 'No signs of kidney dysfunction.'),
(22, 2, 'KwaZulu-Natal', 4, 'Allergy Test', '2023-07-18', 'Positive for Grass Pollen', 'Advise antihistamine use during allergy season.'),
(23, 3, 'Western Cape', 1, 'Blood Pressure', '2023-07-19', '120/80', 'Normal range. No issues detected.'),
(24, 4, 'Eastern Cape', 5, 'Chest X-Ray', '2023-07-20', 'Normal', 'No abnormalities detected in chest X-ray.'),
(25, 5, 'Free State', 10, 'Brain CT Scan', '2023-07-21', 'No Abnormalities', 'No abnormalities detected in scan.'),
(26, 6, 'Mpumalanga', 7, 'Full Blood Count', '2023-07-22', 'Normal', 'No signs of infection or anemia.'),
(27, 7, 'Limpopo', 6, 'Blood Glucose', '2023-07-23', '5.5 mmol/L', 'Normal range.'),
(28, 8, 'North West', 9, 'Blood Pressure', '2023-07-24', '145/95', 'Hypertension detected. Prescribe medication.'),
(29, 9, 'Northern Cape', 8, 'Bone Mineral Density', '2023-07-25', 'Normal', 'No signs of osteoporosis.'),
(30, 10, 'Gauteng', 3, 'Liver Function Test', '2023-07-26', 'Normal', 'No liver issues detected.'),
(31, 1, 'Gauteng', 2, 'Electrolyte Panel', '2023-07-27', 'Normal', 'Electrolytes in balance.'),
(32, 2, 'KwaZulu-Natal', 4, 'Pulmonary Function Test', '2023-07-28', 'Normal', 'Lung function is within normal limits.'),
(33, 3, 'Western Cape', 1, 'HbA1c', '2023-07-29', '7.1%', 'Indicates diabetes. Recommend treatment plan.'),
(34, 4, 'Eastern Cape', 5, 'Thyroid Function Test', '2023-07-30', 'Hypothyroidism', 'Prescribe thyroid hormone replacement.'),
(35, 5, 'Free State', 10, 'Urinalysis', '2023-07-31', 'Normal', 'No infection detected.'),
(36, 6, 'Mpumalanga', 7, 'Allergy Panel', '2023-08-01', 'Positive for Cat Dander', 'Patient advised to avoid exposure to cats.'),
(37, 7, 'Limpopo', 6, 'Complete Blood Count', '2023-08-02', 'Normal', 'No signs of infection or abnormality.'),
(38, 8, 'North West', 9, 'Chest X-Ray', '2023-08-03', 'Normal', 'No abnormalities detected.'),
(39, 9, 'Northern Cape', 8, 'Cholesterol Test', '2023-08-04', 'High', 'Advise lifestyle changes and prescribe statins.'),
(40, 10, 'Gauteng', 3, 'Blood Glucose', '2023-08-05', 'Normal', 'No diabetes detected.');
 

-- Immunizations Table
CREATE TABLE Immunizations (
    ImmunizationID INT PRIMARY KEY NOT NULL,
    PatientID INT NOT NULL,
    HospitalID INT NOT NULL,
    VaccineName VARCHAR(100) NOT NULL,
    ImmunizationDate DATE NOT NULL,
    Notes TEXT NOT NULL,
    FOREIGN KEY (PatientID) REFERENCES Patients(PatientID),
    FOREIGN KEY (HospitalID) REFERENCES Hospitals(HospitalID)
);


INSERT INTO Immunizations (ImmunizationID, PatientID, HospitalID, VaccineName, ImmunizationDate, Notes) 
VALUES
(1, 1, 2, 'COVID-19 (Pfizer)', '2021-05-01', 'First dose administered. No adverse effects reported.'),
(2, 2, 4, 'COVID-19 (J&J)', '2021-06-10', 'Single dose. Mild fever experienced post-vaccination.'),
(3, 3, 1, 'COVID-19 (Pfizer)', '2021-07-15', 'First dose administered. Mild headache reported.'),
(4, 4, 5, 'Hepatitis B', '2021-08-20', 'First dose. No adverse reactions reported.'),
(5, 5, 10, 'Measles, Mumps, and Rubella (MMR)', '2021-09-12', 'Routine childhood vaccination.'),
(6, 6, 7, 'Tetanus', '2021-10-05', 'Booster shot. No reactions reported.'),
(7, 7, 6, 'COVID-19 (Pfizer)', '2021-11-23', 'First dose. No adverse reactions reported.'),
(8, 8, 9, 'Flu Vaccine', '2022-01-15', 'Annual flu vaccine. Minor injection site soreness.'),
(9, 9, 8, 'COVID-19 (Pfizer)', '2022-02-10', 'Second dose administered. Mild fatigue reported.'),
(10, 10, 3, 'Yellow Fever', '2022-03-05', 'Vaccine for international travel. No side effects reported.'),
(11, 1, 2, 'COVID-19 (Pfizer)', '2022-04-01', 'Second dose administered. No adverse effects.'),
(12, 2, 4, 'Pneumococcal Vaccine', '2022-05-12', 'Administered to prevent pneumonia. No side effects.'),
(13, 3, 1, 'COVID-19 (Pfizer)', '2022-06-16', 'Booster shot administered. Mild fatigue reported.'),
(14, 4, 5, 'Tetanus', '2022-07-25', 'Booster shot. No reactions.'),
(15, 5, 10, 'HPV', '2022-08-10', 'First dose of HPV vaccine.'),
(16, 6, 7, 'Meningococcal Vaccine', '2022-09-03', 'Administered for meningitis prevention. No side effects.'),
(17, 7, 6, 'Flu Vaccine', '2022-10-21', 'Annual flu vaccine. Soreness at the injection site.'),
(18, 8, 9, 'COVID-19 (Pfizer)', '2022-11-11', 'Booster shot. No side effects reported.'),
(19, 9, 8, 'Hepatitis A', '2022-12-18', 'First dose administered. No adverse reactions reported.'),
(20, 10, 3, 'Typhoid', '2023-01-05', 'Administered for international travel. No reactions reported.'),
(21, 1, 2, 'Flu Vaccine', '2023-02-12', 'Annual flu vaccine. Soreness at injection site.'),
(22, 2, 4, 'Polio Vaccine', '2023-03-25', 'Routine booster shot. No adverse reactions.'),
(23, 3, 1, 'COVID-19 (Moderna)', '2023-04-10', 'Booster shot administered. No side effects reported.'),
(24, 4, 5, 'Rabies Vaccine', '2023-05-06', 'Administered after animal bite.'),
(25, 5, 10, 'DTP (Diphtheria, Tetanus, Pertussis)', '2023-06-12', 'Routine childhood vaccine.'),
(26, 6, 7, 'MMR (Measles, Mumps, Rubella)', '2023-07-01', 'Routine vaccine. No side effects reported.'),
(27, 7, 6, 'Flu Vaccine', '2023-08-09', 'Annual flu shot. Mild fever reported post-vaccination.'),
(28, 8, 9, 'COVID-19 (J&J)', '2023-09-15', 'Booster shot administered. No side effects reported.'),
(29, 9, 8, 'Hepatitis B', '2023-10-20', 'Booster shot. No adverse effects reported.'),
(30, 10, 3, 'Varicella (Chickenpox)', '2023-11-05', 'Routine childhood vaccine.'),
(31, 1, 2, 'Flu Vaccine', '2023-12-10', 'Annual flu vaccine. No adverse effects reported.'),
(32, 2, 4, 'Typhoid', '2023-12-15', 'Vaccine for travel. No side effects reported.'),
(33, 3, 1, 'Hepatitis A', '2024-01-18', 'Booster shot administered.'),
(34, 4, 5, 'Pneumococcal Vaccine', '2024-02-08', 'Administered to prevent pneumonia. No side effects reported.'),
(35, 5, 10, 'HPV', '2024-03-06', 'Second dose of HPV vaccine.'),
(36, 6, 7, 'Flu Vaccine', '2024-04-10', 'Annual flu shot. Mild soreness at the injection site.'),
(37, 7, 6, 'COVID-19 (Moderna)', '2024-05-20', 'Second booster. No adverse reactions.'),
(38, 8, 9, 'Yellow Fever', '2024-06-18', 'Vaccine for travel. No adverse reactions reported.'),
(39, 9, 8, 'Meningococcal Vaccine', '2024-07-09', 'Booster shot administered. No side effects reported.'),
(40, 10, 3, 'Flu Vaccine', '2024-08-15', 'Annual flu shot. No adverse effects reported.');


-- Administrative Records
-- Appointments Table
CREATE TABLE Appointments (
    AppointmentID INT PRIMARY KEY NOT NULL,
    PatientID INT NOT NULL,
    AppointmentDate DATE NOT NULL,
	Province VARCHAR(20) NOT NULL,
    HospitalID INT NOT NULL,
    DoctorID INT NOT NULL,
    Reason VARCHAR(100) NOT NULL,
    Notes TEXT NOT NULL,
    FOREIGN KEY (PatientID) REFERENCES Patients(PatientID),
    FOREIGN KEY (DoctorID) REFERENCES Doctors(DoctorID),
    FOREIGN KEY (HospitalID) REFERENCES Hospitals(HospitalID)
);

INSERT INTO Appointments (AppointmentID, PatientID, AppointmentDate, Province, HospitalID, DoctorID, Reason, Notes) 
VALUES
(1, 1, '2023-01-10', 'Gauteng', 2, 1, 'Routine Check-up', 'Patient appears healthy, regular follow-up recommended.'),
(2, 2, '2023-01-12', 'KwaZulu-Natal', 4, 2, 'Vaccination Appointment', 'Administered influenza vaccine.'),
(3, 3, '2023-01-14', 'Western Cape', 1, 3, 'Follow-up on Diabetes', 'Glucose levels slightly elevated, adjust diet.'),
(4, 4, '2023-01-16', 'Eastern Cape', 5, 4, 'Chest Pain Assessment', 'Cardiac evaluation advised due to symptoms.'),
(5, 5, '2023-01-18', 'Free State', 10, 5, 'Skin Allergy Consultation', 'Patient reports rash; allergy testing recommended.'),
(6, 6, '2023-01-20', 'Mpumalanga', 7, 6, 'Annual Physical Exam', 'Patient in good health, cholesterol levels normal.'),
(7, 7, '2023-01-22', 'Limpopo', 6, 7, 'Mental Health Check', 'Discussed anxiety management strategies.'),
(8, 8, '2023-01-24', 'North West', 9, 8, 'Routine Check-up', 'No significant health concerns reported.'),
(9, 9, '2023-01-26', 'Northern Cape', 8, 9, 'Follow-up on Hypertension', 'Blood pressure within normal range, continue monitoring.'),
(10, 10, '2023-01-28', 'Gauteng', 3, 10, 'Pediatric Consultation', 'Routine vaccination for a 5-year-old.'),
(11, 11, '2023-02-02', 'Gauteng', 2, 1, 'Routine Health Screening', 'All tests returned normal results.'),
(12, 12, '2023-02-05', 'KwaZulu-Natal', 4, 2, 'Follow-up on Asthma', 'Asthma well-controlled, refill prescription.'),
(13, 13, '2023-02-08', 'Western Cape', 1, 3, 'Routine Check-up', 'Patient healthy, schedule next visit in 6 months.'),
(14, 14, '2023-02-10', 'Eastern Cape', 5, 4, 'Gastrointestinal Issues', 'Endoscopy scheduled for next month.'),
(15, 15, '2023-02-12', 'Free State', 10, 5, 'Chronic Pain Management', 'Updated pain management plan.'),
(16, 16, '2023-02-14', 'Mpumalanga', 7, 6, 'Routine Vaccination', 'Administered DTP vaccine.'),
(17, 17, '2023-02-16', 'Limpopo', 6, 7, 'Diabetes Check-up', 'A1C levels improved, patient advised on diet.'),
(18, 18, '2023-02-18', 'North West', 9, 8, 'Cardiology Consultation', 'ECG and echocardiogram results discussed.'),
(19, 19, '2023-02-20', 'Northern Cape', 8, 9, 'Follow-up Appointment', 'Patient recovering well from surgery.'),
(20, 20, '2023-02-22', 'Gauteng', 3, 10, 'Pediatric Review', 'Discussed growth milestones with parents.'),
(21, 21, '2023-03-01', 'Gauteng', 2, 1, 'Mental Health Follow-up', 'Patient showing signs of improvement.'),
(22, 22, '2023-03-03', 'KwaZulu-Natal', 4, 2, 'Immunization Appointment', 'Administered hepatitis B vaccine.'),
(23, 23, '2023-03-05', 'Western Cape', 1, 3, 'Check-up for Hypertension', 'Medication adjusted, next visit in 3 months.'),
(24, 24, '2023-03-07', 'Eastern Cape', 5, 4, 'Nutrition Consultation', 'Dietary changes discussed for weight loss.'),
(25, 25, '2023-03-09', 'Free State', 10, 5, 'Respiratory Check', 'No signs of infection, asthma plan reinforced.'),
(26, 26, '2023-03-11', 'Mpumalanga', 7, 6, 'Annual Check-up', 'Patient encouraged to maintain healthy lifestyle.'),
(27, 27, '2023-03-13', 'Limpopo', 6, 7, 'Follow-up on Allergies', 'New medications prescribed for allergic rhinitis.'),
(28, 28, '2023-03-15', 'North West', 9, 8, 'Routine Physical Exam', 'Overall health satisfactory, labs ordered.'),
(29, 29, '2023-03-17', 'Northern Cape', 8, 9, 'Post-Operative Review', 'Healing well after surgery.'),
(30, 30, '2023-03-19', 'Gauteng', 3, 10, 'Child Wellness Check', 'Routine health assessment for a 3-year-old.'),
(31, 31, '2023-04-01', 'Gauteng', 2, 1, 'Follow-up on Weight Loss', 'Patient encouraged to continue diet plan.'),
(32, 32, '2023-04-03', 'KwaZulu-Natal', 4, 2, 'Routine Immunization', 'Administered MMR vaccine.'),
(33, 33, '2023-04-05', 'Western Cape', 1, 3, 'Chronic Illness Review', 'Patient stable, medication continues.'),
(34, 34, '2023-04-07', 'Eastern Cape', 5, 4, 'Assessment for Back Pain', 'Referred to physiotherapy.'),
(35, 35, '2023-04-09', 'Free State', 10, 5, 'Seasonal Allergy Review', 'Medication updated for allergy symptoms.'),
(36, 36, '2023-04-11', 'Mpumalanga', 7, 6, 'Wellness Check', 'No major concerns noted during examination.'),
(37, 37, '2023-04-13', 'Limpopo', 6, 7, 'Follow-up on Mental Health', 'Patient reports improvement, continue therapy.'),
(38, 38, '2023-04-15', 'North West', 9, 8, 'Routine Check-up', 'Lab results within normal limits.'),
(39, 39, '2023-04-17', 'Northern Cape', 8, 9, 'Follow-up on Diabetes', 'Discussed blood sugar management.'),
(40, 40, '2023-04-19', 'Gauteng', 3, 10, 'Pediatric Growth Assessment', 'Reviewed growth parameters with parents.');



-- Public Health Data
-- HealthPrograms Table
CREATE TABLE HealthPrograms (
    ProgramID INT PRIMARY KEY NOT NULL,
    Name VARCHAR(100) NOT NULL,
    Info TEXT NOT NULL,
	Province VARCHAR(20),
    HospitalID INT NOT NULL,
    StartDate DATE NOT NULL,
    EndDate DATE NOT NULL,
    TargetPopulation VARCHAR(100) NOT NULL,
    FOREIGN KEY (HospitalID) REFERENCES Hospitals(HospitalID)
);

INSERT INTO HealthPrograms (ProgramID, Name, Info, Province, HospitalID, StartDate, EndDate, TargetPopulation) 
VALUES
(1, 'HIV/AIDS Awareness', 'A program aimed at educating the community about HIV prevention and treatment.', 'Gauteng', 1, '2023-01-01', '2023-12-31', 'Youth and Adults'),
(2, 'Diabetes Management', 'Offering support and resources for diabetes care and management.', 'KwaZulu-Natal', 2, '2023-02-01', '2024-01-31', 'Adults with Diabetes'),
(3, 'Mental Health Support', 'Providing counseling and resources for mental health awareness and support.', 'Western Cape', 3, '2023-03-01', '2024-03-01', 'All Age Groups'),
(4, 'Maternal Health Program', 'A comprehensive program for prenatal and postnatal care for mothers.', 'Eastern Cape', 4, '2023-04-01', '2024-04-01', 'Pregnant Women'),
(5, 'Child Immunization Drive', 'Promoting immunization among children under 5 years.', 'Free State', 5, '2023-05-01', '2024-05-01', 'Children under 5'),
(6, 'Nutrition and Wellness', 'Educating the community about healthy eating and wellness.', 'Mpumalanga', 6, '2023-06-01', '2024-06-01', 'Families'),
(7, 'Cardiac Health Awareness', 'Programs focused on heart health and disease prevention.', 'Limpopo', 7, '2023-07-01', '2024-07-01', 'Adults over 40'),
(8, 'Tuberculosis Screening', 'Offering free screening and treatment for tuberculosis.', 'North West', 8, '2023-08-01', '2024-08-01', 'High-risk groups'),
(9, 'Cancer Screening and Awareness', 'Promoting early detection of cancers through screening.', 'Northern Cape', 9, '2023-09-01', '2024-09-01', 'Adults over 35'),
(10, 'Sexual Health Education', 'Providing education on sexual health and safe practices.', 'Gauteng', 1, '2023-10-01', '2024-10-01', 'Adolescents'),
(11, 'Elderly Care Program', 'Support services for elderly citizens in the community.', 'KwaZulu-Natal', 2, '2023-11-01', '2024-11-01', 'Elderly Population'),
(12, 'Healthy Lifestyle Promotion', 'Encouraging active lifestyles through fitness programs.', 'Western Cape', 3, '2023-12-01', '2024-12-01', 'All Age Groups'),
(13, 'HIV Testing and Counseling', 'Free testing and counseling services for HIV.', 'Eastern Cape', 4, '2023-01-15', '2024-01-15', 'Youth and Adults'),
(14, 'Stroke Prevention Awareness', 'Educating the community about stroke risk factors and prevention.', 'Free State', 5, '2023-02-15', '2024-02-15', 'Adults over 30'),
(15, 'Mental Health First Aid Training', 'Training for community members to support those with mental health issues.', 'Mpumalanga', 6, '2023-03-15', '2024-03-15', 'Community Leaders'),
(16, 'Family Planning Services', 'Offering resources and counseling on family planning options.', 'Limpopo', 7, '2023-04-15', '2024-04-15', 'Women of Reproductive Age'),
(17, 'Youth Empowerment Program', 'Programs to empower youth through health education and skills training.', 'North West', 8, '2023-05-15', '2024-05-15', 'Youth aged 15-24'),
(18, 'Diabetes Screening Program', 'Offering free diabetes screening and education on management.', 'Northern Cape', 9, '2023-06-15', '2024-06-15', 'Adults at Risk'),
(19, 'Community Health Workshops', 'Regular workshops on various health topics for the community.', 'Gauteng', 1, '2023-07-15', '2024-07-15', 'General Public'),
(20, 'Chronic Disease Management', 'Support for individuals managing chronic diseases.', 'KwaZulu-Natal', 2, '2023-08-15', '2024-08-15', 'Chronic Disease Patients'),
(21, 'Senior Wellness Check', 'Free health checks and assessments for seniors.', 'Western Cape', 3, '2023-09-15', '2024-09-15', 'Elderly Population'),
(22, 'Substance Abuse Prevention', 'Programs aimed at preventing substance abuse in the community.', 'Eastern Cape', 4, '2023-10-15', '2024-10-15', 'Youth and Adults'),
(23, 'Healthy Pregnancy Initiative', 'Support for expectant mothers for a healthy pregnancy.', 'Free State', 5, '2023-11-15', '2024-11-15', 'Pregnant Women'),
(24, 'Breastfeeding Support Group', 'Providing resources and support for breastfeeding mothers.', 'Mpumalanga', 6, '2023-12-15', '2024-12-15', 'New Mothers'),
(25, 'Elderly Nutrition Program', 'Education on nutrition specifically for the elderly.', 'Limpopo', 7, '2023-01-20', '2024-01-20', 'Elderly Population'),
(26, 'Mental Health Awareness Campaign', 'Campaign to reduce stigma around mental health issues.', 'North West', 8, '2023-02-20', '2024-02-20', 'General Public'),
(27, 'Youth Sexual Health Initiative', 'Education on sexual health for youth.', 'Northern Cape', 9, '2023-03-20', '2024-03-20', 'Adolescents'),
(28, 'Access to Clean Water Initiative', 'Providing resources for clean water access in communities.', 'Gauteng', 1, '2023-04-20', '2024-04-20', 'Low-Income Families'),
(29, 'Preventive Health Screening', 'Offering various preventive screenings for early detection.', 'KwaZulu-Natal', 2, '2023-05-20', '2024-05-20', 'All Age Groups'),
(30, 'Childhood Obesity Prevention', 'Programs aimed at preventing obesity in children.', 'Western Cape', 3, '2023-06-20', '2024-06-20', 'Children aged 5-12'),
(31, 'Cardiac Rehabilitation Program', 'Support for patients recovering from heart procedures.', 'Eastern Cape', 4, '2023-07-20', '2024-07-20', 'Heart Patients'),
(32, 'Family Wellness Program', 'Encouraging family-based health and wellness activities.', 'Free State', 5, '2023-08-20', '2024-08-20', 'Families'),
(33, 'Women’s Health Initiative', 'Programs focused on health issues specifically for women.', 'Mpumalanga', 6, '2023-09-20', '2024-09-20', 'Women of All Ages'),
(34, 'Health Education for Schools', 'Programs designed to educate students on health topics.', 'Limpopo', 7, '2023-10-20', '2024-10-20', 'School-Aged Children'),
(35, 'Hepatitis Awareness Program', 'Educating communities about hepatitis prevention and treatment.', 'North West', 8, '2023-11-20', '2024-11-20', 'At-Risk Populations'),
(36, 'Environmental Health Initiative', 'Addressing health issues related to environmental factors.', 'Northern Cape', 9, '2023-12-20', '2024-12-20', 'General Public'),
(37, 'Cancer Awareness Month', 'Campaign to raise awareness about cancer prevention.', 'Gauteng', 1, '2024-01-01', '2024-01-31', 'All Age Groups'),
(38, 'Cervical Cancer Screening', 'Providing free cervical cancer screenings for women.', 'KwaZulu-Natal', 2, '2024-02-01', '2024-02-29', 'Women aged 30-65'),
(39, 'Heart Disease Prevention', 'Educational programs focusing on heart disease risk factors.', 'Western Cape', 3, '2024-03-01', '2024-03-31', 'Adults over 40'),
(40, 'Oral Health Awareness', 'Promoting oral health education and access to dental care.', 'Eastern Cape', 4, '2024-04-01', '2024-04-30', 'Children and Adults');


-- Support Tables
-- MedicationsCatalog Table
CREATE TABLE MedicationsCatalog (
    MedicationID INT PRIMARY KEY NOT NULL,
    Name VARCHAR(100) NOT NULL,
    Info TEXT NOT NULL,
	Province VARCHAR(20) NOT NULL,
    HospitalID INT NOT NULL,
    Manufacturer VARCHAR(100),
    DosageForm VARCHAR(50),
    UnitPrice DECIMAL(10, 2),
    FOREIGN KEY (HospitalID) REFERENCES Hospitals(HospitalID)
);

INSERT INTO MedicationsCatalog (MedicationID, Name, Info, Province, HospitalID, Manufacturer, DosageForm, UnitPrice) 
VALUES
(1, 'Lisinopril', 'An ACE inhibitor used to treat high blood pressure and heart failure.', 'Gauteng', 1, 'Pharma Corp', 'Tablet', 25.50),
(2, 'Metformin', 'Used for managing type 2 diabetes by controlling blood sugar levels.', 'KwaZulu-Natal', 2, 'Health Solutions', 'Tablet', 30.00),
(3, 'Ibuprofen', 'Nonsteroidal anti-inflammatory drug (NSAID) used to reduce pain and inflammation.', 'Western Cape', 3, 'MediPharm', 'Tablet', 15.75),
(4, 'Sertraline', 'Antidepressant used to treat major depressive disorder and anxiety disorders.', 'Eastern Cape', 4, 'Wellness Pharma', 'Tablet', 40.00),
(5, 'Amlodipine', 'Calcium channel blocker used to treat high blood pressure and angina.', 'Free State', 5, 'CardioMed', 'Tablet', 22.00),
(6, 'Cetirizine', 'Antihistamine used for relieving allergy symptoms.', 'Mpumalanga', 6, 'Allergy Solutions', 'Tablet', 18.50),
(7, 'Salbutamol', 'Bronchodilator used to relieve asthma symptoms and other breathing difficulties.', 'Limpopo', 7, 'Respiratory Pharma', 'Inhaler', 35.00),
(8, 'Paracetamol', 'Used to treat mild to moderate pain and reduce fever.', 'North West', 8, 'Pain Relief Inc.', 'Tablet', 10.00),
(9, 'Tiotropium', 'Long-acting bronchodilator for chronic obstructive pulmonary disease (COPD).', 'Northern Cape', 9, 'Pulmonary Pharma', 'Inhaler', 50.00),
(10, 'Sumatriptan', 'Used to treat migraine attacks and cluster headaches.', 'Gauteng', 1, 'NeuroPharm', 'Tablet', 45.00),
(11, 'Simvastatin', 'Used to lower cholesterol levels and reduce the risk of heart disease.', 'KwaZulu-Natal', 2, 'Cholesterol Care', 'Tablet', 28.00),
(12, 'Amoxicillin', 'Antibiotic used to treat a variety of bacterial infections.', 'Western Cape', 3, 'Infection Control', 'Capsule', 12.50),
(13, 'Clopidogrel', 'Antiplatelet medication used to prevent blood clots.', 'Eastern Cape', 4, 'CardioPharma', 'Tablet', 30.00),
(14, 'Metoprolol', 'Beta-blocker used to treat high blood pressure and heart problems.', 'Free State', 5, 'Heart Health', 'Tablet', 32.50),
(15, 'Atorvastatin', 'Used to lower cholesterol and triglyceride levels in the blood.', 'Mpumalanga', 6, 'Lipids Pharma', 'Tablet', 29.75),
(16, 'Warfarin', 'Anticoagulant used to prevent blood clots in patients with certain heart conditions.', 'Limpopo', 7, 'Coagulation Care', 'Tablet', 33.00),
(17, 'Furosemide', 'Diuretic used to reduce fluid retention in patients with heart failure.', 'North West', 8, 'Kidney Health', 'Tablet', 20.00),
(18, 'Hydrochlorothiazide', 'Diuretic used to treat high blood pressure and swelling.', 'Northern Cape', 9, 'Diuretic Pharma', 'Tablet', 14.00),
(19, 'Albuterol', 'Used to relieve bronchospasm in conditions such as asthma.', 'Gauteng', 1, 'Respiratory Care', 'Inhaler', 37.50),
(20, 'Losartan', 'Angiotensin II receptor blocker used to treat high blood pressure.', 'KwaZulu-Natal', 2, 'CardioMed', 'Tablet', 24.00),
(21, 'Gabapentin', 'Used to treat nerve pain and seizures.', 'Western Cape', 3, 'NeuroCare', 'Capsule', 40.00),
(22, 'Oxycodone', 'Opioid pain medication used to treat moderate to severe pain.', 'Eastern Cape', 4, 'Pain Management', 'Tablet', 60.00),
(23, 'Dexamethasone', 'Corticosteroid used to treat inflammation and autoimmune conditions.', 'Free State', 5, 'Steroid Pharma', 'Tablet', 35.00),
(24, 'Levothyroxine', 'Thyroid hormone replacement therapy for hypothyroidism.', 'Mpumalanga', 6, 'Thyroid Health', 'Tablet', 45.00),
(25, 'Ciprofloxacin', 'Antibiotic used to treat bacterial infections.', 'Limpopo', 7, 'Infection Care', 'Tablet', 20.00),
(26, 'Sildenafil', 'Used to treat erectile dysfunction and pulmonary hypertension.', 'North West', 8, 'Men’s Health', 'Tablet', 50.00),
(27, 'Esomeprazole', 'Proton pump inhibitor used to treat gastroesophageal reflux disease (GERD).', 'Northern Cape', 9, 'Digestive Health', 'Tablet', 30.00),
(28, 'Insulin', 'Hormone used to control blood sugar levels in diabetes.', 'Gauteng', 1, 'Diabetes Care', 'Injection', 100.00),
(29, 'Ranitidine', 'Used to treat and prevent ulcers and GERD.', 'KwaZulu-Natal', 2, 'Digestive Pharma', 'Tablet', 22.00),
(30, 'Atenolol', 'Beta-blocker used to treat high blood pressure and chest pain.', 'Western Cape', 3, 'Cardio Solutions', 'Tablet', 27.00),
(31, 'Montelukast', 'Used to prevent asthma attacks and relieve symptoms of seasonal allergies.', 'Eastern Cape', 4, 'Allergy Pharma', 'Tablet', 35.00),
(32, 'Citalopram', 'Antidepressant used to treat depression and anxiety disorders.', 'Free State', 5, 'Mental Health Pharma', 'Tablet', 45.00),
(33, 'Lansoprazole', 'Proton pump inhibitor used to treat stomach and esophagus problems.', 'Mpumalanga', 6, 'Digestive Care', 'Capsule', 29.00),
(34, 'Rosuvastatin', 'Used to lower cholesterol levels and reduce the risk of heart disease.', 'Limpopo', 7, 'Lipid Solutions', 'Tablet', 28.50),
(35, 'Tramadol', 'Pain relief medication for moderate to severe pain.', 'North West', 8, 'Pain Pharma', 'Tablet', 55.00),
(36, 'Ketorolac', 'NSAID used for short-term management of moderate to severe pain.', 'Northern Cape', 9, 'Pain Management', 'Injection', 60.00),
(37, 'Bupropion', 'Antidepressant used to treat major depressive disorder and for smoking cessation.', 'Gauteng', 1, 'Mental Health Solutions', 'Tablet', 42.00),
(38, 'Tamoxifen', 'Used in hormone receptor-positive breast cancer treatment.', 'KwaZulu-Natal', 2, 'Oncology Pharma', 'Tablet', 75.00),
(39, 'Zolpidem', 'Used for the short-term treatment of sleeping problems.', 'Western Cape', 3, 'Sleep Health', 'Tablet', 32.00),
(40, 'Finasteride', 'Used to treat enlarged prostate and male pattern baldness.', 'Eastern Cape', 4, 'Men’s Health Pharma', 'Tablet', 50.00);


-- Procurement and Logistics
-- Suppliers Table
CREATE TABLE Suppliers (
    SupplierID INT PRIMARY KEY NOT NULL,
    Name VARCHAR(100) NOT NULL,
	Province VARCHAR(20) NOT NULL,
    HospitalID INT NOT NULL,
    ContactPerson VARCHAR(100) NOT NULL,
    ContactNumber VARCHAR(20) NOT NULL,
    Email VARCHAR(100) NOT NULL,
    Address VARCHAR(200) NOT NULL,
    FOREIGN KEY (HospitalID) REFERENCES Hospitals(HospitalID)
);

INSERT INTO Suppliers (SupplierID, Name, Province, HospitalID, ContactPerson, ContactNumber, Email, Address) 
VALUES
(1, 'Pharma Supply Co.', 'Gauteng', 1, 'Alice Johnson', '012-345-6789', 'alice.johnson@pharmasupply.co.za', '123 Pharma St, Pretoria'),
(2, 'Medical Supplies Inc.', 'KwaZulu-Natal', 2, 'Brian Smith', '031-234-5678', 'brian.smith@medsupplies.co.za', '456 Med St, Durban'),
(3, 'HealthCare Solutions', 'Western Cape', 3, 'Chantal Jones', '021-345-6789', 'chantal.jones@healthcare.co.za', '789 Health Rd, Cape Town'),
(4, 'Wellness Suppliers', 'Eastern Cape', 4, 'David Brown', '041-123-4567', 'david.brown@wellnesssuppliers.co.za', '101 Wellness Way, Port Elizabeth'),
(5, 'CardioMed Supply', 'Free State', 5, 'Ella Roberts', '051-456-7890', 'ella.roberts@cardiomed.co.za', '202 Cardio St, Bloemfontein'),
(6, 'Pharmaceutical Partners', 'Mpumalanga', 6, 'Frank White', '013-567-8901', 'frank.white@pharmaceuticalpartners.co.za', '303 Pharma Ln, Mbombela'),
(7, 'Limpopo Med Supplies', 'Limpopo', 7, 'Grace Lee', '015-678-9012', 'grace.lee@limpopomed.co.za', '404 Health Ave, Polokwane'),
(8, 'North West Medical', 'North West', 8, 'Henry Davis', '018-789-0123', 'henry.davis@northwestmed.co.za', '505 Wellness Blvd, Mahikeng'),
(9, 'Northern Cape Supplies', 'Northern Cape', 9, 'Isabel Turner', '053-890-1234', 'isabel.turner@northerncapemed.co.za', '606 Care St, Kimberley'),
(10, 'Elite Health Suppliers', 'Gauteng', 1, 'Jack Wilson', '012-901-2345', 'jack.wilson@elitehealth.co.za', '707 Elite Rd, Johannesburg'),
(11, 'First Aid Supply Co.', 'KwaZulu-Natal', 2, 'Kimberly Young', '031-012-3456', 'kimberly.young@firstaid.co.za', '808 First Aid St, Pietermaritzburg'),
(12, 'NextGen Meds', 'Western Cape', 3, 'Liam Green', '021-123-4567', 'liam.green@nextgenmeds.co.za', '909 NextGen St, George'),
(13, 'Apex Health Supplies', 'Eastern Cape', 4, 'Mia Hall', '041-234-5678', 'mia.hall@apexhealth.co.za', '112 Apex St, East London'),
(14, 'Safemed Solutions', 'Free State', 5, 'Noah King', '051-345-6789', 'noah.king@safemed.co.za', '213 Safe Rd, Welkom'),
(15, 'Vital Supplies', 'Mpumalanga', 6, 'Olivia Wright', '013-456-7890', 'olivia.wright@vital.co.za', '314 Vital Ln, Nelspruit'),
(16, 'Carewell Supplies', 'Limpopo', 7, 'Peter Scott', '015-567-8901', 'peter.scott@carewell.co.za', '415 Care Blvd, Tzaneen'),
(17, 'WellMed Suppliers', 'North West', 8, 'Quinn Parker', '018-678-9012', 'quinn.parker@wellmed.co.za', '516 Med St, Rustenburg'),
(18, 'SurgiTech Supplies', 'Northern Cape', 9, 'Ryan Mitchell', '053-789-0123', 'ryan.mitchell@surgitech.co.za', '617 Surgi Ave, Upington'),
(19, 'PharmaPro', 'Gauteng', 1, 'Sophia Adams', '012-890-1234', 'sophia.adams@pharmapro.co.za', '718 Pharma Ln, Centurion'),
(20, 'BioHealth Supply', 'KwaZulu-Natal', 2, 'Thomas Robinson', '031-901-2345', 'thomas.robinson@biohealth.co.za', '819 BioHealth St, Richards Bay'),
(21, 'MedCare Suppliers', 'Western Cape', 3, 'Ursula Hall', '021-012-3456', 'ursula.hall@medcaresuppliers.co.za', '920 MedCare Rd, Stellenbosch'),
(22, 'CureAll Suppliers', 'Eastern Cape', 4, 'Victor Carter', '041-123-4567', 'victor.carter@cureallsuppliers.co.za', '101 CureAll Blvd, Uitenhage'),
(23, 'TrustMed Supplies', 'Free State', 5, 'Wendy Evans', '051-234-5678', 'wendy.evans@trustmed.co.za', '202 Trust Ln, Bethlehem'),
(24, 'Reliable Med Supply', 'Mpumalanga', 6, 'Xander Perez', '013-345-6789', 'xander.perez@reliablemed.com', '303 Reliable Rd, Barberton'),
(25, 'Optimal Health Suppliers', 'Limpopo', 7, 'Yara Ortiz', '015-456-7890', 'yara.ortiz@optimalhealth.co.za', '404 Optimal St, Limpopo'),
(26, 'Global Medical Supply', 'North West', 8, 'Zara Clarke', '018-567-8901', 'zara.clarke@globalmed.com', '505 Global Ave, Klerksdorp'),
(27, 'Premier Health Supplies', 'Northern Cape', 9, 'Angela Brooks', '053-678-9012', 'angela.brooks@premierhealth.com', '606 Premier Rd, Springbok'),
(28, 'Dynamic Med Suppliers', 'Gauteng', 1, 'Bradley Foster', '012-789-0123', 'bradley.foster@dynamicmed.co.za', '707 Dynamic St, Sandton'),
(29, 'Precision Medical Supply', 'KwaZulu-Natal', 2, 'Crystal Simmons', '031-890-1234', 'crystal.simmons@precisionmed.co.za', '808 Precision Rd, Durban North'),
(30, 'Trusty Med Supplies', 'Western Cape', 3, 'Daniel Flores', '021-012-3456', 'daniel.flores@trustymeds.co.za', '909 Trusty St, Bellville'),
(31, 'Synergy Medical Supply', 'Eastern Cape', 4, 'Emily Murphy', '041-123-4567', 'emily.murphy@synergymed.co.za', '112 Synergy Ln, Mthatha'),
(32, 'Compass Health Suppliers', 'Free State', 5, 'Fredrick Long', '051-234-5678', 'fredrick.long@compasshealth.co.za', '213 Compass Rd, Welkom'),
(33, 'Excellence Medical Supply', 'Mpumalanga', 6, 'Gabriel King', '013-345-6789', 'gabriel.king@excellencemed.co.za', '314 Excellence Blvd, Siyabuswa'),
(34, 'Sterling Health Supplies', 'Limpopo', 7, 'Hannah Wood', '015-456-7890', 'hannah.wood@sterlinghealth.co.za', '415 Sterling St, Mokopane'),
(35, 'Evergreen Medical Supply', 'North West', 8, 'Isabelle Garcia', '018-567-8901', 'isabelle.garcia@evergreenmed.co.za', '516 Evergreen Rd, Mahikeng'),
(36, 'Alpine Health Suppliers', 'Northern Cape', 9, 'Jake Turner', '053-678-9012', 'jake.turner@alpinehealth.co.za', '617 Alpine Ln, Upington'),
(37, 'Unity Medical Supply', 'Gauteng', 1, 'Lila Bennett', '012-789-0123', 'lila.bennett@unitymed.co.za', '718 Unity Rd, Pretoria'),
(38, 'Wave Medical Suppliers', 'KwaZulu-Natal', 2, 'Mason Hayes', '031-890-1234', 'mason.hayes@wavemed.co.za', '819 Wave St, Durban'),
(39, 'Key Health Suppliers', 'Western Cape', 3, 'Nina Adams', '021-012-3456', 'nina.adams@keyhealth.co.za', '920 Key Rd, Paarl'),
(40, 'Link Med Suppliers', 'Eastern Cape', 4, 'Oscar Patel', '041-123-4567', 'oscar.patel@linkmed.co.za', '101 Link St, Grahamstown');


-- PurchaseOrders Table
CREATE TABLE PurchaseOrders (
    OrderID INT PRIMARY KEY NOT NULL,
    SupplierID INT NOT NULL,
Province VARCHAR(20) NOT NULL,
    HospitalID INT NOT NULL,
    OrderDate DATE,
    ExpectedDeliveryDate DATE,
    Status VARCHAR(50),
    TotalAmount DECIMAL(10, 2),
    FOREIGN KEY (SupplierID) REFERENCES Suppliers(SupplierID),
    FOREIGN KEY (HospitalID) REFERENCES Hospitals(HospitalID)
);

INSERT INTO PurchaseOrders (OrderID, SupplierID, Province, HospitalID, OrderDate, ExpectedDeliveryDate, Status, TotalAmount)
VALUES
(1, 1, 'Gauteng', 1, '2024-01-10', '2024-01-20', 'Pending', 15000.00),
(2, 2, 'KwaZulu-Natal', 2, '2024-01-15', '2024-01-25', 'Completed', 5000.00),
(3, 3, 'Western Cape', 3, '2024-01-20', '2024-01-30', 'In Progress', 10000.00),
(4, 4, 'Eastern Cape', 4, '2024-01-25', '2024-02-05', 'Pending', 20000.00),
(5, 5, 'Free State', 5, '2024-02-01', '2024-02-10', 'Completed', 12000.00),
(6, 6, 'Mpumalanga', 6, '2024-02-05', '2024-02-15', 'In Progress', 8000.00),
(7, 7, 'Limpopo', 7, '2024-02-10', '2024-02-20', 'Pending', 7000.00),
(8, 8, 'North West', 8, '2024-02-15', '2024-02-25', 'Completed', 9000.00),
(9, 9, 'Northern Cape', 9, '2024-02-20', '2024-03-02', 'In Progress', 16000.00),
(10, 10, 'Gauteng', 1, '2024-03-01', '2024-03-10', 'Pending', 14000.00),
(11, 1, 'KwaZulu-Natal', 2, '2024-03-05', '2024-03-15', 'Completed', 5500.00),
(12, 2, 'Western Cape', 3, '2024-03-10', '2024-03-20', 'In Progress', 17000.00),
(13, 3, 'Eastern Cape', 4, '2024-03-15', '2024-03-25', 'Pending', 11000.00),
(14, 4, 'Free State', 5, '2024-03-20', '2024-03-30', 'Completed', 9500.00),
(15, 5, 'Mpumalanga', 6, '2024-03-25', '2024-04-05', 'In Progress', 12000.00),
(16, 6, 'Limpopo', 7, '2024-04-01', '2024-04-10', 'Pending', 6500.00),
(17, 7, 'North West', 8, '2024-04-05', '2024-04-15', 'Completed', 7500.00),
(18, 8, 'Northern Cape', 9, '2024-04-10', '2024-04-20', 'In Progress', 17000.00),
(19, 9, 'Gauteng', 1, '2024-04-15', '2024-04-25', 'Pending', 9000.00),
(20, 10, 'KwaZulu-Natal', 2, '2024-04-20', '2024-04-30', 'Completed', 10500.00),
(21, 1, 'Western Cape', 3, '2024-05-01', '2024-05-10', 'In Progress', 12500.00),
(22, 2, 'Eastern Cape', 4, '2024-05-05', '2024-05-15', 'Pending', 14000.00),
(23, 3, 'Free State', 5, '2024-05-10', '2024-05-20', 'Completed', 8000.00),
(24, 4, 'Mpumalanga', 6, '2024-05-15', '2024-05-25', 'In Progress', 11000.00),
(25, 5, 'Limpopo', 7, '2024-05-20', '2024-05-30', 'Pending', 12500.00),
(26, 6, 'North West', 8, '2024-06-01', '2024-06-10', 'Completed', 16000.00),
(27, 7, 'Northern Cape', 9, '2024-06-05', '2024-06-15', 'In Progress', 9000.00),
(28, 8, 'Gauteng', 1, '2024-06-10', '2024-06-20', 'Pending', 10500.00),
(29, 9, 'KwaZulu-Natal', 2, '2024-06-15', '2024-06-25', 'Completed', 14000.00),
(30, 10, 'Western Cape', 3, '2024-06-20', '2024-06-30', 'In Progress', 7500.00),
(31, 1, 'Eastern Cape', 4, '2024-07-01', '2024-07-10', 'Pending', 8000.00),
(32, 2, 'Free State', 5, '2024-07-05', '2024-07-15', 'Completed', 11500.00),
(33, 3, 'Mpumalanga', 6, '2024-07-10', '2024-07-20', 'In Progress', 13000.00),
(34, 4, 'Limpopo', 7, '2024-07-15', '2024-07-25', 'Pending', 9000.00),
(35, 5, 'North West', 8, '2024-07-20', '2024-07-30', 'Completed', 11000.00),
(36, 6, 'Northern Cape', 9, '2024-08-01', '2024-08-10', 'In Progress', 12500.00),
(37, 7, 'Gauteng', 1, '2024-08-05', '2024-08-15', 'Pending', 9500.00),
(38, 8, 'KwaZulu-Natal', 2, '2024-08-10', '2024-08-20', 'Completed', 11500.00),
(39, 9, 'Western Cape', 3, '2024-08-15', '2024-08-25', 'In Progress', 14000.00),
(40, 10, 'Eastern Cape', 4, '2024-08-20', '2024-08-30', 'Pending', 12500.00);

-- OrderDetails Table
CREATE TABLE OrderDetails (
    OrderDetailID INT PRIMARY KEY NOT NULL,
    OrderID INT NOT NULL,
	Province VARCHAR(20) NOT NULL,
    HospitalID INT NOT NULL,
    MedicationID INT NOT NULL,
    Quantity INT,
    UnitPrice DECIMAL(10, 2),
    FOREIGN KEY (OrderID) REFERENCES PurchaseOrders(OrderID),
    FOREIGN KEY (MedicationID) REFERENCES MedicationsCatalog(MedicationID),
    FOREIGN KEY (HospitalID) REFERENCES Hospitals(HospitalID)
);

INSERT INTO OrderDetails (OrderDetailID, OrderID, Province, HospitalID, MedicationID, Quantity, UnitPrice)
VALUES
(1, 1, 'Gauteng', 1, 1, 100, 150.00),
(2, 1, 'Gauteng', 1, 2, 50, 80.00),
(3, 2, 'KwaZulu-Natal', 2, 3, 30, 120.00),
(4, 2, 'KwaZulu-Natal', 2, 4, 60, 200.00),
(5, 3, 'Western Cape', 3, 5, 40, 95.00),
(6, 3, 'Western Cape', 3, 6, 25, 65.00),
(7, 4, 'Eastern Cape', 4, 7, 80, 45.00),
(8, 4, 'Eastern Cape', 4, 8, 20, 300.00),
(9, 5, 'Free State', 5, 9, 50, 250.00),
(10, 5, 'Free State', 5, 10, 15, 60.00),
(11, 6, 'Mpumalanga', 6, 1, 70, 90.00),
(12, 6, 'Mpumalanga', 6, 2, 90, 110.00),
(13, 7, 'Limpopo', 7, 3, 55, 75.00),
(14, 7, 'Limpopo', 7, 4, 35, 85.00),
(15, 8, 'North West', 8, 5, 45, 50.00),
(16, 8, 'North West', 8, 6, 25, 70.00),
(17, 9, 'Northern Cape', 9, 7, 60, 40.00),
(18, 9, 'Northern Cape', 9, 8, 10, 300.00),
(19, 10, 'Gauteng', 1, 9, 20, 150.00),
(20, 10, 'Gauteng', 1, 10, 30, 60.00),
(21, 11, 'KwaZulu-Natal', 2, 1, 100, 50.00),
(22, 11, 'KwaZulu-Natal', 2, 2, 80, 90.00),
(23, 12, 'Western Cape', 3, 3, 75, 120.00),
(24, 12, 'Western Cape', 3, 4, 40, 250.00),
(25, 13, 'Eastern Cape', 4, 5, 90, 55.00),
(26, 13, 'Eastern Cape', 4, 6, 30, 70.00),
(27, 14, 'Free State', 5, 7, 20, 100.00),
(28, 14, 'Free State', 5, 8, 60, 150.00),
(29, 15, 'Mpumalanga', 6, 9, 80, 80.00),
(30, 15, 'Mpumalanga', 6, 10, 50, 90.00),
(31, 16, 'Limpopo', 7, 1, 100, 60.00),
(32, 16, 'Limpopo', 7, 2, 20, 110.00),
(33, 17, 'North West', 8, 3, 40, 70.00),
(34, 17, 'North West', 8, 4, 30, 85.00),
(35, 18, 'Northern Cape', 9, 5, 60, 120.00),
(36, 18, 'Northern Cape', 9, 6, 10, 300.00),
(37, 19, 'Gauteng', 1, 7, 25, 45.00),
(38, 19, 'Gauteng', 1, 8, 15, 55.00),
(39, 20, 'KwaZulu-Natal', 2, 9, 70, 90.00),
(40, 20, 'KwaZulu-Natal', 2, 10, 40, 100.00);

-- Inventory Table
CREATE TABLE Inventory (
    InventoryID INT PRIMARY KEY NOT NULL,
    MedicationID INT NOT NULL,
	Province VARCHAR(20) NOT NULL,
    HospitalID INT NOT NULL,
    QuantityOnHand INT NOT NULL,
    ReorderLevel INT NOT NULL,
    ExpiryDate DATE NOT NULL,
    Location VARCHAR(100) NOT NULL,
    FOREIGN KEY (MedicationID) REFERENCES MedicationsCatalog(MedicationID),
    FOREIGN KEY (HospitalID) REFERENCES Hospitals(HospitalID)
);

INSERT INTO Inventory (InventoryID, MedicationID, Province, HospitalID, QuantityOnHand, ReorderLevel, ExpiryDate, Location)
VALUES
(1, 1, 'Gauteng', 1, 150, 50, '2025-05-01', 'Pharmacy Room A'),
(2, 2, 'Gauteng', 1, 80, 30, '2024-12-15', 'Pharmacy Room B'),
(3, 3, 'KwaZulu-Natal', 2, 120, 40, '2025-01-10', 'Storage Area 1'),
(4, 4, 'KwaZulu-Natal', 2, 90, 20, '2025-03-22', 'Pharmacy Room C'),
(5, 5, 'Western Cape', 3, 70, 25, '2024-11-30', 'Pharmacy Room A'),
(6, 6, 'Western Cape', 3, 100, 50, '2025-07-20', 'Pharmacy Room D'),
(7, 7, 'Eastern Cape', 4, 200, 60, '2026-01-15', 'Pharmacy Room A'),
(8, 8, 'Eastern Cape', 4, 110, 35, '2025-02-14', 'Storage Area 2'),
(9, 9, 'Free State', 5, 90, 45, '2024-10-01', 'Pharmacy Room C'),
(10, 10, 'Free State', 5, 60, 20, '2024-09-05', 'Pharmacy Room D'),
(11, 11, 'Mpumalanga', 6, 130, 55, '2025-06-12', 'Pharmacy Room A'),
(12, 12, 'Mpumalanga', 6, 80, 30, '2025-04-25', 'Storage Area 1'),
(13, 13, 'Limpopo', 7, 140, 40, '2025-08-30', 'Pharmacy Room B'),
(14, 14, 'Limpopo', 7, 70, 20, '2024-12-20', 'Pharmacy Room C'),
(15, 15, 'North West', 8, 60, 25, '2024-11-15', 'Pharmacy Room D'),
(16, 16, 'North West', 8, 110, 35, '2025-03-10', 'Pharmacy Room A'),
(17, 17, 'Northern Cape', 9, 90, 20, '2025-01-01', 'Storage Area 2'),
(18, 18, 'Northern Cape', 9, 120, 60, '2025-05-22', 'Pharmacy Room C'),
(19, 19, 'Gauteng', 1, 150, 40, '2024-10-10', 'Pharmacy Room A'),
(20, 20, 'Gauteng', 1, 75, 25, '2024-12-30', 'Pharmacy Room B'),
(21, 21, 'KwaZulu-Natal', 2, 80, 50, '2024-11-01', 'Storage Area 1'),
(22, 22, 'KwaZulu-Natal', 2, 65, 15, '2025-04-15', 'Pharmacy Room D'),
(23, 23, 'Western Cape', 3, 100, 40, '2025-02-20', 'Pharmacy Room C'),
(24, 24, 'Western Cape', 3, 130, 35, '2024-09-10', 'Storage Area 2'),
(25, 25, 'Eastern Cape', 4, 200, 45, '2024-10-25', 'Pharmacy Room A'),
(26, 26, 'Eastern Cape', 4, 90, 30, '2024-12-05', 'Pharmacy Room B'),
(27, 27, 'Free State', 5, 75, 20, '2025-03-30', 'Pharmacy Room D'),
(28, 28, 'Free State', 5, 50, 10, '2024-11-20', 'Pharmacy Room A'),
(29, 29, 'Mpumalanga', 6, 140, 60, '2025-06-01', 'Storage Area 1'),
(30, 30, 'Mpumalanga', 6, 80, 25, '2025-04-18', 'Pharmacy Room B'),
(31, 31, 'Limpopo', 7, 90, 30, '2024-10-05', 'Pharmacy Room C'),
(32, 32, 'Limpopo', 7, 110, 35, '2025-01-25', 'Storage Area 2'),
(33, 33, 'North West', 8, 80, 15, '2024-11-30', 'Pharmacy Room A'),
(34, 34, 'North West', 8, 60, 20, '2024-12-10', 'Pharmacy Room B'),
(35, 35, 'Northern Cape', 9, 130, 50, '2025-03-15', 'Pharmacy Room C'),
(36, 36, 'Northern Cape', 9, 90, 25, '2025-06-20', 'Storage Area 1'),
(37, 37, 'Gauteng', 1, 150, 40, '2024-10-30', 'Pharmacy Room D'),
(38, 38, 'Gauteng', 1, 75, 25, '2025-05-05', 'Pharmacy Room A'),
(39, 39, 'KwaZulu-Natal', 2, 100, 60, '2025-01-15', 'Storage Area 1'),
(40, 40, 'KwaZulu-Natal', 2, 65, 15, '2024-12-22', 'Pharmacy Room B');

-- Shipments Table
CREATE TABLE Shipments (
    ShipmentID INT PRIMARY KEY NOT NULL,
    OrderID INT NOT NULL,
	Province VARCHAR(20) NOT NULL,
    HospitalID INT NOT NULL,
    ShipmentDate DATE NOT NULL,
    ReceivedDate DATE NOT NULL,
    Status VARCHAR(50) NOT NULL,
    FOREIGN KEY (OrderID) REFERENCES PurchaseOrders(OrderID),
    FOREIGN KEY (HospitalID) REFERENCES Hospitals(HospitalID)
);

INSERT INTO Shipments (ShipmentID, OrderID, Province, HospitalID, ShipmentDate, ReceivedDate, Status)
VALUES
(1, 1, 'Gauteng', 1, '2024-01-10', '2024-01-12', 'Received'),
(2, 2, 'Gauteng', 1, '2024-01-15', '2024-01-17', 'In Transit'),
(3, 3, 'KwaZulu-Natal', 2, '2024-02-01', '2024-02-03', 'Received'),
(4, 4, 'KwaZulu-Natal', 2, '2024-02-05', '2024-02-06', 'Received'),
(5, 5, 'Western Cape', 3, '2024-02-10', '2024-02-12', 'Pending'),
(6, 6, 'Western Cape', 3, '2024-02-15', '2024-02-17', 'In Transit'),
(7, 7, 'Eastern Cape', 4, '2024-02-20', '2024-02-22', 'Received'),
(8, 8, 'Eastern Cape', 4, '2024-03-01', '2024-03-02', 'Pending'),
(9, 9, 'Free State', 5, '2024-03-05', '2024-03-07', 'Received'),
(10, 10, 'Free State', 5, '2024-03-10', '2024-03-12', 'In Transit'),
(11, 11, 'Mpumalanga', 6, '2024-03-15', '2024-03-17', 'Received'),
(12, 12, 'Mpumalanga', 6, '2024-03-20', '2024-03-22', 'Pending'),
(13, 13, 'Limpopo', 7, '2024-03-25', '2024-03-27', 'Received'),
(14, 14, 'Limpopo', 7, '2024-04-01', '2024-04-02', 'In Transit'),
(15, 15, 'North West', 8, '2024-04-05', '2024-04-07', 'Received'),
(16, 16, 'North West', 8, '2024-04-10', '2024-04-12', 'Pending'),
(17, 17, 'Northern Cape', 9, '2024-04-15', '2024-04-17', 'Received'),
(18, 18, 'Northern Cape', 9, '2024-04-20', '2024-04-21', 'In Transit'),
(19, 19, 'Gauteng', 1, '2024-04-25', '2024-04-27', 'Received'),
(20, 20, 'Gauteng', 1, '2024-05-01', '2024-05-03', 'Pending'),
(21, 21, 'KwaZulu-Natal', 2, '2024-05-05', '2024-05-07', 'Received'),
(22, 22, 'KwaZulu-Natal', 2, '2024-05-10', '2024-05-12', 'In Transit'),
(23, 23, 'Western Cape', 3, '2024-05-15', '2024-05-17', 'Received'),
(24, 24, 'Western Cape', 3, '2024-05-20', '2024-05-22', 'Pending'),
(25, 25, 'Eastern Cape', 4, '2024-06-01', '2024-06-03', 'Received'),
(26, 26, 'Eastern Cape', 4, '2024-06-05', '2024-06-06', 'In Transit'),
(27, 27, 'Free State', 5, '2024-06-10', '2024-06-12', 'Received'),
(28, 28, 'Free State', 5, '2024-06-15', '2024-06-17', 'Pending'),
(29, 29, 'Mpumalanga', 6, '2024-06-20', '2024-06-22', 'Received'),
(30, 30, 'Mpumalanga', 6, '2024-06-25', '2024-06-27', 'In Transit'),
(31, 31, 'Limpopo', 7, '2024-07-01', '2024-07-03', 'Received'),
(32, 32, 'Limpopo', 7, '2024-07-05', '2024-07-07', 'Pending'),
(33, 33, 'North West', 8, '2024-07-10', '2024-07-12', 'Received'),
(34, 34, 'North West', 8, '2024-07-15', '2024-07-17', 'In Transit'),
(35, 35, 'Northern Cape', 9, '2024-07-20', '2024-07-22', 'Received'),
(36, 36, 'Northern Cape', 9, '2024-07-25', '2024-07-27', 'Pending'),
(37, 37, 'Gauteng', 1, '2024-08-01', '2024-08-03', 'Received'),
(38, 38, 'Gauteng', 1, '2024-08-05', '2024-08-07', 'In Transit'),
(39, 39, 'KwaZulu-Natal', 2, '2024-08-10', '2024-08-12', 'Received'),
(40, 40, 'KwaZulu-Natal', 2, '2024-08-15', '2024-08-17', 'Pending');

-- ShipmentDetails Table
CREATE TABLE ShipmentDetails (
    ShipmentDetailID INT PRIMARY KEY NOT NULL,
    ShipmentID INT NOT NULL,
	Province VARCHAR(20) NOT NULL,
    HospitalID INT NOT NULL,
    MedicationID INT NOT NULL,
    QuantityReceived INT,
    Illness VARCHAR(50),
    FOREIGN KEY (ShipmentID) REFERENCES Shipments(ShipmentID),
    FOREIGN KEY (MedicationID) REFERENCES MedicationsCatalog(MedicationID),
    FOREIGN KEY (HospitalID) REFERENCES Hospitals(HospitalID)
);


INSERT INTO ShipmentDetails (ShipmentDetailID, ShipmentID, Province, HospitalID, MedicationID, QuantityReceived, Illness)
VALUES
(1, 1, 'Gauteng', 1, 1, 100, 'Hypertension'),
(2, 2, 'Gauteng', 1, 2, 50, 'Asthma'),
(3, 3, 'KwaZulu-Natal', 2, 3, 200, 'Diabetes'),
(4, 4, 'KwaZulu-Natal', 2, 4, 75, 'Pain Relief'),
(5, 5, 'Western Cape', 3, 5, 150, 'Migraine'),
(6, 6, 'Western Cape', 3, 6, 30, 'Allergy'),
(7, 7, 'Eastern Cape', 4, 7, 120, 'Heart Disease'),
(8, 8, 'Eastern Cape', 4, 8, 90, 'Chronic Cough'),
(9, 9, 'Free State', 5, 9, 200, 'Anxiety'),
(10, 10, 'Free State', 5, 10, 60, 'Depression'),
(11, 11, 'Mpumalanga', 6, 1, 150, 'Hypertension'),
(12, 12, 'Mpumalanga', 6, 2, 40, 'Asthma'),
(13, 13, 'Limpopo', 7, 3, 110, 'Diabetes'),
(14, 14, 'Limpopo', 7, 4, 80, 'Pain Relief'),
(15, 15, 'North West', 8, 5, 190, 'Migraine'),
(16, 16, 'North West', 8, 6, 35, 'Allergy'),
(17, 17, 'Northern Cape', 9, 7, 130, 'Heart Disease'),
(18, 18, 'Northern Cape', 9, 8, 70, 'Chronic Cough'),
(19, 19, 'Gauteng', 1, 9, 220, 'Anxiety'),
(20, 20, 'Gauteng', 1, 10, 65, 'Depression'),
(21, 21, 'KwaZulu-Natal', 2, 1, 100, 'Hypertension'),
(22, 22, 'KwaZulu-Natal', 2, 2, 55, 'Asthma'),
(23, 23, 'Western Cape', 3, 3, 210, 'Diabetes'),
(24, 24, 'Western Cape', 3, 4, 85, 'Pain Relief'),
(25, 25, 'Eastern Cape', 4, 5, 160, 'Migraine'),
(26, 26, 'Eastern Cape', 4, 6, 45, 'Allergy'),
(27, 27, 'Free State', 5, 7, 190, 'Heart Disease'),
(28, 28, 'Free State', 5, 8, 75, 'Chronic Cough'),
(29, 29, 'Mpumalanga', 6, 9, 140, 'Anxiety'),
(30, 30, 'Mpumalanga', 6, 10, 50, 'Depression'),
(31, 31, 'Limpopo', 7, 1, 180, 'Hypertension'),
(32, 32, 'Limpopo', 7, 2, 30, 'Asthma'),
(33, 33, 'North West', 8, 3, 130, 'Diabetes'),
(34, 34, 'North West', 8, 4, 100, 'Pain Relief'),
(35, 35, 'Northern Cape', 9, 5, 170, 'Migraine'),
(36, 36, 'Northern Cape', 9, 6, 25, 'Allergy'),
(37, 37, 'Gauteng', 1, 7, 150, 'Heart Disease'),
(38, 38, 'Gauteng', 1, 8, 80, 'Chronic Cough'),
(39, 39, 'KwaZulu-Natal', 2, 9, 190, 'Anxiety'),
(40, 40, 'KwaZulu-Natal', 2, 10, 60, 'Depression');

-- Distribution Table
CREATE TABLE Distribution (
    DistributionID INT PRIMARY KEY NOT NULL,
    MedicationID INT NOT NULL,
    Province VARCHAR(20) NOT NULL,
    HospitalID INT NOT NULL,
    Quantity INT NOT NULL,
    DistributionDate DATE NOT NULL,
    FOREIGN KEY (MedicationID) REFERENCES MedicationsCatalog(MedicationID),
    FOREIGN KEY (HospitalID) REFERENCES Hospitals(HospitalID)
);

INSERT INTO Distribution (DistributionID, MedicationID, Province, HospitalID, Quantity, DistributionDate)
VALUES
(1, 1, 'Gauteng', 1, 150, '2024-01-10'),
(2, 2, 'Gauteng', 1, 100, '2024-01-15'),
(3, 3, 'KwaZulu-Natal', 2, 200, '2024-01-20'),
(4, 4, 'KwaZulu-Natal', 2, 120, '2024-01-25'),
(5, 5, 'Western Cape', 3, 180, '2024-02-01'),
(6, 6, 'Western Cape', 3, 90, '2024-02-05'),
(7, 7, 'Eastern Cape', 4, 250, '2024-02-10'),
(8, 8, 'Eastern Cape', 4, 130, '2024-02-15'),
(9, 9, 'Free State', 5, 110, '2024-02-20'),
(10, 10, 'Free State', 5, 70, '2024-02-25'),
(11, 11, 'Mpumalanga', 6, 160, '2024-03-01'),
(12, 12, 'Mpumalanga', 6, 80, '2024-03-05'),
(13, 13, 'Limpopo', 7, 220, '2024-03-10'),
(14, 14, 'Limpopo', 7, 140, '2024-03-15'),
(15, 15, 'North West', 8, 190, '2024-03-20'),
(16, 16, 'North West', 8, 75, '2024-03-25'),
(17, 17, 'Northern Cape', 9, 130, '2024-04-01'),
(18, 18, 'Northern Cape', 9, 60, '2024-04-05'),
(19, 19, 'Gauteng', 1, 170, '2024-04-10'),
(20, 20, 'Gauteng', 1, 100, '2024-04-15'),
(21, 21, 'KwaZulu-Natal', 2, 190, '2024-04-20'),
(22, 22, 'KwaZulu-Natal', 2, 110, '2024-04-25'),
(23, 23, 'Western Cape', 3, 240, '2024-05-01'),
(24, 24, 'Western Cape', 3, 130, '2024-05-05'),
(25, 25, 'Eastern Cape', 4, 160, '2024-05-10'),
(26, 26, 'Eastern Cape', 4, 80, '2024-05-15'),
(27, 27, 'Free State', 5, 150, '2024-05-20'),
(28, 28, 'Free State', 5, 90, '2024-05-25'),
(29, 29, 'Mpumalanga', 6, 200, '2024-06-01'),
(30, 30, 'Mpumalanga', 6, 70, '2024-06-05'),
(31, 31, 'Limpopo', 7, 250, '2024-06-10'),
(32, 32, 'Limpopo', 7, 130, '2024-06-15'),
(33, 33, 'North West', 8, 180, '2024-06-20'),
(34, 34, 'North West', 8, 60, '2024-06-25'),
(35, 35, 'Northern Cape', 9, 170, '2024-07-01'),
(36, 36, 'Northern Cape', 9, 80, '2024-07-05'),
(37, 37, 'Gauteng', 1, 200, '2024-07-10'),
(38, 38, 'Gauteng', 1, 120, '2024-07-15'),
(39, 39, 'KwaZulu-Natal', 2, 190, '2024-07-20'),
(40, 40, 'KwaZulu-Natal', 2, 110, '2024-07-25');