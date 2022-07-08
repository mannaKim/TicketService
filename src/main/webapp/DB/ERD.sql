
/* Drop Tables */

DROP TABLE address CASCADE CONSTRAINTS;
DROP TABLE goods_cart CASCADE CONSTRAINTS;
DROP TABLE goods_order_detail CASCADE CONSTRAINTS;
DROP TABLE goods CASCADE CONSTRAINTS;
DROP TABLE goods_orders CASCADE CONSTRAINTS;
DROP TABLE mem CASCADE CONSTRAINTS;
DROP TABLE worker CASCADE CONSTRAINTS;




/* Create Tables */

CREATE TABLE address
(
	zip_num varchar2(7) NOT NULL,
	sido varchar2(30) NOT NULL,
	gugun varchar2(30) NOT NULL,
	dong varchar2(100) NOT NULL,
	zip_code varchar2(30),
	bunji varchar2(30)
);


CREATE TABLE goods
(
	-- goods_sequance로 값을 설정하는 goods테이블의 기본키
	gseq number(10) NOT NULL,
	name varchar2(100) NOT NULL,
	-- goods 카테고리
	kind char(1) NOT NULL,
	-- goods의 원가
	price1 number(10),
	-- goods의 판매가
	price2 number(10),
	-- goods의 마진(price2-price1)
	price3 number(10),
	-- goods 상세 설명
	content varchar2(1000),
	-- goods의 이미지파일 경로
	image varchar2(255),
	-- goods의 판매여부
	useyn char(1) DEFAULT 'y',
	-- goods의 best상품 여부
	bestyn char(1) DEFAULT 'n',
	-- goods 등록일
	indate date DEFAULT sysdate,
	PRIMARY KEY (gseq)
);


CREATE TABLE goods_cart
(
	g_cseq number(10) NOT NULL,
	quantity number(5) DEFAULT 1,
	-- 장바구니 처리상태('1':미처리, '0':처리완료)
	result char(1) DEFAULT '1',
	indate date DEFAULT SYSDATE,
	id varchar2(20) NOT NULL,
	-- goods_sequance로 값을 설정하는 goods테이블의 기본키
	gseq number(10) NOT NULL,
	PRIMARY KEY (g_cseq)
);


CREATE TABLE goods_orders
(
	-- goods의 order를 저장하는 테이블
	g_oseq number(10) NOT NULL,
	indate date DEFAULT SYSDATE,
	id varchar2(20) NOT NULL,
	PRIMARY KEY (g_oseq)
);


CREATE TABLE goods_order_detail
(
	g_odseq number(10) NOT NULL,
	quantity number(5) DEFAULT 1,
	-- order 처리상태('1':미처리, '0':처리완료)
	result char(1) DEFAULT '1',
	-- goods의 order를 저장하는 테이블
	g_oseq number(10) NOT NULL,
	-- goods_sequance로 값을 설정하는 goods테이블의 기본키
	gseq number(10) NOT NULL,
	PRIMARY KEY (g_odseq)
);


CREATE TABLE mem
(
	id varchar2(20) NOT NULL,
	pwd varchar2(20) NOT NULL,
	name varchar2(20) NOT NULL,
	email varchar2(40) NOT NULL,
	-- 우편번호
	zip_code varchar2(10) NOT NULL,
	-- 주소
	address1 varchar2(50) NOT NULL,
	-- 상세 주소
	address2 varchar2(50),
	phone varchar2(20) NOT NULL,
	-- 가입일자
	indate date DEFAULT sysdate,
	PRIMARY KEY (id)
);


CREATE TABLE worker
(
	id varchar2(20) NOT NULL,
	pwd varchar2(20) NOT NULL,
	name varchar2(20) NOT NULL,
	phone varchar2(20) NOT NULL,
	PRIMARY KEY (id)
);



/* Create Foreign Keys */

ALTER TABLE goods_cart
	ADD FOREIGN KEY (gseq)
	REFERENCES goods (gseq)
;


ALTER TABLE goods_order_detail
	ADD FOREIGN KEY (gseq)
	REFERENCES goods (gseq)
;


ALTER TABLE goods_order_detail
	ADD FOREIGN KEY (g_oseq)
	REFERENCES goods_orders (g_oseq)
;


ALTER TABLE goods_cart
	ADD FOREIGN KEY (id)
	REFERENCES mem (id)
;


ALTER TABLE goods_orders
	ADD FOREIGN KEY (id)
	REFERENCES mem (id)
;



/* Comments */

COMMENT ON COLUMN goods.gseq IS 'goods_sequance로 값을 설정하는 goods테이블의 기본키';
COMMENT ON COLUMN goods.kind IS 'goods 카테고리';
COMMENT ON COLUMN goods.price1 IS 'goods의 원가';
COMMENT ON COLUMN goods.price2 IS 'goods의 판매가';
COMMENT ON COLUMN goods.price3 IS 'goods의 마진(price2-price1)';
COMMENT ON COLUMN goods.content IS 'goods 상세 설명';
COMMENT ON COLUMN goods.image IS 'goods의 이미지파일 경로';
COMMENT ON COLUMN goods.useyn IS 'goods의 판매여부';
COMMENT ON COLUMN goods.bestyn IS 'goods의 best상품 여부';
COMMENT ON COLUMN goods.indate IS 'goods 등록일';
COMMENT ON COLUMN goods_cart.result IS '장바구니 처리상태(''1'':미처리, ''0'':처리완료)';
COMMENT ON COLUMN goods_cart.gseq IS 'goods_sequance로 값을 설정하는 goods테이블의 기본키';
COMMENT ON COLUMN goods_orders.g_oseq IS 'goods의 order를 저장하는 테이블';
COMMENT ON COLUMN goods_order_detail.result IS 'order 처리상태(''1'':미처리, ''0'':처리완료)';
COMMENT ON COLUMN goods_order_detail.g_oseq IS 'goods의 order를 저장하는 테이블';
COMMENT ON COLUMN goods_order_detail.gseq IS 'goods_sequance로 값을 설정하는 goods테이블의 기본키';
COMMENT ON COLUMN mem.zip_code IS '우편번호';
COMMENT ON COLUMN mem.address1 IS '주소';
COMMENT ON COLUMN mem.address2 IS '상세 주소';
COMMENT ON COLUMN mem.indate IS '가입일자';



