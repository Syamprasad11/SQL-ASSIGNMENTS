CREATE DATABASE healthcare;
USE healthcare;

CREATE TABLE patients (
    patient_id INT PRIMARY KEY,
    patient_name VARCHAR(50),
    age INT,
    gender VARCHAR(10),
    phone VARCHAR(15)
);

INSERT INTO patients (patient_id, patient_name, age, gender, phone) VALUES
(1, 'Arun Kumar', 65, 'Male', '9876543210'),
(2, 'Anu Joseph', 45, 'Female', '9876543211'),
(3, 'Rahul Nair', 55, 'Male', '9876543212'),
(4, 'Meera Das', 32, 'Female', '9876543213'),
(5, 'Vishnu Raj', 72, 'Male', '9876543214'),
(6, 'Sneha Menon', 28, 'Female', '9876543215'),
(7, 'Akhil Das', 61, 'Male', '9876543216'),
(8, 'Neha Paul', 50, 'Female', '9876543217'),
(9, 'Ravi Menon', 58, 'Male', '9876543218'),
(10, 'Lakshmi Nair', 67, 'Female', '9876543219'),
(11, 'Suresh Kumar', 40, 'Male', '9876543220'),
(12, 'Divya Raj', 35, 'Female', '9876543221'),
(13, 'Manoj Das', 75, 'Male', '9876543222'),
(14, 'Priya Joseph', 52, 'Female', '9876543223'),
(15, 'Kiran Paul', 48, 'Male', '9876543224');


CREATE TABLE doctors (
    doctor_id INT PRIMARY KEY,
    doctor_name VARCHAR(50),
    specialization VARCHAR(50)
);

INSERT INTO doctors (doctor_id, doctor_name, specialization) VALUES
(101, 'Dr. Suresh', 'Cardiology'),
(102, 'Dr. Anitha', 'Neurology'),
(103, 'Dr. Rahul', 'Orthopedics'),
(104, 'Dr. Meena', 'Dermatology'),
(105, 'Dr. Vivek', 'General Medicine');


CREATE TABLE appointments (
    appointment_id INT PRIMARY KEY,
    patient_id INT,
    doctor_id INT,
    appointment_date DATETIME,
    status VARCHAR(20),
    FOREIGN KEY (patient_id) REFERENCES patients(patient_id),
    FOREIGN KEY (doctor_id) REFERENCES doctors(doctor_id)
);

INSERT INTO appointments
(appointment_id, patient_id, doctor_id, appointment_date, status) VALUES
(1001, 1, 101, '2026-01-05 10:00:00', 'Completed'),
(1002, 1, 102, '2026-01-15 11:00:00', 'Completed'),
(1003, 2, 105, '2026-01-07 09:30:00', 'Completed'),
(1004, 3, 101, '2026-01-10 10:30:00', 'Completed'),
(1005, 3, 103, '2026-01-20 12:00:00', 'Completed'),
(1006, 4, 104, '2026-01-12 14:00:00', 'Completed'),
(1007, 5, 101, '2026-01-14 09:00:00', 'Completed'),
(1008, 5, 103, '2026-01-25 10:00:00', 'Completed'),
(1009, 6, 105, '2026-01-18 15:00:00', 'Completed'),
(1010, 7, 102, '2026-01-22 11:30:00', 'Completed'),
(1011, 7, 101, '2026-02-02 10:00:00', 'Completed'),
(1012, 8, 104, '2026-01-28 13:00:00', 'Completed'),
(1013, 9, 103, '2026-02-05 09:30:00', 'Completed'),
(1014, 9, 105, '2026-02-10 10:30:00', 'Completed'),
(1015, 10, 101, '2026-02-12 11:00:00', 'Completed'),
(1016, 10, 102, '2026-02-15 14:00:00', 'Completed'),
(1017, 11, 105, '2026-02-18 09:00:00', 'Completed'),
(1018, 12, 104, '2026-02-20 12:30:00', 'Completed'),
(1019, 13, 101, '2026-02-22 10:00:00', 'Completed'),
(1020, 14, 102, '2026-02-25 11:00:00', 'Completed'),
(1021, 15, 103, '2026-02-28 15:00:00', 'Completed'),
(1022, 1, 101, '2026-03-01 10:00:00', 'Completed'),
(1023, 3, 101, '2026-03-03 11:00:00', 'Completed'),
(1024, 5, 101, '2026-03-05 09:30:00', 'Completed'),
(1025, 7, 101, '2026-03-07 10:30:00', 'Completed'),
(1026, 10, 101, '2026-03-10 12:00:00', 'Completed'),
(1027, 13, 101, '2026-03-12 14:00:00', 'Completed');


CREATE TABLE billing (
    billing_id INT PRIMARY KEY,
    patient_id INT,
    doctor_id INT,
    amount DECIMAL(10,2),
    billing_date DATE,
    FOREIGN KEY (patient_id) REFERENCES patients(patient_id),
    FOREIGN KEY (doctor_id) REFERENCES doctors(doctor_id)
);

INSERT INTO billing
(billing_id, patient_id, doctor_id, amount, billing_date) VALUES
(2001, 1, 101, 12000.00, '2026-01-05'),
(2002, 1, 102, 8000.00, '2026-01-15'),
(2003, 2, 105, 5000.00, '2026-01-07'),
(2004, 3, 101, 15000.00, '2026-01-10'),
(2005, 3, 103, 7000.00, '2026-01-20'),
(2006, 4, 104, 4000.00, '2026-01-12'),
(2007, 5, 101, 18000.00, '2026-01-14'),
(2008, 5, 103, 9000.00, '2026-01-25'),
(2009, 6, 105, 3000.00, '2026-01-18'),
(2010, 7, 102, 6000.00, '2026-01-22'),
(2011, 7, 101, 14000.00, '2026-02-02'),
(2012, 8, 104, 4500.00, '2026-01-28'),
(2013, 9, 103, 8000.00, '2026-02-05'),
(2014, 9, 105, 5000.00, '2026-02-10'),
(2015, 10, 101, 16000.00, '2026-02-12'),
(2016, 10, 102, 9000.00, '2026-02-15'),
(2017, 11, 105, 4500.00, '2026-02-18'),
(2018, 12, 104, 3500.00, '2026-02-20'),
(2019, 13, 101, 20000.00, '2026-02-22'),
(2020, 14, 102, 7000.00, '2026-02-25'),
(2021, 15, 103, 6000.00, '2026-02-28'),
(2022, 1, 101, 10000.00, '2026-03-01'),
(2023, 3, 101, 11000.00, '2026-03-03'),
(2024, 5, 101, 12000.00, '2026-03-05'),
(2025, 7, 101, 13000.00, '2026-03-07'),
(2026, 10, 101, 15000.00, '2026-03-10'),
(2027, 13, 101, 17000.00, '2026-03-12');

CREATE TABLE prescriptions (
    prescription_id INT PRIMARY KEY,
    patient_id INT,
    doctor_id INT,
    appointment_id INT,
    medicine_name VARCHAR(50),
    dosage VARCHAR(50),
    FOREIGN KEY (patient_id) REFERENCES patients(patient_id),
    FOREIGN KEY (doctor_id) REFERENCES doctors(doctor_id),
    FOREIGN KEY (appointment_id) REFERENCES appointments(appointment_id)
);

INSERT INTO prescriptions
(prescription_id, patient_id, doctor_id, appointment_id, medicine_name, dosage) VALUES
(3001, 1, 101, 1001, 'Amlodipine', '5mg'),
(3002, 1, 102, 1002, 'Gabapentin', '300mg'),
(3003, 2, 105, 1003, 'Paracetamol', '500mg'),
(3004, 3, 101, 1004, 'Amlodipine', '10mg'),
(3005, 3, 103, 1005, 'Calcium', '500mg'),
(3006, 4, 104, 1006, 'Cetirizine', '10mg'),
(3007, 5, 101, 1007, 'Amlodipine', '5mg'),
(3008, 5, 103, 1008, 'Calcium', '500mg'),
(3009, 6, 105, 1009, 'Paracetamol', '500mg'),
(3010, 7, 102, 1010, 'Gabapentin', '300mg'),
(3011, 7, 101, 1011, 'Amlodipine', '5mg'),
(3012, 8, 104, 1012, 'Cetirizine', '10mg'),
(3013, 9, 103, 1013, 'Calcium', '500mg'),
(3014, 9, 105, 1014, 'Paracetamol', '500mg'),
(3015, 10, 101, 1015, 'Amlodipine', '10mg'),
(3016, 10, 102, 1016, 'Gabapentin', '300mg'),
(3017, 11, 105, 1017, 'Paracetamol', '500mg'),
(3018, 12, 104, 1018, 'Cetirizine', '10mg'),
(3019, 13, 101, 1019, 'Amlodipine', '5mg'),
(3020, 14, 102, 1020, 'Gabapentin', '300mg'),
(3021, 15, 103, 1021, 'Calcium', '500mg');

select * from patients;
select * from doctors;
select * from appointments;
select * from billing;
select * from prescriptions;
-- TASK QUESTIONS
/*
1. Display all patients.
2. Find patients who are older than 50 years.
3. Count the total number of patients.
4. Count appointments handled by each doctor.
5. Join Patients, Doctors, and Appointments to display patient name, doctor name, and appointment date.
6. Find doctors who have more than 10 appointments using HAVING.
7. Calculate total billing amount for each patient.
8. Calculate average billing amount for each doctor.
9. Find patients who have not attended any appointment using LEFT JOIN.
10. Find the most frequently prescribed medicine.
11. Find the latest appointment of each patient using ROW_NUMBER().
12. Rank doctors based on number of appointments.
13. Calculate a running total of billing amounts.
14. Use a CTE to find patients whose total billing exceeds 25,000.
15. Find patients who have appointments with more than one doctor.
*/

-- TASK ANSWERS

select * from patients;
select * from patients where age>50;
select count(*) as total_no_of_patients from patients;
select doctor_id,count(appointment_id) as no_of_appointments from appointments group by doctor_id;
select p.patient_name,d.doctor_name,a.appointment_date from patients p join appointments a on p.patient_id=a.patient_id join doctors d on a.doctor_id=d.doctor_id;
select doctor_id,count(appointment_id) as no_of_appointments from appointments group by doctor_id having count(appointment_id)>10;
select patient_id,sum(amount) as total_billing_amount from billing group by patient_id;
select doctor_id,avg(amount) as avg_billing_amount from billing group by doctor_id;
select p.patient_id,p.patient_name,count(a.appointment_id) as no_of_appointments from patients p left join appointments a on p.patient_id=a.patient_id group by p.patient_id,p.patient_name having count(a.appointment_id)=0;
select medicine_name,count(medicine_name) as  most_prescribed from prescriptions group by medicine_name;
select a.appointment_id,p.patient_name,row_number() over(order by a.appointment_date) as latest from appointments a join patients p on p.patient_id=a.patient_id;
select doctor_id,no_of_appointments,RANK() OVER (ORDER BY no_of_appointments DESC) AS doctor_rank FROM (SELECT doctor_id,COUNT(appointment_id) AS no_of_appointments FROM appointments GROUP BY doctor_id) t;
select billing_id,amount,sum(amount) over(order by billing_id) as running_total from billing;
with billing_total as(
select patient_id,sum(amount) as total_amount from billing group by patient_id)
select * from billing_total where total_amount> 25000;
select patient_id,COUNT(DISTINCT doctor_id) AS number_of_doctors FROM appointments GROUP BY patient_id HAVING COUNT(DISTINCT doctor_id) > 1;


select * from patients;
select * from doctors;
select * from appointments;
select * from billing;
select * from prescriptions;


# Tasks of finance database completed
##########################################################################################