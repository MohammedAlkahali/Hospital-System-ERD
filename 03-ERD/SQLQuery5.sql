CREATE DATABASE HospitalManagementSystem2
USE HospitalManagementSystem2

CREATE TABLE Department (
Dept_id INT PRIMARY KEY,
Dept_name VARCHAR(100),
Locations VARCHAR(100),
Contact_number VARCHAR(50),
No_of_doctors INT,
);

CREATE TABLE Doctor (
Doctor_id INT PRIMARY KEY,
[Name] VARCHAR(100),
License_no VARCHAR(100),
Phone_no VARCHAR(50),
Email VARCHAR(100),
Years_of_experience INT,
Specialization VARCHAR(100),
Qualification VARCHAR(100),
Supervised_id INT NULL,
Dept_id INT,
FOREIGN KEY (Supervised_id) REFERENCES Doctor(Doctor_id),
FOREIGN KEY (Dept_id) REFERENCES Department(Dept_id)
);

CREATE TABLE Patient (
Patient_id INT PRIMARY KEY,
F_Name VARCHAR(100),
L_Name VARCHAR(100),
Phone_no VARCHAR(100),
Email VARCHAR(100),
Addresss VARCHAR(100),
Gender VARCHAR(20),
Blood_group VARCHAR(20),
DOB DATE,
Age INT
);


CREATE TABLE Servicee (
Service_id INT PRIMARY KEY,
Servicee_name VARCHAR(100),
Descriptions VARCHAR(200),
Unit_price DECIMAL,
Service_type VARCHAR,
Dept_id INT,
FOREIGN KEY (Dept_id) REFERENCES Department(Dept_id)
);

ALTER TABLE Servicee
ALTER COLUMN Service_type VARCHAR(100);

CREATE TABLE Appointment (
Appointment_id INT PRIMARY KEY,
[Date] DATE,
[Time] TIME,
[Status] VARCHAR(30),
Appointment_type VARCHAR(50),
Reason VARCHAR(100),
Patient_id INT,
Doctor_id INT,
FOREIGN KEY (Patient_id) REFERENCES Patient(Patient_id),
FOREIGN KEY (Doctor_id) REFERENCES Doctor(Doctor_id)
);

CREATE TABLE Appointment_Service (
Appointment_id INT,
Service_id INT,
Quantity INT,
PRIMARY KEY (Appointment_id, Service_id),
FOREIGN KEY (Appointment_id) REFERENCES Appointment(Appointment_id),
FOREIGN KEY (Service_id) REFERENCES Servicee(Service_id),
);

CREATE TABLE Medical_Record (
Record_id INT PRIMARY KEY,
Visit_date DATE,
Diagnosis VARCHAR(100),
Treatment_plan VARCHAR(100),
Prescribed_medications VARCHAR(100),
Doctor_notes VARCHAR(100),
Follow_up_required VARCHAR(100),
Patient_id INT,
Doctor_id INT,
Appointment_id INT,
FOREIGN KEY (Patient_id) REFERENCES Patient(Patient_id),
FOREIGN KEY (Doctor_id) REFERENCES Doctor(Doctor_id),
FOREIGN KEY (Appointment_id) REFERENCES Appointment(Appointment_id),
);

CREATE TABLE Billing (
Bill_id INT PRIMARY KEY,
Bill_date DATE,
Due_date DATE,
Total_amount DECIMAL,
Payment_status VARCHAR(50),
Payment_method VARCHAR(50),
Patient_id INT,
Appointment_id INT,
FOREIGN KEY (Patient_id) REFERENCES Patient(Patient_id),
FOREIGN KEY (Appointment_id) REFERENCES Appointment(Appointment_id)
);


INSERT INTO Department VALUES
(1, 'Cardiology', 'First Floor', '24560001', 2),
(2, 'Neurology', 'Second Floor', '24560002', 2),
(3, 'Orthopedics', 'Third Floor', '24560003', 2),
(4, 'General Medicine', 'Ground Floor', '24560004', 2);

INSERT INTO Doctor VALUES
(1, 'Dr. Ahmed',  'LIC1001', '91234567', 'ahmed@hospital.com',  10, 'Cardiologist',      'MD Cardiology',  NULL, 1),
(2, 'Dr. Sara',   'LIC1002', '91234568', 'sara@hospital.com',    7, 'Cardiologist',      'MD Cardiology',  NULL, 1),
(3, 'Dr. Khalid', 'LIC1003', '91234569', 'khalid@hospital.com',  9, 'Neurologist',       'MD Neurology',   NULL, 2),
(4, 'Dr. Noor',   'LIC1004', '91234570', 'noor@hospital.com',    6, 'Neurologist',       'MD Neurology',   NULL, 2),
(5, 'Dr. Ali',    'LIC1005', '91234571', 'ali@hospital.com',     8, 'Orthopedic',        'MD Orthopedics', NULL, 3),
(6, 'Dr. Mona',   'LIC1006', '91234572', 'mona@hospital.com',    5, 'Orthopedic',        'MD Orthopedics', NULL, 3),
(7, 'Dr. Hassan', 'LIC1007', '91234573', 'hassan@hospital.com', 12, 'General Physician', 'MBBS',           NULL, 4),
(8, 'Dr. Fatma',  'LIC1008', '91234574', 'fatma@hospital.com',   4, 'General Physician', 'MBBS',           NULL, 4);

INSERT INTO Patient VALUES
(1, 'Salim',   'Al-Harthi',  '92345671', 'salim@email.com',   'Muscat', 'Male',   'O+',  '1995-05-10', 30),
(2, 'Aisha',   'Al-Balushi', '92345672', 'aisha@email.com',   'Seeb',   'Female', 'A+',  '1998-07-15', 27),
(3, 'Khalfan', 'Al-Rawahi',  '92345673', 'khalfan@email.com', 'Barka',  'Male',   'B+',  '1990-03-22', 35),
(4, 'Noor',    'Al-Mamari',  '92345674', 'noor@email.com',    'Muscat', 'Female', 'AB+', '2000-11-01', 25),
(5, 'Huda',    'Al-Saadi',   '92345675', 'huda@email.com',    'Nizwa',  'Female', 'O-',  '1993-02-14', 33),
(6, 'Saeed',   'Al-Kindi',   '92345676', 'saeed@email.com',   'Sohar',  'Male',   'A-',  '1988-09-09', 37),
(7, 'Maryam',  'Al-Hinai',   '92345677', 'maryam@email.com',  'Muscat', 'Female', 'B-',  '1996-12-30', 29),
(8, 'Ali',     'Al-Abri',    '92345678', 'ali@email.com',     'Ibri',   'Male',   'O+',  '1992-06-18', 33);


INSERT INTO Servicee VALUES
(1, 'Consultation',   'Consultation', 15.000, 'General doctor consultation', 4),
(2, 'ECG',            'Lab Test',     20.000, 'Heart test',                  1),
(3, 'MRI',            'X-Ray',        50.000, 'Brain scan',                  2),
(4, 'X-Ray',          'X-Ray',        25.000, 'Bone scan',                   3),
(5, 'Blood Test',     'Lab Test',     10.000, 'Basic blood test',            4),
(6, 'Physiotherapy',  'Treatment',    30.000, 'Physical therapy session',    3),
(7, 'Minor Surgery',  'Surgery',     200.000, 'Small surgical procedure',    3),
(8, 'Follow-up Visit','Consultation', 10.000, 'Follow-up appointment',       4);

INSERT INTO Appointment VALUES
(1,  '2026-04-01', '09:00', 'Completed', 'Consultation', 'Chest pain',           1, 1),
(2,  '2026-04-02', '10:00', 'Completed', 'Emergency',    'Headache',             2, 3),
(3,  '2026-04-03', '11:00', 'Scheduled', 'Follow-up',    'Knee pain',            3, 5),
(4,  '2026-04-04', '12:00', 'Completed', 'Consultation', 'Fever',                4, 7),
(5,  '2026-04-05', '09:30', 'Cancelled', 'Consultation', 'Back pain',            5, 6),
(6,  '2026-04-06', '10:30', 'Completed', 'Emergency',    'Heart check',          6, 2),
(7,  '2026-04-07', '11:30', 'Completed', 'Consultation', 'Bone injury',          7, 5),
(8,  '2026-04-08', '12:30', 'Scheduled', 'Consultation', 'General checkup',      8, 8),
(9,  '2026-04-09', '09:15', 'Completed', 'Follow-up',    'Follow-up heart test', 1, 1),
(10, '2026-04-10', '10:15', 'Completed', 'Consultation', 'Migraine',             2, 4);



INSERT INTO Appointment_Service VALUES
(1,  1, 1), (1,  2, 1),
(2,  3, 1), (2,  5, 2),
(3,  4, 1),
(4,  1, 1), (4,  5, 1),
(5,  6, 2),
(6,  2, 1), (6,  1, 1),
(7,  4, 1), (7,  6, 1),
(8,  1, 1),
(9,  2, 1), (9,  8, 1),
(10, 3, 1), (10, 1, 1);


INSERT INTO Medical_Record VALUES
(1, '2026-04-01', 'Mild chest pain',    'Medication and rest',  'Painkiller',        'Patient stable',     'Yes', 1, 1, 1),
(2, '2026-04-02', 'Migraine symptoms',  'MRI and medication',   'Migraine medicine', 'Needs follow-up',    'Yes', 2, 3, 2),
(3, '2026-04-04', 'Fever infection',    'Antibiotics',          'Antibiotic',        'Monitor temperature','No',  4, 7, 4),
(4, '2026-04-06', 'Heart rhythm issue', 'ECG follow-up',        'Heart medication',  'Needs monitoring',   'Yes', 6, 2, 6),
(5, '2026-04-07', 'Minor bone injury',  'Physiotherapy',        'Pain relief',       'Improving',          'Yes', 7, 5, 7),
(6, '2026-04-09', 'Heart follow-up',    'Continue treatment',   'Same medication',   'Better condition',   'No',  1, 1, 9),
(7, '2026-04-10', 'Headache issue',     'MRI review',           'Painkiller',        'Check scan result',  'Yes', 2, 4, 10);


INSERT INTO Billing VALUES
(1, '2026-04-01', '2026-04-05', 35.000,  'Paid',    'Card',      1, 1),
(2, '2026-04-02', '2026-04-06', 70.000,  'Partial', 'Insurance', 2, 2),
(3, '2026-04-04', '2026-04-08', 25.000,  'Paid',    'Cash',      4, 4),
(4, '2026-04-06', '2026-04-10', 35.000,  'Paid',    'Card',      6, 6),
(5, '2026-04-07', '2026-04-11', 55.000,  'Pending', 'Cash',      7, 7),
(6, '2026-04-09', '2026-04-13', 30.000,  'Paid',    'Card',      1, 9),
(7, '2026-04-10', '2026-04-14', 65.000,  'Partial', 'Insurance', 2, 10);


UPDATE Appointment
SET [Status] = 'Completed'
WHERE Appointment_id = 3; 

UPDATE Billing
SET Payment_status = 'Paid'
WHERE Bill_id = 5;

UPDATE Servicee
SET Unit_price = Unit_price * 1.10;

select * from Servicee

UPDATE Patient
SET Phone_no = '99099099'
WHERE Patient_id = 1;

UPDATE Doctor
SET Dept_id = 4
WHERE Doctor_id = 2;


SELECT * FROM Appointment WHERE Appointment_id = 5;

DELETE FROM Appointment_Service 
WHERE Appointment_id = 5;

DELETE FROM Appointment 
WHERE Appointment_id = 5;

select * from Servicee WHERE Service_id = 7;
select * from Appointment_Service WHERE Service_id = 7;

DELETE FROM Servicee WHERE Service_id = 7;

select * from Billing WHERE Bill_id = 7;

DELETE FROM Billing WHERE Bill_id = 7;

DELETE FROM Patient WHERE Patient_id = 1;
-- This will FAIL with a FK constraint violation error


select COUNT (*) as total_patients
from Patient

select COUNT (*) as Doc_total
from Doctor

select COUNT (*) as appointment_total
from Appointment

select avg(Unit_price) as Total_Billing_Amount
from Servicee

SELECT
    MAX(Unit_price) AS Highest_Service_Price,
    MIN(Unit_price) AS Lowest_Service_Price
FROM Servicee;

SELECT Dept_id, COUNT(*) AS Total_Doctors
FROM Doctor
GROUP BY Dept_id;

SELECT Doctor_id, COUNT(*) AS Total_Appointment
FROM Appointment
GROUP BY Doctor_id;

select* from Appointment

SELECT status, COUNT(*) AS Total_Appointment
FROM Appointment
GROUP BY status;

SELECT
    Payment_status,
    SUM(Total_amount) AS Total_Billing_Amount
FROM Billing
GROUP BY Payment_status;

SELECT
    Service_type,
    AVG(Unit_price) AS Average_Price
FROM Servicee
GROUP BY Service_type;

SELECT
    Service_id,
    SUM(Quantity) AS Total_Quantity_Used
FROM Appointment_Service
GROUP BY Service_id;





SELECT doc.[Name],
	   COUNT(a.Appointment_id) AS Appointment_Count
FROM Doctor doc
JOIN Appointment a ON doc.Doctor_id = a.Doctor_id
GROUP BY doc.[Name] 
HAVING COUNT(a.Appointment_id) > 1;



SELECT s.Servicee_name,
       SUM(a_s.Quantity) AS Total_Used
FROM Servicee s
JOIN Appointment_Service a_s ON s.Service_id = a_s.Service_id
GROUP BY s.Servicee_name
HAVING SUM(a_s.Quantity) > 2;


SELECT d.Dept_name,
       COUNT(doc.Doctor_id) AS Doctor_Count
FROM Department d
JOIN Doctor doc ON d.Dept_id = doc.Dept_id
GROUP BY d.Dept_name
HAVING COUNT(doc.Doctor_id) > 1;



SELECT Payment_status,
       SUM(Total_amount) AS Total
FROM Billing
GROUP BY Payment_status
HAVING SUM(Total_amount) > 50;


SELECT TOP 1
       s.Servicee_name,
       SUM(a_s.Quantity) AS Total_Used
FROM Servicee s
JOIN Appointment_Service a_s ON s.Service_id = a_s.Service_id
GROUP BY s.Servicee_name
ORDER BY Total_Used DESC;


SELECT TOP 1
       s.Servicee_name,
       SUM(a_s.Quantity * s.Unit_price) AS Total_Revenue
FROM Servicee s
JOIN Appointment_Service a_s ON s.Service_id = a_s.Service_id
GROUP BY s.Servicee_name
ORDER BY Total_Revenue DESC;
