CREATE TABLE typedocument(
    idtypedocument SERIAL PRIMARY KEY,
    typedocument VARCHAR(50)
);

CREATE TABLE position (
    idposition SERIAL PRIMARY KEY,
    name_position VARCHAR(50) NOT NULL
);

CREATE TABLE person(
    idperson SERIAL PRIMARY KEY,
    name_person VARCHAR(50) NOT NULL,
    lastname VARCHAR(50) NOT NULL,
    age INT NOT NULL,
    tel VARCHAR(13) NOT NULL,
    email VARCHAR(100),
    fk_idtypedocument INT NOT NULL,
    FOREIGN KEY (fk_idtypedocument) REFERENCES typedocument(idtypedocument)
);

CREATE TABLE docent(
    iddocent SERIAL PRIMARY KEY,
    fk_idperson INT NOT NULL,
    state_docent VARCHAR(10) NOT NULL,
    speciality VARCHAR(50),
    FOREIGN KEY (fk_idperson) REFERENCES person(idperson)
);

CREATE TABLE  student(
    idstudent SERIAL PRIMARY KEY,
    fk_idperson INT NOT NULL,
    state_student VARCHAR(10) NOT NULL,
    admission_date DATE NOT NULL,
    emergency_contact_name VARCHAR(50) NOT NULL,
    emergency_contact_tel VARCHAR(13) NOT NULL,
    FOREIGN KEY (fk_idperson) REFERENCES person(idperson)
);

CREATE TABLE employee(
    idemployee SERIAL PRIMARY KEY,
    fk_idperson INT NOT NULL,
    fk_idposition INT NOT NULL,
    state_employee VARCHAR(10) NOT NULL,
    salary DECIMAL NOT NULL,
    schedule VARCHAR(100) NOT NULL,
    FOREIGN KEY (fk_idperson) REFERENCES person(idperson),
    FOREIGN KEY (fk_idposition) REFERENCES position(idposition)
);

CREATE TABLE course(
    idcourse SERIAL PRIMARY KEY,
    fk_iddocent INT NOT NULL,
    name_course VARCHAR(100) NOT NULL, 
    description_co VARCHAR(1000),
    FOREIGN KEY (fk_iddocent) REFERENCES docent(iddocent)
);

CREATE TABLE inscription(
    idinscription SERIAL PRIMARY KEY,
    fk_idstudent INT NOT NULL,
    fk_idcourse INT NOT NULL,
    state VARCHAR(10) NOT NULL,
    FOREIGN KEY (fk_idstudent) REFERENCES student(idstudent),
    FOREIGN KEY (fk_idcourse) REFERENCES course(idcourse)
);

CREATE TABLE attendance (
    idattendance SERIAL PRIMARY KEY,
    fk_idinscription INT NOT NULL,
    fecha DATE NOT NULL,
    attendance VARCHAR(10)  NOT NULL,
    FOREIGN KEY (fk_idinscription) REFERENCES inscription(idinscription)
);

CREATE TABLE company(
    idcompany SERIAL PRIMARY KEY,
    name_company VARCHAR(100),
    address_company VARCHAR(100),
    tel_company VARCHAR(20)
);

CREATE TABLE inventory (
    idinventory SERIAL PRIMARY KEY,
    item VARCHAR(100) NOT NULL,
    cant INT NOT NULL,
    fk_idcompany INT NOT NULL,
    FOREIGN KEY (fk_idcompany) REFERENCES company(idcompany)
);

CREATE TABLE _user (
    iduser SERIAL PRIMARY KEY,
    fk_idperson INT NOT NULL,
    username VARCHAR(100) NOT NULL,
    password_user VARCHAR(100) NOT NULL,
    FOREIGN KEY (fk_idperson) REFERENCES person(idperson)
);

CREATE TABLE role (
    idrole SERIAL PRIMARY KEY,
    name_role VARCHAR(100) NOT NULL
);

CREATE TABLE user_role (
    iduser_role SERIAL PRIMARY KEY,
    fk_idrol INT NOT NULL,
    fk_iduser INT NOT NULL,
    state VARCHAR(10) NOT NULL,
    FOREIGN KEY (fk_idrol) REFERENCES role(idrole),
    FOREIGN KEY (fk_iduser) REFERENCES user(iduser)
);