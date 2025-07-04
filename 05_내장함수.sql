-- 형 변환 함수 실습
-- 숫자 데이터를 문자 데이터로 형 변환
SELECT 123456789;
SELECT CAST(123456789 AS CHAR);
SELECT CONVERT(123456789, CHAR);

-- usertbl 테이블에서 birthYear 열의 데이터를 문자 데이터로 형 변환
SELECT `name`,
		 CONVERT(`birthYear`, CHAR)
FROM usertbl;

-- 실수 데이터를 정수 데이터로 형 변환
-- buytbl 테이블에서 평균 구매 개수를 정수형으로 변환해서 조회
SELECT CONVERT(AVG(amount), INT)
FROM buytbl;

-- 문자 데이터를 숫자 데이터로 형 변환
SELECT CONVERT('10000000', INT);
SELECT CONVERT('10,000,000', INT); -- 10 출력
SELECT REPLACE('10,000,000', ',', ''); -- 문자열에서 콤마(,)를 제거
SELECT CONVERT(REPLACE('10,000,000', ',', ''), INT);

-- 아래의 쿼리가 정상적으로 연산되도록 쿼리문을 작성하시오.
SELECT '1,000,000' - '500,000';
SELECT CONVERT(REPLACE('1,000,000', ',', ''), INT) 
			- CONVERT(REPLACE('500,000', ',', ''), INT);

-- 묵시적 형 변환 활용
SELECT '1000000' - '500000';
SELECT REPLACE('1,000,000', ',', '') - REPLACE('500,000', ',', '');

-- usertbl 테이블에서 mobile1의 데이터를 숫자 데이터로 형 변환
SELECT `name`,
		 CONVERT(`mobile1`, INT)
FROM usertbl;

-- 문자, 숫자 데이터를 날짜, 시간 데이터로 형 변환
SELECT CONVERT('2025-06-25', DATE);
SELECT CONVERT('2025/06/25', DATE);
SELECT CONVERT('2025%06%25', DATE);
SELECT CONVERT('11:10:30', TIME);
SELECT CONVERT('2025-06-25 11:10:30', DATETIME);

SELECT CONVERT(20250625, DATE);
SELECT CONVERT(111525, TIME);
SELECT CONVERT(20250625111525, DATETIME);

-- 모든 데이터 타입에 대해서 형 변환이 가능한 것은 아니다.
SELECT CAST(2025 AS YEAR);
SELECT CAST(123 AS TINYINT);
SELECT CAST(12345 AS SMALLINT);
SELECT CONVERT(2025, YEAR);
SELECT CONVERT(123, TINYINT);
SELECT CONVERT(12345, SMALLINT);

-- 묵시적 형 변환
SELECT '100' + '200';
SELECT CONCAT('100', 200);
SELECT 1 > '2mega'; -- 정수 2로 변환되어서 비교 (거짓을 의미하는 0 출력)
SELECT 3 > '2mega'; -- 정수 2로 변환되어서 비교 (참을 의미하는 1 출력)
SELECT 0 = 'mega'; -- 문자는 0으로 변환되어서 비교 (참을 의미하는 1 출력)

-- 제어 흐름 함수
-- IF 함수
SELECT IF(100 < 200, '참', '거짓');

-- buytbl 테이블에서 고객 별 구매 개수의 합계 조회
-- 단, 구매 개수가 10개 이상이면 'VIP 고객', 
-- 10개 미만이면 '일반 고객'으로 출력
SELECT userid AS '아이디', 
		 SUM(amount) AS '구매 개수의 합',
		 IF(SUM(amount) >= 10, 'VIP 고객', '일반 고객') AS '고객 유형'
FROM buytbl
GROUP BY userid
ORDER BY `구매 개수의 합`;

-- IFNULL 함수
SELECT IFNULL(NULL, '값이 없음'), IFNULL(100, '값이 없음');
SELECT NVL(NULL, '값이 없음'), NVL(100, '값이 없음'); -- 10.3 버전부터 지원

-- buytbl 테이블에서 모든 데이터를 출력
-- 단, groupName 열의 값이 NULL인 경우 '없음'으로 출력
SELECT num,
		 userid,
		 prodName,
		 IFNULL(groupName, '없음'),
		 price,
		 amount
FROM buytbl;

-- NVL2 함수
SELECT NVL2(NULL, 100, 200), NVL2(300, 100, 200);

-- employee 테이블에서 보너스를 0.1로 동결하여 
-- 직원명, 보너스, 보너스가 포함된 연봉 조회
SELECT emp_name,
		 NVL2(bonus, 0.1, 0),
		 salary * 12,
		 (salary + (salary * NVL2(bonus, 0.1, 0))) * 12
FROM employee;

-- CASE 연산자
SELECT CASE 10
			WHEN 1 THEN '일'
			WHEN 5 THEN '오'
			WHEN 10 THEN '십'
			ELSE '모름'
		 END AS '결과';

SELECT CASE
			WHEN 10 < 20 THEN '10 < 20'
			WHEN 10 = 20 THEN '10 = 20'
			ELSE '모름'
		 END AS '결과';

-- employee 테이블에서 직원명, 급여, 급여 등급(1 ~ 4) 조회
-- 급여가 500만원 초과일 경우 1등급
-- 급여가 500만원 이하 350만원 초과일 경우 2등급
-- 급여가 350만원 이하 200만원 초과일 경우 3등급
-- 그 외의 경우 4등급
SELECT emp_name,
		 salary,
		 CASE
		 	WHEN salary > 5000000 THEN '1등급'
		 	WHEN salary > 3500000 THEN '2등급'
		 	WHEN salary > 2000000 THEN '3등급'
		 	ELSE '4등급'
		 END AS 'grade'
FROM employee
ORDER BY grade DESC;

-- 문자열 함수
-- ASCII, CHAR 함수
SELECT ASCII('A'), CHAR(65), ASCII('홍');

-- BIT_LENGTH, CHAR_LENGTH, LENGTH 함수
-- MariaDB는 기본적으로 UTF-8 코드를 사용하기 때문에 영문은 1Byte, 한글은 3Byte를 할당한다.
SELECT BIT_LENGTH('ABC'), CHAR_LENGTH('ABC'), LENGTH('ABC');
SELECT BIT_LENGTH('홍길동'), CHAR_LENGTH('홍길동'), LENGTH('홍길동');

-- CONCAT, CONCAT_WS 함수
SELECT CONCAT('2025', '06', '25'),
			CONCAT_WS('/', '2025', '06', '25');

-- usertbl 테이블에서 아이디, 이름, 전화번호 조회
SELECT `userid`,
		 `name`,
		 -- CONCAT(`mobile1`, `mobile2`) AS 'mobile',
		 CONCAT_WS('-', `mobile1`, `mobile2`) AS 'mobile'
FROM usertbl;

-- ELT, FIELD, FIND_IN_SET, INSTR, LOCATE 함수
SELECT ELT(2, '하나', '둘', '셋'); -- '둘' 반환
SELECT FIELD('둘', '하나', '둘', '셋'); -- 2 반환
SELECT FIND_IN_SET('둘', '하나,둘,셋'); -- 2 반환
SELECT INSTR('하나 둘 셋', '둘');
SELECT LOCATE('둘', '하나 둘 셋');

-- employee 테이블에서 이메일의 '@' 위치값 출력
SELECT email,
		 INSTR(email, '@')
FROM employee;

-- FORMAT 함수
SELECT CONVERT(1234567, CHAR);
-- 반올림, 3자리 콤마를 표시해 준다.
SELECT FORMAT(1234567.789, 2);

-- INSERT 함수
SELECT INSERT('abcdefghi', 3, 4, '####');
SELECT INSERT('990525-1234567', 9, 6, '******');

-- employee 테이블에서 사원명, 주민등록번호(뒷자리 마스킹 처리) 조회
SELECT emp_name, 
		 INSERT(emp_no, 8, 7, '*******')
FROM employee;

-- UPPER, LOWER 함수
SELECT UPPER('abcdeFGHI'), LOWER('abcdeFGHI');

-- LEFT, RIGHT 함수
SELECT LEFT('abcdefghi', 3), RIGHT('abcdefghi', 3);

-- employee 테이블에서 사원명, 이메일, 아이디 출력
SELECT emp_name, 
		 email,
		 LEFT(email, INSTR(email, '@') - 1) AS 'id'
FROM employee;

-- LPAD, RPAD 함수
SELECT LPAD('Hello', 10),
		 LPAD('Hello', 10, ' '),
		 LPAD('Hello', 10, '#'),
		 LPAD('Hello', 4, '#');

SELECT RPAD('Hello', 10),
		 RPAD('Hello', 10, ' '),
		 RPAD('Hello', 10, '#'),
		 RPAD('Hello', 4, '#');

-- employee 테이블에서 사원명, 주민등록번호(뒷자리 마스킹 처리) 조회
SELECT emp_name, 
		RPAD(LPAD(emp_no, 8), 14, '*')
FROM employee;

-- LTRIM, RTRIM, TRIM 함수
SELECT LTRIM('     HELLO     '),
		 RTRIM('     HELLO     '),
		 TRIM('     HELLO     ');

SELECT TRIM(BOTH ' ' FROM '     HELLO     '),
		 TRIM(BOTH 'z' FROM 'zzzzzHELLOzzzzz'),
		 TRIM(LEADING 'z' FROM 'zzzzzHELLOzzzzz'),
		 TRIM(TRAILING 'z' FROM 'zzzzzHELLOzzzzz');

-- REPEAT, REVERSE, SPACE 함수
SELECT REPEAT('Hello', 3),
		 REVERSE('Hello'),
		 CONCAT('Maria', SPACE(5), 'DB');
		 
-- REPLACE 함수
SELECT REPLACE('hong@gmail.com', 'gmail', 'naver'),
		 REPLACE('hong@gmail.com', '@gmail.com', '');
		 
-- employee 테이블에서 이메일의 kh.or.kr을 beyond.com으로 변경해서 조회
SELECT emp_name,
		 REPLACE(email, 'kh.or.kr', 'beyond.com'),
		 REPLACE(email, '@kh.or.kr', '')
FROM employee;

-- SUBSTRING 함수
SELECT SUBSTRING('대한민국만세', 3),
		 SUBSTRING('대한민국만세', 3, 2),
		 SUBSTRING('대한민국만세', -2, 2);
		 
-- employee 테이블에서 사원명, 아이디, 성별 조회
SELECT emp_name,
		 SUBSTRING(email, 1, INSTR(email, '@') - 1) AS 'id',
		 CASE
		 	WHEN SUBSTRING(emp_no, 8, 1) IN ('1', '3') THEN '남자'
		 	WHEN SUBSTRING(emp_no, 8, 1) IN ('2', '4') THEN '여자'
		 END AS 'gender'
FROM employee;

-- SUBSTRING_INDEX 함수
SELECT SUBSTRING_INDEX('cafe.naver.com', '.', 2),
		 SUBSTRING_INDEX('cafe.naver.com', '.', -2);

-- employee 테이블에서 사원명, 아이디, 이메일 조회
SELECT emp_name,
		 SUBSTRING_INDEX(email, '@', 1) AS 'id',
		 email
FROM employee;

-- 수학 함수
-- CEILING, FLOOR 함수
SELECT CEILING(4.3), FLOOR(4.7);

-- ROUND 함수
SELECT ROUND(4.355),
		 ROUND(4.355, 0),
		 ROUND(4.355, 2),
		 ROUND(4.355, -1);
		 
-- TRUNCATE 함수
SELECT TRUNCATE(123.456, 0),
		 TRUNCATE(123.456, 2),
		 TRUNCATE(123.456, -1);

-- MOD 함수, % 연산자
SELECT MOD(157, 10),
		 157 % 10,
		 157 MOD 10;
		 
-- RAND()
-- 1 ~ 100 사이의 랜덤 값 출력
SELECT RAND(), -- 0.0 ~ 0.999...
		 RAND() * 100, -- 0.0 ~ 99.999...
		 FLOOR((RAND() * 100) + 1); -- 1 ~ 100
		 
-- 날짜 및 시간 함수
-- ADDDATE, SUBDATE 함수
SELECT ADDDATE('2025-01-01', INTERVAL 10 DAY),
		 ADDDATE('2025-01-01', INTERVAL 1 MONTH),
		 ADDDATE('2025-01-01', INTERVAL 2 YEAR);
		 
SELECT ADDDATE(CURDATE(), INTERVAL 10 DAY),
		 ADDDATE(CURDATE(), INTERVAL 1 MONTH),
		 ADDDATE(CURDATE(), INTERVAL 2 YEAR);
		 
SELECT SUBDATE('2025-01-01', INTERVAL 10 DAY),
		 SUBDATE('2025-01-01', INTERVAL 1 MONTH),
		 SUBDATE('2025-01-01', INTERVAL 2 YEAR);
		 
SELECT SUBDATE(CURDATE(), INTERVAL 10 DAY),
		 SUBDATE(CURDATE(), INTERVAL 1 MONTH),
		 SUBDATE(CURDATE(), INTERVAL 2 YEAR);

-- employee 테이블에서 직원명, 입사일, 입사 후 3개월이 된 날짜를 조회
SELECT emp_name,
		 hire_date,
		 ADDDATE(hire_date, INTERVAL 3 MONTH)
FROM employee;

-- ADDTIME, SUBTIME 함수
SELECT ADDTIME('2025-01-01 23:59:59', '1:1:1'),
		 ADDTIME('15:00:00', '2:10:30');
		 
SELECT ADDTIME(NOW(), '1:1:1'),
		 ADDTIME(CURTIME(), '2:10:30');

SELECT SUBTIME('2025-01-02 01:01:00', '1:1:1'),
		 SUBTIME('17:10:30', '2:10:30');
		 
SELECT SUBTIME(NOW(), '1:1:1'),
		 SUBTIME(CURTIME(), '2:10:30');
		 
-- CURDATE, CURTIME, NOW, SYSDATE 함수
SELECT CURDATE(),
		 CURTIME(), 
		 NOW(), 
		 SYSDATE();

-- YEAR, MONTH, DAY, DATE 함수
SELECT YEAR(CURDATE()),
		 MONTH(CURDATE()),
		 DAY(CURDATE()),
		 DAYOFMONTH(CURDATE()),
		 DATE(NOW());

-- HOUR, MINUTE, SECOND, TIME 함수
SELECT HOUR(CURTIME()),
		 MINUTE(CURTIME()),
		 SECOND(CURTIME()),
		 TIME(NOW());

-- DATEDIFF, TIMEDIFF 함수
SELECT DATEDIFF(CURDATE(), '2024-06-26'),
		 TIMEDIFF(CURTIME(), '09:00:00');
		 
-- employee 테이블에서 직원명, 입사일, 근무 일 수 조회
SELECT emp_name, 
		 hire_date,
		 DATEDIFF(CURDATE(), hire_date)
FROM employee;

-- DAYOFWEEK, MONTHNAME, DAYOFYEAR, LAST_DAY 함수
SELECT DAYOFWEEK(CURDATE()),
		 MONTHNAME(CURDATE()),
		 DAYOFYEAR(CURDATE()),
		 LAST_DAY(CURDATE());
		 
-- MAKEDATE, MAKETIME, PERIOD_ADD, PERIOD_DIFF 함수
SELECT MAKEDATE(2025, 177),
		 MAKETIME(23, 59, 59),
		 PERIOD_ADD(202506, 11),
		 PERIOD_DIFF(202506, 202405);
		 
-- QUARTER, TIME_TO_SEC 함수
SELECT QUARTER(CURDATE()),
		 TIME_TO_SEC(CURTIME());