-- SELECT 실습
-- 사용할 데이터베이스 선택
USE test_db;

-- usertbl 테이블의 모든 데이터 조회
SELECT * FROM usertbl;

-- buytbl 테이블의 모든 데이터 조회
SELECT * FROM buytbl;
SELECT * FROM test_db.buytbl;

-- employee 테이블의 모든 데이터 조회
SELECT * FROM employee;
SELECT * FROM employees_db.employee;

-- 필요한 열의 데이터 조회
-- 여러 개의 열을 가져오고 싶으면 콤마(,)로 구분하면 된다.
-- 조회되는 열 이름에 별칭(Alias)을 지정할 수 있다.
SELECT `userid` AS '아이디', 
		 `name` '이름',
		 `addr` 주소
FROM usertbl;

-- DISTINCT 실습
-- 회원들의 거주 지역 조회
SELECT DISTINCT addr
FROM usertbl;

-- DISTINCT는 SELECT 절에 한 번만 기술할 수 있다.
-- SELECT DISTINCT addr, DISTINCT mobile1
SELECT DISTINCT addr, mobile1
FROM usertbl;

-- LIMIT 실습
-- 전체 회원 중 5명에 대한 모든 데이터 조회
SELECT *
FROM usertbl
-- LIMIT 5
-- LIMIT 0, 5
LIMIT 5 OFFSET 0;

-- 열의 산술 연산 실습
-- employee 테이블에서 직원명, 급여, 직원의 연봉(급여 * 12) 조회
SELECT emp_name,
		 salary,
		 salary * 12
FROM employee;

-- employee 테이블에서 직원명, 급여, 직원의 연봉,
-- 보너스가 포함된 연봉((급여 + (급여 * 보너스)) * 12) 조회
SELECT emp_name AS '직원명',
		 salary AS '급여',
		 salary * 12 AS '연봉',
		 (salary + (salary * IFNULL(bonus, 0))) * 12 AS '보너스 포함 연봉'
FROM employee;

-- WHERE 실습
-- 비교 연산자와 논리 연산자
-- usertbl 테이블에서 아이디가 KBS인 회원의 아이디, 이름, 키 조회
SELECT `userid`, 
		 `name`, 
		 `height`
FROM usertbl
WHERE `userid` = 'KBS';

-- usertbl 테이블에서 키가 174 이상인 회원의 모든 데이터 조회
SELECT *
FROM usertbl
WHERE height >= 174
ORDER BY height;

-- usertbl 테이블에서 휴대폰이 없는 회원의 모든 데이터 조회
SELECT *
FROM usertbl
-- NULL 값은 비교 연산자로 비교 불가능
-- WHERE mobile1 = NULL;
-- NULL 값은 IS [NOT] NULL 연산자로 비교해야 한다.
WHERE mobile1 IS NULL;
-- WHERE mobile1 IS NOT NULL;

-- usertbl 테이블에서 가입일이 2010년 10월 10일 이전인 회원의 모든 데이터 조회
SELECT *
FROM usertbl
WHERE mDate <= '2010-10-10'
ORDER BY mDate;

-- employee 테이블에서 연봉이 5000만원 이상인 사원의 직원명, 급여, 연봉 조회
SELECT emp_name,
		 salary,
		 salary * 12
FROM employee
WHERE salary * 12 >= 50000000
ORDER BY salary;

-- usertbl 테이블에서 키가 170 이상 182 이하인 회원의 모든 데이터 조회
SELECT *
FROM usertbl
WHERE height >= 170 AND height <= 182
ORDER BY height;

-- usertbl 테이블에서 가입일이 2008년 1월 1일 이후에서 
-- 2010년 12월 31일 이전인 회원의 모든 데이터 조회
SELECT *
FROM usertbl
WHERE mDate >= '2008-01-01' AND mDate <= '2010-12-31'
ORDER BY mDate;

-- usertbl 테이블에서 1970년 이후에 출생했거나, 
-- 키가 182 이상인 회원의 아이디와 이름 조회
SELECT `userid`, 
       `name`
FROM usertbl
WHERE birthYear >= 1970 OR height >= 182;

-- employee 테이블에서 부서 코드가 D5이거나,
-- 급여가 500만원 이상인 직원들의 직원명, 부서 코드, 급여 조회
SELECT emp_name, 
 		 dept_code, 
		 salary
FROM employee
WHERE dept_code = 'D5' OR salary >= 5000000;

-- BETWEEN AND 연산자 실습
-- usertbl 테이블에서 키가 170 이상 182 이하인 회원의 모든 데이터 조회
SELECT * 
FROM usertbl
WHERE height BETWEEN 170 AND 182
-- WHERE height NOT BETWEEN 170 AND 182
-- WHERE NOT height BETWEEN 170 AND 182
ORDER BY height;

-- usertbl 테이블에서 가입일이 2008년 1월 1일 이후에서 
-- 2010년 12월 31일 이전인 회원의 모든 데이터 조회
SELECT * 
FROM usertbl
WHERE mDate BETWEEN '2008-01-01' AND '2010-12-31'
ORDER BY mDate; 

-- IN 연산자 실습
-- usertbl 테이블에서 주소가 경남, 경북, 전남인 회원의 이름, 주소 조회
SELECT `name`,
		 `addr`
FROM usertbl
-- WHERE addr = '경남' OR addr = '경북' OR addr = '전남';
WHERE addr IN ('경남', '경북', '전남');
-- WHERE addr NOT IN ('경남', '경북', '전남');
-- WHERE NOT addr IN ('경남', '경북', '전남');

-- LIKE 연산자 실습
-- usertbl 테이블에서 성이 김 씨인 회원의 모든 데이터 조회
SELECT *
FROM usertbl
-- WHERE `name` LIKE '김__';
WHERE `name` LIKE '김%';
-- WHERE `name` NOT LIKE '김%';
-- WHERE NOT `name` LIKE '김%';

-- 실습 문제
-- employee 테이블에서 급여가 350만원 이상 600만원 이하를 받는 
-- 직원의 사번, 직원명, 부서 코드, 급여 조회 (BETWEEN AND)
SELECT emp_id AS '사번',
		 emp_name AS '이름',
		 dept_code AS '부서 코드',
		 salary AS '급여'
FROM employee
WHERE salary BETWEEN 3500000 AND 6000000
ORDER BY salary;

-- employee 테이블에서 입사일이 '1990-01-01' ~ '2001-01-01'인 사원의 모든 컬럼 조회
SELECT *
FROM employee
WHERE hire_date >= '1990-01-01' AND hire_date <= '2001-01-01'
ORDER BY hire_date;

-- employee 테이블에서 전화번호 처음 3자리가 010이 아닌 사원의 이름, 전화번호 조회
SELECT emp_name, 
		 IFNULL(phone, '번호없음')
FROM employee
WHERE IFNULL(phone, '번호없음') NOT LIKE '010%';

-- employee 테이블에서 이름 중에 '하'가 포함된 
-- 사원의 직원명, 주민번호, 부서 코드 조회
SELECT emp_name,
		 emp_no,
		 dept_code
FROM employee
WHERE emp_name LIKE '%하%';

-- employee 테이블에서 이메일 중 _ 앞 글자가 3자리인 주소를 가진 사원의 사번, 직원명, 이메일 조회 
SELECT emp_no,
       emp_name,
       email
FROM employee
-- WHERE email LIKE '___\_%';
WHERE email LIKE '___$_%' ESCAPE '$';

-- ORDER BY 실습
-- usertbl 테이블에서 mDate으로 오름차순 / 내림차순 정렬
SELECT `userid`,
		 `name`,
		 `mDate`
FROM usertbl
-- ORDER BY mDate;
-- ORDER BY mDate ASC;
ORDER BY mDate DESC;
-- LIMIT 3;

-- usertbl 테이블에서 addr으로 오름차순 정렬
-- 단, addr 일치할 경우 mDate를 가지고 내림차순 정렬
SELECT `userid`,
		 `name`,
		 `addr`,
		 `mDate`
FROM usertbl
-- ORDER BY addr, mDate DESC;
ORDER BY addr ASC, mDate DESC;

-- usertbl 테이블에서 아이디, 이름, 가입일 조회
-- 단, 이름으로 내림차순 조회
SELECT `userid` AS '아이디',
		 `name` AS '이름',
		 `mDate` AS '가입일'
FROM usertbl
-- ORDER BY `name` DESC; -- 열의 이름
-- ORDER BY 2 DESC; -- 열의 순번
-- ORDER BY 이름 DESC; -- 열의 별칭
ORDER BY `이름` DESC;

-- GROUP BY 실습
-- 중복 제거와 그룹으로 묶는 것은 다르다.
SELECT DISTINCT addr, COUNT(*)
FROM usertbl;

SELECT addr, COUNT(*)
FROM usertbl
GROUP BY addr;

-- employee 테이블에서 전체 사원의 급여의 합계 조회
SELECT SUM(salary)
FROM employee;

-- employee 테이블에서 부서별 급여의 합계 조회 (부서별 오름차순으로 정렬)
SELECT dept_code,
		 SUM(salary)
FROM employee
GROUP BY dept_code
ORDER BY dept_code;

-- buytbl 테이블에서 사용자 별로 구매한 개수의 합계를 조회
SELECT userid,
       SUM(amount),
       -- 사용자별 구매 금액의 총합
       SUM(price * amount)
FROM buytbl
GROUP BY userid;

-- buytbl 테이블에서 전체 구매자가 구매한 물품 개수의 평균
SELECT AVG(amount)
FROM buytbl;

-- buytbl 테이블에서 사용자별 평균 구매 개수
SELECT userid,
		 AVG(amount)
FROM buytbl
GROUP BY userid;

-- usertbl 테이블에서 가장 작은 키와 큰 키 조회
SELECT MIN(height),
		 MAX(height)
FROM usertbl;

-- usertbl 테이블에서 조회된 전체 행의 개수를 출력
SELECT COUNT(*)
FROM usertbl;

-- usertbl 테이블에서 휴대폰이 있는 회원의 수 출력
SELECT COUNT(*)
FROM usertbl
WHERE mobile1 IS NOT NULL;

-- mobile1 열에 값이 있는 행만 카운트한다.
-- 즉, mobile1 열에 NULL 값인 것은 제외하고 카운트한다.
SELECT COUNT(mobile1)
FROM usertbl;

-- 참고
-- mobile1 열에 중복된 값은 한 번만 카운트한다.
SELECT COUNT(DISTINCT mobile1)
FROM usertbl;

-- 실습 문제
-- employee 테이블에서 부서 코드가 D5인 사원들의 총 연봉의 합계를 조회
-- 윤동기님
SELECT SUM(salary) * 12
FROM employee
WHERE dept_code = 'd5'
;

-- employee 테이블의 전체 사원의 급여 평균 조회
-- 김민수님
SELECT FLOOR(AVG(IFNULL(salary, 0)))
FROM employees_db.employee;

-- employee 테이블에서 퇴사한 직원의 수를 조회 (ENT_DATE가 NULL인 경우 개수를 세지않는다.)
-- 최정필님
SELECT COUNT(*)
FROM employee
WHERE ent_date IS NOT NULL;

-- employee 테이블에서 직급별 급여의 합계를 조회 (직급별 내림차순 정렬)
-- 안진기님
SELECT job_code AS '직급',
       SUM(salary) AS '합계'
FROM employee
GROUP BY job_code 
ORDER BY job_code DESC;

-- employee 테이블에서 부서별 사원의 수를 조회
-- 손혜원님
SELECT IFNULL(dept_code, '부서 없음'), COUNT(*)
FROM employee
GROUP BY dept_code;

-- employee 테이블에서 부서별 사원의 수, 보너스를 받는 사원의 수, 급여의 합, 평균 급여, 최고 급여, 최저 급여를 조회 (부서별 내림차순)
-- 임성민님
SELECT IFNULL(dept_code, '정보없음') AS '부서 코드',
       COUNT(emp_id) AS '부서별 사원 수',
       COUNT(bonus) AS '보너스 받는 사람의 수',
       SUM(salary) AS '급여의 합',
       round(AVG(salary)) AS '평균 급여',
       MIN(salary) AS '최대 급여',
       MAX(salary) AS '최소 급여'
FROM employee
GROUP BY dept_code
ORDER BY dept_code DESC;

-- employee 테이블에서 부서 코드와 직급 코드가 같은 사원의 사원의 수, 급여의 합을 조회
-- 최정우님
SELECT dept_code, 
		 job_code, 
		 COUNT(*) AS 사원수, 
		 SUM(salary) AS 급여합
FROM employee
GROUP BY dept_code, job_code;

-- buytbl 테이블에서 총 구매 금액이 1000 이상인 회원의 아이디, 구매 금액 조회
SELECT userid AS '아이디',
	    SUM(price * amount) AS '총 구매 금액'
FROM buytbl
-- 집계 함수의 결과를 WHERE 절에서 조건으로 사용할 수 없다.
-- WHERE SUM(price * amount) >= 1000
-- HAVING 절은 반드시 GROUP BY 절 다음에 작성해야 한다.
-- HAVING SUM(price * amount) >= 1000
GROUP BY userid
HAVING SUM(price * amount) >= 1000
ORDER BY `총 구매 금액`;

-- buytbl 테이블에서 사용자별 구매 평균 개수가 3개 이상인
-- 회원의 아이디, 평균 구매 개수 조회
SELECT userid,
		 AVG(amount)
FROM buytbl
GROUP BY userid
HAVING AVG(amount) >= 3;

/*
SELECT 구문의 실행 순서
	5: SELECT
	1: FROM
	2: WHERE
	3: GROUP BY
	4: HAVING
	6: ORDER BY 
	7: LIMIT
*/

-- 실습 문제
-- employee 테이블에서 부서별로 급여가 300만원 이상인 직원의 평균 급여를 조회
-- 조용주님
SELECT dept_code AS 부서, 
		 AVG(salary) AS 평균급여 
FROM employee 
WHERE salary >= 3000000 
GROUP BY dept_code;

-- employee 테이블에서 부서별 평균 급여가 300만원 이상인 부서의 부서 코드, 평균 급여를 조회
-- 송명주님
SELECT A.dept_code AS '부서코드', 
      FLOOR(AVG(A.salary)) AS'부서 평균 급여' 
FROM employees_db.employee  A
GROUP BY A.dept_code
HAVING AVG(A.salary) >= 3000000
;

-- employee 테이블에서 직급별 총 급여의 합이 10,000,000 이상인 직급만 조회
-- 박종원님
SELECT job_code, SUM(salary)
FROM employee
GROUP BY job_code
HAVING SUM(salary) >= 10000000;

-- employee 테이블에서 부서별 보너스를 받는 사원이 없는 부서만 조회
-- 전하윤님
SELECT dept_code AS '보너스를 받는 사원이 없는 부서',
       COUNT(bonus)
FROM employee
GROUP BY dept_code
HAVING COUNT(bonus) = 0;