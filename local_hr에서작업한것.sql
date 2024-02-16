show user;
-- USER이(가) "HR"입니다.

select * from dba_users;
/*
    ORA-00942: 테이블 또는 뷰가 존재하지 않습니다
    00942. 00000 -  "table or view does not exist"
    *Cause:    
    *Action:
    4행, 15열에서 오류 발생
*/
-- dba_users 은 관리자만 조회할 수 있는 것이지 일반 사용자인 hr 은 조회가 불가하다는 말이다. 


-- *** ORACLE 은 관계형 데이터베이스(Relation DataBase) 관리 시스템(Management System) 이다. ***
--     관계형 데이터베이스 관리 시스템을 RDBMS(Relation DataBase Management System) 라고 부른다.
--     관계형 데이터베이스는 데이터를 열(Column, Field) 과 행(Row, Record, tuple) 으로 이루어진 테이블(Table, entity, 개체) 형태로 저장한다.

-- ** 현재 오라클 서버에 접속되어진 사용자(지금은 hr)가 만든 (소유의) 테이블(Table) 목록을 조회해 본다.
select *
from tab;
/*
        TNAME          TABTYPE
   ------------------------------
    COUNTRIES	        TABLE
    DEPARTMENTS	        TABLE
    EMPLOYEES	        TABLE
    EMP_DETAILS_VIEW	VIEW (VIEW 는 테이블은 아니지만 SELECT 되어진 결과물을 마치 테이블인 것 처럼 보는 것)
    JOBS	            TABLE
    JOB_HISTORY	        TABLE
    LOCATIONS	        TABLE
    REGIONS             TABLE
   ------------------------------
*/
select *
from DEPARTMENTS; -- sql 명령어는 대,소문자를 구분하지 않습니다.

SELECT *
FROM DEPARTMENTS; -- sql 명령어는 대,소문자를 구분하지 않습니다.

sEleCt *
FrOm DEPARTMENTS; -- sql 명령어는 대,소문자를 구분하지 않습니다.

select *
from DePArTmentS; -- 테이블명도 대,소문자를 구분하지 않습니다.

select department_id, department_name, manager_id, location_id -- 컬럼명도 대,소문자를 구분하지 않습니다.
from departments;

select DEPARTMENT_ID, DEPARTMENT_NAME, MANAGER_ID, LOCATION_ID -- 컬럼명도 대,소문자를 구분하지 않습니다.
from departments;

select dePARTMENT_id, DEpartMENT_NAME, manaGER_ID, LOcatION_id -- 컬럼명도 대,소문자를 구분하지 않습니다.
from departments;

-- !!! 저장되어진 데이터 값 만큼은 반드시 대,소문자를 구분합니다. !!! --
select *
from departments
where department_name = 'Sales'; -- 결과물이 나온다.

-- !!! 저장되어진 데이터 값 만큼은 반드시 대,소문자를 구분합니다. !!! --
select *
from departments
where department_name = 'SALES'; -- 결과물이 안나온다.

-- !!! 저장되어진 데이터 값 만큼은 반드시 대,소문자를 구분합니다. !!! --
select *
from departments
where department_name = 'sales'; -- 결과물이 안나온다.

-- !!! 저장되어진 데이터 값 만큼은 반드시 대,소문자를 구분합니다. !!! --
select *
from departments
where department_name = 'sAlEs'; -- 결과물이 안나온다.

-------------------------------------------------------------------------------------------------------------------------

/*
    ===== 아주아주아주아주아주아주아주아주아주아주아주아주아주아주아주아주아주아주 중요중요중요중요중요중요중요중요중요중요중요중요중요 !!!!! =====
    >>>>>> !!!!! 필수 암기 !!!!! <<<<<<
    
    ==== 어떠한 테이블(또는 뷰)에서 데이터 정보를 꺼내와 보는 명령어인 select 의 처리(해석, parsing) 순서 ====
    select 컬럼명, 컬럼명   -- 5
    from 테이블명(또는 뷰명) -- 1
    where 조건절           -- 2 where 조건절이 뜻하는 것은 해당 테이블명(또는 뷰명)에서 조건에 만족하는 행(row)을 메모리(RAM)에 로딩(올리는것)해주는 것이다.!!!!
    group by 절           -- 3
    having 그룹함수조건절   -- 4
    order by 절           -- 6
*/

select *
from departments; -- "부서" 테이블

select department_id, department_name
from departments;

describe departments; -- departments 테이블의 컬럼(column)의 정보를 알려주는 것이다.
-- 또는
desc departments;

/*
          이름                     널?                                                                                   유형           
    ---------------            --------                                                                              ------------ 
    DEPARTMENT_ID   (부서번호)   NOT NULL ==> NOT NULL 은 반드시 데이터를 입력해야 한다는 뜻이다.                            NUMBER(4)    ==> 숫자 타입 -9999 ~ 9999
    DEPARTMENT_NAME (부서명)    NOT NULL                                                                              VARCHAR2(30)  ==> 문자열타입 최대 30byte 까지만 입력가능함. 
    MANAGER_ID      (부서장의 사원번호)    ==> 없는 것이나 NULL 은 같은 것인데 데이터를 입력하든 하지 않든 모두 허용한다는 뜻이다. NUMBER(6)   ==> 숫자 타입 -999999 ~ 999999 
    LOCATION_ID     (부서위치ID)          ==> 없는 것이나 NULL 은 같은 것인데 데이터를 입력하든 하지 않든 모두 허용한다는 뜻이다. NUMBER(4)  ==> 숫자 타입 -9999 ~ 9999
*/

select *
from EMPLOYEES; -- "사원" 테이블

desc employees;
/*
         이름                                     널?         유형           
    --------------                            --------   ------------ 
    EMPLOYEE_ID     (사원번호)                  NOT NULL    NUMBER(6)    
    FIRST_NAME      (이름)                                VARCHAR2(20) 
    LAST_NAME       (성)                       NOT NULL  VARCHAR2(25) 
    EMAIL           (이메일)                   NOT NULL   VARCHAR2(25) 
    PHONE_NUMBER    (연락처)                              VARCHAR2(20) 
    HIRE_DATE       (입사일자)                  NOT NULL     DATE -- 날짜타입         
    JOB_ID          (직종ID)                   NOT NULL   VARCHAR2(10) 
    SALARY          (기본급여)                             NUMBER(8,2)  - 999999.99 ~ 999999.99
    COMMISSION_PCT  (커미션(수당)퍼센티지)                   NUMBER(2,2)  - -0.99 ~ 0.99  
    MANAGER_ID      (직속상관(사수)의 사원번호)               NUMBER(6)    
    DEPARTMENT_ID   (해당사원이 근무하는 부서번호)            NUMBER(4)    
*/

select *
from LOCATIONS; -- 부서의 위치정보를 알려주는 테이블

select *
from COUNTRIES; -- 국가정보를 알려주는 테이블

select *
from REGIONS;   -- 대륙정보를 알려주는 테이블

-----------------------------------------------------------------------------------------------------------------------

---- *** NULL 을 처리해주는 함수 *** ----
---- NULL 은 존재하지 않는 것이므로 4칙연산( + - * / )에 NULL이 포함되어지면 그 결과는 무조건 NULL 이 된다.!!!!!

1. NVL
    
    select '안녕하세요', 500, '500', 0075, '0075', null
    from dual;  -- dual 은 select 다음에 나오는 값들을 화면에 보여주기 위한 용도로 쓰이는 가상테이블이다.

    select 1+2, 1+null , 3*0, null*0, 2-1, 2-null, 5/2, 5/null
    from dual;

    select nvl(7, 3), nvl(null,3),
            nvl('이순신','거북선'), nvl(null,'거북선')
    from dual;

2. NVL2

    select nvl2(7, 3, 2), nvl2(null, 3, 2),
            nvl2('이순신', '거북선', '구국영웅'), nvl2(null, '거북선', '구국영웅')
    from dual;

    select employee_id, first_name, last_name, job_id, salary, commission_pct, department_id
    -- 3. 메모리(RAM)에 퍼올려진 행들에서 화면에 보여주는 컬럼은 employee_id, first_name, last_name, job_id, salary, commission_pct, department_id 컬럼의 값들을 화면에 보여라.
    from employees               -- 1. employees 테이블에서
    where department_id = 60;    -- 2. department_id 컬럼의 값이 60과 일치하는 행들만 메모리(RAM)에 퍼올린다.
    
    select *       -- 2. * 이므로 employees 테이블에 존재하는 모든 컬럼들을 화면에 보여라.
    from employees; -- 1. employees 테이블에서 where 절이 없으므로 emplyees 테이블에 저장되어진 모든 행들(107개행)을 메모리(RAM)에 퍼올린다.
    
    select employee_id, first_name, last_name, job_id, salary, commission_pct, department_id
    -- 2. 메모리(RAM)에 퍼올려진 행들에서 화면에 보여주는 컬럼은 employee_id, first_name, last_name, job_id, salary, commission_pct, department_id 컬럼의 값들을 화면에 보여라.
    from employees; -- 1. employees 테이블에서 where 절이 없으므로 emplyees 테이블에 저장되어진 모든 행들(107개행)을 메모리(RAM)에 퍼올린다.
    
    /*
    select employee_id, first_name
    from employees;
    */
    
    -- 월급은 기본급여(salary) + 수당(salary * commission_pct)
    -- commission_pct 컬럼의 값이 null 이라 함은 수당이 없다는 말이고, commission_pct 컬럼의 값이 0.3 이라 함은 자신의 기본급여(salary) * 0.3 이 실제 수당금액이다.
    
    select employee_id, first_name, last_name, salary, commission_pct,
        salary + (salary*commission_pct),
        NVL(salary + (salary * commission_pct), salary),
        NVL2(commission_pct, salary + (salary * commission_pct), salary)
    from employees;
    
    select 2+3*4, 2+(3*4), (2+3)*4
    from dual;
    
    --- *** select 되어져 나온 결과물에서 컬럼에 대한 별칭(별명, alias)을 부여하겠다. *** ---
    select employee_id AS "사원번호"    -- 별칭(별명, alias)
        , first_name "이름"            -- 별칭(별명, alias)에서 AS 는 생략가능함.
        , last_name 성                 -- 별칭(별명, alias)에서 "" 는 생략가능함. 
        , salary "기본 급여"            -- 별칭(별명, alias)에 공백을 주고자 한다라면 반드시 "" 로 해주어야 한다.
        , commission_pct 커미션퍼센티지
        , NVL(salary + (salary * commission_pct), salary) "1월급" -- 별칭(별명, alias)에서 별칭명이 숫자로 시작한다라면 반드시 "" 로 해주어야 한다. 
        , NVL2(commission_pct, salary + (salary * commission_pct), salary) 월급2
    from employees;
    
    
    
    
    
    
    
    ----------- **** 비교연산자 **** -------------------
    /*
    1. 같다                   = 
    2. 같지않다               !=  <>  ^=
    3. 크다. 작다             >   <
    4. 같거나크다. 같거나작다   >=  <=
    5. NULL 은 존재하지 않는 것이므로 비교대상이 될 수가 없다.!!!!!
      그러므로 비교연산( =  !=  <>  ^=  >  <  >=  <= )을 할 수가 없다.
      그래서 비교연산을 하려면 nvl()함수, nvl2()함수를 사용하여 처리한다.!!!!!
    */
    -- 오라클에서 컬럼들을 붙일때(연결할때)는 문자타입이든 숫자타입이든 날짜타입이든 관계없이 || 를 쓰면된다.  
    
    select '대한민국' || '서울시' || 1234 || sysdate
    from dual;
    
    
    
    
    
    
    -- employees 테이블에서 부서번호가 30번에 근무하는 사원들만
    -- 사원번호, 사원명, 월급, 부서번호를 나타내세요.
    select employee_id as "사원번호"
        , first_name || ' ' || last_name as "사원명"
        , nvl(salary + (salary * commission_pct), salary) as "월급"
        , department_id as "부서번호"
    from employees
    where department_id = 30;
    
    -- employees 테이블에서 부서번호가 null 인 사원들만
    -- 사원번호, 사원명, 월급, 부서번호를 나타내세요.
    select employee_id as "사원번호"
        , first_name || ' ' || last_name as "사원명"
        , nvl(salary + (salary * commission_pct), salary) as "월급"
        , department_id as "부서번호"
    from employees
    where department_id = null;
    --> 데이터가 출력되지 않는다.
    -- 왜냐하면 null 은 존재하지 않는 것이므로 비교대상이 될 수가 없기 때문이다.
    
    select employee_id as "사원번호"
        , first_name || ' ' || last_name as "사원명"
        , nvl(salary + (salary * commission_pct), salary) as "월급"
        , department_id as "부서번호"
        , nvl(department_id, -9999) as "부서번호2"  -- 부서번호가 null 이면 -9999 출력
    from employees;
    
    -- 부서가 null 인 사원만 출력하기 
    select employee_id as "사원번호"
        , first_name || ' ' || last_name as "사원명"
        , nvl(salary + (salary * commission_pct), salary) as "월급"
        , department_id as "부서번호"
    from employees
    where nvl(department_id, -9999) = -9999;        -- 부서번호가 null 이면 -9999 가 출력되는데, -9999 인 사원인 경우(조건)
    
    -- 또는
    select employee_id as "사원번호"
        , first_name || ' ' || last_name as "사원명"
        , nvl(salary + (salary * commission_pct), salary) as "월급"
        , department_id as "부서번호"
    from employees
    where department_id is null;    -- null은 is 연산자를 사용하여 구한다.
                                    -- department_id 컬럼의 값이 null 인 행들만 RAM(메모리)에 퍼올리는 것이다.
    
    -- employees 테이블에서 부서번호가 30번이 아닌 사원들만
    -- 사원번호, 사원명, 월급, 부서번호를 나타내세요.
    
    select employee_id as "사원번호"
        , first_name || ' ' || last_name as "사원명"
        , nvl(salary + (salary * commission_pct), salary) as "월급"
        , department_id as "부서번호"
    from employees
    where department_id != 30;      -- 부서번호가 null 인 사원을 제외하고 30을 계산하니 안된다!!(오류)
    -- where department_id <> 30;
    -- where department_id ^= 30;
    
    -- !!!! select 구문을 작성하기 전 반드시 해당 테이블의 구조를 먼저 확인하자.!!!!
    desc employees;
    
    select employee_id as "사원번호"
        , first_name || ' ' || last_name as "사원명"
        , nvl(salary + (salary * commission_pct), salary) as "월급"
        , department_id as "부서번호"
    from employees
    where nvl(department_id,-9999) != 30;   -- 부서번호가 null 을 포함한 30과 동일하지 않은 경우
    
    -- employees 테이블에서 부서번호가 null 이 아닌 사원들만
    -- 사원번호, 사원명, 월급, 부서번호를 나타내세요.
    
    select employee_id as "사원번호"
        , first_name || ' ' || last_name as "사원명"
        , nvl(salary + (salary * commission_pct), salary) as "월급"
        , department_id as "부서번호"
    from employees
    where nvl(department_id,-9999) != -9999;    
    
    -- 또는
    select employee_id as "사원번호"
        , first_name || ' ' || last_name as "사원명"
        , nvl(salary + (salary * commission_pct), salary) as "월급"
        , department_id as "부서번호"
    from employees
    where department_id is not null;    -- null 은 is 연산자를 사용하여 구한다.
    
    -- 또는
    select employee_id as "사원번호"
        , first_name || ' ' || last_name as "사원명"
        , nvl(salary + (salary * commission_pct), salary) as "월급"
        , department_id as "부서번호"
    from employees
    where not department_id is null;    -- null 은 is 연산자를 사용하여 구한다.
 
 
 
 
 
 
    --- *** select 되어져 나온 결과 데이터를 정렬(오름차순정렬, 내림차순정렬)하여 보여주기 *** ---
    
    -- 오름차순
    select employee_id, first_name, last_name, salary, department_id
    from employees
    order by salary asc;    -- salary 컬럼의 값을 기준으로 오름차순 정렬
    
    -- 또는
    select employee_id, first_name, last_name, salary, department_id
    from employees
    order by salary;        -- asc 은 생략 가능하다.
    
    -- 내림차순
    select employee_id, first_name, last_name, salary, department_id
    from employees
    order by salary desc;   -- salary 컬럼의 값을 기준으로 내림차순 정렬
    
    
    
    -- 월급의 오름차순으로 나타내세요.
    select employee_id as "사원번호"
        , first_name || ' ' || last_name as "사원명"
        , nvl(salary + (salary * commission_pct), salary) as "월급"
        , department_id as "부서번호"
    from employees
    order by nvl(salary*commission_pct,salary) asc;

    -- 또는
    select employee_id as "사원번호"
        , first_name || ' ' || last_name as "사원명"
        , nvl(salary + (salary * commission_pct), salary) as "월급"     -- nvl(salary*commission_pct,salary) 와 "월급" 은 같다라는 뜻 => as
        , department_id as "부서번호"
    from employees
    order by "월급" asc;      -- 공백이 없을 경우 "" 을 지워도 되지만 있을경우 반드시 "" 이 필요하다.
    
    -- 또는
    select employee_id as "사원번호"
        , first_name || ' ' || last_name as "사원명"
        , nvl(salary + (salary * commission_pct), salary) as "월급"    
        , department_id as "부서번호"
    from employees
    order by 3 asc;         -- select 되어져 나오는 3번째 순서의 오름차순 정렬
    
    -- 또는
    select employee_id as "사원번호"
        , first_name || ' ' || last_name as "사원명"
        , nvl(salary + (salary * commission_pct), salary) as "월급"    
        , department_id as "부서번호"
    from employees
    order by 3;             -- asc 은 생략가능함.
    
    -- 월급의 내림차순으로 나타내세요.
    select employee_id as "사원번호"
        , first_name || ' ' || last_name as "사원명"
        , nvl(salary + (salary * commission_pct), salary) as "월급"    
        , department_id as "부서번호"
    from employees
    order by 3 desc;
    -- order by "월급" desc;
    -- order by 월급 desc;
    -- order by nvl(salary*commission_pct,salary) desc;
    
    
    -- 정렬(오름차순정렬, 내림차순정렬)을 할때 null 은 존재하지 않는 것이므로
    -- 오라클에서는 정렬시 null 을 가장 큰 것으로 간주를 해주고,
    -- 마이크로소프트사의 MS-SQL 에서는 정렬시 null 을 가장 작은 것으로 간주를 한다. 
    
    -- department_id 컬럼의 값을 기준으로 오름차순 정렬하여 나타내세요.
    select employee_id, first_name, last_name, salary, department_id
    from employees
    order by department_id asc;         -- Oracle 은 null 을 가장 큰 것으로 간주한다.
    
    -- department_id 컬럼의 값을 기준으로 내림차순 정렬하여 나타내세요.
    select employee_id, first_name, last_name, salary, department_id
    from employees
    order by department_id desc;        -- Oracle 은 null 을 가장 큰 것으로 간주한다.
    
    
    
    ------ *** 1차정렬, 2차정렬에 대해서 알아봅니다. *** ------
    
    -- employees 테이블에서 부서번호별 오름차순 정렬을 한 후에 동일한 부서번호내에서는 
    -- 월급의 내림차순으로 정렬하여 사원번호, 사원명, 월급, 부서번호를 나타내세요.
    
    select employee_id as "사원번호"
        , first_name || ' ' || last_name as "사원명"
        , nvl(salary + (salary * commission_pct), salary) as "월급"    
        , department_id as "부서번호"
    from employees
    order by 4 asc, 3 desc;     -- 부서번호 오름차순, 월급 내림차순
        -- 1차정렬, 2차정렬
    
    -- 또는
    select employee_id as "사원번호"
        , first_name || ' ' || last_name as "사원명"
        , nvl(salary + (salary * commission_pct), salary) as "월급"
        , department_id as "부서번호"
    from employees
    order by 4, 3 desc;     -- asc 은 생략 가능함 => 4 asc, 3 desc 와 동일
        -- 1차정렬, 2차정렬
    
    -- employees 테이블에서 수당퍼센티지가 null 인 사원들만 
    -- 사원번호, 사원명, 월급(기본급여+수당금액), 부서번호를 나타내되 
    -- 부서번호의 오름차순으로 정렬한 후 동일한 부서번호내에서는 월급의 내림차순으로 나타내세요.
    select employee_id as "사원번호"
        , first_name || ' ' || last_name as "사원명"
        , nvl(salary + (salary * commission_pct), salary) as "월급(기본급여+수당금액)"    
        , department_id as "부서번호"
    from employees
    where commission_pct is null
    order by 4,3 desc;      -- 부서번호 오름차순, 월급 내림차순
    
    -- employees 테이블에서 수당퍼센티지가 null 이 아닌 사원들만 
    -- 사원번호, 사원명, 월급(기본급여+수당금액), 부서번호를 나타내되 
    -- 부서번호의 오름차순으로 정렬한 후 동일한 부서번호내에서는 월급의 내림차순으로 나타내세요.
    select employee_id as "사원번호"
        , first_name || ' ' || last_name as "사원명"
        , nvl(salary + (salary * commission_pct), salary) as "월급(기본급여+수당금액)"    
        , department_id as "부서번호"
    from employees
    where nvl(commission_pct,-9999) = commission_pct
    order by 4,3 desc;      -- 부서번호 오름차순, 월급 내림차순
    
    -- employees 테이블에서 월급(기본급여+수당금액)이 10000 보다 큰 사원들만 
    -- 사원번호, 사원명, 월급(기본급여+수당금액), 부서번호를 나타내되 
    -- 부서번호의 오름차순으로 정렬한 후 동일한 부서번호내에서는 월급의 내림차순으로 나타내세요.
    select employee_id as "사원번호"
        , first_name || ' ' || last_name as "사원명"
        , nvl(salary + (salary * commission_pct), salary) as "월급(기본급여+수당금액)"    
        , department_id as "부서번호"
    from employees
    where nvl(salary + (salary * commission_pct), salary) > 10000
    order by 4,3 desc;      -- 부서번호 오름차순, 월급 내림차순
    
    -- employees 테이블에서 부서번호가 50번 부서가 아닌 사원들만 
    -- 사원번호, 사원명, 월급(기본급여+수당금액), 부서번호를 나타내되 
    -- 부서번호의 오름차순으로 정렬한 후 동일한 부서번호내에서는 월급의 내림차순으로 나타내세요.
    
    desc employees;     -- 구조 먼저 파악하기
    
    select employee_id as "사원번호"
        , first_name || ' ' || last_name as "사원명"
        , nvl(salary + (salary * commission_pct), salary) as "월급(기본급여+수당금액)"    
        , department_id as "부서번호"
    from employees
    where nvl(department_id,-9999) != 50
    order by 4,3 desc;      -- 부서번호 오름차순, 월급 내림차순
    
    
    
    
    
    --- *** AND     OR      IN()        NOT연산자 *** ---
    
    -- employees 테이블에서 80번 부서에 근무하는 사원들중에 기본급여가 10000 이상인 사원들만 
    -- 사원번호, 사원명, 기본급여, 부서번호를 나타내세요.
    select employee_id as "사원번호"
        , first_name || ' ' || last_name as "사원명"
        , salary as "기본급여"
        , department_id as "부서번호"
    from employees
    where nvl(department_id,-9999) = 80 and salary >= 10000;
    
    -- employees 테이블에서 30번, 60번, 80번, null 부서에 근무하는 사원들만
    -- 사원번호, 사원명, 기본급여, 부서번호를 나타내세요.
    select employee_id as "사원번호"
        , first_name || ' ' || last_name as "사원명"
        , salary as "기본급여"
        , department_id as "부서번호"
    from employees
    where department_id = 30 or 
        department_id = 60 or
        department_id = 80 or
        department_id is null
    order by "부서번호";
    
    -- 또는
    select employee_id as "사원번호"
        , first_name || ' ' || last_name as "사원명"
        , salary as "기본급여"
        , department_id as "부서번호"
    from employees
    where nvl(department_id, -9999) in(30, 60, 80, -9999)  -- in() 는 비교연산자 ' = ' 로 보면 된다.
    order by "부서번호";
    
    -- employees 테이블에서 30번, 60번, 80번 부서에 근무하지 않는 사원들만
    -- 사원번호, 사원명, 기본급여, 부서번호를 나타내세요.
    select employee_id as "사원번호"
        , first_name || ' ' || last_name as "사원명"
        , salary as "기본급여"
        , department_id as "부서번호"
    from employees
    where nvl(department_id, -9999) != 30 and
        nvl(department_id, -9999) != 60 and
        nvl(department_id, -9999) != 80
    order by "부서번호";
    
    -- 또는
    select employee_id as "사원번호"
        , first_name || ' ' || last_name as "사원명"
        , salary as "기본급여"
        , department_id as "부서번호"
    from employees
    where nvl(department_id, -9999) not in(30, 60, 80, -9999)
    order by "부서번호";
    
    -- 또는
    select employee_id as "사원번호"
        , first_name || ' ' || last_name as "사원명"
        , salary as "기본급여"
        , department_id as "부서번호"
    from employees
    where not nvl(department_id, -9999) in(30, 60, 80, -9999)
    order by "부서번호";
    
    -- employees 테이블에서 부서번호가 30, 50, 60번 부서에 근무하는 사원들중에 
    -- 연봉(월급*12)이 20000 이상 60000 이하인 사원들만 
    -- 사원번호, 사원명, 연봉(월급*12), 부서번호를 나타내되 
    -- 부서번호의 오름차순으로 정렬한 후 동일한 부서번호내에서는 연봉의 내림차순으로 나타내세요. 
   
   /*
      === !!!!! AND 와 OR 가 혼용되어지면 연산의 우선순위에 따라 AND 가 먼저 실행된다. !!!!!
      === !!!!! 연산자에 있어서 가장 최우선은 괄호( )가 제일 우선한다. !!!!!
      
      select 2+3*4, (2+3)*4
      from dual;
      --      14      20
   */
   
   --- !!! 이것은 틀린 풀이이다. !!! ---
   select employee_id as "사원번호"
        , first_name || ' ' || last_name as "사원명"
        , nvl(salary + (salary * commission_pct), salary) * 12 as "연봉(월급*12)"
        , department_id as "부서번호"
   from employees
   where department_id = 30 or
        department_id = 50 or
        department_id = 60 and
        nvl(salary + (salary * commission_pct), salary) * 12 >= 20000 and
        nvl(salary + (salary * commission_pct), salary) * 12 <= 60000
    -- where department_id in(30, 50, 60)
    order by 부서번호, "연봉(월급*12)" desc;    -- () 가 들어가 있으므로 "" 이 필요하다.
    -- or와 and 가 혼용되면 and 가 우선이기 때문에 원하는 값이 나오지 않는다.(60번 부서만 연봉을 따지고 있다.)
    
    --- !!! 이것이 올바르게 풀이한 것이다. !!! ---
    --- !!! 이것은 틀린 풀이이다. !!! ---
   select employee_id as "사원번호"
        , first_name || ' ' || last_name as "사원명"
        , nvl(salary + (salary * commission_pct), salary) * 12 as "연봉(월급*12)"
        , department_id as "부서번호"
   from employees
   where (department_id = 30 or
        department_id = 50 or
        department_id = 60) and     -- 부서번호를 먼저 () 해서 먼저 구한 다음에 and 계산하기
        nvl(salary + (salary * commission_pct), salary) * 12 >= 20000 and
        nvl(salary + (salary * commission_pct), salary) * 12 <= 60000
    -- where department_id in(30, 50, 60)
    order by 부서번호, "연봉(월급*12)" desc;    -- () 가 들어가 있으므로 "" 이 필요하다.
    
    -- 또는
    select employee_id as "사원번호"
        , first_name || ' ' || last_name as "사원명"
        , nvl(salary + (salary * commission_pct), salary) * 12 as "연봉(월급*12)"
        , department_id as "부서번호"
   from employees
    where department_id in(30, 50, 60) and
        nvl(salary + (salary * commission_pct), salary) * 12 >= 20000 and
        nvl(salary + (salary * commission_pct), salary) * 12 <= 60000
    order by 부서번호, "연봉(월급*12)" desc;    --> IN( ) 은 괄호가 있는 OR 이다.
   
   
   
   
   
   ------ **** ==== 범위 연산자 ==== **** ------
   --     >   <   >=    <=   between A and B ==> A 이상 B 이하
   
   --  범위 연산자에 사용되는 데이터는 숫자 뿐만 아니라 문자, 날짜 까지 모두 사용된다. 
   
   select employee_id as "사원번호"
        , first_name || ' ' || last_name as "사원명"
        , nvl(salary + (salary * commission_pct), salary) * 12 as "연봉(월급*12)"
        , department_id as "부서번호"
   from employees
    where department_id in(30, 50, 60) and
        nvl(salary + (salary * commission_pct), salary) * 12 between 20000 and 60000
    order by 부서번호, "연봉(월급*12)" desc;
   
   select first_name, last_name, salary
   from employees
   where first_name >= 'J' and first_name <= 'S'
   order by first_name;
   
   select first_name, last_name, salary
   from employees
   where first_name between 'J' and 'S'
   order by first_name;
   
   ---- *** === 현재 시각을 알려주는 것 ==== *** ----
    select sysdate, current_date, localtimestamp, current_timestamp, systimestamp
    from dual;
    -- 24/02/16     24/02/16   24/02/16 14:15:18.030000000  24/02/16 14:15:18.030000000 +09:00  24/02/16 14:15:18.030000000 +09:00
    /*
       날짜타입은 date 이다.
       date 타입의 기본적인 표현방식은 'RR/MM/DD' 으로 나타내어진다.
       RR 은 년도의 2자리만 나타내어주는데 50 ~ 99 는  1950 ~ 1999 을 말하는 것이다.
       RR 은 년도의 2자리만 나타내어주는데 00 ~ 49 는  2000 ~ 2049 을 말하는 것이다.
       MM 은 월이고, DD 는 일이다.
   */
   
   select sysdate
        , to_char(sysdate,'yyyy-mm-dd')
        , to_char(sysdate, 'hh24:mi:ss')
        , to_char(sysdate,'yyyy-mm-dd hh24:mi:ss')
        , to_char(sysdate,'yyyy/mm/dd hh24:mi:ss')
        , to_char(sysdate,'yyyy/mm/dd am hh:mi:ss')
        , to_char(sysdate,'yyyy/mm/dd pm hh:mi:ss')
   from dual;
    -- 24/02/16     2024-02-16      14:20:21    2024-02-16 14:20:21     2024/02/16 14:20:21 2024/02/16 오후 02:20:21      2024/02/16 오후 02:20:21

    desc employees;
    -- HIRE_DATE(입사일자)   NOT NULL    DATE(날짜)  
    
    select employee_id as "사원번호"
        , first_name || ' ' || last_name as "사원명"
        , hire_date as "입사일자1"
        , to_char(hire_date, 'yyyy-mm-dd hh24:mi:ss') as "입사일자2"
    from employees;
    
    -- 154	Nanette Cambrault	06/12/09	2006-12-09 00:00:00
    -- employees 테이블에 저장된 사원번호가 154 인 행에 대해서 hire_date(입사일자) 컬럼의 값을 '2006-12-31 09:00:00' 로 수정(변경)하고자 한다.
    update employees set hire_date = to_date('2006-12-31 09:00:00', 'yyyy-mm-dd hh24:mi:ss')
    where employee_id = 154;
    -- 1 행 이(가) 업데이트되었습니다.
    
    commit;
    -- 커밋 완료.
    
    select employee_id as "사원번호"
        , first_name || ' ' || last_name as "사원명"
        , hire_date as "입사일자1"
        , to_char(hire_date, 'yyyy-mm-dd hh24:mi:ss') as "입사일자2"
    from employees;
    
    -- employees 테이블에서 입사일자가 2005년 1월 1일 부터 2006년 12월 31일 까지 입사한 사원들만
    -- 사원번호, 사원명, 입사일자를 나타내세요.
    
    --- 틀린 풀이 !!! (1) ---
    select employee_id as "사원번호"
        , first_name || ' ' || last_name as "사원명"
        , hire_date as "입사일자1"
        , to_char(hire_date, 'yyyy-mm-dd hh24:mi:ss') as "입사일자2"
    from employees
    where '05/01/01' <= hire_date and hire_date <= '06/12/31'   -- 'yy/mm/dd 만 적으면 00:00:00 으로 간주(틀린 풀이법)
    order by 3;     -- 입사일자1 오름차순 배열
    --- !!!!! 중요 !!!!  날짜를 나타낼때 시,분,초 가 없는 년,월,일만 나타내어주면 자동적으로 0시0분0초가 된다.
    ---                 즉, 자정(그날의 시작)을 뜻한다.
   
    --- 틀린 풀이 !!! (2) ---
    select employee_id as "사원번호"
        , first_name || ' ' || last_name as "사원명"
        , hire_date as "입사일자1"
        , to_char(hire_date, 'yyyy-mm-dd hh24:mi:ss') as "입사일자2"
    from employees
-- where '05/01/01' <= hire_date and hire_date <= '06/12/31' 
-- 또는
    where hire_date between '05/01/01' and '06/12/31'
    order by 3;     -- 입사일자1 오름차순 배열
    

    --- 올바른 풀이 !!! ---
    select employee_id as "사원번호"
        , first_name || ' ' || last_name as "사원명"
        , hire_date as "입사일자1"
        , to_char(hire_date, 'yyyy-mm-dd hh24:mi:ss') as "입사일자2"
    from employees
    where '05/01/01' <= hire_date and hire_date <= '07/01/01'   -- '06/12/31' 까지 알고 싶으면 그 다음날로 설정해야 한다.   
    order by 3;     -- 입사일자1 오름차순 배열
    
    
    
    
    
    
    'A' --> 65
    'a' --> 97
    '0' --> 48
    ' ' --> 32
    select ascii('A'), ascii('a'), ascii('0'), ascii(' ')
    from dual;
    --          65      97          48          32
 
    select chr(65), chr(97), chr(48), chr(32)
    from dual;
    --      A       a           0       ' '
    
    -- employees 테이블에서 first_name 컬럼의 값이 'Elj' 부터 'I' 까지인 데이터를 가지는 사원들만
    -- first_name 을 출력하세요.
    select first_name
    from employees
    where 'Elj' <= first_name and first_name <= 'I'
    order by 1;
    -- 'Elj' 'Elja' 'EljaSt' 'Eljasnkjasnhkmasjo' ~~~ 'Harrison' 'Hazel' 'Hermann' 'I'
    
    select first_name
    from employees
    where first_name between 'Elj' and 'I'
    order by 1;
    
    
    
    
    
    --------------------------------------------------------------------------------------
    -- 어떤 테이블에 존재하는 행의 컬럼의 값을 변경(수정)하려고 할 때는 update 명령어를 사용해서 변경해준다.
    select *
    from employees
    where employee_id = 100;
    
    /*
    ------------------------------------------------------
    employee_id     first_name      last_name   hire_date
    ------------------------------------------------------
    100             Steven          King        03/06/17
    */
    
    update employees set first_name = '혜정', last_name = '양', hire_date = sysdate
    where employee_id = 100;    --> 메모리(RAM)상에서 변경된 것이다.
    -- 1 행 이(가) 업데이트되었습니다.
    
    select  employee_id, first_name, last_name, hire_date   -- 실제 디스크 적용 x RAM에만 적용
    
    from employees
    where employee_id = 100;
     /*
    ------------------------------------------------------
    employee_id     first_name      last_name   hire_date
    ------------------------------------------------------
    100             혜정              양        24/02/16
    */
    
    commit; --> 메모리(RAM)상에서 변경되어진 것을 실제 디스크(DISK) 파일에 적용(저장)시켜주는 것이다.
    -- 커밋 완료.

    update employees set first_name = 'sfsdf', last_name = 'ㅋㅋㅋ', hire_date = sysdate
    where employee_id = 100;    --> 메모리(RAM)상에서 변경된 것이다.
    -- 1 행 이(가) 업데이트되었습니다.
    
    select employee_id, first_name, last_name, hire_date, salary
    from employees
    where employee_id = 100;
    
    rollback; --> 메모리(RAM)상에서 변경되어진 정보(sfsdf ㅋㅋㅋ)를 삭제해주는 것이다.
            -- 즉, 위에서 실행한 update 명령을 한 결과를 취소하겠다는 말이다.
    -- 롤백 완료

    select employee_id, first_name, last_name, hire_date, salary
    from employees
    where employee_id = 100;
    
    update employees set first_name = 'HyeJoung', last_name = 'Yang', hire_date = sysdate
    where employee_id = 100;
    -- 1 행 이(가) 업데이트되었습니다.
     /*
    ------------------------------------------------------
    employee_id     first_name      last_name   hire_date
    ------------------------------------------------------
    100             HyeJoung           Yang     24/02/16
    */
    
    commit;
    -- rollback;
    -- 커밋 완료.
    
    select employee_id, first_name, last_name, hire_date, salary
    from employees
    where employee_id = 100;
    
    update employees set first_name = 'ㅎㅎㅎ', last_name = 'ㅋㅋㅋ', hire_date = sysdate, salary = 10
    where employee_id = 100;
    -- 1 행 이(가) 업데이트되었습니다.
    
    select employee_id, first_name, last_name, hire_date, salary
    from employees
    where employee_id = 100;
    
    commit;
    -- rollback;
    -- 커밋 완료. 
    
    update employees set first_name = 'Steven', last_name = 'King'
        , hire_date = to_date('03/06/17','RR/MM/DD')
        , salary = 24000
    where employee_id = 100;
    -- 1 행 이(가) 업데이트되었습니다.
    
    commit;
    -- 커밋 완료.
    
    update employees set first_name = 'fdas', last_name = '....'
        , hire_date = to_date('03/06/17','RR/MM/DD')
        , salary = 24000
    where employee_id = 100;
    -- 1 행 이(가) 업데이트되었습니다.
    
    commit;
    -- 커밋 완료.
    
    select employee_id, first_name, last_name, hire_date, salary
    from employees
    where employee_id = 100;
    
    rollback;
    -- 롤백 완료.
    
    select employee_id, first_name, last_name, hire_date, salary
    from employees
    where employee_id = 100;
    -- rollback 은 commit 한 이후로 변경되어진 정보를 취소하는 것(이전 상태로 되돌리는 것)이므로
    -- commit 한 이후에 rollback 하더라도 원상복구는 안된다.
    
    ---- 다시 원상복구 ----
    update employees set first_name = 'Steven', last_name = 'King'
        , hire_date = to_date('03/06/17','RR/MM/DD')
        , salary = 24000
    where employee_id = 100;
    -- 1 행 이(가) 업데이트되었습니다.
    
    commit;
    -- 커밋 완료.
    
    
    
    
    
    
    --- *** employees 테이블에 jubun(주민번호) 이라는 컬럼을 추가하겠습니다. *** ---
    desc employees; 
    
    select 0010204234567, 9010201234567     -- 숫자 형태
        , '0010204234567', '9010201234567'  -- 문자 형태
    from dual;
    /*
       jubun(주민번호) 컬럼의 값을 입력할때는 '-' 는 빼고 숫자로만 입력할 것입니다.
       jubun(주민번호) 컬럼의 값을 입력할 때 맨 처음 첫자리에 0 이 들어올 수 있다라면 
       number 타입이 아니라 varchar2 타입으로 해야 한다.
       왜냐하면 number 타입으로 해주면 맨 앞에 입력한 값이 0 일때는 0이 생략 되어지기 때문이다.
       맨 앞의 0 도 나오게 하려면 컬럼의 데이터 타입은 varchar2 가 되어야 한다.
   */
    
    -- *** 컬럼 추가하기 *** --
    alter table employees
    add jubun varchar2(13);     -- 문자타입(varchar2) 13자리
    -- Table EMPLOYEES이(가) 변경되었습니다.
    
    desc employees;
    -- JUBUN                   VARCHAR2(13) 
    
    select *
    from employees;
    
    update employees set jubun = '6101131234567'
    where employee_id = 100;
    
    update employees set jubun = '8510151234567'
    where employee_id = 101;
    
    update employees set jubun = '6510152234567'
    where employee_id = 102;
    
    update employees set jubun = '7510151234567'
    where employee_id = 103;
    
    update employees set jubun = '6110152234567'
    where employee_id = 104;
    
    update employees set jubun = '6510151234567'
    where employee_id = 105;
    
    update employees set jubun = '6107221234567'
    where employee_id = 106;
    
    update employees set jubun = '0803153234567'
    where employee_id = 107;
    
    update employees set jubun = '0712154234567'
    where employee_id = 108;
    
    update employees set jubun = '8810151234567'
    where employee_id = 109;
    
    update employees set jubun = '8908152234567'
    where employee_id = 110;
    
    update employees set jubun = '9005052234567'
    where employee_id = 111;
    
    update employees set jubun = '6610151234567'
    where employee_id = 112;
    
    update employees set jubun = '6710151234567'
    where employee_id = 113;
    
    update employees set jubun = '6709152234567'
    where employee_id = 114;
    
    update employees set jubun = '6110151234567'
    where employee_id = 115;
    
    update employees set jubun = '6204291234567'
    where employee_id = 116;
    
    update employees set jubun = '6110152234567'
    where employee_id = 117;
    
    update employees set jubun = '7810151234567'
    where employee_id = 118;
    
    update employees set jubun = '7909151234567'
    where employee_id = 119;
    
    update employees set jubun = '7702152234567'
    where employee_id = 120;
    
    update employees set jubun = '7009151234567'
    where employee_id = 121;
    
    update employees set jubun = '7111011234567'
    where employee_id = 122;
    
    update employees set jubun = '8010131234567'
    where employee_id = 123;
    
    update employees set jubun = '8110191234567'
    where employee_id = 124;
    
    update employees set jubun = '9012132234567'
    where employee_id = 125;
    
    update employees set jubun = '9406251234567'
    where employee_id = 126;
    
    update employees set jubun = '9408252234567'
    where employee_id = 127;
    
    update employees set jubun = '9204152234567'
    where employee_id = 128;
    
    update employees set jubun = '8507251234567'
    where employee_id = 129;
    
    update employees set jubun = '6511111234567'
    where employee_id = 130;
    
    update employees set jubun = '0010153234567'
    where employee_id = 131;
    
    update employees set jubun = '0005254234567'
    where employee_id = 132;
    
    update employees set jubun = '0110194234567'
    where employee_id = 133;
    
    update employees set jubun = '0412154234567'
    where employee_id = 134;
    
    update employees set jubun = '0503253234567'
    where employee_id = 135;
    
    update employees set jubun = '9510012234567'
    where employee_id = 136;
    
    update employees set jubun = '9510021234567'
    where employee_id = 137;
    
    update employees set jubun = '9610041234567'
    where employee_id = 138;
    
    update employees set jubun = '9610052234567'
    where employee_id = 139;
    
    update employees set jubun = '7310011234567'
    where employee_id = 140;
    
    update employees set jubun = '7310092234567'
    where employee_id = 141;
    
    update employees set jubun = '7510121234567'
    where employee_id = 142;
    
    update employees set jubun = '7612012234567'
    where employee_id = 143;
    
    update employees set jubun = '7710061234567'
    where employee_id = 144;
    
    update employees set jubun = '7810052234567'
    where employee_id = 145;
    
    update employees set jubun = '6810251234567'
    where employee_id = 146;
    
    update employees set jubun = '6811062234567'
    where employee_id = 147;
    
    update employees set jubun = '6712052234567'
    where employee_id = 148;
    
    update employees set jubun = '6102231234567'
    where employee_id = 149;
    
    update employees set jubun = '6210062234567'
    where employee_id = 150;
    
    update employees set jubun = '6110191234567'
    where employee_id = 151;
    
    update employees set jubun = '5712062234567'
    where employee_id = 152;
    
    update employees set jubun = '5810231234567'
    where employee_id = 153;
    
    update employees set jubun = '6311051234567'
    where employee_id = 154;
    
    update employees set jubun = '6412182234567'
    where employee_id = 155;
    
    update employees set jubun = '6110191234567'
    where employee_id = 156;
    
    update employees set jubun = '6210112234567'
    where employee_id = 157;
    
    update employees set jubun = '6311132234567'
    where employee_id = 158;
    
    update employees set jubun = '8511112234567'
    where employee_id = 159;
    
    update employees set jubun = '8710131234567'
    where employee_id = 160;
    
    update employees set jubun = '8710072234567'
    where employee_id = 161;
    
    update employees set jubun = '9010171234567'
    where employee_id = 162;
    
    update employees set jubun = '9112072234567'
    where employee_id = 163;
    
    update employees set jubun = '9110241234567'
    where employee_id = 164;
    
    update employees set jubun = '9212251234567'
    where employee_id = 165;
    
    update employees set jubun = '9310232234567'
    where employee_id = 166;
    
    update employees set jubun = '9811151234567'
    where employee_id = 167;
    
    update employees set jubun = '9810252234567'
    where employee_id = 168;
    
    update employees set jubun = '9910301234567'
    where employee_id = 169;
    
    update employees set jubun = '0910153234567'
    where employee_id = 170;
    
    update employees set jubun = '1011153234567'
    where employee_id = 171;
    
    update employees set jubun = '1006153234567'
    where employee_id = 172;
    
    update employees set jubun = '1111154234567'
    where employee_id = 173;
    
    update employees set jubun = '1209103234567'
    where employee_id = 174;
    
    update employees set jubun = '1207154234567'
    where employee_id = 175;
    
    update employees set jubun = '0906153234567'
    where employee_id = 176;
    
    update employees set jubun = '0812113234567'
    where employee_id = 177;
    
    update employees set jubun = '9810132234567'
    where employee_id = 178;
    
    update employees set jubun = '8712111234567'
    where employee_id = 179;
    
    update employees set jubun = '8310012234567'
    where employee_id = 180;
    
    update employees set jubun = '6510191234567'
    where employee_id = 181;
    
    update employees set jubun = '6510221234567'
    where employee_id = 182;
    
    update employees set jubun = '6510232234567'
    where employee_id = 183;
    
    update employees set jubun = '8512131234567'
    where employee_id = 184;
    
    update employees set jubun = '8510182234567'
    where employee_id = 185;
    
    update employees set jubun = '7510192234567'
    where employee_id = 186;
    
    update employees set jubun = '8512192234567'
    where employee_id = 187;
    
    update employees set jubun = '9511151234567'
    where employee_id = 188;
    
    update employees set jubun = '7509302234567'
    where employee_id = 189;
    
    update employees set jubun = '8510161234567'
    where employee_id = 190;
    
    update employees set jubun = '9510192234567'
    where employee_id = 191;
    
    update employees set jubun = '0510133234567'
    where employee_id = 192;
    
    update employees set jubun = '0810194234567'
    where employee_id = 193;
    
    update employees set jubun = '0910183234567'
    where employee_id = 194;
    
    update employees set jubun = '1010134234567'
    where employee_id = 195;
    
    update employees set jubun = '9510032234567'
    where employee_id = 196;
    
    update employees set jubun = '9710181234567'
    where employee_id = 197;
    
    update employees set jubun = '9810162234567'
    where employee_id = 198;
    
    update employees set jubun = '7511171234567'
    where employee_id = 199;
    
    update employees set jubun = '7810172234567'
    where employee_id = 200;
    
    update employees set jubun = '7912172234567'
    where employee_id = 201;
    
    update employees set jubun = '8611192234567'
    where employee_id = 202;
    
    update employees set jubun = '7810252234567'
    where employee_id = 203;
    
    update employees set jubun = '7803251234567'
    where employee_id = 204;
    
    update employees set jubun = '7910232234567'
    where employee_id = 205;
    
    update employees set jubun = '8010172234567'
    where employee_id = 206;
    
    commit;
    
    select *
    from employees;
    -- order by employee_id;    employee_id 순서대로 안 나올 경우
    
    
    
    
    ------------------------------------------------------------------------------------------------
    
    
    
    ------ **** ===== like 연산자 ===== **** ------
    select *
    from employees
    where department_id = 30;
    
    select *
    from employees
    where department_id like 30;
    
    /*
    like 연산자와 함께 사용되어지는 % 와 _ 를 wild character 라고 부른다.
    like 연산자와 함께 사용되어지는 % 의 뜻은 글자수와는 관계없이 글자가 있든지 없든지 관계없다라는 말이고,
    like 연산자와 함께 사용되어지는 _ 의 뜻은 반드시 아무글자 1개만을 뜻하는 것이다.
    */
    
    -- employees 테이블에서 여자 1990년생과 남자 1991년생의 사원들만
    -- 사원번호, 사원명, 주민번호를 나타내세요.
    select employee_id as "사원번호"
        , first_name || ' ' || last_name as "사원명"
        , jubun as "주민번호"
    from employees
    where jubun like '90____2%' or
        jubun like '91____1%';
    
    
    -- employees 테이블에서 first_name 컬럼의 값이 'J' 로 시작하는 사원들만
    -- 사원번호, 이름, 성, 기본급여를 나타내세요.
    select employee_id as "사원번호"
        , first_name as "이름"
        , last_name as "성"
        , salary as "기본급여"
    from employees
    where first_name like 'J%';
    
    -- employees 테이블에서 first_name 컬럼의 값이 's' 로 끝하는 사원들만
    -- 사원번호, 이름, 성, 기본급여를 나타내세요.
    select employee_id as "사원번호"
        , first_name as "이름"
        , last_name as "성"
        , salary as "기본급여"
    from employees
    where first_name like '%s';
    
    -- employees 테이블에서 first_name 컬럼의 값중에 'ee'라는 글자가 들어있는 사원들만
    -- 사원번호, 이름, 성, 기본급여를 나타내세요.
    select employee_id as "사원번호"
        , first_name as "이름"
        , last_name as "성"
        , salary as "기본급여"
    from employees
    where first_name like '%ee%';
    
    -- employees 테이블에서 first_name 컬럼의 값중에 'e'가 2개 이상 들어있는 사원들만
    -- 사원번호, 이름, 성, 기본급여를 나타내세요.
    select employee_id as "사원번호"
        , first_name as "이름"
        , last_name as "성"
        , salary as "기본급여"
    from employees
    where first_name like '%e%e%';
    
    -- employees 테이블에서 last_name 컬럼의 값이 첫글자는 'F' 이고 두번째 글자는 아무거나 이고
    -- 세번째 글자는 소문자 'e' 이며 4번째 부터는 글자가 있든지 없든지 상관없는 사원들만 
    -- 사원번호, 이름, 성, 기본급여를 나타내세요. 
    select employee_id as "사원번호"
        , first_name as "이름"
        , last_name as "성"
        , salary as "기본급여"
    from employees
    where last_name like'F_e%';
    
    ---- ***  like 연산자와 함께 사용되어지는 % 와 _ 인 wild character 의 escape(탈출) 시키기 *** ----
    
    