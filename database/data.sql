
INSERT INTO TYPEDOCUMENT (typedocument) VALUES ('Cédula');
INSERT INTO TYPEDOCUMENT (typedocument) VALUES ('Pasaporte');
INSERT INTO TYPEDOCUMENT (typedocument) VALUES ('Tarjeta Identidad');

INSERT INTO POSITION (name_position) VALUES ('Gerente');
INSERT INTO POSITION (name_position) VALUES ('Secretaria');
INSERT INTO POSITION (name_position) VALUES ('Administrador');

INSERT INTO ROLE (name_role) VALUES('Estudiante');
INSERT INTO ROLE (name_role) VALUES('Docente');
INSERT INTO ROLE (name_role) VALUES('Empleado');
INSERT INTO ROLE (name_role) VALUES('Administrador');

-- datos compañia
INSERT INTO COMPANY (NAME_COMPANY, ADDRESS_COMPANY, TEL_COMPANY) VALUES (
    'Academia IntiArte', 'Calle 12A # 21-04', '3508966184'
);

INSERT INTO INVENTORY (ITEM, CANT, FK_IDCOMPANY ) VALUES(
     'Guitarra', 1, 1
);
INSERT INTO INVENTORY (ITEM, CANT, FK_IDCOMPANY ) VALUES(
     'Piano', 4, 1
);
INSERT INTO INVENTORY (ITEM, CANT, FK_IDCOMPANY ) VALUES(
     'Bajo', 1, 1
);
INSERT INTO INVENTORY (ITEM, CANT, FK_IDCOMPANY ) VALUES(
     'Bateria', 1, 1
);
INSERT INTO INVENTORY (ITEM, CANT, FK_IDCOMPANY ) VALUES(
     'Ukelele', 1, 1
);
-- PRUEBA USER
INSERT INTO PERSON (idperson, name_person, lastname, age, tel, email, fk_idtypedocument)
VALUES (1, 'Juan', 'Perez', 30, '123456789', 'juan@example.com', 1);

-- DATOS DE PRUEBA ----------------------------------------
-- DOCENT
INSERT INTO PERSON (idperson, name_person, lastname, age, tel, email, fk_idtypedocument) VALUES (
    1117551679, 'Juan Martines', 'Perez', 30, '3508966184', 'juan@example.com', 1
);

INSERT INTO DOCENT (fk_idperson, state_docent, speciality) VALUES(
     1117551679,'Active', 'Guitarrista'
);

INSERT INTO COURSE (idcourse,fk_iddocent,name_course, description_co  ) VALUES(
     1,1, 'Curso de Guitarra', 'tecnica basica de guitarra'
);
-- STUDENT
-- 1
INSERT INTO PERSON (idperson, name_person, lastname, age, tel, email, fk_idtypedocument) VALUES (
    1233507069, 'Yudy Vanessa', 'Perez', 20, '3508966569', 'yudy.perez@udla.edu.co', 2);

INSERT INTO STUDENT (FK_IDPERSON, STATE_STUDENT, ADMISSION_DATE, EMERGENCY_CONTACT_NAME, EMERGENCY_CONTACT_TEL) VALUES (
    1233507069, 'Active', '2021-05-12', 'Andres Perez', '3508988273'
);
-- 2
INSERT INTO PERSON (idperson, name_person, lastname, age, tel, email, fk_idtypedocument) VALUES (
    1117551897, 'Pedro', 'Ortiz', 19, '3202655898', 'p.ortiz@example.com', 1);

INSERT INTO STUDENT (FK_IDPERSON, STATE_STUDENT, ADMISSION_DATE, EMERGENCY_CONTACT_NAME, EMERGENCY_CONTACT_TEL) VALUES (
    1117551897, 'Active', '2021-09-12', '', ''
);
-- EMPLOYEE
INSERT INTO PERSON (idperson, name_person, lastname, age, tel, email, fk_idtypedocument) VALUES (
    1117500567, 'Andres', 'Gomez', 40, '3115266987', 'a.gomez@inti.co', 1);

INSERT INTO EMPLOYEE (FK_IDPERSON, FK_IDPOSITION, STATE_EMPLOYEE, SALARY, SCHEDULE ) VALUES(
     1117500567, 3, 'Active', 500.000, 'Lunes 3 a 4 Pm, Miercoles 5 a 6 Pm'
);

-- INSCRIPTION 
INSERT INTO INSCRIPTION (FK_IDSTUDENT, FK_IDCOURSE, STATE) VALUES(
     1, 1, 'Active'
);

INSERT INTO INSCRIPTION (FK_IDSTUDENT, FK_IDCOURSE, STATE) VALUES(
     2, 1, 'Active'
);


-----------------------------------------------------------------------------------------------

-- users 
-- prueba
INSERT INTO _USER (fk_idperson, username, password_user  ) VALUES(
     1,'root','root'
);

-- DOCENT
INSERT INTO _USER (fk_idperson, username, password_user  ) VALUES(
     1117551679,'juanmartines','12345'
);

-- STUDENT
INSERT INTO _USER (fk_idperson, username, password_user  ) VALUES(
     1233507069,'yudyperez','12345'
);

INSERT INTO _USER (fk_idperson, username, password_user  ) VALUES(
     1117551897,'pedrortiz','12345'
);

-- EMPLOYEE
INSERT INTO _USER (fk_idperson, username, password_user  ) VALUES(
     1117500567,'andresgomez','12345'
);

-- USER_ROLE
-- prueba
INSERT INTO USER_ROLE (fk_idrol, fk_iduser, state) VALUES(
     3,1,'Active'
);

-- DOCENT
INSERT INTO USER_ROLE (fk_idrol, fk_iduser, state) VALUES(
     2,2,'Active'
);

-- STUDENT
INSERT INTO USER_ROLE (fk_idrol, fk_iduser, state) VALUES(
     1,3,'Active'
);
INSERT INTO USER_ROLE (fk_idrol, fk_iduser, state) VALUES(
     1,4,'Active'
);

-- EMPLOYEE
INSERT INTO USER_ROLE (fk_idrol, fk_iduser, state) VALUES(
     3,5,'Active'
);

