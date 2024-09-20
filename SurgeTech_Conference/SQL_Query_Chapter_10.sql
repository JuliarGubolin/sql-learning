-- CHAPTER 10: INSERT, UPDATE, DELETE, DROP TABLE AND TRUNCATE TABLE COMMANDS
-- 1. INSERT
INSERT INTO ATTENDEE (FIRST_NAME, LAST_NAME, PHONE, EMAIL)
VALUES ('JULIA', 'BLABLABLA', 14542342432, 'julia.bbbblllaa@fictionalexample.com');

INSERT INTO ATTENDEE (FIRST_NAME, LAST_NAME)
VALUES ('THOMAS', 'NIELD');

select * from ATTENDEE;

-- MULTIPLE INSERTS
INSERT INTO ATTENDEE (FIRST_NAME, LAST_NAME, PHONE, EMAIL, VIP) VALUES
('Kamilly', 'Lawson', 478234723, 'kami.law@example.com', 1),
('Amelie', 'Silva', 442342341, 'amelie@example.com.br', 0),
('Karlos', 'Magnum',876543223299 , 'karlitos@yahoo.vom', 1);

-- MIGRATE TABLE
INSERT INTO ATTENDEE (FIRST_NAME, LAST_NAME, PHONE, EMAIL, VIP)
SELECT FIRST_NAME, LAST_NAME, PHONE, EMAIL
FROM ATTENDEE_BACKUP; --Just an example

-- Foreing key: inserting into COMPANY table
INSERT INTO COMPANY (NAME, DESCRIPTION, PRIMARY_CONTACT_ID)
VALUES ('LegitmaSchool', 'A technology school for kids', 3);

-- 2. DELETE: the most dangerous statement

-- This will delete the ATTENDEE number 6
DELETE FROM ATTENDEE 
WHERE PHONE LIKE '876543223299';

-- 3. TRUNCATE TABLE (not supported on SQLite): delete all the data inserted in a table
--TRUNCATE TABLE ATTENDEE;
-- WE can also use:
DELETE FROM ATTENDEE;
-- But the first one (TRUNCATE) resets the AUTO_INCREMENT value to its start value

-- 4. UPDATE: used to modify already existed data
-- updating email:
UPDATE ATTENDEE SET EMAIL = UPPER(EMAIL);
-- UPPER: to update each letter to capital format
-- Multiple updates
UPDATE ATTENDEE SET FIRST_NAME = UPPER(FIRST_NAME), LAST_NAME = UPPER(LAST_NAME);
-- UPDATE with WHERE: UPDATE CONDICIONALY
-- Update VIP to 1 only the attendees with ID 3 or 4
UPDATE ATTENDEE SET VIP = 1
WHERE ATTENDEE_ID IN (3, 4)