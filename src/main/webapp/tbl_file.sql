-- tbl_file 테이블 관련 삭제 명령어
DROP TABLE tbl_file;

-- tbl_file 테이블 생성
CREATE TABLE tbl_file(
    boardNum NUMBER,
    filePath VARCHAR2(1000) NOT NULL,
    fileName VARCHAR2(1000) NOT NULL
);

-- 커밋
COMMIT;

-- 조회
SELECT * FROM tbl_file;