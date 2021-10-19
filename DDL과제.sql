-- 1. 다음 모델링을 동일하게 수행하시오 모델링을 기반으로 DDL을 생성하고 테이블을 생성하시오.
DROP TABLE LECTURE;
DROP TABLE STUDENT;
DROP TABLE PROFESSOR;

CREATE TABLE PROFESSOR(
    PROFESSOR_NO    VARCHAR2(5 BYTE) NOT NULL,
    PROFESSOR_NAME  VARCHAR2(30 BYTE),
    PROFESSOR_MAJOR VARCHAR2(30 BYTE));
    
    

CREATE TABLE STUDENT(
    STUDENT_NO      VARCHAR2(6 BYTE) NOT NULL,
    STUDENT_NAME    VARCHAR2(30 BYTE) NOT NULL,
    STUDENT_ADDRESS VARCHAR2(100 BYTE),
    STUDENT_GRADE   NUMBER(1),
    PROFESSOR_NO    VARCHAR2(5 BYTE) NOT NULL);
    
CREATE TABLE LECTURE(
    LECTURE_NO      VARCHAR2(5 BYTE) NOT NULL,
    LECTURE_NAME    VARCHAR2(30 BYTE) NOT NULL,
    LECTURE_LAB     VARCHAR2(30 BYTE),
    PROFESSOR_NO    VARCHAR2(5 BYTE) NOT NULL);
    
ALTER TABLE PROFESSOR ADD CONSTRAINT PROFESSOR_PK PRIMARY KEY(PROFESSOR_NO);
ALTER TABLE STUDENT ADD CONSTRAINT STUDENT_PK PRIMARY KEY(STUDENT_NO);
ALTER TABLE STUDENT ADD CONSTRAINT STUDENT_PROFESSOR_FK FOREIGN KEY(PROFESSOR_NO) REFERENCES PROFESSOR(PROFESSOR_NO);
ALTER TABLE LECTURE ADD CONSTRAINT LECTURE_PK PRIMARY KEY(LECTURE_NO);
ALTER TABLE LECTURE ADD CONSTRAINT LECTURE_PROFESSOR_FK FOREIGN KEY(PROFESSOR_NO) REFERENCES PROFESSOR(PROFESSOR_NO);


--2. 다음과 같이 각 테이블에 데이터를 INSERT하고 커밋하시오.

INSERT INTO professor(professor_no, professor_name, professor_major) VALUES('P1000', '제임스', '개발');
INSERT INTO professor(professor_no, professor_name, professor_major) VALUES('P2000', '앨리스', '네트워크');
INSERT INTO professor(professor_no, professor_name, professor_major) VALUES('P3000', '스미스', '보안');

COMMIT;

INSERT INTO student(student_no, student_name, student_address, student_grade, professor_no) VALUES ('S10000', '몬데시', '서울', 1, 'P1000');
INSERT INTO student(student_no, student_name, student_address, student_grade, professor_no) VALUES ('S20000', '제시카', '경기', 1, 'P1000');
INSERT INTO student(student_no, student_name, student_address, student_grade, professor_no) VALUES ('S30000', '카를로스', '인천', 2, 'P2000');
INSERT INTO student(student_no, student_name, student_address, student_grade, professor_no) VALUES ('S40000', '로만', '대구', 2, 'P2000');
INSERT INTO student(student_no, student_name, student_address, student_grade, professor_no) VALUES ('S50000', '알베르토', '부산', 3, 'P3000');
INSERT INTO student(student_no, student_name, student_address, student_grade, professor_no) VALUES ('S60000', '트럼프', '제주', 3, 'P3000');

COMMIT;

INSERT INTO lecture(lecture_no, lecture_name, lecture_lab, professor_no) VALUES('L1000', 'LAP101', '자바완전정복', 'P1000');
INSERT INTO lecture(lecture_no, lecture_name, lecture_lab, professor_no) VALUES('L2000', 'LAP102', '시스코', 'P2000');
INSERT INTO lecture(lecture_no, lecture_name, lecture_lab, professor_no) VALUES('L3000', 'LAP103', '모의해킹', 'P3000');

COMMIT;


-- 3. 2학년들의 학번, 성명, 주소를  조회하시오.

SELECT student_no,
       student_name,
       student_address
  FROM student
 WHERE student_grade = 2;
 
 
--4. 가장 높은 학년의 학번, 성명, 주소를 조회하시오

SELECT student_no,
       student_name,
       student_address
  FROM student
 WHERE student_grade = (SELECT MAX(student_grade)
                          FROM student);
                          
--5. 모든 교수들의 교수명, 전공, 강좌명을 조회하시오
SELECT p. professor_name,
       p.professor_major,
       l.lecture_name
  FROM professor p INNER JOIN lecture l
    ON p.professor_no = l.professor_no;
                          
                          

-- 6. 교수별 학생수를 조회하시오 칼럼마다 별명을 지정하고, 교수명의 오름차순으로 조회하시오. 
SELECT p.professor_name AS 교수명, COUNT(s.professor_no) AS 학생수
  FROM professor p INNER JOIN student s
    ON p.professor_no = s.professor_no
 GROUP BY p.professor_name, s.professor_no
 ORDER BY p.professor_name;
    

  
--7.  모든 학생들이 듣고 있는 강좌명과 학생명을 조회하시오.

SELECT lecture_name,
       student_name
  FROM student s INNER JOIN lecture l
    ON s.professor_no = l.professor_no;
    
    























