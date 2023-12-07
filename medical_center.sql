-- from the terminal run:
-- psql < medical_center.sql

DROP DATABASE IF EXISTS medical_center;

CREATE DATABASE medical_center;

\c medical_center

CREATE TABLE med_center
(
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
);

CREATE TABLE doctors
(
    id SERIAL PRIMARY KEY,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    med_center_id INTEGER REFERENCES med_center ON DELETE SET NULL,

);

CREATE TABLE patients
(
    id SERIAL PRIMARY KEY,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    
);

CREATE TABLE doctor_patient_rel
(
    id SERIAL PRIMARY KEY,
    doctor_id INTEGER REFERENCES doctors ON DELETE CASCADE,
    patient_id INTEGER REFERENCES patients ON DELETE CASCADE,
);

CREATE TABLE diseases
(
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,

);

CREATE TABLE patient_disease_rel
(
    id SERIAL PRIMARY KEY,
    patient_id INTEGER REFERENCES patients ON DELETE CASCADE,
    disease_id INTEGER REFERENCES diseases ON DELETE CASCADE,
),