-- tbl_comment 테이블 관련 삭제 명령어
DROP TABLE tbl_comment;
DROP SEQUENCE tbl_comment_seq;

-- tbl_comment 테이블 생성
CREATE TABLE tbl_comment(
    commentNum NUMBER NOT NULL,
    boardNum NUMBER NOT NULL,
    commentWriter VARCHAR2(20) NOT NULL,
    commentContent VARCHAR2(1000) NOT NULL,
    commentDate VARCHAR2(20) NOT NULL
);

-- tbl_comment_seq 시퀀스 생성
CREATE SEQUENCE tbl_comment_seq
NOCACHE;

-- 샘플 데이터 삽입
INSERT INTO tbl_comment
VALUES(tbl_comment_seq.nextval, 5, '뽀로로', '첫 번째 댓글', TO_CHAR(SYSDATE, 'YYYY/MM/DD HH24:MI:SS'));
INSERT INTO tbl_comment
VALUES(tbl_comment_seq.nextval, 5, '루피', '두 번째 댓글', TO_CHAR(SYSDATE, 'YYYY/MM/DD HH24:MI:SS'));

-- 커밋
COMMIT;

-- 조회
SELECT * FROM tbl_comment;