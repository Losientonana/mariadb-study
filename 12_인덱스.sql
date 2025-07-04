-- 인덱스 실습
SELECT * FROM employees;
EXPLAIN SELECT * FROM employees;

SELECT * FROM employees WHERE emp_no = 457485;
EXPLAIN SELECT * FROM employees WHERE emp_no = 457485;

-- 인덱스 생성(보조 인덱스)
CREATE INDEX idx_employees_first_name ON employees(first_name);

ANALYZE TABLE employees;

SELECT * FROM employees WHERE first_name = 'moon';
EXPLAIN SELECT * FROM employees WHERE first_name = 'moon';

-- 인덱스 생성(여러 개의 열을 묶어서 인덱스 생성)
CREATE INDEX idx_employees_first_name_last_name 
ON employees(first_name, last_name);

ANALYZE TABLE employees;

SELECT * FROM employees WHERE first_name = 'moon' AND last_name = 'Yetto';
EXPLAIN SELECT * FROM employees WHERE first_name = 'moon' AND last_name = 'Yetto';

-- 인덱스 삭제
DROP INDEX idx_employees_first_name ON employees;
DROP INDEX idx_employees_first_name_last_name ON employees;

-- 인덱스를 사용하지 않는 경우
SELECT * FROM employees;
EXPLAIN SELECT * FROM employees;

SELECT * FROM employees WHERE emp_no < 400000;
EXPLAIN SELECT * FROM employees WHERE emp_no < 400000;

SELECT * FROM employees WHERE emp_no = 100000;
EXPLAIN SELECT * FROM employees WHERE emp_no * 1 = 100000;
EXPLAIN SELECT * FROM employees WHERE emp_no / 1 = 100000;

ALTER TABLE employees ADD INDEX idx_employees_gender(gender);
ANALYZE TABLE employees;

SELECT * FROM employees WHERE gender = 'M';
EXPLAIN SELECT * FROM employees WHERE gender = 'M';

ALTER TABLE employees DROP INDEX idx_employees_gender;