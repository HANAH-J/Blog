-- blogCommentTbl 테이블 관련 삭제 명령어
DROP TABLE blogCommentTbl;
DROP SEQUENCE blogCommentTbl_seq;

-- blogCommentTbl 테이블 생성
CREATE TABLE blogCommentTbl(
    commentNum NUMBER NOT NULL,
    boardNum NUMBER NOT NULL,
    commentWriter VARCHAR2(20) NOT NULL,
    commentContent VARCHAR2(1000) NOT NULL,
    commentDate VARCHAR2(20) NOT NULL
);

-- blogCommentTbl_seq 시퀀스 생성
CREATE SEQUENCE blogCommentTbl_seq
NOCACHE;

-- 샘플 데이터 삽입
INSERT INTO blogCommentTbl
VALUES(blogCommentTbl_seq.nextval, 5, '뽀로로', '첫 번째 댓글', TO_CHAR(SYSDATE, 'YYYY/MM/DD HH24:MI:SS'));
INSERT INTO blogCommentTbl
VALUES(blogCommentTbl_seq.nextval, 5, '루피', '두 번째 댓글', TO_CHAR(SYSDATE, 'YYYY/MM/DD HH24:MI:SS'));

-- 커밋
COMMIT;

-- 조회
SELECT * FROM blogCommentTbl;