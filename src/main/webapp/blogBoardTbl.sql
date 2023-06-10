-- blogBoardTbl 테이블 관련 삭제 명령어
DROP TABLE blogBoardTbl;
DROP SEQUENCE blogBoardTbl_seq;

-- blogBoardTbl 테이블 생성
CREATE TABLE blogBoardTbl(
    memberId VARCHAR2(20) NOT NULL,
    boardNum NUMBER PRIMARY KEY,
    boardTitle VARCHAR2(200) NOT NULL,
    boardContent VARCHAR2(2000) NOT NULL,
    readCount NUMBER DEFAULT 0,
    boardDate VARCHAR2(20) NOT NULL
);

-- blogBoardTbl_seq 시퀀스 생성
CREATE SEQUENCE blogBoardTbl_seq
NOCACHE;

-- 샘플 데이터 삽입
INSERT INTO blogBoardTbl
VALUES('test', blogBoardTbl_seq.nextval, '첫 번째 글', '첫 번째 글 내용', 0, TO_CHAR(SYSDATE, 'YYYY/MM/DD HH24:MI:SS'));
INSERT INTO blogBoardTbl
VALUES('test', blogBoardTbl_seq.nextval, '두 번째 글', '두 번째 글 내용', 0, TO_CHAR(SYSDATE, 'YYYY/MM/DD HH24:MI:SS'));
INSERT INTO blogBoardTbl
VALUES('test', blogBoardTbl_seq.nextval, '세 번째 글', '세 번째 글 내용', 0, TO_CHAR(SYSDATE, 'YYYY/MM/DD HH24:MI:SS'));
INSERT INTO blogBoardTbl
VALUES('test', blogBoardTbl_seq.nextval, '네 번째 글', '네 번째 글 내용', 0, TO_CHAR(SYSDATE, 'YYYY/MM/DD HH24:MI:SS'));
INSERT INTO blogBoardTbl
VALUES('test', blogBoardTbl_seq.nextval, '다섯 번째 글', '다섯 번째 글 내용', 0, TO_CHAR(SYSDATE, 'YYYY/MM/DD HH24:MI:SS'));

-- 커밋
COMMIT;

-- 조회
SELECT * FROM blogBoardTbl;