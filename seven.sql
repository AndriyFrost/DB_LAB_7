DROP SCHEMA IF EXISTS frost_seven;
CREATE SCHEMA IF NOT EXISTS frost_seven DEFAULT CHARACTER SET utf8 ;
USE frost_seven ;


DROP TABLE IF EXISTS position;
DROP TABLE IF EXISTS street;
DROP TABLE IF EXISTS zone_of_influence;
DROP TABLE IF EXISTS pharmacy;
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS list_of_drugs;
DROP TABLE IF EXISTS pharmacy_has_list_of_drugs;
DROP TABLE IF EXISTS list_of_drugs_has_zone_of_influence;

CREATE TABLE IF NOT EXISTS position (
  id INT NOT NULL AUTO_INCREMENT,
  job_title VARCHAR(45) NOT NULL,
  PRIMARY KEY (id))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS street  (
  id INT NOT NULL AUTO_INCREMENT,
  street_name VARCHAR(45) NOT NULL,
  PRIMARY KEY (id))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS zone_of_influence (
  id INT NOT NULL AUTO_INCREMENT,
  heart VARCHAR(45) NOT NULL,
  lungs VARCHAR(45) NOT NULL,
  stomach VARCHAR(45) NOT NULL,
  kidneys VARCHAR(45) NOT NULL,
  PRIMARY KEY (id))
ENGINE = InnoDB;


CREATE TABLE IF NOT EXISTS pharmacy (
  id INT NOT NULL AUTO_INCREMENT,
  name_of_pharmacy VARCHAR(45) NOT NULL,
  house_number INT NOT NULL,
  web_page_address VARCHAR(45) NOT NULL,
  time_start_work TIME NOT NULL,
  time_end_work TIME NOT NULL,
  weekend_on_saturday BOOLEAN NOT NULL,
  weekend_on_sunday BOOLEAN NOT NULL,
  street_id INT NOT NULL,
  PRIMARY KEY (id,street_id))
ENGINE = InnoDB;


CREATE TABLE IF NOT EXISTS employees (
  id INT NOT NULL AUTO_INCREMENT,
  first_name VARCHAR(45) NOT NULL,
  last_name VARCHAR(45) NOT NULL,
  father_name VARCHAR(45) NOT NULL,
  identification_number INT UNIQUE NOT NULL ,
  series_and_passport_number VARCHAR(45) NOT NULL,
  experience_in_years DOUBLE NOT NULL,
  date_of_birth DATE NOT NULL,
  position_id INT NOT NULL,
  pharmacy_id INT NOT NULL,
  PRIMARY KEY (id,position_id,pharmacy_id))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS list_of_drugs (
  id INT NOT NULL AUTO_INCREMENT,
  name_of_the_drug VARCHAR(45) NOT NULL,
  ministry_code INT NOT NULL,
  only_with_recipe BOOLEAN NOT NULL,
  narcotic BOOLEAN NOT NULL,
  psychotropic_drug BOOLEAN NOT NULL,
  PRIMARY KEY (id))
ENGINE = InnoDB;


CREATE TABLE IF NOT EXISTS pharmacy_has_list_of_drugs (
  pharmacy_id INT NOT NULL,
  list_of_drugs_id INT NOT NULL,
  PRIMARY KEY (pharmacy_id, list_of_drugs_id))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS list_of_drugs_has_zone_of_influence (
  list_of_drugs_id INT NOT NULL,
  zone_of_influence_id INT NOT NULL,
  PRIMARY KEY (list_of_drugs_id, zone_of_influence_id))
ENGINE = InnoDB;

INSERT INTO position (id, job_title ) VALUES
(1, "Pharmacist"),
(2, "Manager"),
(3, "Junior pharmacist"),
(4, "Pharmacist-analyst"),
(5, "Pharmacist-intern"),
(6, "Senior pharmacist");

INSERT INTO street (id, street_name ) VALUES
(1, "Buzkova"),
(2, "Vladimir the Great"),
(3, "Scientific"),
(4, "Pulyuya"),
(5, "Truskavets"),
(6, "Princess Olga");

INSERT INTO zone_of_influence (id,heart,lungs,stomach,kidneys) values
(1, "will help", "will help", "none", "not much, but will help a little"),
(2, "will help", "not much, but will help a little", "none", "not much, but will help a little"),
(3, "none", "will help", "none", "will help"),
(4, "will help", "none", "not much, but will help a little", "not much, but will help a little"),
(5, "not much, but will help a little", "will help", "none", "none"),
(6, "not much, but will help a little", "will help", "none", "not much, but will help a little"),
(7, "none", "will help", "none", "not much, but will help a little"),
(8, "will help", "will help", "none", "will help"),
(9, "none", "none", "will help", "not much, but will help a little");

INSERT INTO pharmacy (id, name_of_pharmacy,house_number,web_page_address,time_start_work,time_end_work,weekend_on_saturday,weekend_on_sunday,street_id ) VALUES
(1, "We wish you health",12,"www.wish.com","09:00:00","22:00:00",true,true,2),
(2, "Pharmacy D.S.",42,"www.ds.com","1:00:00","22:00:00",false,true,1),
(3, "Low price pharmacy",32,"www.price.com","11:00:00","22:00:00",true,false,2),
(4, "PHARMACY GRACE",2,"www.grace.com","12:00:00","22:00:00",true,false,5),
(5, "Good day pharmacy",13,"www.good.com","13:00:00","22:00:00",false,false,3),
(6, "Rosemary Pharmacy",72,"www.rosemary.com","14:00:00","22:00:00",true,true,6),
(7, "Plantain",75,"www.plantain.com","17:00:00","22:00:00",true,true,4);

INSERT INTO employees (id, first_name,last_name,father_name,identification_number,series_and_passport_number,experience_in_years,date_of_birth,position_id,pharmacy_id ) VALUES
(1, "Vova","Bats","Vasul",213214,"none",2.4,"1994-07-01",4,1),
(2, "Andriy","Moroz","Roman",213215,"none",1.3,"2001-11-28",5,2),
(3, "Vita","Prots","Roman",213221,"none",2.6,"1998-03-07",1,3),
(4, "Solomiya","Vahohuch","Andriy",215211,"none",4.7,"1989-02-02",3,5),
(5, "Anton","Zaritskui","Yra",242423,"none",1.5,"2000-12-31",3,4),
(6, "Yra","Voitina","Anton",642132,"none",0.5,"2002-01-07",2,2),
(7, "Vasul","Kachmar","Yra",423421,"none",5.4,"1996-10-13",1,3);

INSERT INTO list_of_drugs (id, name_of_the_drug,ministry_code,only_with_recipe,narcotic,psychotropic_drug ) VALUES
(1, "Pomichnuk",53224,true,true,true),
(2, "Analgin",24312,true,false,true),
(3, "Streptils",85643,false,true,true),
(4, "Black Vugila",31242,true,true,false),
(5, "Farmatcetron",75453,false,false,false),
(6, "Noshpa",68213,true,false,true),
(7, "Popolus",93241,false,true,true);

INSERT INTO pharmacy_has_list_of_drugs( pharmacy_id,list_of_drugs_id) VALUES
(1, 7),
(2, 2),
(4, 1),
(2, 3),
(3, 6),
(6, 2),
(4, 6),
(1, 2),
(7, 5),
(2, 4),
(2, 1);

INSERT INTO list_of_drugs_has_zone_of_influence( list_of_drugs_id,zone_of_influence_id) VALUES
(7, 1),
(2, 2),
(4, 1),
(3, 2),
(6, 3),
(2, 6),
(4, 6),
(1, 2),
(5, 7),
(3, 4),
(2, 1);

DELIMITER //
CREATE PROCEDURE proc1(sId INT,
  sName_of_pharmacy VARCHAR(45),
  sHouse_number INT ,
  sWeb_page_address VARCHAR(45),
  sTime_start_work TIME,
  sTime_end_work TIME,
  sWeekend_on_saturday BOOLEAN,
  sWeekend_on_sunday BOOLEAN,
  sStreet_id INT)
BEGIN
    INSERT INTO frost_seven.pharmacy(id,name_of_pharmacy,house_number,web_page_address,time_start_work,time_end_work,weekend_on_saturday,weekend_on_sunday,street_id)
    VALUES (sId, sName_of_pharmacy, sHouse_number,sWeb_page_address,sTime_start_work,sTime_end_work,sWeekend_on_saturday,sWeekend_on_sunday,sStreet_id);
END//
DELIMITER ;

DELIMITER //
CREATE PROCEDURE proc2(id int)
BEGIN
 if id = 0 THEN
  select (select id from pharmacy where ub.pharmacy_id=pharmacy.id),
    (select name_of_the_drug from list_of_drugs where ub.list_of_drugs_id=list_of_drugs.id)
    from pharmacy_has_list_of_drugs as ub;
    END IF;
 if id > 0 THEN
  select (select name_of_pharmacy from pharmacy where ub.pharmacy_id=pharmacy.id),
    (select name_of_the_drug from list_of_drugs where ub.list_of_drugs_id=list_of_drugs.id)
    from pharmacy_has_list_of_drugs as ub where ub.list_of_drugs_id=id;
    END if;
END//
DELIMITER ;

Delimiter //
CREATE PROCEDURE create_random_tables()
BEGIN
	DECLARE new_name VARCHAR(45);
	DECLARE done BOOL DEFAULT FALSE;
    DECLARE zone_of_influence_cursor CURSOR FOR SELECT name FROM zone_of_influence;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
    
    
	
    set @zone_of_influence_1 := CONCAT('zone_of_influence_',SECOND(NOW()),'_',MINUTE(NOW()),'_',HOUR(NOW()),'_',DAY(NOW()),'_1');
    set @zone_of_influence_2 := CONCAT('zone_of_influence_',SECOND(NOW()),'_',MINUTE(NOW()),'_',HOUR(NOW()),'_',DAY(NOW()),'_2');
    
    set @zone_of_influence_query_1 := CONCAT('CREATE TABLE ', @zone_of_influence_1, ' LIKE zone_of_influence;');
    set @zone_of_influence_query_2 := CONCAT('CREATE TABLE ', @zone_of_influence_2, ' LIKE zone_of_influence;');
    
    
	 prepare query from @zone_of_influence_query_1;
	 execute query;
    
    prepare query from @zone_of_influence_query_2;
	execute query;
    
    
    OPEN zone_of_influence_cursor;
    label2: LOOP
		FETCH zone_of_influence_cursor INTO new_name;
        IF done THEN LEAVE label2;
        END IF;
        
        IF FLOOR(RAND()*10)%2 THEN
        set @values := CONCAT('INSERT ', @zone_of_influence_1 ,' (name) VALUES (\"',new_name,'\");');
		prepare query from @values;
	    execute query;
        ELSE
		set @values := CONCAT('INSERT ', @zone_of_influence_2 ,' (name) VALUES (\"',new_name,'\");');
        prepare query from @values;
	    execute query;
        END IF;
        
    END LOOP;
    CLOSE zone_of_influence_cursor;
END
// Delimiter ;

DELIMITER //
CREATE FUNCTION func1()
RETURNS DOUBLE
DETERMINISTIC
BEGIN
 RETURN (SELECT AVG(experience_in_years) FROM employees);
END//
DELIMITER ;

SELECT * FROM employees where experience_in_years > frost_seven.func1();

DELIMITER //
CREATE FUNCTION func2(id int)
RETURNS VARCHAR(25)
DETERMINISTIC
BEGIN
	RETURN (SELECT job_title  FROM position WHERE position.id=id);
END//
DELIMITER ;

SELECT *, frost_seven.func2(employees.position_id) AS job_title  FROM employees;

--                 INSERT                --

DELIMITER //
CREATE TRIGGER pharmacyCheckInsertFK
BEFORE INSERT
ON pharmacy FOR EACH ROW
BEGIN
	IF (new.street_id NOT IN (SELECT id from street))
		THEN SIGNAL SQLSTATE "45000"
			SET MESSAGE_TEXT = "Check street for insert. FK trouble";
    END IF;
END
// DELIMITER ;


DELIMITER //
CREATE TRIGGER employeeCheckInsertFK
BEFORE INSERT
ON employees FOR EACH ROW
BEGIN
	IF (new.position_id NOT IN (SELECT id from position))
		THEN SIGNAL SQLSTATE "45000"
			SET MESSAGE_TEXT = "Check post for insert. FK trouble";
    END IF;
    
    IF (new.pharmacy_id NOT IN (SELECT id from pharmacy))
		THEN SIGNAL SQLSTATE "45000"
			SET MESSAGE_TEXT = "Check pharmacy for insert. FK trouble";
    END IF;
    
END
// DELIMITER ;

-- --                 UPDATE                --

DELIMITER //
CREATE TRIGGER postCheckUpdateFK
BEFORE UPDATE
ON position FOR EACH ROW
BEGIN
	IF (old.id != new.id AND old.id in (select id FROM position))
    		THEN SIGNAL SQLSTATE "45000"
			SET MESSAGE_TEXT = "Check index for update.";
    END IF;	
END
// DELIMITER ;


DELIMITER //
CREATE TRIGGER streetCheckUpdateFK
BEFORE UPDATE
ON street FOR EACH ROW
BEGIN
	IF (old.id != new.id AND old.id in (select id FROM street))
    		THEN SIGNAL SQLSTATE "45000"
			SET MESSAGE_TEXT = "Check index for update.";
    END IF;	
END
// DELIMITER ;

DELIMITER //
CREATE TRIGGER zoneOfInfluenceCheckUpdateFK
BEFORE UPDATE
ON zone_of_influence FOR EACH ROW
BEGIN
	IF (old.id != new.id AND old.id in (select id FROM zone_of_influence))
    		THEN SIGNAL SQLSTATE "45000"
			SET MESSAGE_TEXT = "Check index for update.";
    END IF;	
END
// DELIMITER ;

DELIMITER //
CREATE TRIGGER employeeCheckUpdateFK
BEFORE UPDATE
ON employees FOR EACH ROW
BEGIN
	IF (old.id != new.id AND old.id in (select id FROM employees))
    		THEN SIGNAL SQLSTATE "45000"
			SET MESSAGE_TEXT = "Check index for update.";
    END IF;	
END
// DELIMITER ;

DELIMITER //
CREATE TRIGGER pharmacyCheckUpdateFK
BEFORE UPDATE
ON pharmacy FOR EACH ROW
BEGIN
	IF (old.id != new.id AND old.id in (select id FROM pharmacy))
    		THEN SIGNAL SQLSTATE "45000"
			SET MESSAGE_TEXT = "Check index for update.";
    END IF;	
END
// DELIMITER ;


DELIMITER //
CREATE TRIGGER drugsCheckUpdateFK
BEFORE UPDATE
ON list_of_drugs FOR EACH ROW
BEGIN
	IF (old.id != new.id AND old.id in (select id FROM list_of_drugs))
    		THEN SIGNAL SQLSTATE "45000"
			SET MESSAGE_TEXT = "Check index for update.";
    END IF;	
END
// DELIMITER ;

-- --                 DELETE                --

DELIMITER //
CREATE TRIGGER postCheckDeleteFK
BEFORE DELETE
ON position FOR EACH ROW
BEGIN
	IF (old.id IN (SELECT position_id FROM employee))
	THEN SIGNAL SQLSTATE "45000"
		SET MESSAGE_TEXT = "It's employee here. FK trouble";
	END IF;
END
// DELIMITER ;


DELIMITER //
CREATE TRIGGER streetCheckDeleteFK
BEFORE DELETE
ON street FOR EACH ROW
BEGIN
	IF (old.id IN (SELECT street_id FROM pharmacy))
	THEN SIGNAL SQLSTATE "45000"
		SET MESSAGE_TEXT = "It's pharmacy here. FK trouble";
	END IF;
END
// DELIMITER ;

 DELIMITER //
 CREATE TRIGGER zoneOfInfluenceCheckDeleteFK 
 BEFORE DELETE
 ON zone_of_influence FOR EACH ROW
 BEGIN
 	IF (old.id IN (SELECT zone_of_influence_id FROM list_of_drugs_has_zone_of_influence))
 	THEN SIGNAL SQLSTATE "45000"
 		SET MESSAGE_TEXT = "Drugs has zone of influence. FK trouble";
 	END IF;
 END
 // DELIMITER ;



 DELIMITER //
 CREATE TRIGGER drugsCheckDeleteFK 
 BEFORE DELETE
 ON list_of_drugs FOR EACH ROW
 BEGIN
 	IF (old.id IN (SELECT list_of_drugs_id FROM list_of_drugs_has_zone_of_influence))
 	THEN SIGNAL SQLSTATE "45000"
 		SET MESSAGE_TEXT = "Zone of influence has drugs. FK trouble";
 	END IF;
     
     	IF (old.id IN (SELECT list_of_drugs_id FROM pharmacy_has_list_of_drugs))
 	THEN SIGNAL SQLSTATE "45000"
 		SET MESSAGE_TEXT = "Pharmacy has drugs. FK trouble";
 	END IF;
 END
 // DELIMITER;


 DELIMITER //
 CREATE TRIGGER pharmacyCheckDeleteFK 
 BEFORE DELETE
 ON pharmacy FOR EACH ROW
 BEGIN
 	IF (old.id IN (SELECT pharmacy_id FROM pharmacy_has_list_of_drugs))
 	THEN SIGNAL SQLSTATE "45000"
 	SET MESSAGE_TEXT = "Drugs has pharmacy. FK trouble";
 	END IF;
 END
 // DELIMITER;


-- --                 TASK 2                --

 DELIMITER //
 CREATE TRIGGER employeeCheckCode
 BEFORE INSERT 
 ON employees FOR EACH ROW
 BEGIN
 	IF (new.identification_number  REGEXP("[^0]{2}$"))
 	THEN SIGNAL SQLSTATE "45000"
 		SET MESSAGE_TEXT = "ID CODE DOES NOT SUPPORT. ID code trouble";
 	END IF;
 END // DELIMITER ;


 DELIMITER //
 CREATE TRIGGER employeeCheckCodeUpd
 BEFORE UPDATE
 ON employees FOR EACH ROW
 BEGIN
 	IF (new.identification_number  REGEXP("[^0]{2}$"))
 	THEN SIGNAL SQLSTATE "45000"
 		SET MESSAGE_TEXT = "ID CODE DOES NOT SUPPORT. ID code trouble";
	END IF;
END // DELIMITER ;

/* TASK 3 */

DELIMITER //
CREATE TRIGGER drugsCheckCode
BEFORE INSERT 
ON list_of_drugs FOR EACH ROW
BEGIN
	IF (new.ministry_code  REGEXP("[^МП]{2}-[0-9]{3}-[0-9]{2}"))
	THEN SIGNAL SQLSTATE "45000"
		SET MESSAGE_TEXT = "CODE DOES NOT SUPPORT. Code trouble";
	END IF;
END // DELIMITER ;


DELIMITER //
CREATE TRIGGER drugsCheckCodeUpd
BEFORE UPDATE
ON list_of_drugs FOR EACH ROW
BEGIN 
	IF (new.ministry_code  REGEXP("[^МП]{2}-[0-9]{3}-[0-9]{2}"))
	THEN SIGNAL SQLSTATE "45000"
		SET MESSAGE_TEXT = "CODE DOES NOT SUPPORT. Code trouble";
	END IF;
END // DELIMITER ;

/* TASK 4 */

DELIMITER //
CREATE TRIGGER streetCreateLog
AFTER INSERT
ON street FOR EACH ROW
BEGIN
	INSERT INTO street_journal (street_name, timestamp) VALUES (new.street_name, current_timestamp());
END // DELIMITER ;

