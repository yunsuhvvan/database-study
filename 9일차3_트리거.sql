SET SERVEROUTPUT ON;

-- 트리거
-- TRIGGER 
-- 1. DML (INSERT , UPDATE , DELETE) 작업을 수행하면 자동으로 실행되는 작업이다.
-- 2. DML 작업 수행 직전에 실행되는 BEFORE TRIGGER 가 있다.
-- 3. DML 작업 수행 직후에 실행되는 AFTER TRIGGER가 있다.


-- TRIG 1 생성
CREATE OR REPLACE TRIGGER TRIG1


    AFTER   -- BEFORE OR AFTER
    INSERT OR UPDATE OR DELETE  -- 트리거가 동작할 DML 선택
    ON ORDERS -- TRIG1 이 동작할 테이블 
    FOR EACH ROW -- 행마다 적용
    

BEGIN
    DBMS_OUTPUT.PUT_LINE('TRIG1이 동작하였다');


END TRIG1;


-- TRIG1 동작확인
INSERT INTO ORDERS(ORDER_ID, CUSTOMER_ID, BOOK_ID, SALES_PRICE, ORDER_DATE) VALUES (ORDERS_SEQ.NEXTVAL, 10000003, 1008, 7000, SYSDATE);



--TRIG2 생성
CREATE OR REPLACE TRIGGER TRIG2


    AFTER
    INSERT OR UPDATE OR DELETE
    ON ORDERS
    FOR EACH ROW


BEGIN

    IF INSERTING THEN
        DBMS_OUTPUT.PUT_LINE('AFTER INSERT');
    ELSIF UPDATING THEN
        DBMS_OUTPUT.PUT_LINE('AFTER UPDATE');
    ELSIF DELETING THEN
        DBMS_OUTPUT.PUT_LINE('AFTER DELETE');
    END IF;
    
    
    
    
    
    
    
    

END TRIG2;

--TRIG2 동작확인
INSERT INTO ORDERS(ORDER_ID, CUSTOMER_ID, BOOK_ID, SALES_PRICE, ORDER_DATE) VALUES (ORDERS_SEQ.NEXTVAL, 10000003, 1008, 7000, SYSDATE);
UPDATE ORDERS SET SALES_PRICE = 6300 WHERE ORDER_ID = 100000;
DELETE FROM ORDERS WHERE ORDER_ID =100010;
