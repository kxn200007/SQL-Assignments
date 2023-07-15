DELIMITER $$

CREATE PROCEDURE test (IN NAME VARCHAR(100))

BEGIN
	
    DECLARE CONTINUE HANDLER FOR 1062
	INSERT INTO categories2 (name) values (name);
    SELECT CONCAT('1 row was updated.') AS msg;
    SELECT CONCAT('Row was not updated - column cannot be null') AS msg;

 END$$
              