-- 스토어드 프로시저 실습
-- 프로시저 생성
DELIMITER $$
CREATE PROCEDURE userProc()
BEGIN
	SELECT * FROM usertbl;
END$$
DELIMITER ;

CALL userProc;

-- 매개 변수 사용
-- 회원의 이름을 입력받아 조회하는 프로시저 생성
DELIMITER $$
CREATE OR REPLACE PROCEDURE userProc(
	IN userName VARCHAR(10)
)
BEGIN
	SELECT *
	FROM usertbl
	WHERE `name` = userName;
END$$
DELIMITER ;

CALL userProc('성시경');

-- 사용자의 아이디를 입력받아서 이름을 돌려주는 프로시저 생성
-- 변수 생성
SET @gender = '남자';
SELECT @gender;

DELIMITER $$
CREATE OR REPLACE PROCEDURE userProc(
	IN id CHAR(8),
	OUT userName VARCHAR(20)
)
BEGIN
	SELECT `name`
	INTO userName
	FROM usertbl
	WHERE userid = id;
END$$
DELIMITER ;

CALL userProc('YJS', @uname);

SELECT @uname;

-- 제어문
-- 1) 조건문
-- IF 실습
DELIMITER $$
CREATE OR REPLACE PROCEDURE empProc(
	IN id CHAR(3)
)
BEGIN
	DECLARE `year` INT;

	SELECT YEAR(hire_date)
	INTO `year`
	FROM employee
	WHERE emp_id = id;
	
	IF `year` >= 2010 THEN
		SELECT '2010년대에 입사하셨네요!!';
	ELSEIF `year` >= 2000 THEN
		SELECT '2000년대에 입사하셨네요!!';
	ELSE
		SELECT '1900년대에 입사하셨네요!!';
	END IF;
END$$
DELIMITER ;

CALL empProc('200');

-- CASE 실습
DELIMITER $$
CREATE OR REPLACE PROCEDURE gradeProc(
	IN score TINYINT
)
BEGIN
	DECLARE grade CHAR(1);
	
	CASE
		WHEN score >= 90 THEN
			SET grade = 'A';
		WHEN score >= 80 THEN
			SET grade = 'B';
		WHEN score >= 70 THEN
			SET grade = 'C';
		WHEN score >= 60 THEN
			SET grade = 'D';
		ELSE
			SET grade = 'F';
	END CASE;
	
	SELECT score AS '점수', grade AS '등급';
END$$
DELIMITER ;

CALL gradeProc(59);

-- 2) 반복문
-- WHILE 실습
-- 1 ~ 10까지의 합계
DELIMITER $$
CREATE OR REPLACE PROCEDURE sumProc()
BEGIN
	DECLARE `i` INT;
	DECLARE `sum` INT;
	
	SET `i` = 1;
	SET `sum` = 0;
	
	WHILE (`i` <= 10) DO
		SET `sum` = `sum` + `i`;
		SET `i` = `i` + 1;
	END WHILE;
	
	SELECT CONCAT('1부터 10까지의 합은 : ', `sum`) AS '결과';
END$$
DELIMITER ;

CALL sumProc();

-- 예외처리 테스트
DELIMITER $$
CREATE OR REPLACE PROCEDURE errorProc()
BEGIN
	DECLARE CONTINUE HANDLER FOR 1146
		SELECT '테이블이 존재하지 않습니다.' AS '메시지';
	SELECT * FROM notable;
END$$
DELIMITER ;

CALL errorProc();

-- 프로시저 삭제
DROP PROCEDURE empProc;
DROP PROCEDURE errorProc;
DROP PROCEDURE gradeProc;
DROP PROCEDURE sumProc;
DROP PROCEDURE test_db.userProc;