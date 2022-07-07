
/* Drop Tables */

DROP TABLE event CASCADE CONSTRAINTS;
DROP TABLE infomation CASCADE CONSTRAINTS;
DROP TABLE introduce CASCADE CONSTRAINTS;
DROP TABLE notice CASCADE CONSTRAINTS;




/* Create Tables */

CREATE TABLE event
(
	-- 이벤트넘버
	enum number(100) NOT NULL,
	-- 이벤트이미지
	eimage varchar2(255) NOT NULL,
	-- 이벤트제목
	etitle varchar2(500) NOT NULL,
	-- 이벤트기간
	evdate varchar2(200),
	-- 게시글 삭제 비밀번호
	pass varchar2(30),
	-- 당첨자발표날짜
	evperson varchar2(200),
	-- 회원등급(참여대상 1:일반, 2:실버, 3:골드..)
	grade varchar2(100) NOT NULL,
	-- 조회수
	readcount number(4) default 0,
	PRIMARY KEY (enum)
);

insert into event(enum, eimage, etitle, evdate, pass, evperson, geade) 
values(enum_seq.nextVal, 'image.jpg', '이벤트제목', '2022-07-07 ~ 2022-07-08', '1234', '2022-08-01 ~ 2022-08-10', '1');

CREATE TABLE infomation
(
	-- 전시사이트 소개명(select문으로 선택, 1:사이트이용관련, 2:예약사항관련, 3:회원등급정보관련
	intent varchar2(100) NOT NULL,
	-- 제목
	title varchar2(500) NOT NULL,
	-- 올린날짜
	indate date DEFAULT SYSDATE,
	-- 내용
	content varchar2(2000),
	-- 게시글 삭제 비밀번호
	pass varchar2(30),
	-- 조회수
	readcount number(4) default 0,
	PRIMARY KEY (intent)
);

insert into infomation(intent, title, content, pass)
values('1', '소개내용1', '전시소개 내용 입니다.', '1234')

CREATE TABLE introduce
(
	-- 소개게시판 번호
	itnum number(100) NOT NULL,
	-- 제목
	title varchar2(500) NOT NULL,
	-- 내용
	content varchar2(2000),
	-- 게시글 삭제 비밀번호
	pass varchar2(30),
	-- 게시판생성날짜
	indate date DEFAULT SYSDATE,
	-- 조회수
	readcount number(4) default 0,
	PRIMARY KEY (itnum)
);

insert into introduce(itnum, title, content, pass) 
values(itnum_seq.nextVal, '전시소개1', '전시소개1의 내용', '1234');

CREATE TABLE notice
(
	-- 공지게시판 번호
	ntnum number(100) NOT NULL,
	-- 제목
	title varchar2(100) NOT NULL,
	-- 업로드날짜
	indate date DEFAULT SYSDATE,
	-- 내용
	content varchar2(2000),
	-- 게시글 삭제 비밀번호
	pass varchar2(30),
	-- 조회수
	readcount number(4) default 0
	PRIMARY KEY (ntnum)
);

insert into notice(ntnum, title, content, pass)
values (ntnum_seq.nextVal, '공지사항입니다.', '공지내용1', '1234')

/* Sequence */
create sequence ntnum_seq start with 1;
create sequence itnum_seq start with 1;
create sequence enum_seq start with 1;


/* Comments */

COMMENT ON COLUMN event.enum IS '이벤트넘버';
COMMENT ON COLUMN event.eimage IS '이벤트이미지';
COMMENT ON COLUMN event.etitle IS '이벤트제목';
COMMENT ON COLUMN event.evdate IS '이벤트기간';
COMMENT ON COLUMN event.evperson IS '당첨자발표날짜';
COMMENT ON COLUMN event.grade IS '회원등급(참여대상)';
COMMENT ON COLUMN infomation.intent IS '공지명';
COMMENT ON COLUMN infomation.title IS '제목';
COMMENT ON COLUMN infomation.indate IS '올린날짜';
COMMENT ON COLUMN infomation.content IS '내용';
COMMENT ON COLUMN infomation.id IS '아이디';
COMMENT ON COLUMN introduce.itnum IS '소개게시판 번호';
COMMENT ON COLUMN introduce.title IS '제목';
COMMENT ON COLUMN introduce.content IS '내용';
COMMENT ON COLUMN introduce.indate IS '게시판생성날짜';
COMMENT ON COLUMN introduce.id IS '아이디';
COMMENT ON COLUMN notice.ntnum IS '공지게시판 번호';
COMMENT ON COLUMN notice.title IS '제목';
COMMENT ON COLUMN notice.indate IS '업로드날짜';
COMMENT ON COLUMN notice.content IS '내용';
COMMENT ON COLUMN notice.id IS '아이디';



