-- tbl_member 테이블 관련 삭제 명령어
DROP TABLE tbl_member;

-- tbl_member 테이블 생성
CREATE TABLE tbl_member(
    id VARCHAR2(20) PRIMARY KEY,
    password VARCHAR2(200) NOT NULL,
    name VARCHAR2(20) NOT NULL,
    email VARCHAR2(50) NOT NULL
);

INSERT INTO tbl_member
VALUES('test', '1234', '보노보노', 'bonobono@my-duck.site');

COMMIT;

SELECT * FROM tbl_member;