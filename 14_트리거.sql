-- 트리거 실습
-- 상품 입/출고 관리 예시

-- 1. 상품에 대한 데이터를 보관할 테이블 생성
CREATE TABLE product(
	pcode INT AUTO_INCREMENT PRIMARY KEY, -- 상품 코드
	pname VARCHAR(100),                   -- 상품 이름
	brand VARCHAR(100),                   -- 브랜드 이름
	price INT,                            -- 가격
	stock INT DEFAULT 0                   -- 재고
);

INSERT INTO product(pname, brand, price)
VALUES ('아이폰 15 프로', '애플', 1200000);

INSERT INTO product(pname, brand, price)
VALUES ('갤럭시 S25', '삼성', 1300000);

-- 2. 상품 입/출고 상세 이력을 보관할 테이블 생성
CREATE TABLE product_detail(
	`dcode` INT AUTO_INCREMENT PRIMARY KEY,                  -- 입/출고 이력 코드 
	`status` VARCHAR(2) CHECK(`status` IN ('입고', '출고')), -- 상태
	`amount` INT,															-- 수량
	`pcode` INT REFERENCES product,									-- 상품 코드(외래 키)
	`ddate` DATE DEFAULT CURDATE()									-- 입/출고 일자
);

-- 1번 상품이 2025-06-30 날짜로 10개 입고
INSERT INTO product_detail (`status`, `amount`, `pcode`, `ddate`)
VALUES ('입고', 10, 1, '2025-06-30');

-- 1번 상품의 재고 수량 변경
UPDATE product
SET stock = stock + 10
WHERE pcode = 1;

-- 1번 상품이 2025-06-30 날짜로 5개 출고
INSERT INTO product_detail(`status`, `amount`, `pcode`, `ddate`)
VALUES ('출고', 5, 1, '2025-06-30');

-- 1번 상품의 재고 수량 변경
UPDATE product
SET stock = stock - 5
WHERE pcode = 1;

-- 2번 상품이 2025-06-30 날짜로 20개 입고
INSERT INTO product_detail (`status`, `amount`, `pcode`, `ddate`)
VALUES ('입고', 20, 2, '2025-06-30');

-- 2번 상품의 재고 수량 변경
UPDATE product
SET stock = stock + 20
WHERE pcode = 2;

-- product_detail 테이블에 데이터를 입력 시
-- product 테이블에 재고 수량이 자동으로 업데이트 되도록 트리거 생성
DELIMITER $$ 
CREATE OR REPLACE TRIGGER trg_product_stock
AFTER INSERT ON product_detail
FOR EACH ROW
BEGIN
	-- 상품이 입고된 경우 (재고 증가)
	IF	NEW.status = '입고' THEN
		UPDATE product
		SET stock = stock + NEW.amount
		WHERE pcode = NEW.pcode;
	END IF;
	
	-- 상품이 출고된 경우 (재고 감소)
	IF NEW.status = '출고' THEN
		UPDATE product
		SET stock = stock - NEW.amount
		WHERE pcode = NEW.pcode;
	END IF;
END$$
DELIMITER ;

-- 2번 상품이 2025-07-01 날짜로 20개 입고
INSERT INTO product_detail (`status`, `amount`, `pcode`, `ddate`)
VALUES ('입고', 20, 2, '2025-07-01');

-- 2번 상품이 2025-07-01 날짜로 30개 출고
INSERT INTO product_detail (`status`, `amount`, `pcode`, `ddate`)
VALUES ('출고', 30, 2, '2025-07-01');

-- 1번 상품이 오늘 날짜로 100개 입고
INSERT INTO product_detail (`status`, `amount`, `pcode`)
VALUES ('입고', 100, 1);

SELECT * FROM product;
SELECT * FROM product_detail;

-- 트리거 삭제
DROP TRIGGER trg_product_stock;