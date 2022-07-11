
drop sequence qna_seq;
create sequence qna_seq start with 1;
drop sequence re_seq;
create sequence re_seq start with 1;

/* Drop Tables */

DROP TABLE qna CASCADE CONSTRAINTS;
DROP TABLE review CASCADE CONSTRAINTS;


/* Create Tables */

CREATE TABLE qna
(
	qseq number(5) NOT NULL,
	-- qna 글번호
	subject varchar2(300) NOT NULL,
	-- qna 제목
	content varchar2(1000) NOT NULL,
	-- qna 내용
	reply varchar2(1000),
	-- (관리자) 댓글
	rep char(1) DEFAULT '1',
	-- 댓글 확인
	indate date DEFAULT SYSDATE,
	-- qna 작성 날짜
	kind char(1) NOT NULL,
	-- qna 카테고리 1 전시 2 회원안내 3 관람/예약 4 굿즈 5 기타
	PRIMARY KEY (qseq)
);


CREATE TABLE review
(
	rseq number(5) NOT NULL,
	-- review 글 번호
	subject varchar2(300) NOT NULL,
	-- review 제목
	content varchar2(1000) NOT NULL,
	-- review 내용
	reply varchar2(1000),
	-- 댓글
	rep char(1) DEFAULT '1',
	-- 댓글 확인
	indate date DEFAULT sysdate,
	-- review 작성 날짜
	kind char(1),
	-- review 카테고리
	image varchar2(255),
	-- review 이미지
	PRIMARY KEY (rseq)
);


/* Comments */

COMMENT ON COLUMN qna.rep IS '댓글 유무 확인';

-- 외래키
ALTER TABLE qna
	ADD FOREIGN KEY (id)
	REFERENCES member (id);

select * from member;

-- Qna 추가
select * from qna;
insert into qna (qseq, kind, subject, content, id) 
values(qna_seq.nextval,'1', '전시 내역 관련 문의입니다', '전시 내역 보내주세요', 'scott');
insert into qna (qseq, kind, subject, content, id) 
values(qna_seq.nextval, '4', '굿즈 환불절차 안내부탁드려요', '환불하고 싶어요', 'scott');
insert into qna (qseq, kind, subject, content, id) 
values(qna_seq.nextval, '4', '굿즈 교환 하고 싶어요', '교환절차 안내부탁드려요', 'scott');
insert into qna (qseq, kind, subject, content, id) 
values(qna_seq.nextval, '2', '비밀번호 변경', '변경 적용이 안됩니다', 'scott');
insert into qna (qseq, kind, subject, content, id) 
values(qna_seq.nextval, '3', '예약 관련', '예약 인원 언제 충원하나요?', 'scott');

-- review 추가
select * from review;
insert into review (rseq, subject, content, id) 
values(re_seq.nextval, '7월 전시', '짱이었어요', 'id');
insert into review (rseq, subject, content, id) 
values(re_seq.nextval, '전시', '재밌게 잘 다녀왔어요', 'id');

