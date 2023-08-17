-- CONSULTA RETORNA USUARIOS Y ROLES
SELECT USER.USERNAME , ROLE.NAME_ROLE
FROM USER
INNER JOIN USER_ROLE 
ON USER.IDUSER = USER_ROLE.FK_IDUSER
INNER JOIN ROLE 
ON ROLE.IDROLE = USER_ROLE.FK_IDROL
WHERE USER.USERNAME = ? AND USER.PASSWORD_USER = ?;

SELECT PERSON.IDPERSON, USER.USERNAME, USER.PASSWORD_USER
FROM PERSON 
INNER JOIN USER
ON PERSON.IDPERSON = USER.FK_IDPERSON
WHERE PERSON.IDPERSON = ?;
--------------------
-- DOCENTE Y CURSO
--------------------

    --DEVUELVE EL NOMBRE DEL DOCENTE Y EL CURSO DE UN DOCENTE EN ESPECIFICO
SELECT PERSON.NAME_PERSON, PERSON.LASTNAME, DOCENT.SPECIALITY, COURSE.NAME_COURSE 
FROM DOCENT 
INNER JOIN PERSON 
ON PERSON.IDPERSON = DOCENT.FK_IDPERSON 
INNER JOIN COURSE 
ON DOCENT.IDDOCENT = COURSE.FK_IDDOCENT 
WHERE DOCENT.IDDOCENT = ?;
    -- DEVUELVE EL NOMBRE DEL DOCENTE Y EL CURSO
SELECT PERSON.NAME_PERSON, PERSON.LASTNAME, DOCENT.SPECIALITY, COURSE.NAME_COURSE 
FROM DOCENT 
INNER JOIN PERSON 
ON PERSON.IDPERSON = DOCENT.FK_IDPERSON 
INNER JOIN COURSE 
ON DOCENT.IDDOCENT = COURSE.FK_IDDOCENT 
ORDER BY DOCENT.IDDOCENT ASC;

-------------------------------------------------------------------------
-- INVENTARIO 
----------------------------------------------------------------------
-- GET
    -- TODO EL INVENTARIO
SELECT INVENTORY.ITEM, INVENTORY.CANT
FROM INVENTORY 
ORDER BY INVENTORY.IDINVENTORY ASC;
    -- OBTENER UN ITEM DEL INVENTARIO 
SELECT INVENTORY.ITEM, INVENTORY.CANT
FROM INVENTORY 
WHERE INVENTORY.IDINVENTORY = ?;

-- UPDATE
    -- ACTUALIZAR CANTIDAD DEL INVENTARIO
SELECT CANT FROM INVENTORY WHERE IDINVENTORY = ?;

UPDATE INVENTORY
SET CANT = IFNULL(?, CANT)
WHERE INVENTORY.IDINVENTORY = ?;

-- manejo de valores nulos al actualiza run registro
UPDATE INVENTORY
SET ?
WHERE INVENTORY.IDINVENTORY = ?;


-- CREATE 

INSERT INTO INVENTORY (ITEM, CANT, FK_IDCOMPANY) VALUES(
    ?,?,1
);

-- DELETE

DELETE FROM INVENTORY WHERE IDINVENTORY = ?;

------------
-- COURSE
-------------
-- GET curso con su descripcio y el nombre del docente y su especialidad

SELECT COURSE.NAME_COURSE, COURSE.DESCRIPTION_CO , PERSON.NAME_PERSON, PERSON.LASTNAME, DOCENT.SPECIALITY 
FROM DOCENT
INNER JOIN COURSE
ON COURSE.FK_IDDOCENT = DOCENT.IDDOCENT
INNER JOIN PERSON
ON PERSON.IDPERSON = DOCENT.FK_IDPERSON
ORDER BY PERSON.IDPERSON ASC;

-- curso en especifico
SELECT COURSE.NAME_COURSE, COURSE.DESCRIPTION_CO , PERSON.NAME_PERSON, PERSON.LASTNAME, DOCENT.SPECIALITY 
FROM DOCENT
INNER JOIN COURSE
ON COURSE.FK_IDDOCENT = DOCENT.IDDOCENT
INNER JOIN PERSON
ON PERSON.IDPERSON = DOCENT.FK_IDPERSON
WHERE COURSE.IDCOURSE = ?;

--  update
UPDATE COURSE 
SET ?
WHERE IDCOURSE = ?;

-- create

INSERT INTO COURSE (FK_IDDOCENT, NAME_COURSE, DESCRIPTION_CO  ) VALUES(
    ?,?,?
);

-- delete
DELETE FROM COURSE WHERE IDCOURSE = ?;

---------------
-- user
---------------
-- get
SELECT PERSON.IDPERSON, CONCAT(PERSON.NAME_PERSON, ' ', PERSON.LASTNAME) AS PERSON_NAME , USER.USERNAME, PERSON.AGE, PERSON.TEL, PERSON.EMAIL FROM PERSON;