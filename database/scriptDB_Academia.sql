CREATE DATABASE academia;

USE academia;

CREATE TABLE TYPEDOCUMENT (
    idtypedocument INT PRIMARY KEY AUTO_INCREMENT,
    typedocument VARCHAR(50)
);

CREATE TABLE POSITION (
    idposition INT PRIMARY KEY AUTO_INCREMENT,
    name_position VARCHAR(50) NOT NULL
);


CREATE TABLE PERSON(
    idperson INT PRIMARY KEY,
    name_person VARCHAR(50)NOT NULL,
    lastname VARCHAR(50) NOT NULL,
    age INT NOT NULL,
    tel VARCHAR(13) NOT NULL,
    email VARCHAR(100),
    fk_idtypedocument INT NOT NULL,
    FOREIGN KEY (fk_idtypedocument) REFERENCES TYPEDOCUMENT(idtypedocument)
);

CREATE TABLE DOCENT(
    iddocent INT AUTO_INCREMENT,
    fk_idperson INT NOT NULL,
    state_docent VARCHAR(10) NOT NULL,
    speciality VARCHAR(50),
    FOREIGN KEY (fk_idperson) REFERENCES PERSON(idperson),
    PRIMARY KEY (iddocent, fk_idperson)
);


CREATE TABLE  STUDENT(
    idstudent INT AUTO_INCREMENT,
    fk_idperson INT NOT NULL,
    state_student VARCHAR(10) NOT NULL,
    admission_date DATE NOT NULL,
    emergency_contact_name VARCHAR(50) NOT NULL,
    emergency_contact_tel VARCHAR(13) NOT NULL,
    FOREIGN KEY (fk_idperson) REFERENCES PERSON(idperson),
    PRIMARY KEY (idstudent, fk_idperson )
);

CREATE TABLE EMPLOYEE(
    idemployee INT AUTO_INCREMENT,
    fk_idperson INT NOT NULL,
    fk_idposition INT NOT NULL,
    state_employee VARCHAR(10) NOT NULL,
    salary DECIMAL NOT NULL,
    schedule VARCHAR(100)NOT NULL,
    FOREIGN KEY (fk_idperson) REFERENCES PERSON(idperson),
    FOREIGN KEY (fk_idposition) REFERENCES `POSITION`(idposition),
    PRIMARY KEY (idemployee, fk_idperson)
);

CREATE TABLE COURSE(
    idcourse INT PRIMARY KEY AUTO_INCREMENT,
    fk_iddocent INT NOT NULL,
    name_course VARCHAR(100) NOT NULL, 
    description_co VARCHAR(1000),
    FOREIGN KEY (fk_iddocent) REFERENCES DOCENT(iddocent)
);

CREATE TABLE INSCRIPTION(
    idinscription INT PRIMARY KEY AUTO_INCREMENT,
    fk_idstudent INT NOT NULL,
    fk_idcourse INT NOT NULL,
    state VARCHAR(10)NOT NULL,
    FOREIGN KEY (fk_idstudent) REFERENCES STUDENT(idstudent),
    FOREIGN KEY (fk_idcourse) REFERENCES COURSE(idcourse)
);

CREATE TABLE ATTENDANCE (
    idattendance INT PRIMARY KEY AUTO_INCREMENT,
    fk_idinscription INT NOT NULL,
    fecha DATE NOT NULL,
    attendance VARCHAR(10)  NOT NULL,
    FOREIGN KEY (fk_idinscription) REFERENCES INSCRIPTION(idinscription)
);

CREATE TABLE COMPANY(
    idcompany INT PRIMARY KEY AUTO_INCREMENT,
    name_company VARCHAR(100),
    address_company VARCHAR(100),
    tel_company VARCHAR(20)
);

CREATE TABLE INVENTORY (
    idinventory INT PRIMARY KEY AUTO_INCREMENT,
    item VARCHAR(100) NOT NULL,
    cant INT NOT NULL,
    fk_idcompany INT NOT NULL,
    FOREIGN KEY (fk_idcompany) REFERENCES COMPANY(idcompany)
);

CREATE TABLE _USER (
    iduser INT PRIMARY KEY AUTO_INCREMENT,
    fk_idperson INT NOT NULL,
    username VARCHAR(100) NOT NULL,
    password_user VARCHAR(100) NOT NULL,
    FOREIGN KEY (fk_idperson) REFERENCES PERSON(idperson)
);

CREATE TABLE ROLE (
    idrole INT PRIMARY KEY AUTO_INCREMENT,
    name_role VARCHAR(100)NOT NULL
);

CREATE TABLE USER_ROLE (
    iduser_role INT PRIMARY KEY AUTO_INCREMENT,
    fk_idrol INT NOT NULL,
    fk_iduser INT NOT NULL,
    state VARCHAR(10)NOT NULL,
    FOREIGN KEY (fk_idrol) REFERENCES ROLE(idrole),
    FOREIGN KEY (fk_iduser) REFERENCES _USER(iduser)
);

