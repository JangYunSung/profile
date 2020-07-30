/* Drop Tables */

DROP TABLE board CASCADE CONSTRAINTS;
DROP TABLE phone CASCADE CONSTRAINTS;
DROP TABLE memberr CASCADE CONSTRAINTS;

CREATE SEQUENCE board_seq START WITH 1 INCREMENT BY 1;
DROP sequence board_seq;
CREATE SEQUENCE phone_seq START WITH 1 INCREMENT BY 1;
DROP sequence phone_seq;

/* Create Tables */

CREATE TABLE board
(
	idx number NOT NULL,
	userid varchar2(30) NOT NULL,
	title varchar2(30) NOT NULL,
	content varchar2(300) NOT NULL,
	post_date date default sysdate,
	PRIMARY KEY (idx)
);


CREATE TABLE memberr
(
	userid varchar2(30) NOT NULL,
	userpw varchar2(40) NOT NULL,
	useremail varchar2(50) NOT NULL,
	username varchar2(40) NOT NULL,
	usernum1 varchar2(30) NOT NULL,
	usernum2 varchar2(30) NOT NULL,
	join_date date default sysdate,
	PRIMARY KEY (userid)
);


CREATE TABLE phone
(
	idx number NOT NULL,
	userid varchar2(30) NOT NULL,
	phonenum varchar2(100) NOT NULL,
	name varchar2(60) NOT NULL,
	email varchar2(100),
	memo varchar2(200),
	PRIMARY KEY (idx)
);



/* Create Foreign Keys */

ALTER TABLE board
	ADD FOREIGN KEY (userid)
	REFERENCES memberr (userid) ON DELETE CASCADE;



ALTER TABLE phone
	ADD FOREIGN KEY (userid)
	REFERENCES memberr (userid) ON DELETE CASCADE;




SELECT COUNT(*) FROM  PHONE  ;


SELECT COUNT( *) FROM (SELECT ROWNUM RN, A.* FROM (SELECT * FROM PHONE a ORDER BY idx DESC) A , MEMBERR m WHERE m.userid = a.userid)
WHERE (RN BETWEEN 1 AND 10) AND (USERID = 'admin') ;  


SELECT * FROM  PHONE  WHERE USERID = 'admin';

