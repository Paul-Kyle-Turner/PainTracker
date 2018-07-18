CREATE TABLE painuser (
id INT(10) NOT NULL PRIMARY KEY,
username varchar(40),
email varchar(320),
google_id char(10)
);

CREATE TABLE role(
id INT(10) NOT NULL PRIMARY KEY,
rolename VARCHAR(50) NOT NULL,
description varchar(200)
);

CREATE TABLE spectator(
id INT(10) NOT NULL PRIMARY KEY,
user_id INT(10) NOT NULL,
role_id INT(10) NOT NULL,
FOREIGN KEY(user_id) REFERENCES painuser(id),
FOREIGN KEY(role_id) REFERENCES role(id)
);

CREATE TABLE patient(
id INT(10) NOT NULL PRIMARY KEY,
user_id int NOT NULL,
birth DATE NOT NULL,
sex BOOL NOT NULL,
FOREIGN KEY(user_id) REFERENCES painuser(id)
);

CREATE TABLE patientspectator(
id INT(10) NOT NULL PRIMARY KEY,
patient_id INT(10) NOT NULL,
spectator_id INT(10) NOT NULL,
FOREIGN KEY(patient_id) REFERENCES patient(id),
FOREIGN KEY(spectator_id) REFERENCES spectator(id)
);

CREATE TABLE treatment(
id INT(10) NOT NULL PRIMARY KEY,
medication BOOL,
treatment_name VARCHAR(64),
treatement_description VARCHAR(64)
);

CREATE TABLE  treatment_map(
id INT(10) NOT NULL PRIMARY KEY,
patient_id INT(10) NOT NULL,
treatment_id INT(10) NOT NULL,
reminder_period INT(2),
FOREIGN KEY(patient_id) REFERENCES patient(id),
FOREIGN KEY(treatment_id) REFERENCES treatment(id)
);

CREATE TABLE marker(
id INT(10) NOT NULL PRIMARY KEY,
x DOUBLE NOT NULL,
y DOUBLE NOT NULL,
z DOUBLE NOT NULL
);

CREATE TABLE symptom(
id INT(10) NOT NULL PRIMARY KEY,
symptom_name VARCHAR(40) NOT NULL,
description varchar(200)
);

CREATE TABLE marker_map(
id INT(10) NOT NULL PRIMARY KEY,
patient_id INT(10) NOT NULL,
symptom_id int NOT NULL,
date_of DATETIME,
FOREIGN KEY(patient_id) REFERENCES patient(id),
FOREIGN KEY(symptom_id) REFERENCES symptom(id)
);

CREATE TABLE record(
id INT(10) NOT NULL PRIMARY KEY,
patient_id INT(10) NOT NULL,
marker_map_id INT(10) NOT NULL,
record_name VARCHAR(60),
description VARCHAR(200),
FOREIGN KEY(patient_id) REFERENCES patient(id),
FOREIGN KEY(marker_map_id) REFERENCES marker_map(ID)
);
