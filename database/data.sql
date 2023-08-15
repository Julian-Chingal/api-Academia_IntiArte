
INSERT INTO typedocument (typedocument) VALUES ('Cédula');
INSERT INTO typedocument (typedocument) VALUES ('Pasaporte');
INSERT INTO typedocument (typedocument) VALUES ('Tarjeta Identidad');

INSERT INTO position (name_position) VALUES ('Gerente');
INSERT INTO position (name_position) VALUES ('Secretaria');
INSERT INTO position (name_position) VALUES ('Administrador');

INSERT INTO role (name_role) VALUES('Estudiante');
INSERT INTO role (name_role) VALUES('Docente');
INSERT INTO role (name_role) VALUES('Empleado');

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
--PRUEBA USER
INSERT INTO person (idperson, name_person, lastname, age, tel, email, fk_idtypedocument)
VALUES (1, 'Juan', 'Perez', 30, '123456789', 'juan@example.com', 1);

--DATOS DE PRUEBA ----------------------------------------
--docent
INSERT INTO person (idperson, name_person, lastname, age, tel, email, fk_idtypedocument) VALUES (
    1117551679, 'Juan Martines', 'Perez', 30, '3508966184', 'juan@example.com', 1
);

INSERT INTO docent (fk_idperson, state_docent, speciality) VALUES(
     1117551679,'Active', 'Guitarrista'
);

INSERT INTO course (IDCOURSE,fk_iddocent,name_course, description_co  ) VALUES(
     1,1, 'Curso de Guitarra', 'tecnica basica de guitarra'
);
--student
--1
INSERT INTO person (idperson, name_person, lastname, age, tel, email, fk_idtypedocument) VALUES (
    1233507069, 'Yudy Vanessa', 'Perez', 20, '3508966569', 'yudy.perez@udla.edu.co', 2);

INSERT INTO STUDENT (FK_IDPERSON, STATE_STUDENT, ADMISSION_DATE, EMERGENCY_CONTACT_NAME, EMERGENCY_CONTACT_TEL) VALUES (
    1233507069, 'Active', '2021-05-12', 'Andres Perez', '3508988273'
);
-- 2
INSERT INTO person (idperson, name_person, lastname, age, tel, email, fk_idtypedocument) VALUES (
    1117551897, 'Pedro', 'Ortiz', 19, '3202655898', 'p.ortiz@example.com', 1);

INSERT INTO STUDENT (FK_IDPERSON, STATE_STUDENT, ADMISSION_DATE, EMERGENCY_CONTACT_NAME, EMERGENCY_CONTACT_TEL) VALUES (
    1117551897, 'Active', '2021-09-12', '', ''
);
--employee
INSERT INTO person (idperson, name_person, lastname, age, tel, email, fk_idtypedocument) VALUES (
    1117500567, 'Andres', 'Gomez', 40, '3115266987', 'a.gomez@inti.co', 1);

INSERT INTO EMPLOYEE (FK_IDPERSON, FK_IDPOSITION, STATE_EMPLOYEE, SALARY, SCHEDULE ) VALUES(
     1117500567, 3, 'Active', 500.000, 'Lunes 3 a 4 Pm, Miercoles 5 a 6 Pm'
);

-- inscription 
INSERT INTO INSCRIPTION (FK_IDSTUDENT, FK_IDCOURSE, STATE) VALUES(
     1, 1, 'Active'
);

INSERT INTO INSCRIPTION (FK_IDSTUDENT, FK_IDCOURSE, STATE) VALUES(
     2, 1, 'Active'
);


-----------------------------------------------------------------------------------------------

-- users 
--prueba
INSERT INTO _user (fk_idperson, username, password_user  ) VALUES(
     1,'root','root'
);

--docent
INSERT INTO _user (fk_idperson, username, password_user  ) VALUES(
     1117551679,'juanmartines','12345'
);

--student
INSERT INTO _user (fk_idperson, username, password_user  ) VALUES(
     1233507069,'yudyperez','12345'
);

INSERT INTO _user (fk_idperson, username, password_user  ) VALUES(
     1117551897,'pedrortiz','12345'
);

--employee
INSERT INTO _user (fk_idperson, username, password_user  ) VALUES(
     1117500567,'andresgomez','12345'
);

--user_role
--prueba
INSERT INTO user_role (fk_idrol, fk_iduser, state) VALUES(
     3,1,'Active'
);

--docent
INSERT INTO user_role (fk_idrol, fk_iduser, state) VALUES(
     2,3,'Active'
);

--student
INSERT INTO user_role (fk_idrol, fk_iduser, state) VALUES(
     1,4,'Active'
);
INSERT INTO user_role (fk_idrol, fk_iduser, state) VALUES(
     1,5,'Active'
);

--employee
INSERT INTO user_role (fk_idrol, fk_iduser, state) VALUES(
     3,6,'Active'
);


------------------
--postgres
---------------------
INSERT INTO user_role (fk_idrol, fk_iduser, state) VALUES(
     3,6,'Active'
);

--docent
INSERT INTO user_role (fk_idrol, fk_iduser, state) VALUES(
     2,7,'Active'
);

--student
INSERT INTO user_role (fk_idrol, fk_iduser, state) VALUES(
     1,8,'Active'
);
INSERT INTO user_role (fk_idrol, fk_iduser, state) VALUES(
     1,9,'Active'
);

--employee
INSERT INTO user_role (fk_idrol, fk_iduser, state) VALUES(
     3,10,'Active'
);