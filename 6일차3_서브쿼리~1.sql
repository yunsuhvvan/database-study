-- 서브쿼리
-- 1. 메인쿼리에 포함되는 하위쿼리를 의마한다.
-- 2. 서브쿼리가 먼저 실행된다.


-- 단일 행 서브쿼리 (single low subquery)
-- 1. 서브쿼리의 결과 행(row)이 1개인 경우
-- 2. 사용가능 연산자 : = , != ,> , >= , < , <=


-- **** 단일 행 서브쿼리 예시문제***

-- 1. 사원번호가 7369인 사원과 같은 직급을 가진 사원 목록을 조회하시오
-- 서브쿼리 :사원번호 '7369'의 직급 구하기  -PK를 사용함으로써 단일 행 보장
SELECT job
  FROM emp
 WHERE empno = 7369;
 
SELECT *
  FROM emp
 WHERE job = (SELECT job FROM emp WHERE empno = 7369);
 
-- 2. 급여가 가장 높은 사원을 조회하시오 결과: KING 
-- 그룹 함수를 사용함으로써 단일 행 보장
SELECT *
  FROM emp
 WHERE sal = (SELECT MAX(sal) FROM emp);
 
--3. 전체사원의 평균 급여 이상을 받는 사원을 조회하시오.
-- 서브쿼리 : 평균 급여 구하기 결과 : 2077 달러
SELECT *
  FROM emp
 WHERE sal >=(SELECT AVG(sal) FROM emp);
 
 
--4. 부서번호가 20인 부서와 같은 지역에 있는 부서목록을 조회하시오.
--- 서브쿼리 : 부서번호가 20인 부서의 지역 결과 : dallas

SELECT *
  FROM dept
 WHERE loc = (SELECT loc FROM dept WHERE deptno = 20);
 
--5. 평균 근속 개월 이상 근무한 사원들을 조회하시오.
-- 서브쿼리 : 평균 근속 개월 구하기 결과 : 481.9477
-- 근속일  : 오늘 - hire_date
-- 근속개월 : months_between(오늘 , hire_date)

SELECT AVG(MONTHS_BETWEEN(SYSDATE, hiredate))
  FROM emp;
 
SELECT *
  FROM emp
 WHERE MONTHS_BETWEEN(SYSDATE , hiredate) >= (SELECT AVG(MONTHS_BETWEEN(SYSDATE, hiredate))
                                                                                  FROM emp);
 
 
 -- SELECT 절에서 사용하는 단일 행 서브쿼리
 -- 1. 스칼라 서브쿼리 (scalar subquery)
 -- 2. 스칼라 서브쿼리는 단일 행 서브쿼리만 가능하다.
 
 -- 1. 전체 사원의 인원수와 평균 급여를 조회하시오.
 --1) 기본풀이 방식
 SELECT COUNT(*) AS 인원수
      , AVG(sal) AS 평균급여
   FROM emp;
   
--2) 스칼라 서브쿼리
SELECT (SELECT COUNT(*) FROM emp )AS 인원수
     , (SELECT AVG(sal) FROM emp) AS 평균급여
  FROM DUAL;
  
  
-- 2. 'dallas'에서 근무하는 사원들의 사원번호, 사원명,부서명을 조회하시오.
-- 1) 기본풀이 : 내부조인

SELECT d.dname, e.empno, e.ename
  FROM dept d  INNER JOIN emp e 
    ON d.deptno = e.deptno
 WHERE d.loc = 'DALLAS';
 

 
-- 2) 스칼라 서브쿼리
SELECT e.empno , e.ename , (SELECT d.dname FROM dept d WHERE d.deptno = e.deptno AND d.loc = 'DALLAS') AS 부서이름
  FROM emp e;
  
  


 
 
 
 