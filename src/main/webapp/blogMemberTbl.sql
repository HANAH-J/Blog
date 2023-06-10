-- blogMemberTbl 테이블 관련 삭제 명령어
DROP TABLE blogMemberTbl;

-- blogMemberTbl 테이블 생성
CREATE TABLE blogMemberTbl(
    id VARCHAR2(20) PRIMARY KEY,
    password VARCHAR2(200) NOT NULL,
    name VARCHAR2(20) NOT NULL,
    birthday NUMBER(8) NOT NULL,
    email VARCHAR2(20) NOT NULL,
    phone NUMBER(11) NOT NULL
);

INSERT INTO blogMemberTbl
VALUES('test', '1234', '보노보노', 20031127, 'bonobono@naver.com', 01012345678);

COMMIT;

SELECT * FROM blogMemberTbl;