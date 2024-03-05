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
    
    
    
    
   -- drop table tbl_watch purge;       -- 테이블 글자 수 잘못 작성하여 삭제하기
    
    create table tbl_watch
    (-- watchname varchar2(10) -- varchar2(10)은 최대 10 byte 까지만 허용.     '쌍용교육센터' --> 12byte 이므로 입력불가    'oracle' --> 6byte 이므로 입력가능
    watchname Nvarchar2(10) -- Nvarchar2(10)은 최대 글자수가 10 글자 까지만 허용. '쌍용교육센터' --> 6글자 이므로 입력가능    'oracle' --> 6글자 이므로 입력가능
    , bigo Nvarchar2(100)
    );
    -- Table TBL_WATCH이(가) 생성되었습니다.
    
    -- 어떤 테이블에 데이터(행)를 입력할때는 insert 라는 명령어를 사용한다.
    insert into tbl_watch(watchname, bigo) values('금시계','순금 99.99% 함유 고급시계');
    --> 1 행 이(가) 삽입되었습니다.
    
    commit; -- 파일(DISK)에 적용(저장)시킨다.
    -- 커밋 완료.
    
    select *
    from tbl_watch;
    
    insert into tbl_watch(watchname, bigo) values('은시계','고객만족도 99.99점 획득한 고급시계');
    insert into tbl_watch(watchname, bigo) values('동시계','가성비가 뛰어난 고급시계');
    --> 1 행 이(가) 삽입되었습니다.
    --> 1 행 이(가) 삽입되었습니다.
    
    commit; -- 파일(DISK)에 적용(저장)시킨다.
    -- 커밋 완료.
    
    select *
    from tbl_watch;
    
    -- 특정행 삭제하기 -- 
    delete from tbl_watch
    where watchname = '은시계';
    --> 1 행 이(가) 삭제되었습니다.
    
    select *
    from tbl_watch;
    
    commit;
    -- 커밋 완료.
    
    select *
    from tbl_watch;
    
    -- 모든행 삭제하기 -- 
    delete from tbl_watch;
    --> 2개 행 이(가) 삭제되었습니다.
    
    select *
    from tbl_watch;
    
    rollback;
    -- 롤백 완료.
    
    select *
    from tbl_watch;
    
    delete from tbl_watch;
    
    commit;
    
    select *
    from tbl_watch;
    
    insert into tbl_watch(watchname, bigo) values('금시계','순금 99.99% 함유 고급시계');
    insert into tbl_watch(watchname, bigo) values('은시계','고객만족도 99.99점 획득한 고급시계');
    insert into tbl_watch(watchname, bigo) values('동시계','가성비가 뛰어난 고급시계');
    
    commit; -- 파일(DISK)에 적용(저장)시킨다.
    -- 커밋 완료.
    
    -- tbl_watch 테이블에서 bigo 컬럼에 99.99% 라는 글자가 들어있는 행만 추출하세요. --
    select *
    from tbl_watch
    where bigo like '%99.99%%';      -- 99.99% 가 아닌 99.99가 들어간 모든 글자가 나온다.
    
    ---- ***  like 연산자와 함께 사용되어지는 % 와 _ 인 wild character 의 escape(탈출) 시키기 *** ----
    select *
    from tbl_watch
    where bigo like '%99.99\%%' escape '\';     -- escape '아무거나 입력' => 탈출시키고 싶은 % 나 _ 앞에 놓기
    --  escape 문자로 '\' 을 주었으므로 '\' 다음에 나오는 % 1개만 wild character 기능에서 탈출시켜 버리므로 % 는 진짜 글자 퍼센트(%) 로 된다.
    
    select *
    from tbl_watch
    where bigo like '%99.992%%' escape '2';     -- escape '아무거나 입력' => 탈출시키고 싶은 % 나 _ 앞에 놓기 => 숫자는 헷갈리게 할 수 있기 때문에 특수문자 사용.
    --  escape 문자로 '2' 을 주었으므로 '2' 다음에 나오는 % 1개만 wild character 기능에서 탈출시켜 버리므로 % 는 진짜 글자 퍼센트(%) 로 된다.
    
    select *
    from tbl_watch
    where bigo like '%99.99a%%' escape 'a';     -- escape '아무거나 입력' => 탈출시키고 싶은 % 나 _ 앞에 놓기 => 문자는 헷갈리게 할 수 있기 때문에 특수문자 사용.
    --  escape 문자로 'a' 을 주었으므로 'a' 다음에 나오는 % 1개만 wild character 기능에서 탈출시켜 버리므로 % 는 진짜 글자 퍼센트(%) 로 된다.
    
    
    
    
    
    ---------------------------------------------------------------------------------------------------------------------------------------
    
    ---------------------- >> 단일행 함수 << -------------------------------------
/*
    
    ※ 단일행 함수의 종류
    
    1. 문자 함수
    2. 숫자 함수
    3. 날짜 함수
    4. 변환 함수
    5. 기타 함수
    
*/
    
    -------------------------- >> 1. 문자 함수 << -------------------------------
    
    -- 1-1 upper('문자열') ==> '문자열' 에 영문자가 있으면 모두 대문자로 변환시켜주는 것.
    select 'kOrea seOuL', upper('kOrea seOuL')
    from dual;
    -- kOrea seOuL	KOREA SEOUL
    

    -- 1-2 lower('문자열') ==> '문자열' 에 영문자가 있으면 모두 소문자로 변환시켜주는 것.
    select 'kOrea seOuL', lower('kOrea seOuL')
    from dual;
    -- kOrea seOuL	korea seoul
    
    
    -- 1-3 initcap('문자열') ==> '문자열' 을 단어별(구분자가 공백으)로 첫글자만 대문자로, 나머지는 모두 소문자로 변환시켜주는 것.
    select 'kOrea seOuL', initcap('kOrea seOuL')
    from dual;
    -- kOrea seOuL	Korea Seoul
    
    select last_name, upper(last_name), lower(last_name), initcap(last_name)
    from employees;
    
    
    select *
    from employees
    where upper(last_name) = upper('king');
    
    select *
    from employees
    where lower(last_name) = lower('King');
    
    
    -- 1-4 substr('문자열', 시작글자번호, 뽑아야 할 글자 길이) 
    --      ==> '문자열' 중에 문자열의 특정 일부분을 선택해올 때 사용한다.    
    select '쌍용교육센터'
        , substr('쌍용교육센터', 2, 3) -- '쌍용교육센터' 에서 2번째 글자인 '용' 부터 3글자만 뽑아온다.
        , substr('쌍용교육센터', 2)   -- '쌍용교육센터' 에서 2번째 글자인 '용' 부터 끝까지 뽑아온다.
    from dual;
    -- 쌍용교육센터	용교육	용교육센터
    
    
    --- *** substr() 함수를 사용하여 employees 테이블에서 성별이 '여자'인 사원들만
    ---      사원번호, 사원명, 주민번호를 나타내세요. ***
    
    select employee_id as "사원번호"
        , first_name || ' ' || last_name as "사원명"
        , jubun as "주민번호"
    from employees
    where substr(jubun,7,1) in ('2','4');   -- ' ' 을 넣지 않을 경우 자동형변환 ' ' 붙은걸로 인식된다. 
    -- 문자열이기 때문에 ' '을 적는 것을 권장
    -- 또는
    -- where substr(jubun,7,1) = '2' or substr(jubun,7,1) = '4';
    -- 또는
    -- where jubun like'______2%' or jubun like'______4%';      -- like 는 in() 과 함께 사용하지 못한다. or 만 가능!!
    
    select 7, to_char(7)        -- 숫자를 문자로 바꾸어줌.
        , '7', to_number('7')   -- 문자를 숫자로 바꾸어줌.
    from dual;
    
    --- *** substr() 함수를 사용하여 employees 테이블에서 1990 년 ~ 1995년에 태어난 사원들 중
    ---     성별이 '남자'인 사원들만 사원번호, 사원명, 주민번호를 나타내세요. ***
    
    select employee_id as "사원번호"
        , first_name || ' ' || last_name as "사원명"
        , jubun as "주민번호"
    from employees
    where substr(jubun,7,1) = '1' and to_number(substr(jubun,1,2)) between 90 and 95;
    -- substr(jubun,1,2) : jubun 1번째 글자부터 2개
    -- to_number : 문자를 숫자로 바꾸기
    -- between A AND B : A 부터 B  까지
    -- , 은 또는 or
    -- 조건1 and 조건2 => 조건1인 사람 중 조건2
    
    
    
    
    
    -- 1-5 instr : 어떤 문자열에서 명명된 문자열의 위치를 알려주는 것
    
    select '쌍용교육센터 서울교육대학교 교육문화원'
        , instr('쌍용교육센터 서울교육대학교 교육문화원','교육',1,1)    -- 3
        -- instr('문자','찾고싶은 문자', 출발점, 찾고싶은 문자가 나오는 순서)
        -- '쌍용교육센터 서울교육대학교 교육문화원' 에서 '교육'이 나오는 위치를 찾는데
        -- 출발점이 1 번째 부터 검색해서 1 번째로 나오는 '교육'의 위치를 알려달라는 말이다.
        
        , instr('쌍용교육센터 서울교육대학교 교육문화원','교육',1,2)    -- 10
        -- instr('문자','찾고싶은 문자', 출발점, 찾고싶은 문자가 나오는 순서)
        -- '쌍용교육센터 서울교육대학교 교육문화원' 에서 '교육'이 나오는 위치를 찾는데
        -- 출발점이 1 번째 부터 검색해서 2 번째로 나오는 '교육'의 위치를 알려달라는 말이다.
        
        , instr('쌍용교육센터 서울교육대학교 교육문화원','교육',4,1)    -- 10
        -- instr('문자','찾고싶은 문자', 출발점, 찾고싶은 문자가 나오는 순서)
        -- '쌍용교육센터 서울교육대학교 교육문화원' 에서 '교육'이 나오는 위치를 찾는데
        -- 출발점이 4 번째 부터 검색해서 1 번째로 나오는 '교육'의 위치를 알려달라는 말이다.
        
        , instr('쌍용교육센터 서울교육대학교 교육문화원','교육',4,3)    --  0 (없다)
        -- instr('문자','찾고싶은 문자', 출발점, 찾고싶은 문자가 나오는 순서)
        -- '쌍용교육센터 서울교육대학교 교육문화원' 에서 '교육'이 나오는 위치를 찾는데
        -- 출발점이 4 번째 부터 검색해서 3 번째로 나오는 '교육'의 위치를 알려달라는 말이다.
        -- 그러한 값이 없다라면 0 이 나온다.
        
        , instr('쌍용교육센터 서울교육대학교 교육문화원','교육',1)    --  3
        -- instr('문자','찾고싶은 문자', 출발점, 찾고싶은 문자가 나오는 순서)
        -- '쌍용교육센터 서울교육대학교 교육문화원' 에서 '교육'이 나오는 위치를 찾는데
        -- 출발점이 1 번째 부터 검색해서 1 번째로 나오는 '교육'의 위치를 알려달라는 말이다.
        -- 출발점만 나오면 뒤에 ,1 이 생략된 것이다.
        
        , instr('쌍용교육센터 서울교육대학교 교육문화원','교육',4)    --  10
        -- instr('문자','찾고싶은 문자', 출발점, 찾고싶은 문자가 나오는 순서)
        -- '쌍용교육센터 서울교육대학교 교육문화원' 에서 '교육'이 나오는 위치를 찾는데
        -- 출발점이 4 번째 부터 검색해서 1 번째로 나오는 '교육'의 위치를 알려달라는 말이다.
        -- 출발점만 나오면 뒤에 ,1 이 생략된 것이다.
        
    from dual;
    
    -- 1-6 reverse : 어떤 문자열을 거꾸로 보여주는 것이다. --
    
    select 'ORACLE' , reverse('ORACLE')
        , '대한민국', reverse('대한민국'), reverse(reverse('대한민국'))
    from dual;
    
    
    ------ [퀴즈] ------
    create table tbl_files
    (fileno     number(3)
    , filepath  varchar2(100)
    );
    -- Table TBL_FILES이(가) 생성되었습니다.
    
    insert into tbl_files(fileno, filepath) values(1, 'c:\myDocuments\resume.hwp');
    insert into tbl_files(fileno, filepath) values(2, 'd:\mymusic.mp3');
    insert into tbl_files(fileno, filepath) values(3, 'c:\myphoto\2024\02\face.jpg');
    
    commit;
    -- 커밋 완료.
    
    select fileno, filepath
    from tbl_files;
    
    -- 아래와 같이 나오도록 하세요. --
    /*
    ------------------------------
         파일번호        파일명
    ------------------------------
             1	     resume.hwp
             2	    mymusic.mp3
             3	     face.jpg
    */
    
    select fileno as "파일번호" 
        , reverse(substr(reverse(filepath),1,instr(reverse(filepath),'\',1)-1)) as "파일명"
        -- instr(reverse(filepath),'\',1) => 뒤집어진 파일명에서 \ 의 index 찾기
        -- substr(문자, 순서1, 숫자) -> 순서1부터 숫자 개수만큼 출력
        -- 숫자에서 -1 을 하지 않으면 \ 까지 나온다.
        -- 뒤집혀진 문자 다시 뒤집어주기
    from tbl_files;
    
    select '쌍용교육센터 서울교육대학교 교육문화원'
        , instr('쌍용교육센터 서울교육대학교 교육문화원','교육',1,1)    -- 3
        -- instr('문자','찾고싶은 문자', 출발점, 찾고싶은 문자가 나오는 순서)
        -- '쌍용교육센터 서울교육대학교 교육문화원' 에서 '교육'이 나오는 위치를 찾는데
        -- 출발점이 1 번째 부터 검색해서 1 번째로 나오는 '교육'의 위치를 알려달라는 말이다.
        
       , instr('쌍용교육센터 서울교육대학교 교육문화원','교육',-1,1)    -- 16
        -- instr('문자','찾고싶은 문자', 출발점, 찾고싶은 문자가 나오는 순서)
        -- '쌍용교육센터 서울교육대학교 교육문화원' 에서 '교육'이 나오는 위치를 찾는데
        -- 출발점이 역순으로 1 번째 부터 검색해서 1 번째로 나오는 '교육'의 위치를 알려달라는 말이다. 
        
        , instr('쌍용교육센터 서울교육대학교 교육문화원','교육',-1)    -- 16
        
        , instr('쌍용교육센터 서울교육대학교 교육문화원','교육',-5,1)    -- 16
        -- instr('문자','찾고싶은 문자', 출발점, 찾고싶은 문자가 나오는 순서)
        -- '쌍용교육센터 서울교육대학교 교육문화원' 에서 '교육'이 나오는 위치를 찾는데
        -- 출발점이 역순으로 5 번째 부터 검색해서 1 번째로 나오는 '교육'의 위치를 알려달라는 말이다.
        
        , instr('쌍용교육센터 서울교육대학교 교육문화원','교육',-6,2)    -- 3
        -- instr('문자','찾고싶은 문자', 출발점, 찾고싶은 문자가 나오는 순서)
        -- '쌍용교육센터 서울교육대학교 교육문화원' 에서 '교육'이 나오는 위치를 찾는데
        -- 출발점이 역순으로 6 번째 부터 검색해서 2 번째로 나오는 '교육'의 위치를 알려달라는 말이다.
        
        , instr('쌍용교육센터 서울교육대학교 교육문화원','교육',-6,3)    -- 0
        -- instr('문자','찾고싶은 문자', 출발점, 찾고싶은 문자가 나오는 순서)
        -- '쌍용교육센터 서울교육대학교 교육문화원' 에서 '교육'이 나오는 위치를 찾는데
        -- 출발점이 역순으로 6 번째 부터 검색해서 3 번째로 나오는 '교육'의 위치를 알려달라는 말이다.
        -- 그러한 값이 없더라면 0 이 나온다.
        
    from dual;
    
    select fileno, filepath
        -- filepath 에서 마지막으로 나오는 \ 의 위치의 1칸 다음부터 끝까지 출력
        -- substr(filepath, 출발점)
        -- 출발점 ==> filepath 에서 마지막으로 나오는 \ 의 위치 + 1
        , substr(filepath, instr(filepath, '\', -1) +1)
    from tbl_files;
    
     select fileno as "파일번호" 
        , substr(filepath,instr(filepath,'\',-1)+1) as "파일명"
    from tbl_files;
    
    
    
    
    
    -- 1.7  lpad : 왼쪽부터 문자를 자리채움 *** -----
    -- 1.8  rpad : 오른쪽부터 문자를 자리채움 *** -----
    select lpad('교육센터',20,'*')  -- 20 byte 를 확보해서 거기에 '교육센터'를 넣습니다. 넣은 후 빈공간(12byte)이 있으면 왼쪽부터 * 로 채워라 
         , rpad('교육센터',20,'*')  -- 20 byte 를 확보해서 거기에 '교육센터'를 넣습니다. 넣은 후 빈공간(12byte)이 있으면 오른쪽부터 * 로 채워라 
    from dual;
    
    select lpad('*',10,'*'), rpad('=',10,'=')
    from dual;
    
    -- 1.9   ltrim : 왼쪽부터 문자를 제거한다. *** ------
    -- 1.10  rtrim : 오른쪽부터 문자를 제거한다. *** ------
    -- 1.11  trim :  왼쪽,오른쪽부터 공백문자를 제거한다. *** ------
    
    select ltrim('abbbcccccdaabbccdTabaacccdddSSS', 'abcd'),    -- abcd 가 아닌 것이 나오면 멈춘다.
           rtrim('abbbcccccdaabbccdTabaacccddd', 'abcd'),
           rtrim( ltrim('abbbcccccdaabbccdTabaacccddd', 'abcd'), 'abcd')
            -- trim('abbbcccccdaabbccdTabaacccddd', 'abcd') 불가!!
    from dual;
    
    select '쌍용' || '                     교육                 센터'
         , '쌍용' || ltrim('                     교육                 센터')  -- 지워야 할 글자가 없을 경우 공백을 지운다.(왼쪽)
    from dual;
    
    select '쌍용                    ' || '교육                 센터' 
         , rtrim('쌍용                    ') || '교육                 센터'   -- 지워야 할 글자가 없을 경우 공백을 지운다.(오른쪽)
    from dual;
    
    
    select '쌍용' || '          교육              ' || '센터' 
         , '쌍용' || trim('          교육              ') || '센터'           -- 지워야 할 글자가 없을 경우 공백을 지운다.
    from dual;
    
    
    -- 1.12   translate *** ------
    select translate('010-3456-7890'        -- 전체 글자
                    ,'0123456789'           -- 바꾸기 전
                    ,'영일이삼사오육칠팔구')   -- 바꾼 후
    from dual;
    
    -- 1.13   replace *** ------
    select replace('쌍용교육센터 서울교육대학교 교육문화원'   -- 전체글자
                  ,'교육'                                -- 바꾸기 전
                  ,'education')                         -- 바꾼 후
    from dual;
    
    
    -- 1.14   length  ==> 문자열의 길이를 알려주는 것  *** ------
    select length('쌍용center')  -- 8
    from dual;
    
    
    
    
    
    
    -------------------------- >> 2. 숫자 함수 << -------------------------------
    
    -- 2-1 mod : 나머지를 구해주는 것이다.
    select 5/2, mod(5,2), trunc(5/2)
    from dual;
    -- 2.5	1	2
    
    -- 2-2  round : 반올림을 해주는 것.
  select 94.547
       , round(94.547)         -- 95
       , round(94.547, 0)      -- 95       0 은 정수 1자리까지만 나타내어준다.
       , round(94.547, 1)      -- 94.5     1 은 소수 첫째자리까지만 나타내어준다.
       , round(94.547, 2)      -- 94.55    2 은 소수 둘째자리까지만 나타내어준다.
       , round(94.547, -1)     -- 90       -1 은 정수 10자리까지만 나타내어준다.
       , round(94.547, -2)     -- 100      -2 은 정수 100자리까지만 나타내어준다.
  from dual;
  
  -- 2-3  trunc : 절삭을 해주는 것. => 반올림X, 무조건 짜르기
  select 94.547
       , trunc(94.547)         -- 94
       , trunc(94.547, 0)      -- 94       0 은 정수 1자리까지만 나타내어준다.
       , trunc(94.547, 1)      -- 94.5     1 은 소수 첫째자리까지만 나타내어준다.
       , trunc(94.547, 2)      -- 94.54    2 은 소수 둘째자리까지만 나타내어준다.
       , trunc(94.547, -1)     -- 90       -1 은 정수 10자리까지만 나타내어준다.
       , trunc(94.547, -2)     -- 0        -2 은 정수 100자리까지만 나타내어준다.
  from dual;
  
    
    -- *** [성적처리] *** --
     create table tbl_sungjuk
     (hakbun    varchar2(20)
     ,name       Nvarchar2(10)
     ,kor       number(3)
     ,eng        number(3)
     ,math      number(3)
    );
    -- Table TBL_SUNGJUK이(가) 생성되었습니다.
    
    select *
    from tbl_sungjuk;
    
    --- *** 데이터 입력하기 *** ---
  insert into tbl_sungjuk(hakbun, name, kor, eng, math) values('sist001','한석규',90,92,93);
  insert into tbl_sungjuk(hakbun, name, kor, eng, math) values('sist002','두석규',100,100,100);
  insert into tbl_sungjuk(hakbun, name, kor, eng, math) values('sist003','세석규',71,72,73);
  insert into tbl_sungjuk(hakbun, name, kor, eng, math) values('sist004','네석규',89,87,81);
  insert into tbl_sungjuk(hakbun, name, kor, eng, math) values('sist005','오석규',60,50,40);
  insert into tbl_sungjuk(hakbun, name, kor, eng, math) values('sist006','육석규',80,81,87);
 
  commit; 
  
  ---------------------------------------------------------------------------------------------------------------------------------------------------------------------
  학번    성명  국어  영어  수학  총점  평균(소수부 첫째자리까지 나타내되 반올림)  학점(평균이 90 이상이면 'A', 90 미만 80 이상이면 'B', 80 미만 70 이상이면 'C' .... 60 미만이면 'F')
  --------------------------------------------------------------------------------------------------------------------------------------------------------------------  
    
    select *
    from tbl_sungjuk;
    
    select hakbun as 학번
        , name as 성명
        , kor as 국어
        , eng as 영어
        , math as 수학
        ,(kor + eng + math) as 총점
        , round((kor + eng + math)/3,1) as 평균
        
        -- , trunc(round((kor + eng + math)/3,1) -1) 
        
        , case trunc( round( (kor + eng + math)/3, 1), -1 ) 
         when 100 then 'A'
         when  90 then 'A'
         when  80 then 'B'
         when  70 then 'C'
         when  60 then 'D'
         else 'F'
         end AS 학점1
        
        , decode ( trunc ( round( (kor + eng + math)/ 3, 1), -1), 100, 'A'
                                                            , 90, 'A'
                                                            , 80, 'B'
                                                            , 70, 'C'
                                                            , 60, 'D'
                                                                , 'F') as 학점2
        
    from tbl_sungjuk;
    
    
    -- 2-4. power : 거듭제곱
    select 2*2*2*2*2, power(2,5) -- 2의 5승 (2^5)
    from dual;
    
    -- 2-5. sqrt : 제곱근
    select sqrt(4), sqrt(16), sqrt(2), sqrt(3)
    from dual;
    
    -- 2-6. sin, cos, tan, asin, acos, atan
    select sin(90), cos(90), tan(90), asin(0.3), acos(0.3), atan(0.3)
    from dual;
    
    -- 2-7. log
    select log(10, 100) -- log_10 100
    from dual;
    -- 2
    
    -- 2-8. sign ==> 결과값이 양수이라면 1, 결과값이 0이라면 0, 결과값이 음수이라면 -1
    select sign(5-2), sign(5-5), sign(3-5)
    from dual;
    -- 1    0   -1
    
    -- 2-9. ceil(실수) ==> 입력되어진 실수 보다 큰 최소의 정수를 나타내어준다.
    --      ceil(정수) ==> 입력되어진 정수를 그대로 나타내어준다.
    select ceil(10.1), ceil(-10.1), ceil(10), ceil(-10)
    from dual;
    --          11	    -10	            10	    -10
    
    -- 2-10. floor(실수) ==> 입력되어진 실수 보다 작은 최대의 정수를 나타내어준다.
    --       floor(정수) ==> 입력되어진 정수를 그대로 나타내어준다.
    select floor(10.1), floor(-10.1), floor(10), floor(-10)
    from dual;
    
    -- 2-11  ascii, chr 
    select ascii('A'), ascii('a'), ascii('0'), ascii(' ')
    from dual;
   --         65         97          48         32
    
    select chr(65), chr(97), chr(48), chr(32)
    from dual;
   --        A          a       0      ' '    
    
    
    
    
    
    -------------------------- >> 3. 날짜 함수 << -------------------------------
    
    /*
        날짜1 + 숫자 = 날짜2 ==> 날짜1 에서 숫자(일수)만큼 더한 값이 날짜2 가 된다.
        날짜1 - 숫자 = 날짜2 ==> 날짜1 에서 숫자(일수)만큼 뺀 값이 날짜2 가 된다.
    
        여기서 중요한 것은 숫자의 단위는 일수 이다.
    */

    
    select sysdate -1, to_char(sysdate -1, 'yyyy-mm-dd hh24:mi:ss') as "어제 시각"
        , sysdate, to_char(sysdate, 'yyyy-mm-dd hh24:mi:ss') as "현재시각"
        , sysdate + 1, to_char(sysdate +1, 'yyyy-mm-dd hh24:mi:ss') as "내일 시각"
    from dual;
    
    --- 단위환산 ---
  /*
     1 kg = 1000 g
     1 g = 1/1000 kg
     1 일 = 24 시간
     1 시간 = 60 분
     1 분 = 1/60 시간
     1 분 = 60 초
     1 초 = 1/60 분
  */
    
    --- *** 현재시각으로 부터 1일 2시간 3분 4초 뒤를 나타내세요. *** ---
    select sysdate, to_char(sysdate, 'yyyy-mm-dd hh24:mi:ss') as "현재시각"
           ,to_char(sysdate + 1 + 2/24 + 3/(24*60) + 4/(24*60*60), 'yyyy-mm-dd hh24:mi:ss')  as "1일 2시간 3분 4초 뒤"
    from dual;
    -- 2024-02-19 14:49:22	2024-02-20 16:52:26
    
    
    
    -- 3-1. add_months(날짜, 숫자)
    /*
        ==> 숫자가 양수이면 날짜에서 숫자 개월수 만큼 더해준 날짜를 나타내는 것이고,
            숫자가 음수이면 날짜에서 숫자 개월수 만큼 뺀    날짜를 나타내는 것이다.
            
        여기서 숫자의 단위는 개월수 이다.     
   */
    
    
    select to_char(add_months(sysdate, -2), 'yyyy-mm-dd hh24:mi:ss') as "2개월전"
            ,to_char(sysdate, 'yyyy-mm-dd hh24:mi:ss') as "현재시각"
            , to_char(add_months(sysdate, 2), 'yyyy-mm-dd hh24:mi:ss') as "2개월후"
    from dual;
    
    -- [퀴즈] 현재일로 부터 1개월 2일 3시간 4분 5초 뒤를 나타내세요.
    select to_char(sysdate, 'yyyy-mm-dd hh24:mi:ss') as "현재시각"
        , to_char(add_months(sysdate,1) + 2 + 3/24 + 4/(24*60) + 5/(24*60*60), 'yyyy-mm-dd hh24:mi:ss') as "1개월 2일 3시간 4분 5초 뒤"
        --          1개월                2일   3시간     4분          5초
    from dual;
    -- 2024-02-19 15:14:28	    2024-03-21 18:18:33
    
    
    -- 3-2. months_between(날짜1, 날짜2) 
    /*
          날짜1 에서 날짜2 를 뺀 값으로 그 결과는 숫자가 나오는데 결과물 숫자의 단위는 개월수 이다.
          즉, 두 날짜의 개월차이를 구할 때 사용한다.
    */
    
    select months_between(add_months(sysdate, 3), sysdate)
    from dual;
    -- 3
    
    
    
    
    
    --  ****   날짜1 - 날짜2 = 숫자   ==> 날짜1 에서 날짜2 를 뺀 값으로 숫자가 나오는데 결과물 숫자의 단위는 일수 이다.
    --                                  즉, 두 날짜의 일수차이를 구할 때 사용한다.
    
    select sysdate + 3 - sysdate
    from dual;
    
    select add_months(sysdate, 1) -sysdate
    from dual;
    
    
    -- 3-3. extract ==> 날짜에서 년, 월,일을 숫자형태로 추출해주는 것이다.
    select sysdate
        , extract(year from sysdate), to_char(sysdate, 'yyyy')
        , extract(month from sysdate), to_char(sysdate, 'mm')
        , extract(day from sysdate), to_char(sysdate, 'dd')
    from dual;
    
    select to_date('2024-08-09','yyyy-mm-dd') - sysdate
        , to_date('2024/08/09','yyyy/mm/dd') - sysdate
        , to_date('20240809','yyyymmdd') - sysdate
    from dual;
    
    
    
    
    162 '901017123456'
    168 '981025223'
    173 '1111154234'
    
    update employees set jubun = '901017123456'
    where employee_id = 162;
      
    update employees set jubun = '981025223'
    where employee_id = 168;
      
    update employees set jubun = '1111154234'
    where employee_id = 173;
        
    select employee_id as "사원번호"
        , first_name || ' ' || last_name "사원명"
        , substr(jubun,1,7) || '******' as "주민번호1"
        -- 주민번호의 개수가 모두 다를 경우
        , substr(jubun, 1,7) || lpad('*',6,'*') as  "주민번호2"
        , substr(jubun, 1,7) || lpad('*',length(jubun)-7, '*') as  "주민번호3"
        
    from employees;
    
    rollback;
    
    select employee_id as "사원번호"
        , first_name || ' ' || last_name "사원명"
        
        , substr(jubun,1,7) || lpad('*',length(jubun)-7, '*') as  "주민번호1"
        , rpad(substr(jubun,1,7), length(jubun),'*') as "주민번호2"
        
        -- 숫자타입1 --
        , case substr(jubun,7,1)
        when '1' then 1900 + to_number(substr(jubun,1,2))
        when '2' then 1900 + to_number(substr(jubun,1,2))
        else 2000 + to_number(substr(jubun,1,2))
        end as "태어난년도"
        
        , case substr(jubun,7,1)
        when '1' then  '19' 
        when '2' then '19'
        else '20'
        end || substr(jubun,1,2) as "태어난년도1"
        
        -- 숫자타입2 --
        , case
        when substr(jubun,7,1) in('1', '2') then '19'
        else '20'
        end || substr(jubun,1,2) as "태어난년도2"
        
        , decode(substr(jubun,7,1),'1','19'
                                ,'2','19'
                                    ,'20') || substr(jubun,1,2) as "태어난년도3"
    
        , to_number(substr(jubun,1,2)) + case when substr(jubun,7,1) in('1','2') then 1900 else 2000 end as "태어난년도4"
    
        , to_number(substr(jubun,1,2)) + decode(substr(jubun,7,1), '1',1900,'2', 1900 , 2000) as "태어난년도5"
        
    from employees
    order by employee_id;
    
    
    
    
    select sysdate
        , to_char(sysdate, 'yyyy-mm-dd hh24:mi:ss')
        , to_char(sysdate, 'yyyy-mm-dd')
        , to_date(to_char(sysdate, 'yyyy-mm-dd'), 'yyyy-mm-dd')
        , to_char(to_date(to_char(sysdate, 'yyyy-mm-dd'), 'yyyy-mm-dd'), 'yyyy-mm-dd hh24:mi:ss')
    from dual;
    
    select employee_id as "사원번호"
    , first_name || ' ' || last_name "사원명"
    , rpad(substr(jubun,1,7), length(jubun),'*') as "주민번호2"
    , to_number(substr(jubun,1,2)) + decode(substr(jubun,7,1), '1', 1900, '2', 1900 , 2000) as "태어난년도"
    
    -- 만나이 ==> 올해 생일이 현재일과 같든지 또는 현재일 보다 과거라면 현재년도 - 태어난년도
    --       ==> 올해 생일이 현재일 보다 미래 라면 현재년도 - 태어난년도 - 1
    
    , to_date(to_char(sysdate, 'yyyy') || substr(jubun,3,4 ), 'yyyymmdd') AS 올해생일
    
    --, 올해생일 - sysdate > 0
    --    to_date(to_char(sysdate, 'yyyy') || substr(jubun,3,4), 'yyyymmdd') - to_date(to_char(sysdate, 'yyyymmdd'),'yyyy-mm-dd')
      /*
      , case
      ,when to_date(to_char(sysdate, 'yyyy') || substr(jubun,3,4), 'yyyymmdd') - to_date(to_char(sysdate, 'yyyy-mm-dd'),'yyyy-mm-dd' > 0
        then 현재년도 - 태어난년도 -1
        else 현재년도 - 태어난년도
        end as 만나이
    */
    , case
      when to_date(to_char(sysdate, 'yyyy') || substr(jubun,3,4), 'yyyymmdd') - to_date(to_char(sysdate, 'yyyy-mm-dd'),'yyyy-mm-dd') > 0
         then extract(year from sysdate) - (to_number( substr(jubun, 1, 2) ) + decode( substr(jubun, 7, 1), '1', 1900, '2', 1900, 2000 )) - 1
         else extract(year from sysdate) - (to_number( substr(jubun, 1, 2) ) + decode( substr(jubun, 7, 1), '1', 1900, '2', 1900, 2000 ))
        end as 만나이
    
    from employees
    order by employee_id;
    
    
    -- 3-4. last_day(특정날짜)
    --      ==> 특정날짜가 포함된 달력에서 맨 마지막 날짜를 알려주는 것이다.
    select sysdate, last_day(sysdate)
    from dual;
    -- 24/02/19	    24/02/29
    
    
    -- 3-5. next_day(특정날짜,'일')  '일'~'토'
    --      ==> 특정날짜로부터 다음번에 돌아오는 가장 빠른 '일'~'토' 의 날짜를 알려주는 것이다.
    select sysdate
        , next_day(sysdate,'금')
        , next_day(sysdate,'월')
    from dual;
    -- 24/02/19	    24/02/23    24/02/26
    
    
    -- 3-6. to_yminterval, to_dsinterval
    /*
     to_yminterval 은 년 과 월을 나타내어 연산자가 + 이면 날짜에서 더해주는 것이고,
     to_dsinterval 은 일 시간 분 초를 나타내어 연산자가 + 이면 날짜에서 더해주는 것이다.
     연산자가 - 를 쓰면 날짜를 빼주는 것이다.
    */
    -- 현재일로 부터 1년 2개월 3일 4시간 5분 6초 뒤를 나타내세요.
    select to_char(sysdate, 'yyyy-mm-dd hh24:mi:ss') as 현재시각
        , sysdate + to_yminterval('01-02') + to_dsinterval('003 04:05:06')
        -- 1-2 도 가능하지만 01-02를 권장            3 4:5:6도 가능 하지만 003 04:05:06 을 권장
        , to_char(sysdate + to_yminterval('01-02') + to_dsinterval('003 04:05:06'), 'yyyy-mm-dd hh24:mi:ss') as "1년 2개월 3일 4시간 5분 6초 뒤"
    from dual;
    
    
    
    
    
    
    
    -------------------------- >> 4. 변환 함수 << -------------------------------
     
    -- 4.1  to_char(날짜, '형태')  ==> 날짜를 '형태' 모양으로 문자형태로 변환시켜주는 것이다.
    --      to_char(숫자, '형태')  ==> 숫자를 '형태' 모양으로 문자형태로 변환시켜주는 것이다.
    
    --- 날짜를 문자형태로 변환하기 ---
     select to_char(sysdate, 'yyyy') AS 년도
          , to_char(sysdate, 'mm')   AS 월
          , to_char(sysdate, 'dd')   AS 일
          , to_char(sysdate, 'hh24') AS "24시간"
          , to_char(sysdate, 'am hh') AS "12시간"
          , to_char(sysdate, 'pm hh') AS "12시간"
          , to_char(sysdate, 'mi')   AS 분
          , to_char(sysdate, 'ss')   AS 초
          , to_char(sysdate, 'q')    AS 분기       -- 1월~3월 => 1,   4월~6월 => 2,   7월~9월 => 3,    10월~12월 => 4 
          , to_char(sysdate, 'day')  AS 요일명     -- 월요일(Windows) , Monday(Linux) 
          , to_char(sysdate, 'dy')   AS 줄인요일명  -- 월(Windows) , Mon(Linux)
     from dual;
    
    -- OS 가 무엇이든 상관없이 같은 결과가 나오게 하기
    select to_char(sysdate,'d') -- sysdate의 주의 일요일 부터(지금은 2024년 2월 18일) sysdate(지금은 2024년 2월 20일) 까지 며칠째 인지를 알려주는 것이다.
                                -- 1(일요일) 2(월요일) 3(화요일) 4(수요일) 5(목요일) 6(금요일) 7(토요일)
    from dual;
    
    
    select case to_char(sysdate,'d')
            when '1' then '일'
            when '2' then '월'
            when '3' then '화'
            when '4' then '수'
            when '5' then '목'
            when '6' then '금'
            when '7' then '토'
            end as "오늘의 요일명1"     -- else 가 나올 상황이 없으므로 생략
            
            , decode (to_char(sysdate,'d'),'1','일',
                                        '2','월',
                                        '3','화',
                                        '4','수',
                                        '5','목',
                                        '6','금',
                                        '7','토') as "오늘의 요일명2"
    from dual;
    
    
    select to_char(sysdate, 'dd')   -- sysdate 의 월 1일 부터(지금은 2024년 2월 1일) sysdate(지금은 2024년 2월 20일) 까지 며칠째 인지를 알려주는 것이다.
    from dual;
    
    select to_char(sysdate, 'ddd')   -- sysdate 의 년도 1월 1일 부터(지금은 2024년 1월 1일) sysdate(지금은 2024년 2월 20일) 까지 며칠째 인지를 알려주는 것이다.
    from dual;
    
    select to_char(sysdate, 'sssss')   -- sysdate 의 0시 0분 0초 부터 sysdate(guswork 2024년 2월 24일 오전 9시 18분 30초 이라면) 까지
                                    -- 흘러간 초를 말한다.
    from dual;
    
    
    --->>> 숫자를 문자형태로 변환하기 <<<---
    select 1234567890
        , to_char(1234567890,'9,999,999,999')
        , to_char(1234567890,'$9,999,999,999')
        , to_char(1234567890,'L9,999,999,999')  -- L 은 그 나라의 화폐기호 이다.
    from dual;
    -- 1234567890	 1,234,567,890	 $1,234,567,890	        ￦1,234,567,890
    
    select 100, 95.7
        ,to_char(100,'999.0')   -- 999.9 도 가능
        ,to_char(95.7,'999.0')  -- 999.0 을 하여도 소수부가 있으면 숫자가 나온다.
    from dual;
    
    
    select hakbun as 학번
        , name as 성명
        , kor as 국어
        , eng as 영어
        , math as 수학
        ,(kor + eng + math) as 총점
        , to_char(round((kor + eng + math)/3,1),'999.0') as 평균
        
        , case trunc( round( (kor + eng + math)/3, 1), -1 ) 
         when 100 then 'A'
         when  90 then 'A'
         when  80 then 'B'
         when  70 then 'C'
         when  60 then 'D'
         else 'F'
         end AS 학점1
        
    from tbl_sungjuk;
    
    
    -- 4.2 to_date(문자,'형태') ==> 문자를 '형태' 모양으로 날짜형태로 변환시켜주는 것이다.
    select '2024-02-20' +1
    from dual;
    -- ORA-01722: 수치가 부적합합니다    ==> 문자에 숫자를 더할 수 없다.
    -- 01722. 00000 -  "invalid number"     
    
    select to_date('2024-02-20', 'yyyy-mm-dd') + 1
            , to_date('2024/02/20', 'yyyy/mm/dd') + 1
            , to_date('20240220', 'yyyymmdd') + 1
    from dual;
    -- 24/02/21	24/02/21	24/02/21
    
    select to_date('2023-02-29', 'yyyy-mm-dd') + 1 -- 2023-02-29 은 달력에 없으므로 오류!!
    from dual;
    -- ORA-01839: 지정된 월에 대한 날짜가 부적합합니다
    
    
    -- 4.3  to_number(문자)  ==> 숫자모양을 가지는 문자를 숫자형태로 변환시켜주는 것이다.
   select '12345', to_number('12345'),
          '007'  , to_number('007')
   from dual;
     
     
   select to_number('50')+10
        , '50'+10   -- 자동형변환이 되어짐.
   from dual;
     

   select to_number('홍길동')
   from dual;
   -- ORA-01722: invalid number
    
 
 
 
 
 
    
    -------------------------- >> 5. 기타 함수 << -------------------------------
    
    -- 5-1. case when then else end ==> !!! 암기 !!!
    
    select case 5-2 -- case 5-2 의 값이
        when 4  then '5-2=4 입니다.'    -- when @ then : @ 인 경우
        when 1 then '5-2=1 입니다,'
        when 3 then '5-2=3 입니다,'
        else '나는 수학을 몰라요ㅜㅜ'
        end as 결과
    from dual;
    
    select case
        when 4 > 5 then '4는 5보다 큽니다.'    -- when @ then : @ 인 경우
        when 5 > 7 then '5는 7보다 큽니다.'
        when 3 > 2 then '3는 2보다 큽니다.'
        else '나는 수학을 몰라요ㅜㅜ'
        end as 결과
    from dual;
    
    -- 5-2. decode ==> !!! 암기 !!!
    
    select case 5-2 -- case 5-2 의 값이
        when 4  then '5-2=4 입니다.'    -- when @ then : @ 인 경우
        when 1 then '5-2=1 입니다,'
        when 3 then '5-2=3 입니다,'
        else '나는 수학을 몰라요ㅜㅜ'
        end as 결과1
        
        , 
        
        decode(5-2,4, '5-2=4 입니다.'
                  ,1, '5-2=1 입니다.'
                  ,3, ' 5-2=3 입니다.'
                  , '나는 수학을 몰라요ㅜㅜ') as 결과2 -------------
    from dual;
    
    ------------------------------------------------------------------------------------------------
    
        ----- ***** !!!! 아주 중요중요중요중요중요중요중요중요중요중요중요중요중요 아주 !!!! ***** -----
        ----- VIEW(뷰)란? 테이블은 아니지만 select 되어진 결과물을 마치 테이블 처럼 보는것(간주하는 것)이다.
        ----- VIEW(뷰)의 종류는 inline view 와 stored view 가 있다.
   
   
   
   
    --- >>> *** inline view 예제 *** <<< ---
    select V.*
    FROM
    (    
        select employee_id
            , first_name || ' ' || last_name as FULLNAME
            , nvl(salary + (salary * commission_pct), salary) as MONTHSAL
        from employees
    ) V;
    -- inline view 는 바로 위의 예제에 보이는 V 인 것이다. 즉, select 구문을 괄호( )를 쳐서 별칭(예 : V)을 부여한 것을 말한다.
     
    select V.*
    FROM
    (    
        select employee_id
            , first_name || ' ' || last_name as FULLNAME
            , nvl(salary + (salary * commission_pct), salary) as MONTHSAL
        from employees
    ) V
    where V.MONTHSAL between 15000 and 20000;
    
    select employee_id as 사원번호              -- V. 은 생략 가능하다.
        , fullname as 사원명                   -- 대소문자 구분 X
        , to_char(monthsal,'$99,999') as 월급     
    FROM
    (    
        select employee_id
            , first_name || ' ' || last_name as FULLNAME
            , nvl(salary + (salary * commission_pct), salary) as MONTHSAL
        from employees
    ) V
    where V.MONTHSAL between 15000 and 20000;
    
    
    -- 숫자가 아닌 날짜나 문자도 비교연산자 사용가능을 보여주기 위한 테스트
    select '1이 2보다 큽니다.'
    from dual
    where 1>2;
    
    select '2는 1보다 큽니다.'
    from dual
    where 2>1;
    
    select '2는 1보다 같거나 큽니다.'
    from dual
    where 2>=1;
    
    select '2는 1보다 같거나 큽니다.'
    from dual
    where 2>=1;
    
    select '오늘은 어제보다 같거나 뒤에 있는 날짜입니다.'
    from dual
    where sysdate >= sysdate -1;
    
    select '어제는 오늘보다 같거나 뒤에 있는 날짜입니다.'
    from dual
    where sysdate -1 >= sysdate;
    
    select 'a가 b보다 뒤에 나온다.'
    from dual
    where 'a' >= 'b';
    
    select 'b가 a보다 뒤에 나온다.'
    from dual
    where 'b' >= 'a';
    
    select 'ab가 aaxyz보다 뒤에 나온다.'
    from dual
    where 'ab' >= 'aawxyz';
    
    select 'a가 A보다 뒤에 나온다.'
    from dual
    where 'a' >= 'A';
    
    
    
    ------------------------------------
    사원번호    사원명     성별      만나이
    ------------------------------------
    >> 성별   ==> 주민번호 7번째에 나오는 글자 1개가 '1' 또는 '3' 이라면 남, '2' 또는 '4' 이라면 여
                >> 주민번호는 jubun 컬럼이 있다.
                
    만나이 ==> 올해생일이 오늘날짜와 같거나 과거이라면 현재년도 - 태어난년도
              올해생일이 오늘날짜보다 미래 이라면 현재년도 - 태어난년도 - 1
              >> 올해생일이라는 컬럼이 employees 테이블에 없다. 그러므로 올해생일이라는 컬럼을 만들어야 한다.
              >> 태어난년도이라는 컬럼이 employees 테이블에 없다. 그러므로 태어난년도이라는 컬럼을 만들어야 한다.
    SELECT employee_id as 사원번호
        , fullname as 사원명
        , gender as 성별
        
        , case when current_year_birthday > to_date(to_char(sysdate,'yyyymmdd'),'yyyymmdd') -- 날짜 연산자도 비교연산자 가능
        -- 시간이 계속 바뀌기 때문에 문자타입인 년월일 만 나타내는 것으로 바꾸어주고 다시 날짜타입로 바꾸어주기
            then extract(year from sysdate) - birthyear - 1 -- extract(year from sysdate) : 날짜에서 년만 추출
            else extract(year from sysdate) - birthyear
            end as 만나이
        
        , trunc(case when current_year_birthday > to_date(to_char(sysdate,'yyyymmdd'),'yyyymmdd')
                    then extract(year from sysdate) - birthyear - 1 
                    else extract(year from sysdate) - birthyear
                    end, -1) as 연령대                         -- => trunc(만나이, -1) 만나이를 정수 10자리까지만 보여주기 
                    
    FROM    -- FROM()V => V 대신 아무글자 사용 가능 () 안을 하나의 테이블로 보겠다는 말이다.
    (
    select employee_id  -- 사원번호
        , first_name || ' ' || last_name as FULLNAME    -- 사원명
        , case when substr(jubun,7,1) in('1','3') then '남' else '여' end as GENDER   -- 성별
        , to_date(to_char(sysdate,'yyyy') || substr(jubun,3,4), 'yyyymmdd') as "CURRENT_YEAR_BIRTHDAY" -- 올해생일 
        , case when substr(jubun,7,1) in('1','2') then '19' else '20' end || substr(jubun,1,2)  as BIRTHYEAR -- 태어난 년도 
    from employees
    ) V;
    
    -- employess 테이블에서 연령대가 20대 여자와 40대 남자만 
    -- 사원번호    사원명     성별      만나이  를 나타내세요.
    SELECT employee_id as 사원번호
        , fullname as 사원명
        , gender as 성별
        , age as 만나이
    FROM
        (
        SELECT employee_id
            , fullname
            , gender
            
            , case when current_year_birthday > to_date(to_char(sysdate,'yyyymmdd'),'yyyymmdd') -- 날짜 연산자도 비교연산자 가능
            -- 시간이 계속 바뀌기 때문에 문자타입인 년월일 만 나타내는 것으로 바꾸어주고 다시 날짜타입로 바꾸어주기
                then extract(year from sysdate) - birthyear - 1 -- extract(year from sysdate) : 날짜에서 년만 추출
                else extract(year from sysdate) - birthyear
                end as age
                        
                FROM    -- FROM()V => V 대신 아무글자 사용 가능 () 안을 하나의 테이블로 보겠다는 말이다.
                (
                select employee_id  -- 사원번호
                    , first_name || ' ' || last_name as FULLNAME    -- 사원명
                    , case when substr(jubun,7,1) in('1','3') then '남' else '여' end as GENDER   -- 성별
                    , to_date(to_char(sysdate,'yyyy') || substr(jubun,3,4), 'yyyymmdd') as "CURRENT_YEAR_BIRTHDAY" -- 올해생일 
                    , case when substr(jubun,7,1) in('1','2') then '19' else '20' end || substr(jubun,1,2)  as BIRTHYEAR -- 태어난 년도 
                 from employees
                ) V
        ) T
   WHERE (trunc(age,-1) = 20 and gender = '여') or       -- T.gender 이지만 생략가능하다.
        (trunc(age,-1) = 40 and gender = '남')
   ORDER BY 3,4;





    -- stored view 는 복잡한 SQL(Structured Query Language == 정형화된 질의어)을 저장하여 select 문을 간단하게 사용하고자 할 때 쓰인다.
    -- 그래서 inline view 는 1회성이고, stored view는 언제든지 불러내서 재사용이 가능하다.
    
    
    ---- **** Stored View (저장된 뷰) 생성하기 **** ----
    
    /*
        create or replace view 뷰명   --> 뷰명으로 되어진 view 가 없으면 create(생성) 하고,
                                    -- 만약에 뷰명으로 되어진 view 가 이미 존재한다라면 이전에 정의해둔 view 를 없애버리고 
                                    -- select 문장 으로 replace(수정) 해라는 말이다.
        as
        select 문장
    */
    
    
    create or replace view view_emp_age
    as
    SELECT employee_id
            , fullname
            , gender
            
            , case when current_year_birthday > to_date(to_char(sysdate,'yyyymmdd'),'yyyymmdd') -- 날짜 연산자도 비교연산자 가능
            -- 시간이 계속 바뀌기 때문에 문자타입인 년월일 만 나타내는 것으로 바꾸어주고 다시 날짜타입로 바꾸어주기
                then extract(year from sysdate) - birthyear - 1 -- extract(year from sysdate) : 날짜에서 년만 추출
                else extract(year from sysdate) - birthyear
                end as age
                        
FROM    -- FROM()V => V 대신 아무글자 사용 가능 () 안을 하나의 테이블로 보겠다는 말이다.
(
select employee_id  -- 사원번호
    , first_name || ' ' || last_name as FULLNAME    -- 사원명
    , case when substr(jubun,7,1) in('1','3') then '남' else '여' end as GENDER   -- 성별
    , to_date(to_char(sysdate,'yyyy') || substr(jubun,3,4), 'yyyymmdd') as "CURRENT_YEAR_BIRTHDAY" -- 올해생일
    , case when substr(jubun,7,1) in('1','2') then '19' else '20' end || substr(jubun,1,2)  as BIRTHYEAR -- 태어난 년도
 from employees
) V;
    -- View VIEW_EMP_AGE이(가) 생성되었습니다.
    
    select *
    from view_emp_age;
    
    
    -- employess 테이블에서 연령대가 20대 여자와 40대 남자만 
    -- 사원번호    사원명     성별      만나이  를 나타내세요.
    
    select *
    from view_emp_age
    where (trunc(age,-1) = 20 and gender = '여') or
        (trunc(age,-1) = 40 and gender = '남')
    order by gender, age;
    
    -- 현재 있는 테이블과 뷰 확인
    select *
    from tab;
    -- 접두어로 쓰려고 하기!
    -- TBL_~~, VIEW_~~
    
    -- 테이블 또는 뷰 에 존재하는 컬럼명, null, 유형 확인하기
    desc view_emp_age;
    
    
    
    
    
    --- *** Stored View (저장된 뷰)의 원본소스(select문) 알아보기 *** ---
    select *
    from user_views;
    
    select text
    from user_views
    where view_name = 'VIEW_EMP_AGE';   -- ==> 메모장 등을 통해 확인 가능
    
    
    
    
    
    
    --- *** view_emp_age 이라는 Stored View (저장된 뷰) 수정하기 *** ---   => 주민번호 추가
    create or replace view view_emp_age
    as
    SELECT employee_id
            , fullname
            , jubun
            , gender
            
            , case when current_year_birthday > to_date(to_char(sysdate,'yyyymmdd'),'yyyymmdd') -- 날짜 연산자도 비교연산자 가능
            -- 시간이 계속 바뀌기 때문에 문자타입인 년월일 만 나타내는 것으로 바꾸어주고 다시 날짜타입로 바꾸어주기
                then extract(year from sysdate) - birthyear - 1 -- extract(year from sysdate) : 날짜에서 년만 추출
                else extract(year from sysdate) - birthyear
                end as age
                        
                FROM    -- FROM()V => V 대신 아무글자 사용 가능 () 안을 하나의 테이블로 보겠다는 말이다.
                (
                select employee_id  -- 사원번호
                    , first_name || ' ' || last_name as FULLNAME    -- 사원명
                    , rpad(substr(jubun,1,7),length(jubun),'*') as JUBUN  -- 주민번호
                    , case when substr(jubun,7,1) in('1','3') then '남' else '여' end as GENDER   -- 성별
                    , to_date(to_char(sysdate,'yyyy') || substr(jubun,3,4), 'yyyymmdd') as "CURRENT_YEAR_BIRTHDAY" -- 올해생일 
                    , case when substr(jubun,7,1) in('1','2') then '19' else '20' end || substr(jubun,1,2)  as BIRTHYEAR -- 태어난 년도 
                 from employees
                ) V;
    -- View VIEW_EMP_AGE이(가) 생성되었습니다.
    
    -- 바뀐 모습 확인하기
    select *
    from view_emp_age;
    
    
    -------------------------------------------------------------------------------------------------
   
    /*
        --- [퀴즈] ---
        employees 테이블에서 모든 사원들에 대해
        사원번호, 사원명, 주민번호, 성별, 현재나이, 월급, 입사일자, 정년퇴직일, 정년까지근무개월수, 퇴직금 을 나타내세요.
        
        여기서 정년퇴직일이라 함은 
        해당 사원의 생월이 3월에서 8월에 태어난 사람은 
        해당사원의 나이가 63세가 되는 년도의 8월말일(8월 31일)로 하고,
        해당사원의 생월이 9월에서 2월에 태어난 사람은 
        해당사원의 나이가 63세가 되는 년도의 2월말일(2월 28일 또는 2월 29일)로 한다.
        
        퇴직금 : 월급 * 근무년수
    */
    
    desc employees;

--- 내방법
    SELECT employee_id as 사원번호
         , fullname as 사원명
         , jubun as 주민번호
         , gender as 성별
         , age as 현재나이
         , to_char(month_money,'99,999')  as 월급
         , hire_date as 입사일자
         , finish_day as 정년퇴직일
         , trunc(months_between(finish_day, hire_date),0) || '개월' as 정년까지근무개월수    -- 정년까지근무개월수
         , to_char(trunc(month_money * (trunc(months_between(finish_day, hire_date),0)/12),0) ,'9,999,999') as 퇴직금   -- 퇴직금
         
    FROM
    (
    SELECT employee_id      -- 사원번호
            , fullname      -- 사원명
            , jubun         -- 주민번호
            , gender        -- 성별
            , age           -- 현재나이
            , month_money   -- 월급
            , hire_date     -- 입사일자
            , last_day(to_date(to_char(add_months(sysdate, (63-age)*12),'yyyy') ||
                    case when substr(jubun,3,2) between '03' and '08'then '-08-01'
                    else '-02-01'
                    end
                    ,'yyyy-mm-dd')) as finish_day   -- 정년퇴직일
        FROM
        (
        SELECT employee_id, fullname, jubun, gender    -- 성별
                
                , case when current_year_birthday > to_date(to_char(sysdate,'yyyymmdd'),'yyyymmdd') -- 날짜 연산자도 비교연산자 가능
                -- 시간이 계속 바뀌기 때문에 문자타입인 년월일 만 나타내는 것으로 바꾸어주고 다시 날짜타입로 바꾸어주기
                    then extract(year from sysdate) - birthyear - 1 -- extract(year from sysdate) : 날짜에서 년만 추출
                    else extract(year from sysdate) - birthyear
                    end as age      -- 현재나이
                , month_money    -- 월급
                , hire_date     -- 입사일자
                /* 만나이 반영 없이
                , case when (substr(jubun,3,4) >= 0301 and substr(jubun,3,4) < 0901)
                    then last_day(to_date(birthyear+63 || '0801','yyyymmdd'))-- '31'    
                    else last_day(to_date(birthyear+63 || '0201','yyyymmdd'))-- '28'   
                    end as finish_day        -- 정년퇴직일
                */          
                    FROM    -- FROM()V => V 대신 아무글자 사용 가능 () 안을 하나의 테이블로 보겠다는 말이다.
                    (
                    select employee_id  -- 사원번호
                        , first_name || ' ' || last_name as FULLNAME    -- 사원명
                        , rpad(substr(jubun,1,7),length(jubun),'*') as JUBUN  -- 주민번호
                        , case when substr(jubun,7,1) in('1','3') then '남' else '여' end as GENDER   -- 성별
                        , to_date(to_char(sysdate,'yyyy') || substr(jubun,3,4), 'yyyymmdd') as "CURRENT_YEAR_BIRTHDAY" -- 올해생일 
                        , case when substr(jubun,7,1) in('1','2') then '19' else '20' end || substr(jubun,1,2)  as BIRTHYEAR -- 태어난 년도 
                        , NVL(salary + (salary * commission_pct), salary) as month_money  -- 월급
                        , hire_date   -- 입사일자
                        
                     from employees
                    ) V
        ) T
    ) A;



    
    -- 강사님 --
    
    -- >>> 만들어야 할 컬럼 : 성별, 현재나이, 정년퇴직일, 정년까지 근무개월 수, 퇴직금 <<< --
    --      정년퇴직일
    --      사원의 나이가 63세가 되는 해
    --      62세 : 지금으로 부터 1년 뒤가 63세가 되는 해   ==> add_months(sysdate, 1*12)   ==> add_months(sysdate, (63-62)*12) 
    -- ==> add_months(sysdate, (63-현재나이)*12)    ==> to_char(add_months(sysdate, (63-현재나이)*12),'yyyy')
    --      37세 : 지금으로 부터 26년 뒤가 63세가 되는 해  ==> add_months(sysdate, 26*12)  ==> add_months(sysdate, (63-37)*12) 
    -- ==> add_months(sysdate, (63-현재나이)*12)    ==> to_char(add_months(sysdate, (63-현재나이)*12),'yyyy')
    
    SELECT employee_id as 사원번호
        , fullname as 사원명
        , jubun as 주민번호
        , gender as 성별
        , age as 만나이
        , to_char(monthsal,'99,999') as 월급
        , to_char(hire_date,'yyyy-mm-dd') as 입사일자
        , to_char(retire_day,'yyyy-mm-dd') as 정년퇴직일
        , trunc(months_between(retire_day, hire_date),0) || '개월' as 정년까지근무개월수  -- 정년까지근무개월수
        , to_char(trunc(monthsal * months_between(retire_day, hire_date)/ 12, 0),'9,999,999')  as 퇴직금                            -- 퇴직금
    
    FROM
    (
    SELECT employee_id, fullname, jubun, gender, age, monthsal, hire_date           -- 사원번호, 사원명, 주민번호, 성별, 현재나이, 월급, 입사일자
        , last_day(to_date(to_char(add_months(sysdate, (63-age)*12),'yyyy') ||      
            -- birthyear은 태어난년도임으로 만으로 나이가 지났는지아닌지 확인이 불가하여 (63-age)를 해야한다.
            -- sysdate 에서 (63-age) = 남은 년도
            -- add_months 는 개월 수를 더해주는 것으로 (63-age)* 12 를 해주어야 한다.
                    case when substr(jubun,3,2) between '03' and '08'then '-08-01'
                    else '-02-01'
                    end
                    ,'yyyy-mm-dd')) as retire_day                                   -- 정년퇴직일
    FROM
    (
        SELECT employee_id
                , fullname
                , jubun
                , gender
                , case when current_year_birthday > to_date(to_char(sysdate,'yyyymmdd'),'yyyymmdd') -- 날짜 연산자도 비교연산자 가능
                -- 시간이 계속 바뀌기 때문에 문자타입인 년월일 만 나타내는 것으로 바꾸어주고 다시 날짜타입로 바꾸어주기
                    then extract(year from sysdate) - birthyear - 1 -- extract(year from sysdate) : 날짜에서 년만 추출
                    else extract(year from sysdate) - birthyear
                    end as age  -- 현재나이
                , monthsal
                , hire_date
                            
        FROM   
            (
            select employee_id  -- 사원번호
                , first_name || ' ' || last_name as FULLNAME    -- 사원명
                , JUBUN  -- 주민번호
                , case when substr(jubun,7,1) in('1','3') then '남' else '여' end as GENDER   -- 성별
                , to_date(to_char(sysdate,'yyyy') || substr(jubun,3,4), 'yyyymmdd') as "CURRENT_YEAR_BIRTHDAY" -- 올해생일 
                , case when substr(jubun,7,1) in('1','2') then '19' else '20' end || substr(jubun,1,2)  as BIRTHYEAR -- 태어난 년도 
                
                , nvl(salary + (salary * commission_pct),salary) as monthsal    -- 월급
                , hire_date -- 입사일자
             from employees
        ) V
    ) T
 ) A;   
    
    
   ------------------------------------------------------------------------------------------------------------------------------------
   
    -- 5.3  greatest , least 
    select greatest(10, 90, 100, 80)  -- 나열되어진것들 중에 제일큰값을 알려주는 것
          , least(10, 90, 100, 80)    -- 나열되어진것들 중에 제일작은값을 알려주는 것
    from dual;
    -- 100    10
     
    select greatest('김유신','허준','고수','엄정화')  -- 나열되어진것들 중에 제일큰값을 알려주는 것
          , least('김유신','허준','고수','엄정화')    -- 나열되어진것들 중에 제일작은값을 알려주는 것
    from dual;
    -- 허준    고수
    
    select greatest(to_date('2024-01-01','yyyy-mm-dd'), sysdate+5, sysdate)  -- 나열되어진것들 중에 제일큰값을 알려주는 것
      , least(to_date('2024-01-01','yyyy-mm-dd'), sysdate+5, sysdate)        -- 나열되어진것들 중에 제일작은값을 알려주는 것
    from dual;
    
    
    
    
    
    
    --5-4. rank ==> 등수(석차)구하기   , dense_rank ==> 서열구하기
    select employee_id as 사원번호
        , first_name || ' ' || last_name as 사원명
        , nvl(salary + (salary * commission_pct), salary) as 월급
        , rank() over(order by nvl(salary + (salary * commission_pct), salary) desc) as 전체월급등수 -- 월급에 대한 내림차순한 값(공동등수가 있으면 밀림)
        , dense_rank() over(order by nvl(salary + (salary * commission_pct), salary) desc) as 전체월급서열 -- 월급에 대한 서열 (공동등수가 있어도 밀리지 않음)
    from employees;
    
    
    select employee_id as 사원번호
        , first_name || ' ' || last_name as 사원명
        , nvl(salary + (salary * commission_pct), salary) as 월급
        , department_id as 부서번호
        
        , rank() over(order by nvl(salary + (salary * commission_pct), salary) desc) as 전체월급등수 
        , rank() over(partition by department_id order by nvl(salary + (salary * commission_pct), salary) desc) as "부서 내 월급등수"
        
        , dense_rank() over(order by nvl(salary + (salary * commission_pct), salary) desc) as 전체월급서열
        , dense_rank() over(partition by department_id order by nvl(salary + (salary * commission_pct), salary) desc) as "부서 내 월급서열" 
    from employees;
    
    
    --- employees 테이블에서 월급의 등수가 1등 부터 10등 까지인 사원들만
    --- 사원번호, 사원명, 월급, 월급등수를 나타내세요.
    
    select  employee_id as 사원번호
        , first_name || ' ' || last_name as 사원명
        , nvl(salary + (salary * commission_pct), salary) as 월급
        , rank() over(order by nvl(salary + (salary * commission_pct), salary) desc) as 월급등수
    from employees
    where rank() over(order by nvl(salary + (salary * commission_pct), salary) desc) <= 10;
    -- ORA-30483: 윈도우 함수를 여기에 사용할 수 없습니다
    -- 오류이다.!! 왜냐하면 rank() 함수와 dense_rank() 함수는 where 절에 막바로 쓸수가 없습니다.
    -- rank 함수는 where 절에서 사용할 수 없다.
    
    -- !!!! 이럴때 inline view 를 사용하여 구한다.!!!!!!!!
    SELECT *
    FROM
    (
    select  employee_id as 사원번호
        , first_name || ' ' || last_name as 사원명
        , to_char(nvl(salary + (salary * commission_pct), salary),'99,999') as 월급
        , rank() over(order by nvl(salary + (salary * commission_pct), salary) desc) as 월급등수
    from employees
    ) V
    WHERE 월급등수 <= 10;
    
    
    --- [퀴즈] 각 부서번호별로 월급에 대한 등수가 1등인 사원들만 아래와 같이 나오도록 하세요.
    ------------------------------------------------------------------------------
    부서번호    사원번호    사원명             월급      부서내등수   전체등수    
    10        200   Jennifer Whalen        4,400        1         61
    20        201   Michael Hartstein     13,000        1         12
    30        114   Den Raphaely          11,000        1         23
    40        203   Susan Mavris           6,500        1         54
    50        121   Adam Fripp             8,200        1         39
    60        103   Alexander Hunold       9,000        1         32
    70        204   Hermann Baer          10,000        1         29
    80        145   John Russell          19,600        1          2
    90        100   Steven King           24,000        1          1
   100        108   Nancy Greenberg       12,008        1         17
   110        205   Shelley Higgins       12,008        1         17
   null       178   Kimberely Grant        8,050        1         41
   
    desc employees;
   
    select department_id as 부서번호
        , employee_id as 사원번호
        , full_name as 사원명
        , month_money as 월급
        , department_rank as 부서내등수
        , total_rank as 전체등수
        from
        (
        select department_id, employee_id       -- 부서번호, 사원번호
            , first_name || ' ' || last_name as full_name   -- 사원명
            , to_char(nvl(salary + (salary * commission_pct), salary),'99,999') as month_money  -- 월급
            , rank() over(partition by department_id order by nvl(salary + (salary * commission_pct), salary) desc) as department_rank  -- 부서내등수
            , rank() over(order by nvl(salary + (salary * commission_pct), salary) desc) as total_rank  -- 전체등수
            
        from employees
        ) v
    where department_rank = 1;
    
    
    
    select employee_id, department_id, salary
    from employees;
    
    
    
    
    
    
    
    -- 5-5. lag, lead 함수 ==> 웹의 게시판 또는 상품보기 등등 에서 특정글(특정상품)을 조회할 때 많이 사용합니다.
    create table tbl_board                                                                                                                      
    (boardno       number                -- 글번호   -- number 는 22byte 를 차지하며, 38자리까지 표현 가능하다. 10의 -130승 ~ 10의 126승 까지 숫자를 저장할 수 있다. 
    ,subject       varchar2(4000)        -- 글제목   varchar2 의 최대크기는 4000 이다. 4000 보다 크면 오류!!!
    ,content       Nvarchar2(2000)       -- 글내용   Nvarchar2 의 최대크기는 2000 이다. 2000 보다 크면 오류!!!
    ,userid        varchar2(40)          -- 글쓴이의 ID
    ,registerday   date default sysdate  -- 작성일자   default sysdate 은 데이터 입력시 registerday 컬럼의 값을 생략하면 기본적으로 sysdate 가 입력된다는 말이다. 
    ,readcount     number(10)            -- 조회수
    );
    -- Table TBL_BOARD이(가) 생성되었습니다.
    
    insert into tbl_board(boardno, subject, content, userid, registerday, readcount)
    values(1,'안녕하세요','글쓰기 연습입니다','leess', sysdate, 0);
    -- 1 행 이(가) 삽입되었습니다.
    
    select *
    from tbl_board;
    
    desc tbl_board;
    
    insert into tbl_board   -- 컬럼을 입력하지 않으면 초기 생성한 순서 따라간다.
    values('반갑습니다',2,'모두 취업대박','eomjh', sysdate, 0);
    /*
    오류 보고 -
    ORA-01722: 수치가 부적합합니다
    */
    
    insert into tbl_board(subject, boardno, content, userid, readcount, registerday)    -- 컬럼명을 적어주는 것을 권장
    values('반갑습니다',2,'모두 취업대박나십시요','eomjh', 0, sysdate);
    -- 1 행 이(가) 삽입되었습니다.
    
    insert into tbl_board(boardno, subject, content, userid, registerday, readcount)
    values(3,'건강하세요','로또 1등을 기원합니다','youks', default, 0);   -- 설정해둔 default 값이 입력된다.
    -- 1 행 이(가) 삽입되었습니다.
    
    insert into tbl_board(boardno, subject, content, userid, readcount)
    values(4,'기쁘고 감사함이 넘치는 좋은 하루되세요','늘 행복하세요','leess',0);
    -- 1 행 이(가) 삽입되었습니다.
    insert into tbl_board(boardno, subject, content, userid, readcount)
    values(5,'오늘도 좋은 하루되세요','늘 감사합니다','hongkd',0);
    -- 1 행 이(가) 삽입되었습니다.
    
    select *
    from tbl_board;
    
    commit;
    -- 커밋 완료.
    
    
    
    
    
    
    /*
      ----------------------------------------------------------------------------------------------------------------------------------------------------------------------
        이전글번호      이전글제목                           글번호    글제목                                글내용                 다음글번호    다음글제목
      ---------------------------------------------------------------------------------------------------------------------------------------------------------------------- 
         NULL          NULL                                 5      오늘도 좋은 하루되세요                 늘 감사합니다               4       기쁘고 감사함이 넘치는 좋은 하루되세요 
         5              오늘도 좋은 하루되세요                 4      기쁘고 감사함이 넘치는 좋은 하루되세요    늘 행복하세요               3       건강하세요
         4              기쁘고 감사함이 넘치는 좋은 하루되세요   3      건강하세요                           로또 1등을 기원합니다         2        반갑습니다
         3              건강하세요                           2      반갑습니다                           모두 취업대박 나십시오         1       안녕하세요
         2              반갑습니다                           1      안녕하세요                           글쓰기 연습입니다            NULL      NULL 
      ----------------------------------------------------------------------------------------------------------------------------------------------------------------------
    
                    1 2 3 4 5 6 7 8 9 10 다음
         이전(최근)  11 12 13 14 15 16 17 18 19 20 다음(과거)
    */ 
    
    select lag(boardno,1) over(order by boardno desc) as 이전글번호
        -- boardno(글번호) 컬럼의 값을 내림차순으로 정렬했을때 위쪽으로 1칸 올라간 행에서 boardno 컬럼의 값을 가져온다.
        , lag(subject,1) over(order by boardno desc) as 이전글제목
        -- boardno(글번호) 컬럼의 값을 내림차순으로 정렬했을때 위쪽으로 1칸 올라간 행에서 subject 컬럼의 값을 가져온다.
        , boardno as 글번호
        , subject as 글제목
        , content as 글내용
        , lead(boardno,1) over(order by boardno desc) as 다음글번호
          -- boardno(글번호) 컬럼의 값을 내림차순으로 정렬했을때 아래쪽으로 1칸 올라간 행에서 boardno 컬럼의 값을 가져온다.
        , lead(subject,1) over(order by boardno desc) as 다음글제목
          -- boardno(글번호) 컬럼의 값을 내림차순으로 정렬했을때 아래쪽으로 1칸 올라간 행에서 subject 컬럼의 값을 가져온다.
    from tbl_board;
    
    
    select lag(boardno,2) over(order by boardno desc) as 이전글번호
        -- boardno(글번호) 컬럼의 값을 내림차순으로 정렬했을때 위쪽으로 2칸 올라간 행에서 boardno 컬럼의 값을 가져온다.
        , lag(subject,2) over(order by boardno desc) as 이전글제목
        -- boardno(글번호) 컬럼의 값을 내림차순으로 정렬했을때 위쪽으로 2칸 올라간 행에서 subject 컬럼의 값을 가져온다.
        , boardno as 글번호
        , subject as 글제목
        , content as 글내용
        , lead(boardno,2) over(order by boardno desc) as 다음글번호
          -- boardno(글번호) 컬럼의 값을 내림차순으로 정렬했을때 아래쪽으로 2칸 올라간 행에서 boardno 컬럼의 값을 가져온다.
        , lead(subject,2) over(order by boardno desc) as 다음글제목
          -- boardno(글번호) 컬럼의 값을 내림차순으로 정렬했을때 아래쪽으로 2칸 올라간 행에서 subject 컬럼의 값을 가져온다.
    from tbl_board;
    
    -- 숫자가 없으면 1칸을 뜻한다.
    select lag(boardno) over(order by boardno desc) as 이전글번호
        -- boardno(글번호) 컬럼의 값을 내림차순으로 정렬했을때 위쪽으로 1칸 올라간 행에서 boardno 컬럼의 값을 가져온다.
        , lag(subject) over(order by boardno desc) as 이전글제목
        -- boardno(글번호) 컬럼의 값을 내림차순으로 정렬했을때 위쪽으로 1칸 올라간 행에서 subject 컬럼의 값을 가져온다.
        , boardno as 글번호
        , subject as 글제목
        , content as 글내용
        , lead(boardno) over(order by boardno desc) as 다음글번호
          -- boardno(글번호) 컬럼의 값을 내림차순으로 정렬했을때 아래쪽으로 1칸 올라간 행에서 boardno 컬럼의 값을 가져온다.
        , lead(subject) over(order by boardno desc) as 다음글제목
          -- boardno(글번호) 컬럼의 값을 내림차순으로 정렬했을때 아래쪽으로 1칸 올라간 행에서 subject 컬럼의 값을 가져온다.
    from tbl_board;
    
    
    -- subject 컬럼의 값의 길이가 16 보다 크면 subject 컬럼의 값 중 16글자만 보여주고 뒤에 ... 을 붙여서 나타내세요.
     /*
      ----------------------------------------------------------------------------------------------------------------------------------------------------------------------
        이전글번호      이전글제목                           글번호    글제목                                글내용                 다음글번호    다음글제목
      ---------------------------------------------------------------------------------------------------------------------------------------------------------------------- 
         NULL          NULL                                 5      오늘도 좋은 하루되세요                 늘 감사합니다               4       기쁘고 감사함이 넘치는 좋은 하루되세요 
         5              오늘도 좋은 하루되세요                 4      기쁘고 감사함이 넘치는 좋은 하루되세요    늘 행복하세요               3       건강하세요
         4              기쁘고 감사함이 넘치는 좋은 ...        3      건강하세요                           로또 1등을 기원합니다         2        반갑습니다
         3              건강하세요                           2      반갑습니다                           모두 취업대박 나십시오         1       안녕하세요
         2              반갑습니다                           1      안녕하세요                           글쓰기 연습입니다            NULL      NULL 
      ----------------------------------------------------------------------------------------------------------------------------------------------------------------------
    
         이전(최근)  11 12 13 14 15 16 17 18 19 20 다음(과거)
    */   
    
    
    select lag(boardno) over(order by boardno desc) as 이전글번호
        , lag(case when length(subject) > 19 then substr(subject,1,16) || '...' else subject end)
         over(order by boardno desc) as 이전글제목
        , boardno as 글번호
        , case when length(subject) > 19 then substr(subject,1,16) || '...' else subject end as 글제목
        , content as 글내용
        , lead(boardno) over(order by boardno desc) as 다음글번호
        , lead(case when length(subject) > 19 then substr(subject,1,16) || '...' else subject end)
         over(order by boardno desc)as 다음글제목
    from tbl_board;
    
    -- 또는
    SELECT lag(boardno) over(order by boardno desc) as 이전글번호
        , lag(subject) over(order by boardno desc) as 이전글제목
        , boardno as 글번호
        , subject as 글제목
        , content as 글내용
        , lead(boardno) over(order by boardno desc) as 다음글번호
        , lead(subject) over(order by boardno desc) as 다음글제목
    FROM
    (
    select boardno
        ,case when length(subject) > 19 then substr(subject,1,16) || '...' else subject end as subject
        , content
    from tbl_board
    ) V;
    --> lag와 lead 를 바꾸고 desc 가아니라 asc 를 하면
    -- 글번호 순서가 맨위가 제일 과거가 뜸으로 바꾸어 사용하면 안된다.
    -- 최신글이 맨위로 가려면 order by 를 통해 잡아주고 lag와 lead 를 위치시키면 된다.
    
    
    
    -- [퀴즈] 아래와 같이 나오도록 하세요.
     ----------------------------------------------------------------------------------------------------------------------------------------------------------------------
        이전글번호      이전글제목                           글번호    글제목                                글내용                 다음글번호    다음글제목
      ---------------------------------------------------------------------------------------------------------------------------------------------------------------------- 
         4              기쁘고 감사함이 넘치는 좋은 ...        3      건강하세요                           로또 1등을 기원합니다         2        반갑습니다
      ----------------------------------------------------------------------------------------------------------------------------------------------------------------------
    --- 내가 한 풀이 ---
    SELECT fu_boardno as 이전글번호
        , fu_subject as 이전글제목
        , boardno as 글번호
        , subject as 글제목
        , content as 글내용
        , la_boardno as 다음글번호
        , la_subject as 다음글제목
    FROM
    (  
    select lag(boardno) over(order by boardno desc) as fu_boardno
        , lag(case when length(subject) > 19 then substr(subject,1,16) || '...' else subject end)
         over(order by boardno desc) as fu_subject
        , boardno
        , case when length(subject) > 19 then substr(subject,1,16) || '...' else subject end as subject
        , content
        , lead(boardno) over(order by boardno desc) as la_boardno
        , lead(case when length(subject) > 19 then substr(subject,1,16) || '...' else subject end)
         over(order by boardno desc)as la_subject
    from tbl_board
    ) V
    where boardno = 3;
    
    --- 틀린 풀이 ---
    select lag(boardno) over(order by boardno desc) as 이전글번호
        , lag(case when length(subject) > 19 then substr(subject,1,16) || '...' else subject end)
         over(order by boardno desc) as 이전글제목
        , boardno as 글번호
        , case when length(subject) > 19 then substr(subject,1,16) || '...' else subject end as 글제목
        , content as 글내용
        , lead(boardno) over(order by boardno desc) as 다음글번호
        , lead(case when length(subject) > 19 then substr(subject,1,16) || '...' else subject end)
         over(order by boardno desc)as 다음글제목
    from tbl_board
    where boardno = 3;
    
    --- *** 아래가 올바른 풀이이다.
    SELECT BEFORE_BOARDNO as 이전글번호
        , BEFORE_BOARDNO as 이전글제목
        , BOARDNO as 글번호
        , SUBJECT as 글제목
        , CONTENT as 글내용
        , After_Boardno as 다음글번호
        , AFTER_SUBJECT as 다음글제목
    FROM
    (
    select lag(boardno) over(order by boardno desc) as BEFORE_BOARDNO
        , lag(case when length(subject) > 19 then substr(subject,1,16) || '...' else subject end)
         over(order by boardno desc) as BEFORE_BOARDNO
        , BOARDNO
        , case when length(subject) > 19 then substr(subject,1,16) || '...' else subject end as SUBJECT
        , CONTENT
        , lead(boardno) over(order by boardno desc) as After_Boardno
        , lead(case when length(subject) > 19 then substr(subject,1,16) || '...' else subject end)
         over(order by boardno desc)as AFTER_SUBJECT
    from tbl_board
    ) V
    WHERE V.BOARDNO = 3;
    
    
    
    
    
    
    
    
    ------------------------------------------------------------------------------------------------------
    
    
             ------ >> 그룹함수(집계함수) << ------
    
    
/*
        1. sum       -- 합계
        2. avg       -- 평균
        3. max       -- 최댓값
        4. min       -- 최솟값
        5. median    -- 중앙값
        6. count     -- select 되어서 나온 결과물의 행의 개수 
        7. variance  -- 분산
        8. stddev    -- 표준편차
        
        분산 : 분산의 제곱근이 표준편차     (평균에서 떨어진 정도)
        표준편차 : 표준편차의 제곱승이 분산  (평균과의 차액)
    
    
    
    
    
    <<연봉>>
    'A'부서
    1000   1200   1100   1300   1100   6200 
    
    select 1000 +  1200 +  1100 +  1300 + 1100 +  6200 
    from dual;  --> 11900
    
    select (1000 +  1200 +  1100 +  1300 + 1100 +  6200) / 6
    from dual;  -- 1983.333333333333333333333333333333333333
    
    'B'부서
    1800   2200   2100   1700   2100   2000 
    
    select 1800 +  2200 +  2100 +  1700 + 2100 +  2000 
    from dual;  --> 11900
       
    select (1800 +  2200 +  2100 +  1700 + 2100 +  2000) / 6 
    from dual;  --> 1983.333333333333333333333333333333333333
    
    
    
    
    >>> 주식투자 <<<
    50  60  40  50  55  45  52  48   평균 50    편차가 적음   -- 안정투자
    10  90  20  80  30  70  90  10   평균 50    편차가 큼     -- 투기성투자(위험을 안고서 투자함) 
    
    분산과 표준편차는 어떤 의사결정시 도움이 되는 지표이다.

*/
    
    select sum(salary)
    from employees;
    -- 그룹함수(집계함수)는 결과값이 1개행만 나온다.
    
    select substr(jubun,7,1)
    from employees;
    -- 단일행함수는 결과값이 메모리에 로드되어진 행의 개수만큼 동일한 개수로 나온다.
    
    
    ----- **** !!!!!!! ★★ 중요중요중요중요중요중요 ★★ !!!!!! **** -----
    -- 그룹함수(집계함수)에서는 null 이 있으면 무조건 null 은 제외시킨 후 연산을 한다.!!!
    
    select 20 + 57 + 178 + 48 + null + 109
    from dual;  -- null
    
    select 20 + 57 + 178 + 48 + null + 109
    from dual;  -- 407
    
    select sum(salary * commission_pct)
    from employees; -- 73690
    
    select salary * commission_pct
    from employees
    where commission_pct is not null;   -- 73690
    
    select salary
    from employees;
    
    select sum(salary), avg(salary), max(salary), min(salary), median(salary), variance(salary), stddev(salary)
    from employees;
    -- 691416	6461.831775700934579439252336448598130841	24000	2100	6200	15284813.66954681713983424440134015164874	3909.579730552481921059198878167256201202
    
    desc employees;
    -- EMPLOYEE_ID    NOT NULL
    -- SALARY
    -- COMMISSION_PCT
    -- DEPARTMENT_ID
    
    select employee_id
    from employees;
    
    select commission_pct
    from employees;
    
    select department_id
    from employees;
    
    select count(employee_id) as "사원번호"
        , count(department_id) as "부서번호가 NULL 이 아닌 사원 수"
        , count(commission_pct) as "Commission_pct 가 NULL 이 아닌 사원 수"
    from employees;
    
    --- employees 테이블에 입력되어진 행의 개수(즉, 사원수)는 어떻게 구할까요?
    select count(employee_id), count(*)
    from employees;
    
    -- 권장방법 -- 
    select count(*)
    from employees;
    
    
    -- tbl_board 테이블에 입력되어진 행의 개수(즉, 사원수)는 어떻게 구할까요?
    desc tbl_board;
    
    select count(boardno), count(*) -- 모든 컬럼이 null 이 있는 경우는 없으니 count(*) 방법을 시행한다.
    from tbl_board; -- 5
    
    
    
    ---- **** avg(평균)을 구하실때는 주의를 요합니다. **** ----
    
    -- employees 테이블에서 기본급여(salary)의 평균치를 구하세요.
    
    select sum(salary), count(salary)   -- 691416   107
        , sum(salary) / count(salary)   -- 691416 / 107 = 6461.831775700934579439252336448598130841
        , avg(salary)                   -- 6461.831775700934579439252336448598130841
    from employees;
    
    -- employees 테이블에서 수당급여(salary * commission_pct)의 평균치를 구하세요.
    select sum(salary * commission_pct), count(salary * commission_pct) -- 73690	35
        , sum(salary * commission_pct) / count(salary * commission_pct) -- 73690 / 35 = 2105.428571428571428571428571428571428571
        , avg(salary * commission_pct)  -- 2105.428571428571428571428571428571428571
        -- 모든 사원이 아닌 수당급여를 받는 사원들의 평균치이다.
        -- NULL 값을 빼기 때문에 NULL 이 아닌 사원 == 수당급여를 받는 사원
    from employees;
    
    select avg(salary * commission_pct) -- 2105.428571428571428571428571428571428571
    from employees; --> 이것은 수당금액을 받는 사원들(35명)만의 수당금액의 평균값을 구하는 것이다.
    
    select salary * commission_pct,nvl(salary * commission_pct,0)
    from employees;
    
    select avg(salary * commission_pct),avg(nvl(salary * commission_pct,0))
    from employees;
    -- 2105.428571428571428571428571428571428571    688.691588785046728971962616822429906542
    -- avg(salary * commission_pct) 은 수당금액을 받는 사원들(35명)만의 수당금액의 평균값이고,
    -- avg(nvl(salary * commission_pct,0)) 은 수당금액이 NULL 인 사원들은 수당금액을 0 으로 계산하여 모든 사원들(107명)의 수당금액의 평균값이다.
    
    
    
    
    
    ---- *** 그룹함수(집계함수)와 함께 사용되어지는 group by 절에 대해서 알아봅니다. *** ----
    
    --- employees 테이블에서 부서번호별로 인원수를 나타내세요.
    
    select count(*)
    from employees
    where department_id = 30;   -- 6
    
    select count(*)
    from employees
    where department_id = 50;   -- 45
    
    /*
        ------------------
        부서번호    인원수
        ------------------
          10        1
          20        2
          30        6
          40        1
          50       45
          60        5
          70        1
          80       34
          90        3
         100        6
         110        2
        (NULL)      1
    */
    
    select department_id as 부서번호
         , count(*) as 인원수
    from employees
    group by department_id  -- department_id 컬럼의 값이 같은것끼리 그룹을 짓는다.
    order by 1;
    -- 그룹을 가지는 조건 : Ex) 부서번호별로 ~~ => 부서번호가 같은 것 끼리
    
    
    --- employees 테이블에서 성별로 인원수를 나타내세요. ---
    
    ------------------
     성별      인원수
    ------------------
     남         56
     여         51
    
    
    SELECT gender as 성별, count(*) as 인원수
    FROM
    (
        select case when substr(jubun,7,1) in('1','3')
            then '남'
            else '여'
            end as gender
        from employees
    ) V
    GROUP BY gender;    -- gender 컬럼의 값이 같은것 끼리 그룹을 짓는다.
    
    --- [퀴즈] employees 테이블에서 연령대별로 인원수를 나타내세요. ---
/*
    ------------------
      연령대   인원수
    ------------------
       10      16
       20      18
       30      21
       40      20
       50      17
       60      15
*/


/*
 나이 : 올해 생일이 미래이면, 현재년도 - 태어난년도 - 1 
      OR 올해 생일이 오늘이거나 과거이면, 현재년도 - 태어난년도

    현재년도 ==> extract(year from sysdate)
    
    태어난년도 ==> case when substr(jubun,7,1) in ('1','2')
                    then '19' || substr(jubun,1,2)
                    else '20' || substr(jubun,1,2)
                    end
                    
    올해생일 ==> to_date(to_char(sysdate,'yyyy') || substr(jubun,3,4), 'yyyymmdd')

*/

SELECT trunc(age,-1) as 연령대, count(*) as 인원수
FROM
    ( 
    SELECT case when current_year_birthday > to_date(to_char(sysdate,'yyyymmdd'),'yyyymmdd') 
                then extract(year from sysdate) - birthyear - 1 -- extract(year from sysdate) : 날짜에서 년만 추출
                else extract(year from sysdate) - birthyear
                end as age  -- 현재나이
    FROM
    (
        select to_date(to_char(sysdate,'yyyy') || substr(jubun,3,4), 'yyyymmdd') as "CURRENT_YEAR_BIRTHDAY" -- 올해생일 
               , case when substr(jubun,7,1) in('1','2') then '19' else '20' end || substr(jubun,1,2)  as BIRTHYEAR -- 태어난 년도 
        from employees
    ) V
) T
GROUP BY trunc(age,-1)
ORDER BY 1;

-- 또는

SELECT T.AGE_LINE AS 연령대
    , COUNT(*) AS 인원수
FROM
(
    SELECT 
        trunc(case when current_year_birthday > to_date(to_char(sysdate, 'yyyymmdd'),'yyyymmdd')
        then extract(year from sysdate) - birthday_year - 1
        else extract(year from sysdate) - birthday_year
        end, -1) as age_line
        FROM
        (
            select to_number( CASE WHEN substr(jubun,7,1) in('1','2') THEN '19' ELSE '20' END || substr(jubun,1,2) ) as birthday_year
                , to_date(to_char(sysdate,'yyyy') || substr(jubun,3,4),'yyyymmdd') as current_year_birthday
            from employees
        ) V
) T
GROUP BY T.AGE_LINE
ORDER BY 1;







--------- **** 1차 그룹, 2차 그룹 짓기 **** -----------------


---- employees 테이블에서 부서번호별, 성별인원수를 나타내세요. ----
/*
    -----------------------------
    부서번호    성별      인원수
    -----------------------------
     ....     ....       ....
     50         남
     50         여
     60         남
     60         여
     ....
*/

SELECT DEPARTMENT_ID AS 부서번호
    , GENDER AS 성별
    , COUNT(*) AS 인원수
FROM
    (
    select department_id
        ,case when substr(jubun,7,1) in('1','3') then '남' else '여' end as gender  
        from employees
    ) V
GROUP BY DEPARTMENT_ID, GENDER
--          1차그룹    , 2차그룹
ORDER BY 1;




--- [퀴즈] employees 테이블에서 연령대별, 성별 인원수를 나타내세요. ---
/*
    -------------------------------------
     연령대    성별    인원수   퍼센티지(%)
    -------------------------------------
      10      남
      10      여
      20      남
      20      여
      30      남
      30      여
      ...    ...
*/
Select ageline as 연령대
    , gender as 성별
    , count(*) as 인원수
    , round(count(*)/(select count(*) from employees)*100,1) as "퍼센티지(%)"
FROM
(
    select case when to_char(sysdate,'yyyymmdd') < current_year_birthday 
                -- 생일이 미래면 이번년도 - 태어난년도 -1
                then trunc(extract(year from sysdate) - birthyear - 1, -1)
                else trunc(extract(year from sysdate) - birthyear ,-1)
                end as ageline
        , gender
    from
    (
        select case when substr(jubun,7,1) in('1','2') then '19' else '20' end || substr(jubun,1,2) as birthyear    -- 태어난년도
            , to_date(to_char(sysdate,'yyyy') || substr(jubun,3,4), 'yyyymmdd') as current_year_birthday -- 올해생일
            , case when substr(jubun,7,1) in('1','3') then '남' else '여' end as gender
        from employees
    ) V
) T
GROUP BY ageline, gender
ORDER BY ageline;

-- 또는
-- 강사님
SELECT AGE_LINE AS 연령대
     , GENDER AS 성별 
     , COUNT(*) AS 인원수
     , round( COUNT(*)/( select count(*) from employees )*100, 1) AS "퍼센티지(%)"
FROM 
(

    SELECT 
           trunc( CASE WHEN current_year_birthday > to_date( to_char(sysdate, 'yyyymmdd'), 'yyyymmdd')
                  THEN extract(year from sysdate) - birthday_year - 1
                  ELSE extract(year from sysdate) - birthday_year
                  END, -1)
           AS AGE_LINE
        ,  GENDER   
    FROM 
    (
      select  to_number( CASE WHEN substr(jubun,7,1) in('1','2') THEN '19' ELSE '20' END || substr(jubun,1,2) )
              AS BIRTHDAY_YEAR
          ,   to_date( to_char(sysdate, 'yyyy') || substr(jubun,3,4), 'yyyymmdd') 
              AS CURRENT_YEAR_BIRTHDAY
          ,   CASE WHEN substr(jubun, 7, 1) in('1','3') THEN '남' ELSE '여' END AS GENDER     
      from employees
    ) V
    
) T
GROUP BY AGE_LINE, GENDER 
ORDER BY 1;


-- 또는
---- ====>>> with 절을 사용한 inline view 만들기 <<<==== ----

WITH
V AS
(
    select to_number( CASE WHEN substr(jubun,7,1) in('1','2') THEN '19' ELSE '20' END || substr(jubun,1,2) ) AS BIRTHDAY_YEAR
        , to_date( to_char(sysdate, 'yyyy') || substr(jubun,3,4), 'yyyymmdd') AS CURRENT_YEAR_BIRTHDAY
        , CASE WHEN substr(jubun, 7, 1) in('1','3') THEN '남' ELSE '여' END AS GENDER     
    from employees
)
SELECT trunc(case when current_year_birthday > to_date(to_char(sysdate,'yyyymmdd'),'yyyymmdd') 
        then extract(year from sysdate) - V.birthday_year - 1
        else extract(year from sysdate) - V.birthday_year
        end, -1) as 연령대
        , gender as 성별
        , count(*) as 인원수
        , round(count(*)/(select count(*) from employees) * 100, 2) as "퍼센티지(%)"
FROM V
GROUP BY trunc(case when current_year_birthday > to_date(to_char(sysdate,'yyyymmdd'),'yyyymmdd') 
        then extract(year from sysdate) - V.birthday_year - 1
        else extract(year from sysdate) - V.birthday_year
        end, -1), gender
ORDER BY 1;






------------------------------------------------------------------------------------------------------------

----- **** 요약값을 보여주는 rollup, cube, grouping sets, grouping 에 대해서 알아봅니다. **** ------


--- employees 테이블에서 부서번호별로 인원수를 나타내면서 동시에 전체 인원수도 나타내세요. ---

select department_id as 부서번호
    , grouping(department_id)   -- grouping(department_id) 은 결과값이 오로지 2개만 나온다.
                                -- 0 또는 1 인데,
                                -- 0 이라함은 department_id 컬럼의 값으로 그룹을 지었다는 말이고,
                                -- 1 이라함은 그룹을 안지었다는 말이다.
    , count(*) as 인원수
from employees
group by rollup(department_id);
--> 부서번호가 null 인지 그룹으로 합쳐진 것에 대한 null 인지 구분하기 어렵다!!


select decode (grouping(department_id), 0, nvl(to_char(department_id),'부서없음'), '전체' ) as 부서번호
    -- grouping(department_id)
    , count(*) as 인원수
    , to_char(round(count(*)/(select count(*) from employees) * 100 , 1),'990.0') as "퍼센티지(%)"  -- 9 는 숫자가 없으면 넣지않고, 0 은 숫자가 없으면 0
from employees
group by rollup(department_id);





---- employees 테이블에서 성별로 인원수 와 퍼센티지(%)를 나타내면서 전체인원수로 나타내세요. ----

with
V as
(
    select case when substr(jubun, 7, 1) in('1','3') then '남' else '여' end as gender
    from employees
)
SELECT nvl(gender,'전체(남,녀)') as 성별
    , count(*) as "인원수"
    , to_char(round( COUNT(*)/( select count(*) from employees )*100, 1),'990.0') as "퍼센티지(%)"
FROM V
GROUP BY rollup(GENDER);

-- 또는

with
V as
(
    select case when substr(jubun, 7, 1) in('1','3') then '남' else '여' end as gender
    from employees
)
SELECT decode(grouping(gender), 0, gender, '전체') as 성별
    -- , grouping(gender) => 그룹핑 유무 판별 0과 1
    , count(*) as "인원수"
    , to_char(round( COUNT(*)/( select count(*) from employees )*100, 1),'990.0') as "퍼센티지(%)"
FROM V
GROUP BY rollup(GENDER);

-- 또는

SELECT decode(grouping(gender), 0, gender, '전체') as 성별
    -- , grouping(gender) => 그룹핑 유무 판별 0과 1
    , count(*) as "인원수"
    , to_char(round( COUNT(*)/( select count(*) from employees )*100, 1),'990.0') as "퍼센티지(%)"
FROM
(
    select case when substr(jubun, 7, 1) in('1','3') then '남' else '여' end as gender
    from employees
) V
GROUP BY rollup(GENDER);




---- employees 테이블에서 부서번호별로, 성별로 인원수 와 퍼센티지(%)를 나타내면서 전체인원수로 나타내세요. ----

SELECT decode (grouping(department_id), 0, nvl(to_char(department_id),'부서없음'), '전체' ) as 부서번호
    , decode (grouping(gender),0,gender,'전체') as 성별
    , count(*) as 인원수
    , to_char(round( COUNT(*)/( select count(*) from employees )*100, 1),'990.0') as "퍼센티지(%)"
FROM
(
    select department_id
        , case when substr(jubun,7,1) in('1','3') then '남' else '여' end as gender
    from employees
) V
GROUP BY rollup(department_id, gender)
ORDER BY department_id;



SELECT decode (grouping(department_id), 0, nvl(to_char(department_id),'부서없음'), '전체' ) as 부서번호
    -- , case grouping(department_id) when 0 then nvl(to_char(department_id),'부서없음') else '전체' end as 부서번호2
    , decode (grouping(gender),0,gender,'전체') as 성별
    -- , case grouping(gender) when 0 then gender else '전체' end as 성별2
    , count(*) as 인원수
    , to_char(round( COUNT(*)/( select count(*) from employees )*100, 1),'990.0') as "퍼센티지(%)"
FROM
(
    select department_id
        , case when substr(jubun,7,1) in('1','3') then '남' else '여' end as gender
    from employees
) V
GROUP BY rollup(department_id, gender)
ORDER BY department_id,1,2; -- department_id 숫자~null 정렬, 1은 null 끼리의 정렬, 2 는 gender 정렬 // 문자는 ㄱ~ㅎ 정렬
-- department_id 는 부서번호(숫자)정렬, 1은 grouping(department_id)의 값을 정렬 0과 1(null 값 정렬가능), gender 정렬



  ----- >>>>> 요약값(rollup, cube, grouping sets) <<<<< ------
  /*
      1. rollup(a,b,c) 은 grouping sets( (a,b,c),(a,b),(a),() ) 와 같다.
    
         group by rollup(department_id, gender) 은
         group by grouping sets( (department_id, gender), (department_id), () ) 와 같다.
  
      2. cube(a,b,c) 은 grouping sets( (a,b,c),(a,b),(b,c),(a,c),(a),(b),(c),() ) 와 같다.
 
         group by cube(department_id, gender) 은
         group by grouping sets( (department_id, gender), (department_id), (gender), () ) 와 같다.
  */


SELECT decode (grouping(department_id), 0, nvl(to_char(department_id),'부서없음'), '전체' ) as 부서번호
    , decode (grouping(gender),0,gender,'전체') as 성별
    , count(*) as 인원수
    , to_char(round( COUNT(*)/( select count(*) from employees )*100, 1),'990.0') as "퍼센티지(%)"
FROM
(
    select department_id
        , case when substr(jubun,7,1) in('1','3') then '남' else '여' end as gender
    from employees
) V
GROUP BY grouping sets((department_id, gender), (department_id), () ) --> rollup 과 동일
-- GROUP BY grouping sets((department_id, gender), (gender), () )
-- GROUP BY grouping sets((department_id), (gender), () )
-- GROUP BY grouping sets((department_id), (gender))
-- ORDER BY department_id;
-- ORDER BY gender;
ORDER BY department_id, 1, gender;  -- department_id 는 부서번호(숫자)정렬, 1은 grouping(department_id)의 값을 정렬 0과 1(null 값 정렬가능), gender 정렬





----- **** group by 절에서 사용하는 listagg 함수 대해서 알아봅니다. **** ------
/* 
    listagg(보여줄컬럼명, '구분자') within group(order by 보여줄 컬럼명의 정렬기준 컬럼명)
    ==> 그룹화 데이터를 하나의 열에 가로로 나열하여 출력하는데 사용됨. 
*/


select department_id as 부서번호
    , listagg(first_name || ' ' || last_name, ',') within group(order by nvl(salary + (salary * commission_pct),salary) desc)-- 월급이 가장 많은사람 먼저
    as "급여가 많은 순서대로 사원명 출력"
from employees
group by department_id;






         ----- ===== ***   having 그룹함수조건절   *** ====== ------
   /*
       group by 절을 사용하여 그룹함수의 값을 나타내었을때
       그룹함수의 값이 특정 조건에 해당하는 것만 추출하고자 할 때는 where 절을 사용하는 것이 아니라
       having 그룹함수조건절 을 사용해야 한다.
   */ 
   
   -- employees 테이블에서 사원이 10명 이상 근무하는 부서번호와 그 인원수를 나타내세요.
   
   select department_id, count(*)
   from employees
   -- where count(*) >= 10     -- 오류!! count(*) 이 무엇인지 알 수 없다!
   group by department_id;  
   
   select department_id as 부서번호 , count(*) as 사원수
   from employees
   group by department_id
   having count(*) >= 10
   order by 2;  -- 인원수가 적은 것이 먼저나오게 함(asc)
   
   
   --- employees 테이블에서 부서번호별로 벌어들이는 salary 의 합계가 50000 이상인 부서에 대해서만
   --- 부서번호, 기본급여의합계 를 나타내세요.
   
   select department_id as 부서번호
        , to_char(sum(salary),'999,999') as 기본급여의합계
   from employees
   group by department_id
   having sum(salary) >= 50000
   order by 2;
   
   
   --- [퀴즈1] employees 테이블에서 부서번호별로 벌어들이는 월급 합계가 40000 이상인 부서에 대해서만
   --- 부서번호, 월급의합계 를 나타내세요.
   
   select department_id as 부서번호
        , to_char(sum(nvl(salary + (salary * commission_pct),salary)),'999,999') as 월급의합계
   from employees
   group by department_id
   having sum(nvl(salary + (salary * commission_pct),salary)) >= 40000
   order by 1;
   
   desc employees;
   
   --- [퀴즈2] employees 테이블에서 부서번호별 월급의 합계와 함께 월급합계의 등수(석차)도 나타내세요. --- 
   select to_char(sum(nvl(salary + (salary * commission_pct),salary)),'999,999') as "월급의 합계"
        , rank() over(order by sum(nvl(salary + (salary * commission_pct),salary)) desc) as 등수
   from employees
   group by department_id;
   
   --- [퀴즈3] employees 테이블에서 부서번호별 인원수와 월급의 평균과 함께 월급평균의 등수(석차)도 나타내세요. --- 
   select department_id as 부서번호, count(*) as 인원수
        , to_char(round(avg(nvl(salary + (salary * commission_pct),salary)),0),'99,999') as "월급의 평균"
        , rank() over(order by avg(nvl(salary + (salary * commission_pct),salary)) desc) as 등수
   from employees
   group by department_id
   order by department_id;
   
   --- [퀴즈4] employees 테이블에서 모든 사원들이 벌어들이는 월급의 합계를 100% 로 보았을때 
   ---       각 부서번호별로 벌어들이는 월급의 합계를 % 로 나타내어보자.

    select decode(grouping(department_id), 0,nvl(to_char(department_id),'부서없음'), '전체') as 부서번호
        , round(sum(nvl(salary + (salary * commission_pct),salary)) 
            / (select sum(nvl(salary + (salary * commission_pct),salary)) from employees) * 100, 1) as "부서별로 총 월급 / 전체월급"
    from employees
    group by rollup(department_id) -- rollup 실시 시 전체도 확인 가능
    order by 1;
    

    -- [퀴즈5] employees 테이블에서 모든 사원들이 벌어들이는 월급의 합계를 100% 로 보았을때 
   ---       각 부서번호별로 벌어들이는 월급합계의 퍼센티지가 5% 이상인 부서만 
   --        부서번호 월급의합계 퍼센티지를 나타내어 보세요.
   
   select department_id as 부서번호
        , to_char(sum(nvl(salary + (salary * commission_pct),salary)),'999,999') as 월급의합계
        , round(sum(nvl(salary + (salary * commission_pct),salary)) 
            / (select sum(nvl(salary + (salary * commission_pct),salary)) from employees) * 100, 1)
        as "월급합계의 퍼센티지"
   from employees
   group by department_id
   having sum(nvl(salary + (salary * commission_pct),salary)) 
        > (select sum(nvl(salary + (salary * commission_pct),salary)) from employees) * 0.05
  order by 1;
   
   
   
   
   
   
    ------- **** !!! 누적(누계)에 대해서 알아봅니다. !!! **** ---------
   /*
        sum(누적되어야할 컬럼명) over(order by 누적되어질 기준이 되는 컬럼명 asc[desc] )
        
        sum(누적되어야할 컬럼명) over(partition by 그룹화 되어질 컬럼명 
                                   order by 누적되어질 기준이 되는 컬럼명 asc[desc] )
   */ 
   
   
    create table tbl_panmae
 (panmaedate  date
 ,jepumname   varchar2(20)
 ,panmaesu    number
 ); 
 -- Table TBL_PANMAE이(가) 생성되었습니다.
 
 -- delete from tbl_panmae;
 
 insert into tbl_panmae(panmaedate, jepumname, panmaesu)
 values( add_months(sysdate,-2), '새우깡', 10);    -- 2달 전 10 개를 팜

 insert into tbl_panmae(panmaedate, jepumname, panmaesu)
 values( add_months(sysdate,-2)+1, '새우깡', 15);  -- 2달 전 하루 뒤 15개 팜

 insert into tbl_panmae(panmaedate, jepumname, panmaesu)
 values( add_months(sysdate,-2)+2, '감자깡', 20);
    
 insert into tbl_panmae(panmaedate, jepumname, panmaesu)
 values( add_months(sysdate,-2)+3, '새우깡', 10);
 
 insert into tbl_panmae(panmaedate, jepumname, panmaesu)
 values( add_months(sysdate,-2)+3, '새우깡', 3);
 
 insert into tbl_panmae(panmaedate, jepumname, panmaesu)
 values( add_months(sysdate,-1), '고구마깡', 7);

 insert into tbl_panmae(panmaedate, jepumname, panmaesu)
 values( add_months(sysdate,-1)+1, '새우깡', 8); 

 insert into tbl_panmae(panmaedate, jepumname, panmaesu)
 values( add_months(sysdate,-1)+2, '감자깡', 10);

 insert into tbl_panmae(panmaedate, jepumname, panmaesu)
 values( add_months(sysdate,-1)+3, '감자깡', 5);

 insert into tbl_panmae(panmaedate, jepumname, panmaesu)
 values( sysdate - 4, '허니버터칩', 30);

 insert into tbl_panmae(panmaedate, jepumname, panmaesu)
 values( sysdate - 3, '고구마깡', 15);

 insert into tbl_panmae(panmaedate, jepumname, panmaesu)
 values( sysdate - 2, '고구마깡', 10);

 insert into tbl_panmae(panmaedate, jepumname, panmaesu)
 values( sysdate - 1, '허니버터칩', 20);

 insert into tbl_panmae(panmaedate, jepumname, panmaesu)
 values( sysdate, '새우깡', 10);

 insert into tbl_panmae(panmaedate, jepumname, panmaesu)
 values( sysdate, '새우깡', 10);

 insert into tbl_panmae(panmaedate, jepumname, panmaesu)
 values( sysdate, '감자깡', 5);

 insert into tbl_panmae(panmaedate, jepumname, panmaesu)
 values( sysdate, '허니버터칩', 15);

 insert into tbl_panmae(panmaedate, jepumname, panmaesu)
 values( sysdate, '고구마깡', 20);

 insert into tbl_panmae(panmaedate, jepumname, panmaesu)
 values( sysdate, '감자깡', 10); 

 insert into tbl_panmae(panmaedate, jepumname, panmaesu)
 values( sysdate, '새우깡', 10);

 commit;  
 
 select *
 from tbl_panmae;
 
 --- *** tbl_panmae 테이블에서 '새우깡'에 대한 일별판매량과 일별누적판매량을 나타내세요. *** ---
 
 select *
 from tbl_panmae
 where jepumname = '새우깡';
 
 ---------------------------------
 판매일자   일별판매량   일별누적판매량
 ---------------------------------
 2023-12-22   10         10
 2023-12-23   15         25
 2023-12-25   13         38
 2024-01-23   8          46
 2024-02-22   30         76
 ---------------------------------
    select to_char(panmaedate,'yyyy-mm-dd') as 판매일자
        , sum(panmaesu) as 일별판매량
        -- sum(누적되어야할 컬럼명) over(order by 누적되어질 기준이 되는 컬럼명 asc[desc] )
        , sum(sum(panmaesu)) over(order by to_char(panmaedate,'yyyy-mm-dd') asc ) as 일별누적판매량
    from tbl_panmae
    where jepumname = '새우깡'
    group by to_char(panmaedate,'yyyy-mm-dd')
    order by 1;
    
    select to_char(panmaedate,'yyyy-mm-dd') as 판매일자
        , sum(panmaesu) as 일별판매량
        , sum(sum(panmaesu)) over(order by to_char(panmaedate,'yyyy-mm-dd') asc ) as 일별누적판매량
        , round(sum(sum(panmaesu)) over(order by to_char(panmaedate,'yyyy-mm-dd') asc ) 
                / (select sum(panmaesu)from tbl_panmae where jepumname = '새우깡') * 100,1) || '%' as "일별누적퍼센티지(%)"
    from tbl_panmae
    where jepumname = '새우깡'
    group by to_char(panmaedate,'yyyy-mm-dd')
    -- 판매일의 시간이 모두 다르므로 시간으 00:00:00 으로 맞춰준다.
    order by 1;
    
    
    
    --- *** tbl_panmae 테이블에서 모든 제품에 대한 일별판매량과 일별누적판매량을 나타내세요. *** ---
    
    select jepumname as 제품명
        , to_char(panmaedate,'yyyy-mm-dd') as 판매일자
        , sum(panmaesu) as 일별판매량
        -- sum(누적되어야할 컬럼명) over(partition by 그룹화 되어질 컬럼명 order by 누적되어질 기준이 되는 컬럼명 asc[desc] )
        , sum(sum(panmaesu)) over(partition by jepumname order by to_char(panmaedate,'yyyy-mm-dd') asc) as 일별누적판매량
        , to_char(round(sum(sum(panmaesu)) over(partition by jepumname order by to_char(panmaedate,'yyyy-mm-dd') asc)
            / (select sum(panmaesu) from tbl_panmae where jepumname = P.jepumname) * 100,1),'990.0') as "일별누적판매량퍼센티지(%)"
            -- tbl_panmae 에서의 jepumname 과 tbl_panmae P 에서 그룹핑해서 선택된 jepumname 과 같은 경우
            -- 일별누적판매량 / 해당제품에서의 일별누적판매량
    from tbl_panmae P   -- 별칭 P (as 생략 가능)
    group by jepumname, to_char(panmaedate,'yyyy-mm-dd')
    order by 1;

    -- 또는
    
    WITH
    V AS
    (
    select jepumname    -- 제품명
        , to_char(panmaedate,'yyyy-mm-dd') as PANMAEDATE    -- 판매일자
        , sum(panmaesu) as DAY_SUM_PANMAESU -- 일별판매량
        , sum(sum(panmaesu)) over(partition by jepumname order by to_char(panmaedate,'yyyy-mm-dd') asc) as DAY_NUGAE_PANMAESU -- 일별누적판매량
    from tbl_panmae P 
    group by jepumname, to_char(panmaedate,'yyyy-mm-dd')
    )
    SELECT jepumname as 제품명
        , panmaedate as 판매일자
        , day_sum_panmaesu as 일별판매량
        , day_nugae_panmaesu as 일별누적판매량
        , to_char(round(day_nugae_panmaesu 
            / (select sum(panmaesu) from tbl_panmae where jepumname = V.jepumname) * 100,1),'990.0') as "일별누적판매량퍼센티지(%)"
    FROM V
    order by 1;
    
    
    --- [퀴즈] tbl_panmae 테이블에서 판매일자가 1개월전의  '01'일 (즉, 현재가 2024년 2월 22일 이므로 2024년 1월 1일 부터) 현재까지 판매된
    --- 감자깡과 새우깡에 대해 일별판매량과 일별누적판매량 및 일별누적판매량 퍼센티지 (%) 을 나타내세요.
    WITH
    V AS
    (
    select jepumname    -- 제품명
        , to_char(panmaedate,'yyyy-mm-dd') as PANMAEDATE    -- 판매일자
        , sum(panmaesu) as DAY_SUM_PANMAESU -- 일별판매량
        , sum(sum(panmaesu)) over(partition by jepumname order by to_char(panmaedate,'yyyy-mm-dd') asc) as DAY_NUGAE_PANMAESU -- 일별누적판매량
    from tbl_panmae P 
    group by jepumname, to_char(panmaedate,'yyyy-mm-dd')
    )
    SELECT jepumname as 제품명
        , panmaedate as 판매일자
        , day_sum_panmaesu as 일별판매량
        , day_nugae_panmaesu as 일별누적판매량
        , to_char(round(day_nugae_panmaesu 
            / (select sum(panmaesu) from tbl_panmae where jepumname = V.jepumname) * 100,1),'990.0') as "일별누적판매량퍼센티지(%)"
    FROM V
    where jepumname in('감자깡','새우깡') 
        and panmaedate >= to_date(to_char(sysdate - 1*extract(day from sysdate),'yyyy-mm') || '01','yyyy-mm-dd')
    -- 강사님 방법
    -- where jepumname in('감자깡','새우깡')
    --    and panmaedate >= to_char(last_day(add_months(sysdate,-2)) + 1, 'yyyy-mm-dd')
    -- add_months(날짜,숫자) : 숫자만큼 날짜를 더한 개월
    order by 1;
    
    
    
    
    
    ------- ====== ***** 아래처럼 나오도록 하세요 ***** ===== -------
    
    --------------------------------------------------------------
    전체사원수   10대     20대     30대     40대     50대     60대
    --------------------------------------------------------------
        107     16      18       21       20       17       15
        
    SELECT trunc(case when current_year_birthday > to_date(to_char(sysdate,'yyyymmdd'),'yyyymmdd')
                    then extract(year from sysdate) - birthyear - 1 
                    else extract(year from sysdate) - birthyear
                    end, -1) as AGE_LINE
    FROM
    (
        select to_date(to_char(sysdate,'yyyy') || substr(jubun,3,4), 'yyyymmdd') as "CURRENT_YEAR_BIRTHDAY" -- 올해생일 
            , case when substr(jubun,7,1) in('1','2') then '19' else '20' end || substr(jubun,1,2)  as BIRTHYEAR -- 태어난 년도 
        from employees
    ) V;
    
    -- WITH 로 사용하기
    WITH
    V AS
    (
        SELECT trunc(case when current_year_birthday > to_date(to_char(sysdate,'yyyymmdd'),'yyyymmdd')
                        then extract(year from sysdate) - birthyear - 1 
                        else extract(year from sysdate) - birthyear
                        end, -1) as AGE_LINE
        FROM
        (
        select to_date(to_char(sysdate,'yyyy') || substr(jubun,3,4), 'yyyymmdd') as "CURRENT_YEAR_BIRTHDAY" -- 올해생일 
            , case when substr(jubun,7,1) in('1','2') then '19' else '20' end || substr(jubun,1,2)  as BIRTHYEAR -- 태어난 년도 
        from employees
        )
    )
    SELECT age_line, decode(age_line, 10,1) as "10대", decode(age_line, 20,1) as "20대", decode(age_line, 30,1) as "30대"
        , decode(age_line, 40,1) as "40대", decode(age_line, 50,1) as "50대", decode(age_line, 60,1) as "60대"
    FROM V;
    
    -- count 붙여서 인원수 파악하기
    WITH
    V AS
    (
        SELECT trunc(case when current_year_birthday > to_date(to_char(sysdate,'yyyymmdd'),'yyyymmdd')
                        then extract(year from sysdate) - birthyear - 1 
                        else extract(year from sysdate) - birthyear
                        end, -1) as AGE_LINE
        FROM
        (
        select to_date(to_char(sysdate,'yyyy') || substr(jubun,3,4), 'yyyymmdd') as "CURRENT_YEAR_BIRTHDAY" -- 올해생일 
            , case when substr(jubun,7,1) in('1','2') then '19' else '20' end || substr(jubun,1,2)  as BIRTHYEAR -- 태어난 년도 
        from employees
        )
    )
    SELECT count(age_line) as 전체사원수
        , count(decode(age_line, 10,1)) as "10대"
        , count(decode(age_line, 20,1)) as "20대"
        , count(decode(age_line, 30,1)) as "30대"
        , count(decode(age_line, 40,1)) as "40대"
        , count(decode(age_line, 50,1)) as "50대"
        , count(decode(age_line, 60,1)) as "60대"
    FROM V;
    
    -- 또는
    
    WITH
    V AS
    (
        SELECT trunc(case when current_year_birthday > to_date(to_char(sysdate,'yyyymmdd'),'yyyymmdd')
                        then extract(year from sysdate) - birthyear - 1 
                        else extract(year from sysdate) - birthyear
                        end, -1) as AGE_LINE
        FROM
        (
        select to_date(to_char(sysdate,'yyyy') || substr(jubun,3,4), 'yyyymmdd') as "CURRENT_YEAR_BIRTHDAY" -- 올해생일 
            , case when substr(jubun,7,1) in('1','2') then '19' else '20' end || substr(jubun,1,2)  as BIRTHYEAR -- 태어난 년도 
        from employees
        )
    )
    SELECT count(age_line) as 전체사원수
        , sum(decode(age_line, 10,1)) as "10대"  -- count,sum 모두 가능sum 은 그룹함수이므로 null 값을 더하지 않는다.
        , sum(decode(age_line, 20,1,0)) as "20대"    -- null 값을 0으로 바꾸고 싶을 경우, 반드시 sum 을 사용해야 한다. =>(count X)
        , sum(decode(age_line, 30,1)) as "30대"
        , sum(decode(age_line, 40,1)) as "40대"
        , sum(decode(age_line, 50,1)) as "50대"
        , sum(decode(age_line, 60,1)) as "60대"
    FROM V;
    
    
    
    
    
    
    
    -------- ==== *** [퀴즈] 아래처럼 나오도록 하세요 *** ==== ---------
    
    select employee_id, first_name, job_id , salary
    from employees;
    /*
    --------------------------------------------------------------------------------------------------------------------------------------
     직종ID          남자기본급여평균    여자기본급여평균     기본급여평균    평균과남자평균차액                     평균과여자평균차액 
                                                                     (남자기본급여평균 - 기본급여평균)        (여자기본급여평균 - 기본급여평균)
   --------------------------------------------------------------------------------------------------------------------------------------
     ........           ....              ....             ....             ...                                 ...     
     FI_ACCOUNT         7900              7950             7920             -20                                  30 
     IT_PROG            5700              6000             5760             -60                                 240 
     ........           ....              ....             ....             ...                                 ...   
   --------------------------------------------------------------------------------------------------------------------------------------
   */
   
   SELECT job_id as "직종ID"
        , lpad(nvl(to_char(round(avg(decode(gender,'남',salary)),0),'999,999'), ' '),9,' ') as "남자기본급여평균"
        -- round(avg(decode(gender,'남',salary)),0)
        , lpad(nvl(to_char(round(avg(decode(gender,'여',salary)),0),'999,999'), ' '),9,' ') as "여자기본급여평균"
        , to_char(avg(salary),'99,999') as "기본급여평균"
        , lpad(nvl(to_char(round(avg(decode(gender,'남',salary)) - avg(salary),0)), ' '),10, ' ') as "평균과남자평균차액"
        , lpad(nvl(to_char(round(avg(decode(gender,'여',salary)) - avg(salary),0)), ' '),10, ' ') as "평균과여자평균차액"
   FROM
   (
       select job_id, salary
            , case when substr(jubun,7,1) in('1','3') then '남' else '여' end as gender
       from employees
   ) V
   GROUP BY job_id
   ORDER BY job_id;
    
    
   -- 강사님
   /*
    select salary
        , case when substr(jubun,7,1) in('1','3') then salary end as 남자
        , case when substr(jubun,7,1) in('2','4') then salary end as 여자
    from employees
    
    select avg(salary) as 남녀모두평균
        , avg(case when substr(jubun,7,1) in ('1','3') then salary end) as 남자평균
        , avg(case when substr(jubun,7,1) in ('2','4') then salary end) as 여자평균
    from employees
    */
    WITH
    V AS
    (
    select job_id as 직종ID
        , trunc(avg(case when substr(jubun,7,1) in ('1','3') then salary end),0) as 남자기본급여평균
        , trunc(avg(case when substr(jubun,7,1) in ('2','4') then salary end),0) as 여자기본급여평균
        , avg(salary) as 기본급여평균
    from employees
    group by job_id
    )
    SELECT 직종ID
        , nvl(to_char(남자기본급여평균,'99,999'),' ') as 남자기본급여평균
        , nvl(to_char(여자기본급여평균,'99,999'), ' ') as 여자기본급여평균
        , to_char(기본급여평균,'99,999') as 기본급여평균
        , nvl(to_char(남자기본급여평균 - 기본급여평균), ' ') AS 평균과남자평균차액
        , nvl(to_char(여자기본급여평균 - 기본급여평균), ' ') AS 평균과여자평균차액
    FROM V
    ORDER BY 1;
    
    
    
    
    
    ---- >>>>>> *** PIVOT, UNPIVOT 함수 *** <<<<<< -----------
    -- PIVOT   함수는 기존 테이블 행을 열로  바꾸어서 출력해 주는 것이고,
    -- UNPIVOT 함수는 기존 테이블 열을 행으로 바꾸어서 출력해 주는 것이다.
    
    /*
    -------------------------------------------------------------
       직종 ID   10  20  30  40  50  60  70  80  90  100 110 NULL
    -------------------------------------------------------------
    AC_ACCOUNT  0   0   0   0   0   0   0   0   0   0   1   0
    AC_MGR      0   0   0   0   0   0   0   0   0   0   1   0
    AD_ASST     1   0   0   0   0   0   0   0   0   0   0   0
    ........    .............................................
    FI_ACCOUNT  0   0   0   0   0   0   0   0   0   5   0   0
    ........    .............................................
    */
    
    select job_id as 직종ID
        , sum(decode(department_id,10,1,0)) as "10"
        , sum(decode(department_id,20,1,0)) as "20"
        , sum(decode(department_id,30,1,0)) as "30"
        , sum(decode(department_id,40,1,0)) as "40"
        , sum(decode(department_id,50,1,0)) as "50"
        , sum(decode(department_id,60,1,0)) as "60"
        , sum(decode(department_id,70,1,0)) as "70"
        , sum(decode(department_id,80,1,0)) as "80"
        , sum(decode(department_id,90,1,0)) as "90"
        , sum(decode(department_id,100,1,0)) as "100"
        , sum(decode(department_id,110,1,0)) as "110"
        --, sum(decode(nvl(to_char(department_id),null),null,1,0)) as 없음
         ,sum(decode(nvl(department_id,-9999),-9999,1,0)) as "없음"
    from employees
    group by job_id
    order by 1;
    
    
    
    -- 부서번호, 직종ID, 인원수
    select department_id, job_id, count(employee_id) as cnt
    from employees
    group by department_id, job_id
    order by 1,2;
    
    -- >>> PIVOT 함수를 사용하여 직종ID별, 부서번호별 인원수를 나타내기 <<< --
    SELECT *
    FROM
    (
    select job_id, nvl(department_id, -9999) as department_id, employee_id
    from employees
    ) V
    PIVOT(  count(employee_id)  -- 실제 출력할 데이터 표기
            for department_id in(10,20,30,40,50,60,70,80,90,100,110,-9999)  -- 가로줄로 표기할 열을 FOR 로 명시한 후에 IN 안에 출력하려는 열 데이터를 지정한다.
        )
    ORDER BY job_id;
    
    
    
    
    
    
    
    ------------------------------------------------------------------------------------------------------------
    
    ------------------- ====== ***** Sub Query (서브쿼리) ***** ====== -------------------
     
    /*
       -- Sub Query (서브쿼리)란?
       select 문속에 또 다른 select 문이 포함되어져 있을 때 포함되어진 select 문을 Sub Query (서브쿼리)라고 부른다.
       
       
       select ...
       from .....  ==> Main Query(메인쿼리 == 외부쿼리)
       where ... in (select ... 
                     from .....) ==> Sub Query (서브쿼리 == 내부쿼리)
                     
       select ...
            , (select ... from .... ) ==> Sub Query (서브쿼리 == 내부쿼리)
       from .... ==> Main Query(메인쿼리 == 외부쿼리) 
       
   */
   
   
   /*
     employees 테이블에서
     기본급여가 제일 많은 사원과 기본급여가 제일적은 사원의 정보를 
     사원번호, 사원명, 기본급여로 나타내세요..
  */
  
  
    select employee_id as 사원번호
        , first_name || ' ' || last_name as 사원명
        , salary as 기본급여
    from employees
    where salary = (select max(salary) from employees) or
         salary = (select min(salary) from employees);
/*
    사원번호    사원명     기본급여
     100	  혜정 양	 24000
     132	 TJ Olson	 2100
*/
  
  
/*
    [퀴즈]
    employees 테이블에서 부서번호가 60, 80번 부서에 근무하는 사원들중에
    월급이 50번 부서 직원들의 '평균월급' 보다 많은 사원들만 
    부서번호, 사원번호, 사원명, 월급을 나타내세요....
*/  
  
    -- 틀 잡기
    from employees
    where department_id in(60,80)
        and nvl(salary + (salary * commission_pct), salary) > (50번 부서 직원들의 '평균월급')
  
  
    -- 50번 부서 직원들의 '평균월급'
    select avg(nvl(salary + (salary * commission_pct), salary))
    from employees
    where department_id = 50;
    -- 3475.555555555555555555555555555555555556
  
    -- 또는
    select avg( case department_id when 50 then (nvl(salary + (salary * commission_pct), salary)) end)
    from employees;
    -- 3475.555555555555555555555555555555555556

    -- 최종
    select department_id as 부서번호
        , employee_id as 사원번호
        , first_name || ' ' || last_name as 사원명
        , nvl(salary + (salary * commission_pct), salary) as 월급
    from employees
    where department_id in(60,80) 
        and (nvl(salary + (salary * commission_pct), salary)) > (select avg(nvl(salary + (salary * commission_pct), salary))
                                                                from employees
                                                                where department_id = 50)
    order by 1,4;
  
    -- 또는
    select department_id AS 부서번호
         , employee_id AS 사원번호
         , first_name || ' ' || last_name AS 사원명
         , nvl(salary + (salary * commission_pct), salary) AS 월급
    from employees
    where department_id in(60, 80) AND
         nvl(salary + (salary * commission_pct), salary) > ( select AVG( case department_id when 50 then nvl(salary + (salary * commission_pct), salary) end )
                                                             from employees )
    order by 1, 4 desc;
    
    
    
    
    
    
    
    create table tbl_authorbook
   (bookname       varchar2(100)
   ,authorname     varchar2(20)
   ,loyalty        number(5)
   );
   -- Table TBL_AUTHORBOOK이(가) 생성되었습니다.
   
   insert into tbl_authorbook(bookname, authorname, loyalty)
   values('자바프로그래밍','이순신',1000);
   
   insert into tbl_authorbook(bookname, authorname, loyalty)
   values('로빈슨크루소','한석규',800);
   
   insert into tbl_authorbook(bookname, authorname, loyalty)
   values('로빈슨크루소','이순신',500);
   
   insert into tbl_authorbook(bookname, authorname, loyalty)
   values('조선왕조실록','엄정화',2500);
   
   insert into tbl_authorbook(bookname, authorname, loyalty)
   values('그리스로마신화','유관순',1200);
   
   insert into tbl_authorbook(bookname, authorname, loyalty)
   values('그리스로마신화','이혜리',1300);
   
   insert into tbl_authorbook(bookname, authorname, loyalty)
   values('그리스로마신화','서강준',1700);

   insert into tbl_authorbook(bookname, authorname, loyalty)
   values('어린왕자','김유신',1800);
   
   commit;
   
   
   select * 
   from tbl_authorbook;
   
   ---  tbl_authorbook 테이블에서 공저(도서명은 동일하지만 작가명이 다른 도서)로 지어진 도서정보를 나타내세요... ---
   
   /*
       ---------------------------------
         도서명         작가명    로얄티
       ---------------------------------  
         로빈슨크루소    한석규        800
         로빈슨크루소    이순신        500
         그리스로마신화  유관순       1200
         그리스로마신화  이혜리       1300
         그리스로마신화  서강준       1700
       ---------------------------------  
   */ 
    
    select *
    from tbl_authorbook
    where bookname in('로빈슨크루소','그리스로마신화');
    
    -- 틀 잡기
    select *
    from tbl_authorbook
    where bookname in(tbl_authorbook 테이블에서 bookname 컬럼의 값이 동일한 것이 2개 이상 나오는 행의 bookname 컬럼값);
    
    -- tbl_authorbook 테이블에서 bookname 컬럼의 값이 동일한 것이 2개 이상 나오는 행의 bookname 컬럼값
    select bookname
    from tbl_authorbook 
    group by bookname
    having count(*) > 1;
    
    -- 최종
    select *
    from tbl_authorbook
    where bookname in(select bookname
                    from tbl_authorbook 
                    group by bookname
                    having count(*) > 1);
    
    
    
    
    
     ----- ===== **** Pairwise(쌍) Sub Query **** ===== -----
  /*
      employees 테이블에서
      부서번호별로 salary 가 최대인 사원과
      부서번호별로 salary 가 최소인 사원의 정보를
      부서번호, 사원번호, 사원명, 기본급여를 나타내세요.
  */

    --- 부서번호 30번에 근무하는 사람들 중에 기본급여가 최대인 사원들
    select department_id as 부서번호
        , employee_id as 사원번호
        , first_name || ' ' || last_name as 사원명
        , salary as 기본급여
    from employees
    where department_id = 30    -- 이것을 빼면 오류! 30번의 최대치가 다른곳의 부서인사람과 같을 수 있기 때문 
        and salary = (select max(salary) from employees where department_id = 30);
  
    --- 부서번호 30번에 근무하는 사람들 중에 기본급여가 최소인 사원들
    select department_id as 부서번호
        , employee_id as 사원번호
        , first_name || ' ' || last_name as 사원명
        , salary as 기본급여
    from employees
    where department_id = 30    
        and salary = (select min(salary) from employees where department_id = 30);
    
   --- 부서번호별 기본급여의 최대값과 최솟값을 알아보고자 한다.
   select department_id, max(salary), min(salary)
   from employees
   group by department_id;
   
   -- ================================================================================= --
   --- 30번 부서의 최대기본급여가 80번 부서 사원들과 같다. 이중, 30번 부서의 사람만 나오도록 하기( 확인용 )
   
   -- Ex) 30번 부서의 기본급여 최대값인 11000 인 사원들
   select department_id , first_name, salary
   from employees
   where salary = 11000;
   /*
   ------------------------------------
   부서번호     사원명        기본급여
    30	       Den	        11000
    80	      Gerald	    11000
    80	      Ellen	        11000
    -----------------------------------
   */
   
   -- 부서번호 30번에 근무하는 사원들 중 기본급여가 11000 인 사원들
   select department_id , first_name, salary
   from employees
   where department_id = 30 and salary = 11000;
   
   -- ==================================================================== --
   
   --- 최종
   select department_id as 부서번호
        , employee_id as 사원번호
        , first_name || ' ' || last_name as 사원명
        , salary as 기본급여
   from employees
   where (nvl(department_id,-9999), salary) in(select nvl(department_id,-9999), max(salary)   
                                               from employees               
                                               group by department_id)             
        -- (nvl(department_id,-9999), salary) 에서 () 을 빼면 오류
        -- null 처리를 양쪽 모두 해주어야 null 값이 나온다.
        -- 각 부서가 같고 최대기본급여와 기본급여가 같은 사원들
        or (nvl(department_id,-9999), salary) in(select nvl(department_id,-9999), min(salary)   
                                               from employees
                                               group by department_id)
        -- 각 부서가 같고 최소기본급여와 기본급여가 같은 사원들
    order by 1,4;
   
   
   
   
   

   
   ---  부서번호별로 salary 가 최대인 사원과 최소인 사원들을 모으고 그 안에서의 등수를 보여주기
   select department_id as 부서번호
        , employee_id as 사원번호
        , first_name || ' ' || last_name as 사원명
        , salary as 기본급여
        , rank() over (order by salary desc) as 등수
   from employees
   where (nvl(department_id,-9999), salary) in(select nvl(department_id,-9999), max(salary)   
                                               from employees               
                                               group by department_id)             
        or (nvl(department_id,-9999), salary) in(select nvl(department_id,-9999), min(salary)   
                                               from employees
                                               group by department_id)
    order by 5,1,4;
   
   
    /*
      employees 테이블에서
      부서번호별로 salary 가 최대인 사원과
      부서번호별로 salary 가 최소인 사원의 정보를
      부서번호, 사원번호, 사원명, 기본급여, 부서내등수, 전체등수를 나타내세요.
    */
   
    WITH
    V AS
    (
    select department_id
        , employee_id 
        , first_name || ' ' || last_name as fullname
        , salary
        , rank() over(partition by department_id order by salary desc) as dept_rank -- 부서내등수
        , rank() over(order by salary desc) as total_rank   -- 전체등수
    from employees
   )
   SELECT department_id as 부서번호
        , employee_id as 사원번호
        , fullname as 사원명
        , to_char(salary,'99,999') as 기본급여
        , dept_rank as 부서내등수
        , total_rank as 전체등수
   FROM V
   WHERE (nvl(department_id,-9999), salary) in(select nvl(department_id,-9999), max(V.salary)   
                                               from V               
                                               group by department_id)             
        or (nvl(department_id,-9999), salary) in(select nvl(department_id,-9999), min(V.salary)   
                                               from V
                                               group by department_id)
    -- ORDER BY 6,1;    -- 전체등수별로 보기 쉬움
   ORDER BY 1,4;    -- 각 부서별로 최대,최소 기본급여의 등수를 보기 쉬움
   
   
   
   
   
   
    --------- ===== **** 상관서브쿼리(== 서브상관쿼리) ****  ===== ---------    
   /*
      상관서브쿼리 이라함은 Main Query(== 외부쿼리)에서 사용된 테이블(뷰)에 존재하는 컬럼이
      Sub Query(== 내부쿼리)의 조건절(where절, having절)에 사용되어질때를 
      상관서브쿼리(== 서브상관쿼리)라고 부른다.
   */
   
   
   -- employees 테이블에서 기본급여에 대해 전체등수 및 부서내등수를 구하세요.
   -- 첫번째 방법은 rank() 함수를 사용하여 구해본다.
   select department_id AS 부서번호
        , employee_id AS 사원번호 
        , salary AS 기본급여
        , rank() over(order by salary desc) AS 전체등수 
        , rank() over(partition by department_id order by salary desc) AS 부서내등수 
   from employees
   order by 1, 3 desc;
   
   
   -- employees 테이블에서 기본급여에 대해 전체등수 및 부서내등수를 구하세요.
   -- 두번째 방법은 count(*) 을 이용하여 상관서브쿼리를 사용하여 구해본다.
   
   select salary
   from employees;
   
   -- 자신의 기본급여가 12008 이라면 등수가 몇등?
   select count(salary)+1 as 등수 -- 급여가 높은사람들 + 1
   from employees
   where salary > 12008;    -- 자신의 기본급여가 12008
   
   
   SELECT department_id AS 부서번호
        , employee_id AS 사원번호 
        , to_char(salary,'99,999') AS 기본급여
        
        , (select count(salary) + 1
            from employees
            where salary > E.salary )AS 전체등수 
        
        , (select count(salary) + 1
            from employees
            where department_id = E.department_id
                and salary > E.salary )AS 부서내등수
            
   FROM employees E
   ORDER BY 1,3 desc;
   
   
   
   --- ==== *** Sub Query 를 사용하여 테이블을 생성할 수 있습니다. *** ==== ---
   create table tbl_employees_3060
   as
   select department_id
        , employee_id
        , first_name || ' ' || last_name AS ENAME
        , nvl(salary + (salary * commission_pct), salary) AS MONTHSAL
        , case when substr(jubun, 7, 1) in('1','3') then '남' else '여' end AS GENDER
        , jubun
   from employees
   where department_id in (30, 60);
   -- Table TBL_EMPLOYEES_3060이(가) 생성되었습니다.
   
   
    select *
    from tbl_employees_3060;
   
    select * from tab;


    ---- *** employees 테이블을 가지고 데이터없이 employees 테이블의 구조만 동일한 tbl_employees_sub 이라는 테이블을 생성하겠습니다. *** ---
   select * 
   from employees
   where 1=1;
   
   select * 
   from employees
   where 1=2;
  
   create table tbl_employees_sub
   as 
   select * 
   from employees
   where 1=2;
   -- Table TBL_EMPLOYEES_SUB이(가) 생성되었습니다.
    
    
    select *
    from tbl_employees_sub;
    
    desc employees;
    desc tbl_employees_sub;
    
    
    ----- ****** !!!! 필수로 꼭 알아두시길 바랍니다. !!!! ****** ------
    --    =====  상관서브쿼리(== 서브상관쿼리)를 사용한 UPDATE 처리하기 ===== 
    /*
       회사에 입사하셔서 delete 또는 update 를 할 때 먼저 반드시 해당 테이블을 백업해두시고 하시길 바랍니다.
       실수하면 복구하기 위한 것이다.
   */
    --- 원본
    select *
    from employees;
    
    -- 백업
    create table tbl_employees_backup_20240223_1135
    as
    select *
    from employees;
    -- Table TBL_EMPLOYEES_BACKUP_20240223_1135이(가) 생성되었습니다.
    
    select *
    from tbl_employees_backup_20240223_1135;
    
    update employees set first_name = '순신', last_name = '이';
    -- 107개 행 이(가) 업데이트되었습니다.
    commit;
    -- 커밋 완료.
    select *
    from employees;
    
    -- ==== 상관서브쿼리(==서브상관쿼리)를 사용한 UPDATE 처리하기 ==== --(복구)
    update employees E set first_name = (select first_name
                                        from tbl_employees_backup_20240223_1135
                                        where employee_id = E.employee_id)    -- 백업본에 있는 employeee_id = 원본에 있는 employee_id
                        , last_name = (select last_name
                                        from tbl_employees_backup_20240223_1135
                                        where employee_id = E.employee_id);
    -- 107개 행 이(가) 업데이트되었습니다.
    commit;
    -- 커밋 완료.
    
    
    
    

    
    ------ **** 데이터베이스 링크(database link) 만들기 **** ------
    
    select first_name, last_name
    from employees
    where employee_id = 100;
    -- Steven	King
    
    
    update employees set first_name = '혜정', last_name = '양'
    where employee_id = 100;
    -- 1 행 이(가) 업데이트되었습니다.
    commit;
    -- 커밋 완료.
    
    1. DB클라이언트 컴퓨터의 탐색기에서  C:\OracleXE18C\product\18.0.0\dbhomeXE\network\admin 에 간다.
    
    2. tnsnames.ora 파일을 메모장으로 연다.
    
    3.
    TEACHER =
  (DESCRIPTION =
    (ADDRESS = (PROTOCOL = TCP)(HOST = 192.168.0.220)(PORT = 1521))
    (CONNECT_DATA =
      (SERVER = DEDICATED)
      (SERVICE_NAME = XE)
    )
  )
    을 추가한다.
    HOST = 192.168.0.220 이 연결하고자 하는 원격지 오라클서버의 IP 주소이다.
    그런데 전제조건은 원격지 오라클서버(192.168.0.220)의 방화벽에서 포트번호 1521 을 허용으로 만들어주어야 한다.
    
    그리고 TEACHER 를 'Net Service Name 네트서비스네임(넷서비스명)' 이라고 부른다.   
    
    4. 명령프롬프트를 열어서 원격지 오라클서버(192.168.0.220)에 연결이 가능한지 테스트를 한다. 
      C:\Users\user>tnsping TEACHER 5
    
    별칭 분석을 위해 TNSNAMES 어댑터 사용
    (DESCRIPTION = (ADDRESS = (PROTOCOL = TCP)(HOST = 192.168.0.220)(PORT = 1521)) (CONNECT_DATA = (SERVER = DEDICATED) (SERVICE_NAME = XE)))에 접속하려고 시도하는 중
    확인(0밀리초)
    확인(20밀리초)
    확인(10밀리초)
    확인(20밀리초)
    확인(20밀리초)
    
    5.  데이터베이스 링크(database link) 만들기    
  
    create database link teacher_oracle_server
    connect to hr identified by gclass -- 이때 hr 과 암호 gclass 는 연결하고자 하는 원격지 오라클서버(192.168.0.220)의 계정명과 암호이다.  
    using 'TEACHER';  -- TEACHER 은 Net Service Name 네트서비스네임(넷서비스명) 이다. 
    -- Database link TEACHER_ORACLE_SERVER이(가) 생성되었습니다.
    
    SELECT *
    FROM employees@teacher_oracle_server    -- 원격지 오라클 서버(192.168.0.220)
    ORDER BY employee_id asc;
    
    SELECT *
    FROM employees@XE   -- 로컬서버
    ORDER BY employee_id asc;
    
    SELECT *
    FROM employees   -- 로컬서버    => 기본값
    ORDER BY employee_id asc;
    
    drop database link teacher_oracle_server;   -- 삭제가 됨
    
    
    -------------------------------------------------------
 -- ====★★★★★★★======================================================================================= --   
    -- IP 주소 연결하기
    DH =
  (DESCRIPTION =
    (ADDRESS = (PROTOCOL = TCP)(HOST = 192.168.0.190)(PORT = 1521))
    (CONNECT_DATA =
      (SERVER = DEDICATED)
      (SERVICE_NAME = XE)
    )
  )
  
  WS =
  (DESCRIPTION =
    (ADDRESS = (PROTOCOL = TCP)(HOST = 192.168.0.191)(PORT = 1521))
    (CONNECT_DATA =
      (SERVER = DEDICATED)
      (SERVICE_NAME = XE)
    )
  )
  -- 데이터베이스 링크 만들기
    create database link dh_oracle_server
    connect to hr identified by gclass -- 이때 hr 과 암호 gclass 는 연결하고자 하는 원격지 오라클서버(192.168.0.220)의 계정명과 암호이다.  
    using 'DH';
    
    create database link ws_oracle_server
    connect to hr identified by gclass -- 이때 hr 과 암호 gclass 는 연결하고자 하는 원격지 오라클서버(192.168.0.220)의 계정명과 암호이다.  
    using 'WS';
    
 -- 데이터베이스 링크 만든거 연결
    SELECT *
    FROM employees@dh_oracle_server    -- 원격지 오라클 서버(192.168.0.190)
    ORDER BY employee_id asc;
    
    SELECT *
    FROM employees@ws_oracle_server    -- 원격지 오라클 서버(192.168.0.191)
    ORDER BY employee_id asc; 
    
 --=========================================================================================================== --   
    
    SELECT *
    FROM employees@teacher_oracle_server    -- 원격지 오라클 서버(192.168.0.220)
    ORDER BY employee_id asc;
    
    
    update employees set first_name = '냥냥', last_name = '고양이', salary = 12345;
    -- 107개 행 이(가) 업데이트되었습니다.
    commit;
    -- 커밋 완료.
    
    update employees E set first_name = (select first_name
                                        from employees@teacher_oracle_server
                                        where employee_id = E.employee_id)    -- 백업본에 있는 employeee_id = 원본에 있는 employee_id
                        , last_name = (select last_name
                                        from employees@teacher_oracle_server
                                        where employee_id = E.employee_id)
                        , salary = (select salary
                                        from employees@teacher_oracle_server
                                        where employee_id = E.employee_id);
    -- 107개 행 이(가) 업데이트되었습니다.
    commit;
    -- 커밋 완료.
    select *
    from employees  -- 로컬서버
    order by employee_id asc;
    -- => 내 파일에서도 강사님 이름이 뜬다.(사원번호 : 100번)
    
    -- 원상복구
    update employees set first_name = 'Steven', last_name = 'King'
    where employee_id = 100;
    -- 1 행 이(가) 업데이트되었습니다.
    commit;
    -- 커밋 완료.
    
    
    ----- *** Sub Query 절을 사용하여 데이터를 입력(insert)할 수 있다. *** -----
  
    select *
    from tbl_employees_3060;
      
    desc tbl_employees_3060;
  
    insert into tbl_employees_3060
    select department_id
        , employee_id
        , first_name || ' ' || last_name
        , nvl(salary + (salary * commission_pct), salary)
        , case when substr(jubun, 7, 1) in('1','3') then '남' else '여' end
        , jubun
    from employees
    where department_id = 40;
  -- 1 행 이(가) 삽입되었습니다.
  
    select *
    from tbl_employees_3060;
   
    insert into tbl_employees_3060(ENAME, DEPARTMENT_ID, EMPLOYEE_ID, MONTHSAL, GENDER, JUBUN) -- 컬럼명에 맞춰서 입력해주어야 한다. 
    select first_name || ' ' || last_name                                                      -- 사원번호가 먼저 나옴
        , department_id
        , employee_id
        , nvl(salary + (salary * commission_pct), salary)
        , case when substr(jubun, 7, 1) in('1','3') then '남' else '여' end
        , jubun
    from employees
    where department_id = 50;
  -- 45개 행 이(가) 삽입되었습니다.
    commit;
    -- 커밋 완료.
    select *
    from tbl_employees_3060;
    -- => select 되어진 테이블을 넣을 수 있다!!
    
    
    
    
    
    
    ----- *** Sub Query 절을 사용하여 데이터를 수정(update)할 수 있다. *** -----
  
  -- tbl_employees_3060 테이블에서 부서번호 60번에 해당하는 사원들의 monthsal 값을 
  -- employees 테이블에 있는 부서번호 30번에 해당하는 사원들의 월급평균 값으로 변경하세요. 
  
    update tbl_employees_3060 set monthsal = ( select avg( nvl(salary+(salary*commission_pct), salary) ) 
                                             from employees 
                                             where department_id = 30 )
    where department_id = 60; 
    -- 5개 행 이(가) 업데이트되었습니다.
    commit;
    -- 커밋 완료.
    
    select * 
    from tbl_employees_3060;
    
    
    
    
    
    
    
    ----- *** Sub Query 절을 사용하여 데이터를 삭제(delete)할 수 있다. *** -----
  
  --- *** tbl_employees_3060 테이블에서 monthsal 이 평균 monthsal 보다 작은 행들만 삭제하세요. *** ---
    delete from tbl_employees_3060
    where monthsal < ( tbl_employees_3060 테이블의 monthsal 컬럼의 평균 );
  
    -- tbl_employees_3060 테이블의 monthsal 컬럼의 평균
    select avg(monthsal)
    from tbl_employees_3060;
    -- 3658.771929824561403508771929824561403509
  
    delete from tbl_employees_3060
    where monthsal < ( select avg(monthsal) from tbl_employees_3060 );
    -- 40개 행 이(가) 삭제되었습니다.
  
    select * 
    from tbl_employees_3060;
  
    commit;
    
    
    
    
    
    
   -----------------------------------------------------------------------------------------
           --  !!!! 중요    JOIN 은 면접에 가시면 무조건 물어봅니다.      중요 !!!! --
   -----------------------------------------------------------------------------------------
   
           ------- ====== **** JOIN **** ====== --------
   /*
       JOIN(조인)은 테이블(뷰)과 테이블(뷰)을 합치는 것을 말하는데 
       행(ROW) 과 행(ROW)을 합치는 것이 아니라, 컬럼(COLUMN) 과 컬럼(COLUMN)을 합치는 것을 말한다.
       위에서 말한 행(ROW) 과 행(ROW)을 합치는 것은 UNION 연산자를 사용하는 것이다.
   
       -- 면접질문 : INNER JOIN(내부조인) 과 OUTER JOIN(외부조인)의 차이점에 대해 말해보세요.
       -- 면접질문 : JOIN 과 UNION 의 차이점에 대해서 말해보세요.
       
       
       A = {1, 2, 3}    원소가 3개
       B = {a, b}       원소가 2개
       
       A ⊙ B = { (1,a), (1,b)
                 ,(2,a), (2,b)
                 ,(3,a), (3,b) }
                 
       데카르트곱(수학)  ==> 원소의 곱 :   3 * 2 = 6개(모든 경우의 수)
       --> 수학에서 말하는 데카르트곱을 데이터베이스에서는 Catersian Product 라고 부른다.
       
       
       JOIN  =>  SQL 1992 CODE 방식  -->  테이블(뷰) 과 테이블(뷰) 사이에 콤마(,)를 찍어주는 것.  
                                         콤마(,)를 찍어주는 것을 제외한 나머지 문법은 데이터베이스 밴더(회사) 제품마다 조금씩 다르다.   
       
       JOIN  =>  SQL 1999 CODE 방식(ANSI) --> 테이블(뷰) 과 테이블(뷰) 사이에 JOIN 이라는 단어를 넣어주는 것.
                                             ANSI(표준화) SQL
   */  
   
   
   
   select * 
   from employees;
   
   select count(*) 
   from employees;  -- 107 개행
   
   select * 
   from departments;
  
   select count(*) 
   from departments; -- 27 개행 
   
   select * 
   from employees , departments --> SQL 1992 CODE 방식, Catersian Product // 경우의 수 : 107*27 = 2889
   order by employee_id;                               
  
   select * 
   from employees CROSS JOIN departments    --> SQL 1999 CODE 방식, Catersian Product  // cross join 은 ,(콤마) 와 같다.
   order by employee_id; 
   
   select count(*) 
   from employees CROSS JOIN departments; --> SQL 1999 CODE 방식  //  2889 개행

                                          
/*
      1. CROSS JOIN 은 프로야구를 예로 들면 10개팀이 있는데 
         각 1팀당 경기를 몇번해야 하는지 구할때 쓰인다. 1팀당 모든 팀과 경기를 펼쳐야 한다. 
         
      2. CROSS JOIN 은 그룹함수로 나온 1개의 행을 가지고 어떤 데이터 값을 얻으려고 할때 사용된다. 
*/
   
    -- [ CROSS JOIN 사용 예 ]
  /*
      사원번호    사원명    부서번호    기본급여    모든사원들의기본급여평균    기본급여평균과의차액    
      이 나오도록 하세요.
  */  
    /*
    -------------------------------------   ------------------------
    사원번호    사원명    부서번호    기본급여     모든사원들의기본급여평균
    -------------------------------------   ------------------------
        107개행                                   1개행
    */
    
    select employee_id as 사원번호
        , first_name || ' ' || last_name as 사원명
        , department_id as 부서번호
        , salary as 기본급여
        , avg(salary) as 모든사원들의기본급여평균 -- 오류!!!! -> 107개행이 아닌 1행이기 때문
    from employees;
    
    -- CROSS JOIN 이용하여 표현하기
    SELECT 사원번호, 사원명, 부서번호
        , to_char(기본급여,'99,999') as 기본급여
        , to_char(모든사원들의기본급여평균,'9,999') as 모든사원들의기본급여평균
        , to_char(기본급여 - 모든사원들의기본급여평균,'99,999') as 기본급여평균과의차액
        , trunc(기본급여/모든사원들의기본급여평균,1) as 평균대비기본급여퍼센티지
    FROM
    (
        select employee_id as 사원번호
            , first_name || ' ' || last_name as 사원명
            , department_id as 부서번호
            , salary as 기본급여
        from employees
    ) A -- 107개행
    CROSS JOIN  -- SQL 1999 CODE (ANSI) 표준
    (
        select trunc(avg(salary),0) 모든사원들의기본급여평균
        from employees
    ) B -- 1개행
    ORDER BY 1; 
    
    -- 또는
    
    -- SQL 1992 CODE 방식(콤마(,)) 이용하여 표현하기
    SELECT 사원번호, 사원명, 부서번호
        , to_char(기본급여,'99,999') as 기본급여
        , to_char(모든사원들의기본급여평균,'9,999') as 모든사원들의기본급여평균
        , to_char(기본급여 - 모든사원들의기본급여평균,'99,999') as 기본급여평균과의차액
        , trunc(기본급여/모든사원들의기본급여평균,1) as 평균대비기본급여퍼센티지
    FROM
    (
        select employee_id as 사원번호
            , first_name || ' ' || last_name as 사원명
            , department_id as 부서번호
            , salary as 기본급여
        from employees
    ) A -- 107개행
    ,   -- SQL 1992 CODE
    (
        select trunc(avg(salary),0) 모든사원들의기본급여평균
        from employees
    ) B -- 1개행
    ORDER BY 1;
    
    -- 또는
    -- WITH 절 이용하여 표현하기
    WITH
    A AS
    (
        select employee_id as 사원번호
            , first_name || ' ' || last_name as 사원명
            , department_id as 부서번호
            , salary as 기본급여
        from employees
    ) -- 107개행
    ,
    B AS
    (
        select trunc(avg(salary),0) 모든사원들의기본급여평균
        from employees
    ) -- 1개행
    SELECT 사원번호, 사원명, 부서번호
        , to_char(기본급여,'99,999') as 기본급여
        , to_char(모든사원들의기본급여평균,'9,999') as 모든사원들의기본급여평균
        , to_char(기본급여 - 모든사원들의기본급여평균,'99,999') as 기본급여평균과의차액
        , trunc(기본급여/모든사원들의기본급여평균,1) as 평균대비기본급여퍼센티지
    FROM A CROSS JOIN B    -- SQL 1999 CODE
    ORDER BY 1;
    
    
    -- 또는
    
    WITH
    A AS
    (
        select employee_id as 사원번호
            , first_name || ' ' || last_name as 사원명
            , department_id as 부서번호
            , salary as 기본급여
        from employees
    ) -- 107개행
    ,
    B AS
    (
        select trunc(avg(salary),0) 모든사원들의기본급여평균
        from employees
    ) -- 1개행
    SELECT 사원번호, 사원명, 부서번호
        , to_char(기본급여,'99,999') as 기본급여
        , to_char(모든사원들의기본급여평균,'9,999') as 모든사원들의기본급여평균
        , to_char(기본급여 - 모든사원들의기본급여평균,'99,999') as 기본급여평균과의차액
        , trunc(기본급여/모든사원들의기본급여평균,1) as 평균대비기본급여퍼센티지
    FROM A , B -- SQL 1992 CODE
    -- 여기서 , 은 JOIN 이다.
    ORDER BY 1;
    
    /*
    기본급여 : 기본급여평균 = x : 1
    ==> 기본급여 * 1 = 기본급여평균 * x
    ==> x = (기본급여 * 1)/기본급여평균
    ==> x = (기본급여)/기본급여평균
    */
    
    SELECT 사원번호, 사원명, 부서번호
        , to_char(기본급여,'99,999') as 기본급여
        , to_char(모든사원들의기본급여평균,'9,999') as 모든사원들의기본급여평균
        , to_char(기본급여 - 모든사원들의기본급여평균,'99,999') as 기본급여평균과의차액
        , trunc(기본급여/모든사원들의기본급여평균,1) as 평균대비기본급여퍼센티지
    FROM
    (
        select employee_id as 사원번호
            , first_name || ' ' || last_name as 사원명
            , department_id as 부서번호
            , salary as 기본급여
        from employees
    ) A 
    CROSS JOIN 
    (
        select trunc(avg(salary),0) 모든사원들의기본급여평균
        from employees
    ) B
    ORDER BY 1;
    
    
    
    
    
    
    
    
      ---- **** EQUI JOIN (SQL 1992 CODE 방식) **** ----

    select *
    from departments;
      
    select *
    from employees;
    
    select *
    from employees , departments    -- SQL 1992 CODE 방식
    where employees.department_id = departments.department_id   -- 부서번호가 null 인 Kimberely Grant 가 나오지 않는 틀린풀이이다.
    order by employee_id;
    -- 이때 where 절을 JOIN 조건절 이라고 부른다.
    
    select *
    from employees E, departments D -- SQL 1992 CODE 방식
    where E.department_id = D.department_id(+) -- 부서번호가 null 인 Kimberely Grant 가 나오는 올바른 풀이이다.
    order by employee_id;
    /*
     조인 조건절에서 (+)가 안 붙은 테이블인 E(employees) 테이블의 모든 행을 출력해주고 나서   ==> 우선 모든 행 출력
     이어서 where E.department_id = D.department_id 조건에 만족하는 행들을 보여준다.      ==> CROSS JOIN 
     그러므로 E.department_id 값이 null 인 킴밸리그랜트는 출력되어진다.
    */
    
    select *
    from employees E, departments D -- SQL 1992 CODE 방식
    where E.department_id(+) = D.department_id
    order by employee_id;
    /*
     조인 조건절에서 (+)가 안 붙은 테이블인 D(departments) 테이블의 모든 행을 출력해주고 나서   ==> 우선 모든 행 출력
     이어서 where E.department_id = D.department_id 조건에 만족하는 행들을 보여준다.      ==> CROSS JOIN 
     그러므로 departments 의 부서번호가 120번 부터 270번 부서까지 출력되어진다.
    */
    
    select *
    from employees E, departments D -- SQL 1992 CODE 방식
    where E.department_id(+) = D.department_id(+)   --- 오류!!!!
    order by employee_id;
    
    /*
        [참고]
        microsoft 사 제품인 MS-SQL 서버에서는 아래와 같이 한다.
        select *
        from employees E, departments D
        where E.department_id *= D.department_id    -- '=' 중심으로 *이 가까운 곳이 (+) 와 같은 역할
        order by employee_id;
    */
    
    ---- **** INNER JOIN(== 내부조인) (SQL 1999 CODE 방식, ANSI) **** ----

    select *
    from employees E INNER JOIN departments D  -- SQL 1999 CODE 방식
    ON E.department_id = D.department_id
    order by employee_id;
    -- 이때 ON 절을 JOIN 조건절 이라고 부른다.
    
    select *
    from employees E JOIN departments D  -- INNER 는 생략가능하다.
    ON E.department_id = D.department_id
    order by employee_id;
    -- 이때 ON 절을 JOIN 조건절 이라고 부른다.


    ---- **** OUTER JOIN(== 외부조인) (SQL 1999 CODE 방식, ANSI) **** ----

    select *
    from employees E LEFT OUTER JOIN departments D  -- SQL 1999 CODE 방식 // OUTER JOIN 을 중심으로 왼쪽에 있는 테이블을 보여주고 CROSS JOIN
    ON E.department_id = D.department_id
    order by employee_id;
    -- 이때 ON 절을 JOIN 조건절 이라고 부른다.

    select *
    from employees E FULL OUTER JOIN departments D  -- SQL 1999 CODE 방식 // OUTER JOIN 을 중심으로 양쪽에 있는 테이블을 보여주고 CROSS JOIN
    ON E.department_id = D.department_id
    order by employee_id;
    -- 이때 ON 절을 JOIN 조건절 이라고 부른다.
    
    select *
    from employees E FULL JOIN departments D  -- OUTER 는 생략가능하다.
    ON E.department_id = D.department_id
    order by employee_id;
    -- 이때 ON 절을 JOIN 조건절 이라고 부른다.
    
    select *
    from employees E CROSS JOIN departments D;  -- 모든 경우의 수. Catersian Product  // 107*27 = 2889 행
    
    select *
    from employees E JOIN departments D     -- 106개행(E 에 있는 행)
    ON E.department_id = D.department_id;   -- INNER 조인
    
    select *
    from employees E LEFT JOIN departments D    -- 107개행(NULL 포함 E 에 있는 행 나열 후 E와 D 가 department_id가 겹치는 행 넣기)
    ON E.department_id = D.department_id;    -- OUTER 조인
    
    select *
    from employees E RIGHT JOIN departments D   -- 122개행(D의 행 나열 후 D와 E가 department_id가 겹치는 행 넣기)
    ON E.department_id = D.department_id;    -- OUTER 조인
    
    select *
    from employees E FULL JOIN departments D    -- 123개행(E와 D의 겹치는 행 + E 만 가지고 있는 행 + D 만 가지고 있는 행)
    ON E.department_id = D.department_id;    -- OUTER 조인
    

    /*
    부서번호   부서명   사원번호   사원명   기본급여
     이 나오도록 하세요.
    
      부서번호                        부서명          사원번호   사원명   기본급여
     --------                       -------        -------------------------
     departments.department_id      departments             employees 
     employees.department_id
    */
    
    -- ◆ [SQL 1992 CODE] ◆
    select E.department_id as 부서번호
        , D.department_name as 부서명
        , E.employee_id as 사원번호
        , E.first_name || ' ' || E.last_name as 사원명
        , E.salary as 기본급여
    from employees E, departments D -- SQL 1992 CODE
    where E.department_id = D.department_id(+);
    -- department_id as 부서번호 일 경우, 오류!! ==> ORA-00918: 열의 정의가 애매합니다
    -- department_id 가 E와 D 모두 가지고 있으므로 E.department_id 나 D.department_id 를 적어주어야 한다.
    -- department_id 를 제외한 다른 컬럼은 중복이 아니므로, E. 이나 D. 을 적을 필요는 없다. 하지만 department_id 는 반드시 적어야 한다!!!
    -- (+) 가 안 붙은 행 먼저 나열
    
    -- ◆ [SQL 1999 CODE] ◆
    select E.department_id as 부서번호
        , D.department_name as 부서명
        , E.employee_id as 사원번호
        , E.first_name || ' ' || E.last_name as 사원명
        , E.salary as 기본급여
    from employees E JOIN departments D -- SQL 1999 CODE
    ON E.department_id = D.department_id;
    -- INNER 은 생략 가능
    -- INNER JOIN 의 조건절은 where 이 아니라 ON 을 사용한다.
    
    select E.department_id as 부서번호
        , D.department_name as 부서명
        , E.employee_id as 사원번호
        , E.first_name || ' ' || E.last_name as 사원명
        , E.salary as 기본급여
    from employees E LEFT JOIN departments D -- SQL 1999 CODE
    ON E.department_id = D.department_id;
    -- OUTER JOIN 중 하나로 왼쪽을 먼저 나열할 경우 LEFT, 오른쪽을 먼저 나열할 경우 RIGHT 을 입력 -> LEFT/RIGHT OUTER JOIN
    -- OUTER 은 생략 가능
    -- OUTER JOIN 의 조건절은 where 이 아니라 ON 을 사용한다.
    
    /*
        30번, 60번 부서에 근무하는 사원들만
        부서번호   부서명   사원번호   사원명   기본급여
        이 나오도록 하세요.
     */
     
     -- ◆ [SQL 1992 CODE] ◆
    select E.department_id as 부서번호
        , D.department_name as 부서명
        , E.employee_id as 사원번호
        , E.first_name || ' ' || E.last_name as 사원명
        , E.salary as 기본급여
    from employees E, departments D -- SQL 1992 CODE
    where E.department_id = D.department_id
        and E.department_id in (30,60);
     
    -- ◆ [SQL 1999 CODE] ◆
    select E.department_id as 부서번호
        , D.department_name as 부서명
        , E.employee_id as 사원번호
        , E.first_name || ' ' || E.last_name as 사원명
        , E.salary as 기본급여
    from employees E JOIN departments D -- SQL 1999 CODE
    ON E.department_id = D.department_id
    where E.department_id in (30,60); 
     
------------------------------------------------------------
     -- ◆ 권장 -> [SQL 1992 CODE] ◆
     select E.department_id as 부서번호
        , department_name as 부서명
        , employee_id as 사원번호
        , fullname as 사원명
        , salary as 기본급여
    from
    (
        select department_id, employee_id, first_name || ' ' || last_name as fullname, salary
        from employees 
        where department_id in(30,60)
    )E
    ,   -- SQL 1992 CODE
    (
        select department_id, department_name
        from departments 
        where department_id in(30,60)
    )D 
    where E.department_id = D.department_id;    -- join 조건절
     
    -- ◆ 권장 -> [SQL 1999 CODE] ◆
    select E.department_id as 부서번호
        , department_name as 부서명
        , employee_id as 사원번호
        , fullname as 사원명
        , salary as 기본급여
    from 
    (
        select department_id, employee_id, first_name || ' ' || last_name as fullname, salary
        from employees 
        where department_id in(30,60)
    ) E
    JOIN    -- SQL 1999 CODE
    (
        select department_id, department_name
        from departments 
        where department_id in(30,60)
    ) D 
    ON E.department_id = D.department_id; 
     
     
     --- WITH 절
     WITH
     E AS
     (
        select department_id, employee_id, first_name || ' ' || last_name as fullname, salary
        from employees 
        where department_id in(30,60)
     )
     ,
     D AS
     (
        select department_id, department_name
        from departments 
        where department_id in(30,60)
     )
    SELECT E.department_id as 부서번호
        , department_name as 부서명
        , employee_id as 사원번호
        , fullname as 사원명
        , salary as 기본급여
    FROM E JOIN D
    ON E.department_id = D.department_id;
    
    
    
    -------------------------------------------------------------------------
    
    select department_id as 부서번호
        , count(*) as 인원수
    from employees
    group by department_id
    order by 1;
    /*
    -- 아래와 같이 나오도록 하세요.
    ----------------------
        부서명     인원수
    ----------------------
    */
    
    SELECT department_name as 부서명
        , cnt as 인원수
    FROM
    (
        select department_id 
            , count(*) as cnt
        from employees
        group by department_id
        order by 1
    ) E
    LEFT JOIN departments D
    ON E.department_id = D.department_id
    order by 1;
    
    -- 또는
    WITH
    V AS
    (
        select department_name
        from employees E LEFT JOIN departments D
        ON E.department_id = D.department_id
    )
    SELECT department_name as 부서명, count(*) as 인원수
    FROM V
    GROUP BY department_name
    ORDER BY 1;
    
    -- 내방법 --
    select department_name, count(*)
    from 
    employees E
    LEFT JOIN
    (
        select department_id, department_name 
        from departments
    ) D
    ON E.department_id = D.department_id
    group by D.department_name
    order by 1;
    
    -- 우석 오빠 방법 中 [SQL 1999 CODE] --
    -- => 부서번호 순서대로 나열이 가능하다.
    WITH
    E AS
    (
    select department_id  , count(*) as cnt
    from employees
    group by department_id
    )
    ,
    D AS
    (
    select department_id , department_name
    from departments
    )
    select department_name as 부서명
         , cnt as 인원수
    from E LEFT JOIN D  -- SQL 1999 CODE
    on E.department_id = D.department_id
    order by E.department_id; 

    select
        EMPLOYEE_ID,
        SALARY
    from EMPLOYEES;
        
    
    
    
    
    
    
        ---- **** JOIN 을 사용한 응용문제 **** ----
    /*
        아래와 같이 나오도록 하세요.
        
        -----------------------------------------------------------------------
         부서번호   사원번호   사원명   기본급여   부서평균기본급여    부서평균과의차액
        -----------------------------------------------------------------------
        
        
        ---------------------------       --------------------------------------------
          부서번호   부서평균기본급여          부서번호   사원번호   사원명    기본급여
        ---------------------------       --------------------------------------------
            10          3500                 10        1001     홍길동    3700
            20          4000                 10        1002     이순신    2500
            30          2800                 20        2001     엄정화    3500
            ..          ....                 20        2002     유관순    4500
            110         3200                 ..        ....     .....    .....
         --------------------------       ---------------------------------------------
    */
    
    SELECT V1.department_id as 부서번호
        , employee_id as 사원번호
        , fullname as 사원명
        , to_char(salary,'99,999') as 기본급여
        , to_char(dept_avg_sal,'99,999') as 부서평균기본급여
        , to_char(salary - dept_avg_sal,'99,999') as 부서평균과의차액
    FROM
    (
        select department_id, trunc(avg(salary)) as dept_avg_sal
        from employees
        group by department_id
    ) V1
    RIGHT JOIN
    (
        select department_id
            , employee_id
            , first_name || ' ' || last_name as fullname
            , salary
        from employees
    ) V2
    ON V1.department_id = V2.department_id  -- RIGHT JOIN 이 아닌 INNER JOIN 사용시, 조건절에서 NVL 을 해주면 된다.
    ORDER BY 1,4;
    
    
    
    
    /*
        아래와 같이 나오도록 하세요.
        
        ----------------------------------------------------------------------------------------------------------
         부서번호   사원번호   사원명   기본급여   부서평균기본급여    부서평균과의차액    부서내기본급여등수   전체기본급여등수
        ----------------------------------------------------------------------------------------------------------
        
        
    */
    
    SELECT V1.department_id as 부서번호
        , employee_id as 사원번호
        , fullname as 사원명
        , to_char(salary,'99,999') as 기본급여
        , to_char(dept_avg_sal,'99,999') as 부서평균기본급여
        , to_char(salary - dept_avg_sal,'99,999') as 부서평균과의차액
        , rank() over(partition by V1.department_id order by salary desc) as 부서내기본급여등수 
        , rank() over(order by salary desc) as 전체기본급여등수
    FROM
    (
        select department_id, trunc(avg(salary)) as dept_avg_sal
        from employees
        group by department_id
    ) V1
    RIGHT JOIN
    (
        select department_id
            , employee_id
            , first_name || ' ' || last_name as fullname
            , salary
        from employees
    ) V2
    ON V1.department_id = V2.department_id  -- RIGHT JOIN 이 아닌 INNER JOIN 사용시, 조건절에서 NVL 을 해주면 된다.
    ORDER BY 1,4 desc;
    
    


    
    /*
        부서번호가 10, 30, 50번 부서에 근무하는 사원들만 아래와 같이 나오도록 하세요.
        
        ----------------------------------------------------------------------------------------------------------
         부서번호   사원번호   사원명   기본급여   부서평균기본급여    부서평균과의차액    부서내기본급여등수   전체기본급여등수
        ----------------------------------------------------------------------------------------------------------
        
        
    */
    
    
    -- 아래의 풀이에서 "전체기본급여등수"는 부서번호 10, 30, 50번 내에서 전체등수를 가리키는 것이다.
    SELECT V1.department_id as 부서번호
        , employee_id as 사원번호
        , fullname as 사원명
        , to_char(salary,'99,999') as 기본급여
        , to_char(dept_avg_sal,'99,999') as 부서평균기본급여
        , to_char(salary - dept_avg_sal,'99,999') as 부서평균과의차액
        , rank() over(partition by V1.department_id order by salary desc) as 부서내기본급여등수 
        , rank() over(order by salary desc) as 전체기본급여등수
    FROM
    (
        select department_id, trunc(avg(salary)) as dept_avg_sal
        from employees
        where department_id in(10, 30, 50)
        group by department_id
    ) V1
    RIGHT JOIN
    (
        select department_id
            , employee_id
            , first_name || ' ' || last_name as fullname
            , salary
        from employees
        where department_id in(10, 30, 50)
    ) V2
    ON V1.department_id = V2.department_id  -- RIGHT JOIN 이 아닌 INNER JOIN 사용시, 조건절에서 NVL 을 해주면 된다.
    ORDER BY 1,4 desc;
    
    
    -- 아래의 풀이가 올바른 것이다.
    
    SELECT V1.department_id as 부서번호
        , employee_id as 사원번호
        , fullname as 사원명
        , to_char(salary,'99,999') as 기본급여
        , to_char(dept_avg_sal,'99,999') as 부서평균기본급여
        , to_char(salary - dept_avg_sal,'99,999') as 부서평균과의차액
        , rank() over(partition by V1.department_id order by salary desc) as 부서내기본급여등수 
        , rank() over(order by salary desc) as 전체기본급여등수
    FROM
    (
        select department_id, trunc(avg(salary)) as dept_avg_sal
        from employees
        where department_id in(10, 30, 50)
        group by department_id
    ) V1
    RIGHT JOIN
    (
        select department_id
            , employee_id
            , first_name || ' ' || last_name as fullname
            , salary
        from employees
        -- where department_id in(10, 30, 50)
    ) V2
    ON V1.department_id = V2.department_id
    ORDER BY 1,4 desc;
    
    
    -- 강사님 방법 -- 
    SELECT V1.department_id as 부서번호
        , employee_id as 사원번호
        , fullname as 사원명
        , to_char(salary,'99,999') as 기본급여
        , to_char(dept_avg_sal,'99,999') as 부서평균기본급여
        , to_char(salary - dept_avg_sal,'99,999') as 부서평균과의차액
        , dept_rank_sal as 부서내기본급여등수 
        , total_rank_sal as 전체기본급여등수
    FROM
    (
        select department_id, trunc(avg(salary)) as dept_avg_sal
        from employees
        where department_id in(10, 30, 50)
        group by department_id
    ) V1
    JOIN
    (
        select department_id
            , employee_id
            , first_name || ' ' || last_name as fullname
            , salary
            , rank() over(partition by department_id order by salary desc) as dept_rank_sal
            , rank() over(order by salary desc) as total_rank_sal
        from employees
    ) V2
    ON V1.department_id = V2.department_id  
    ORDER BY 1,4 desc;
    
    
    
    -- 또는 WITH 절을 사용한 inline view JOIN
    WITH
    V1 AS
    (
        select department_id, trunc(avg(salary)) as dept_avg_sal
        from employees
        where department_id in(10, 30, 50)
        group by department_id
    )
    ,
    V2 AS
    (
        select department_id
            , employee_id
            , first_name || ' ' || last_name as fullname
            , salary
            , rank() over(partition by department_id order by salary desc) as dept_rank_sal
            , rank() over(order by salary desc) as total_rank_sal
        from employees
    )
    SELECT V1.department_id as 부서번호
        , employee_id as 사원번호
        , fullname as 사원명
        , to_char(salary,'99,999') as 기본급여
        , to_char(dept_avg_sal,'99,999') as 부서평균기본급여
        , to_char(salary - dept_avg_sal,'99,999') as 부서평균과의차액
        , dept_rank_sal as 부서내기본급여등수 
        , total_rank_sal as 전체기본급여등수
    FROM V1 JOIN V2
    ON V1.department_id = V2.department_id  
    ORDER BY 1,4 desc;
    
    
    
    
    
    
    
    
     ---- =========== *** NON-EQUI JOIN *** ============= ----
  /*
      조인조건절에 사용되는 컬럼의 값이 특정한 범위에 속할 때 사용하는 것이 NON-EQUI JOIN 이다. 
      NON-EQUI JOIN 에서는 조인조건절에 = 을 사용하는 것이 아니라 between A and B 를 사용하는 것이다. 
  */
  
  -- 소득세율 지표 관련 테이블을 생성한다. 
  create table tbl_taxindex
  (lowerincome   number       -- 연봉의 최저
  ,highincome    number       -- 연봉의 최대
  ,taxpercent    number(2,2)  -- 세율  -0.99 ~ 0.99 
  );
  -- Table TBL_TAXINDEX이(가) 생성되었습니다.
    
  insert into tbl_taxindex(lowerincome,highincome,taxpercent)
  values(1, 99999, 0.02);

  insert into tbl_taxindex(lowerincome,highincome,taxpercent)
  values(100000, 149999, 0.05);

  insert into tbl_taxindex(lowerincome,highincome,taxpercent)
  values(150000, 199999, 0.08);

  insert into tbl_taxindex(lowerincome,highincome,taxpercent)
  values(200000, 10000000000000000, 0.1);

  commit;
  
  select * 
  from tbl_taxindex;
  /*
  ------------------------------------------------------
   사원번호     사원명     연봉     세율      소득세액
  ------------------------------------------------------
    1001       홍길동    50000    0.02      50000 *  0.02
    1002       엄정화   170000    0.08     170000 *  0.08
    ....       ......  ......    .....     .............
    
 */

    --- SQL 1992 CODE
    select employee_id as 사원번호
        , first_name || ' ' || last_name as 사원명
        , to_char(nvl(salary + (salary * commission_pct), salary) * 12,'999,999') as 연봉
        , taxpercent as 세율
        , to_char(trunc(nvl(salary + (salary * commission_pct), salary) * 12 * taxpercent,0),'99,999') as 소득세액
    from employees E, tbl_taxindex T
    where nvl(salary + (salary * commission_pct), salary) * 12 between T.lowerincome and T.highincome
    order by 3;
    
    --- SQL 1999 CODE
    select employee_id as 사원번호
        , first_name || ' ' || last_name as 사원명
        , to_char(nvl(salary + (salary * commission_pct), salary) * 12,'999,999') as 연봉
        , taxpercent as 세율
        , to_char(trunc(nvl(salary + (salary * commission_pct), salary) * 12 * taxpercent,0),'99,999') as 소득세액
    from employees E JOIN tbl_taxindex T
    ON nvl(salary + (salary * commission_pct), salary) * 12 between T.lowerincome and T.highincome
    order by 3;
    
    
    
    
    
       ------------------ ===== **** SELF JOIN(자기조인) **** ===== ------------------ 
   /*
       자기자신의 테이블(뷰)을 자기자신의 테이블(뷰)과 JOIN 시키는 것을 말한다.
       이때 반드시 테이블(뷰)에 대한 alias(별칭)를 달리 주어서 실행해야 한다.
   */
   
   --- 아래처럼 나오도록 하세요... ---
/*
   -------------------------------------------------------------------------------------------------------
    사원번호              사원명             이메일     급여      직속상관번호             직속상관명
  employee_id   first_name || last_name    email     salary   employee_id      first_name || last_name
  -------------------------------------------------------------------------------------------------------
     100             Steven King           SKING     24000     null                 null 
     102             Lex De Haan           LDEHAAN   17000     100                  Steven King
     103             Alexander Hunold      AHUNOLD   9000      102                  Lex De Haan
     104             Bruce Ernst           BERNST    6000      103                  Alexander Hunold
*/

   select *
   from employees
   order by employee_id asc;
    
    --- SQL 1992 CODE ---
    select E1.employee_id as 사원번호
        , E1.first_name || ' ' || E1.last_name as 사원명
        , E1.email as 이메일
        , E1.salary as 급여
        , E2.employee_id as 직속상관번호
        , E2.first_name || ' ' || E2.last_name as 직속상관명 -- ' ' 이 없으면 null 이 나온다. 하지만 다른것들이 붙어져서 나온다.
    from employees E1, employees E2
    where E1.manager_id = E2.employee_id(+) -- 조인조건절
    order by E1.employee_id;
    
    --- SQL 1999 CODE ---
    select E1.employee_id as 사원번호
        , E1.first_name || ' ' || E1.last_name as 사원명
        , E1.email as 이메일
        , E1.salary as 급여
        , E2.employee_id as 직속상관번호
        , E2.first_name || ' ' || E2.last_name as 직속상관명 
    from employees E1 LEFT JOIN employees E2
    ON E1.manager_id = E2.employee_id -- 조인조건절
    order by E1.employee_id;
    
    
    
    
    
    select *
    from tbl_authorbook;
    
    --- SELF JOIN(자기조인)을 사용하여 tbl_authorbook 테이블에서 공저(도서명은 동일하지만 작가명이 다른 도서)로 지어진 도서정보를 나타내세요... ---
   ---                                                                =                 != 
   /*
       ---------------------------------
         도서명         작가명    로얄티
       ---------------------------------  
         로빈슨크루소    한석규        800
         로빈슨크루소    이순신        500
         그리스로마신화  유관순       1200
         그리스로마신화  이혜리       1300
         그리스로마신화  서강준       1700
       ---------------------------------  
   */
   
    -- [잘못된 경우]
    select B1.*
    from tbl_authorbook B1, tbl_authorbook B2   --- SQL 1992 CODE
    where B1.bookname = B2.bookname and
        B1.authorname != B2.authorname;
    ---- !!!! select 되어져 나온 결과물에서 행전체가 동일하게(중복하게) 나오는 경우 중복된 행을 1개만 보이게 하려면 select 바로 다음에 distinct 를 쓰면 된다. !!!! 
    select distinct B1.*
    from tbl_authorbook B1, tbl_authorbook B2   --- SQL 1992 CODE
    where B1.bookname = B2.bookname and
        B1.authorname != B2.authorname;
        
    select distinct B1.*
    from tbl_authorbook B1 JOIN tbl_authorbook B2   --- SQL 1999 CODE
    ON B1.bookname = B2.bookname and
        B1.authorname != B2.authorname;
    
    
    
    
    
    
        ----- ===== **** Multi Table JOIN (다중 테이블 조인) **** ===== -----
    
    --> 3개 이상의 테이블(뷰)을 가지고 조인 시켜주는 것이다.
    
   /*
       
      --------------------------------------------------------------------------------------------------------------------------
         대륙명        국가명                        부서주소                    부서번호    부서명       사원번호  사원명       기본급여
      --------------------------------------------------------------------------------------------------------------------------   
         Americas     United States of America     Seattle 2004 Charade Rd      90      Executive   100    Steven King   24000
   
   
         대륙명   ==>  regions.region_name                                    regions.region_id 
         국가명   ==>  countries.country_name                                 countries.region_id       countries.country_id
         부서주소  ==> locations.city || ' ' || locations.street_address      locations.country_id      locations.location_id
         부서명   ==> departments.department_name                             departments.location_id   departments.department_id 
         사원명   ==> employees.first_name || ' ' || employees.last_name      employees.department_id
   */    
    
   select * from tab;
   
   select *
   from regions;
   
   select *
   from countries;
    
   select * 
   from locations; 
    
   select * 
   from departments; 
    
   select * 
   from employees;
    
    
    
    
    
    -- !!!!! 부서번호가 NULL 인 킴밸리 그랜트가 나오도록 하세요..!!!!! (입사시 자주 물어봄!!)
    select R.region_name as 대륙명
        , country_name as 국가명
        , L.state_province || ' ' || L.city || ' ' || L.street_address as 부서주소
        , D.department_id as 부서번호
        , department_name as 부서명
        , employee_id as 사원번호
        , first_name || ' ' || last_name as 사원명
        , to_char(salary,'99,999') as 기본급여
    from regions R
    JOIN countries C
    ON R.region_id = C.region_id
    JOIN locations L
    ON C.country_id = L.country_id
    JOIN departments D
    ON L.location_id = D.location_id
    RIGHT JOIN employees E              -- 부서번호가 null 인 킴밸리 그랜트도 나타내기 
    ON D.department_id = E.department_id
    order by 사원번호; -- 107개행
    
    
    -- 대륙명이 'Americas' 인 것만 추출하세요..
    
    select R.region_name as 대륙명
        , country_name as 국가명
        , L.state_province || ' ' || L.city || ' ' || L.street_address as 부서주소
        , D.department_id as 부서번호
        , department_name as 부서명
        , employee_id as 사원번호
        , first_name || ' ' || last_name as 사원명
        , to_char(salary,'99,999') as 기본급여
    from regions R
    JOIN countries C
    ON R.region_name = 'Americas' and R.region_id = C.region_id
    JOIN locations L
    ON C.country_id = L.country_id
    JOIN departments D
    ON L.location_id = D.location_id
    JOIN employees E              
    ON D.department_id = E.department_id
    order by 사원번호; -- 70명
    
    --- 강사님 ---
    WITH
    V AS
    (
        select R.region_name as 대륙명
            , country_name as 국가명
            , L.state_province || ' ' || L.city || ' ' || L.street_address as 부서주소
            , D.department_id as 부서번호
            , department_name as 부서명
            , employee_id as 사원번호
            , first_name || ' ' || last_name as 사원명
            , to_char(salary,'99,999') as 기본급여
        from regions R
        JOIN countries C
        ON R.region_id = C.region_id
        JOIN locations L
        ON C.country_id = L.country_id
        JOIN departments D
        ON L.location_id = D.location_id
        RIGHT JOIN employees E            
        ON D.department_id = E.department_id
    )
    SELECT *
    FROM V
    WHERE 대륙명 = 'Americas'
    ORDER BY 사원번호;  -- 70명
    
    
    -- 또는 (아래처럼 권장)
    select R.region_name as 대륙명
        , country_name as 국가명
        , L.state_province || ' ' || L.city || ' ' || L.street_address as 부서주소
        , D.department_id as 부서번호
        , department_name as 부서명
        , employee_id as 사원번호
        , first_name || ' ' || last_name as 사원명
        , to_char(salary,'99,999') as 기본급여
    from (select * from regions where region_name = 'Americas') R
    JOIN countries C
    ON R.region_id = C.region_id
    JOIN locations L
    ON C.country_id = L.country_id
    JOIN departments D
    ON L.location_id = D.location_id
    JOIN employees E              
    ON D.department_id = E.department_id
    order by 사원번호; -- 70명
    
    
    
    
    
    
    ---- [과제] -----
--  아래와 같이 나오도록 하세요...
    
-- 사원수가 107명이 나오도록 하세요
/*
        ----------------------------------------------------------------------------------------------------------------------------------------------------
         부서번호    부서명    부서주소    부서장성명    사원번호   사원명    성별    나이    연봉    연봉소득세액    부서내연봉평균차액    부서내연봉등수     전체연봉등수 
        ----------------------------------------------------------------------------------------------------------------------------------------------------
*/

/*
       email : tjdudgkr0959@naver.com
       메일제목 : SQL JOIN 과제_양혜정
       첨부파일 : SQL JOIN 과제_양혜정.txt
*/


    WITH
    B AS
    (
        SELECT employee_id, gender
            , case when this_year_birthday > to_date(to_char(sysdate,'yyyymmdd'),'yyyymmdd')
                        then extract(year from sysdate) - birthyear - 1 
                        else extract(year from sysdate) - birthyear
                        end as age
        FROM
        (
            select employee_id 
                ,case when substr(jubun,7,1) in('1','3') then '남' else '여' end as gender 
                , to_date(to_char(sysdate,'yyyy') || substr(jubun,3,4),'yyyymmdd') as this_year_birthday
                , case when substr(jubun,7,1) in('1','2') then '19' else '20' end || substr(jubun,1,2) as birthyear
            from employees
        ) A
    )
    ,
    C AS
    (   
        select department_id
            , round(avg(nvl(salary + (salary * commission_pct),salary) * 12),1) as avg_year_money
        from employees
        group by department_id
    )
    ,
    NAME AS
    (
        select E.department_id
            , first_name || ' ' || last_name as fullname
        from employees E JOIN departments D
        ON E.employee_id = D.manager_id
    )
    select E.department_id as 부서번호
        , department_name as 부서명
        , street_address || ' ' || city || ' ' || state_province as 부서주소
        , fullname as 부서장성명
        , E.employee_id as 사원번호
        , first_name || ' ' || last_name as 사원명    
        , gender as 성별
        , age as 나이
        , to_char(nvl(salary + (salary * commission_pct), salary) * 12,'999,999') as 연봉
        , to_char(trunc(nvl(salary + (salary * commission_pct), salary) * 12 * taxpercent,0),'99,999') as 연봉소득세액
        , case when D.department_id is null 
            then nvl(salary + (salary * commission_pct), salary) * 12 - (select avg_year_money from C where department_id is null)
        else nvl(salary + (salary * commission_pct), salary) * 12 - avg_year_money end as 부서내연봉평균차액    
        , rank() over(partition by D.department_id order by nvl(salary + (salary * commission_pct), salary) * 12 desc) as 부서내연봉등수
        , rank() over(order by nvl(salary + (salary * commission_pct), salary) * 12 desc) as 전체연봉등수 
    FROM locations L
    JOIN
        departments D
    ON L.location_id = D.location_id
    RIGHT JOIN
        employees E
    ON nvl(D.department_id,-999) = nvl(E.department_id,-999)
    LEFT JOIN 
        B -- age, gender
    ON E.employee_id = B.employee_id
    FULL JOIN 
        NAME   -- 본부장성명
    ON E.department_id = NAME.department_id
    LEFT JOIN 
        C -- 부서내연봉평균
    ON NAME.department_id = C.department_id
    LEFT JOIN 
        tbl_taxindex T
    ON nvl(salary + (salary * commission_pct), salary) * 12 between T.lowerincome and T.highincome
    ORDER BY 1;
    
    
    -- 강사님 방법 --
    /*
        ----------------------------------------------------------------------------------------------------------------------------------------------------
         부서번호    부서명    부서주소    부서장성명    사원번호   사원명    성별    나이    연봉    연봉소득세액    부서내연봉평균차액    부서내연봉등수     전체연봉등수 
        ----------------------------------------------------------------------------------------------------------------------------------------------------
    */
    
    /*
    --------------------------------------------------------------
    부서주소    부서번호    부서명     부서장사원번호        부서장성명
    --------------------------------------------------------------
    |||||||    ================================       ***********
    locations            departments                   employees
    L.location_id = D.location_id   D.manager_id = E.employee_id
    
    -----------------------------------------------------------------------------------------------------------
    사원번호   사원명    성별    나이    연봉    연봉소득세액    부서내연봉평균차액    부서내연봉등수     전체연봉등수 
    ------------------------------------------------------------------------------------------------------------
    =====================================   ***********     |||||||||||     =============================
                employees                  tbl_taxindex    평균 따로만들기             employees
                연봉 between lowerincome and highincome           nvl(departmnet_id,-999)
    */
    
    WITH 
    A as
    (
         select D.department_id
              , department_name
              , street_address || ' ' || city || ' ' || state_province AS Address -- 부서주소
              , E.first_name || ' ' || E.last_name AS DeptHeadName  -- 부서장성명
         from locations L JOIN departments D   
         ON L.location_id = D.location_id
         JOIN employees E
         ON D.manager_id = E.employee_id
    )
    , 
    B as 
    (  select department_id
            , trunc(avg(nvl(salary+(salary*commission_pct), salary)*12)) AS DeptAvgYearSal
       from employees
       group by department_id
    ) 
    , 
    C as
    (
        select E.department_id
              , employee_id 
              , first_name || ' ' || last_name AS Ename
              , case when substr(jubun, 7, 1) in('1','3') then '남' else '여' end AS Gender
              
              , case when to_date(to_char(sysdate, 'yyyy')||substr(jubun,3,4), 'yyyymmdd') - to_date(to_char(sysdate, 'yyyymmdd'),'yyyymmdd') > 0 
                     then extract(year from sysdate) - ( to_number(substr(jubun, 1, 2)) + case when substr(jubun, 7, 1) in('1','2') then 1900 else 2000 end ) - 1 
                     else extract(year from sysdate) - ( to_number(substr(jubun, 1, 2)) + case when substr(jubun, 7, 1) in('1','2') then 1900 else 2000 end )
                 end AS Age     
    
              , to_char( nvl(salary+(salary*commission_pct), salary)*12, '999,999') AS YearSal
              , to_char( trunc(nvl(salary+(salary*commission_pct), salary)*12 * taxpercent), '99,999') AS YearSalTax 
              , to_char( trunc(nvl(salary+(salary*commission_pct), salary)*12 - DeptAvgYearSal), '999,999') AS DeptAvgYearSalDiff
              , rank() over(partition by E.department_id
                            order by nvl(salary+(salary*commission_pct), salary)*12 desc) AS DeptYearSalRank
              , rank() over(order by nvl(salary+(salary*commission_pct), salary)*12 desc) AS TotalYearSalRank                                      
         from employees E JOIN tbl_taxindex T  
         ON nvl(salary+(salary*commission_pct), salary)*12 between lowerincome and highincome 
         JOIN B
         ON nvl(E.department_id, -9999) = nvl(B.department_id, -9999)
    )
    select A.department_id AS 부서번호
        , department_name AS 부서명
        , Address AS 부서주소
        , DeptHeadName AS 부서장성명
        , employee_id AS 사원번호
        , Ename AS 사원명
        , Gender AS 성별
        , Age AS 나이 
        , YearSal AS 연봉
        , YearSalTax AS 연봉소득세액
        , DeptAvgYearSalDiff AS 부서내연봉평균차액
        , DeptYearSalRank AS 부서내연봉등수
        , TotalYearSalRank AS 전체연봉등수  
    from A RIGHT JOIN C
    ON A.department_id = C.department_id
    order by 부서번호, 연봉 desc;
    
    
    
    
     ------ ====== **** SET Operator(SET 연산자, 집합연산자) **** ======= ------
    /*
        -- 종류 --
        1. UNION 
        2. UNION ALL
        3. INTERSECT
        4. MINUS
        
        -- 면접시 JOIN 과 UNION 의 차이점에 대해서 말해 보세요~~~ !! --
        
    ==>  UNION 은 테이블(뷰)과 테이블(뷰)을 합쳐서 보여주는 것으로써,
         이것은 행(ROW)과 행(ROW)을 합친 결과를 보여주는 것이다.

    A = { a, x, b, e, g }
          -     -
    B = { c, d, a, b, y, k, m}    
                -  -    
    A ∪ B = {a, b, c, d, e, g, k, m, x, y}  ==> UNION               
                                             {a, b, c, d, e, g, k, m, x, y}

                                             ==> UNION ALL 
                                             {a, x, b, e, g, c, d, a, b, y, k, m} 

    A ∩ B = {a,b}  ==> INTERSECT
                       {a,b}

    A - B = {x,e,g} ==> MINUS 
                        {x,e,g}

    B - A = {c,d,y,k,m} ==> MINUS 
                           {c,d,y,k,m}
 */
    
    select *
    from tbl_panmae;
    
    
    -- tbl_panmae 테이블에서 2달전에 해당하는 월(현재가 2024년 2월이므로 2023년 12월)에 판매되어진 정보만 추출해서 tbl_panmae_202312 라는 테이블로 생성하세요. 
    
    create table tbl_panmae_202312
    as
    select *
    from tbl_panmae
    where to_char(panmaedate,'yyyymm') = to_char(add_months(sysdate,-2),'yyyymm');
    -- Table TBL_PANMAE_202312이(가) 생성되었습니다.
    
    -- tbl_panmae 테이블에서 1달전에 해당하는 월(현재가 2024년 2월이므로 2024년 1월)에 판매되어진 정보만 추출해서 tbl_panmae_202401라는 테이블로 생성하세요. 
    
    create table tbl_panmae_202401
    as
    select *
    from tbl_panmae
    where to_char(panmaedate,'yyyymm') = to_char(add_months(sysdate,-1),'yyyymm');
    -- Table TBL_PANMAE_202401이(가) 생성되었습니다.
    
    
    
    -- tbl_panmae 테이블에서 이번달에 해당하는 월(현재가 2024년 2월)에 판매되어진 정보만 남겨두고 나머지는 모두 삭제하세요.
    
    select *
    from tbl_panmae
    where to_char(panmaedate,'yyyymm') != to_char(sysdate,'yyyymm');    -- 이번달이 아닌 지난달을 포함한 과거에 판매되어진 데이터 정보
    
     -- 이번달이 아닌 지난달을 포함한 과거에 판매되어진 데이터 정보를 삭제한다.
    delete from tbl_panmae
    where to_char(panmaedate,'yyyymm') != to_char(sysdate,'yyyymm');
    -- 9개 행 이(가) 삭제되었습니다.
    
    commit;
    
    ---- *** 최근 3개월간 판매되어진 정보를 가지고 제품별 판매량의 합계를 추출하세요 *** ----   
    /*
    tbl_panmae          -- 이번달 데이터
    tbl_panmae_202401   -- 1달 전 데이터
    tbl_panmae_202312   -- 2달 전 데이터
    */
    select *
    from tbl_panmae          -- 이번달 데이터
    UNION
    select *
    from tbl_panmae_202401   -- 1달 전 데이터
    UNION
    select *
    from tbl_panmae_202312;  -- 2달 전 데이터
    
    -- 위치 바꾸기
    select *
    from tbl_panmae_202401  -- 1달 전 데이터
    UNION
    select *
    from tbl_panmae_202312  -- 2달 전 데이터
    UNION
    select *
    from tbl_panmae;       -- 이번달 데이터
    -- UNION 을 하면 항상 첫번째 컬럼(지금은 panmaedate)을 기준으로 오름차순 정렬되어 나온다.
    -- 그래서 2023년 12월 데이터 부터 먼저 나온다.
    
    select jepumname, panmaedate, panmaesu
    from tbl_panmae_202401  -- 1달 전 데이터
    UNION
    select jepumname, panmaedate, panmaesu
    from tbl_panmae_202312  -- 2달 전 데이터
    UNION
    select jepumname, panmaedate, panmaesu
    from tbl_panmae;       -- 이번달 데이터
    -- UNION 을 하면 항상 첫번째 컬럼(지금은 jepumname)을 기준으로 오름차순 정렬되어 나온다.
    -- 그래서 감자깡 부터 먼저 나온다.
    
    select panmaedate, jepumname, panmaesu -- panmaedate as 판매일자, jepumname as 제품명, panmaesu as 판매량 이면 별칭이 적용된다.
    from tbl_panmae_202401  -- 1달 전 데이터
    UNION
    select panmaedate as 판매일자, jepumname as 제품명, panmaesu as 판매량
    from tbl_panmae_202312  -- 2달 전 데이터
    UNION
    select panmaedate, jepumname, panmaesu
    from tbl_panmae;       -- 이번달 데이터
    -- UNION 을 사용할때 컬럼에 대한 별칭(alias)은 맨 처음 select 구문에 쓴것만 되어진다. 
    
    
    select panmaedate as 판매일자, jepumname as 제품명, panmaesu as 판매량
    from tbl_panmae_202401  -- 1달 전 데이터
    UNION
    select panmaedate as 판매날날날짜, jepumname as 제품명명명, panmaesu as 판매량량량  -- as "별칭" 이 있어도 사용되지 않는다.
    from tbl_panmae_202312  -- 2달 전 데이터
    UNION
    select panmaedate as "1", jepumname as "2", panmaesu as "3" -- as "별칭" 이 있어도 사용되지 않는다.
    from tbl_panmae;       -- 이번달 데이터
    
    select jepumname as 제품명, panmaedate as 판매일자, panmaesu as 판매량
    from tbl_panmae_202401  -- 1달 전 데이터
    UNION
    select panmaedate, jepumname, panmaesu 
    from tbl_panmae_202312  -- 2달 전 데이터
    UNION
    select panmaedate, jepumname, panmaesu  
    from tbl_panmae;       -- 이번달 데이터
    -- 오류!!!
    -- UNION 을 할때는 반드시 컬럼의 순서는 동일한 데이터타입을 가지도록 해야 한다.
    
    
    
    
     ---- *** 최근 3개월간 판매되어진 정보를 가지고 제품별 판매량의 합계를 추출하세요 *** ----
    select jepumname, panmaesu
    from tbl_panmae_202312   -- 2달 전 데이터
    UNION
    select jepumname, panmaesu
    from tbl_panmae_202401   -- 1달 전 데이터
    UNION
    select jepumname, panmaesu
    from tbl_panmae;         -- 이번달 데이터 
    -- UNION 을 사용하면 중복된 데이터 행은 제거하고 1번만 보여주므로 올바른 데이터 집계가 아니므로
    -- 위와 같이 하면 안된다.!!!! 
     
    select jepumname, panmaesu
    from tbl_panmae_202312   -- 2달 전 데이터
    UNION ALL
    select jepumname, panmaesu
    from tbl_panmae_202401   -- 1달 전 데이터
    UNION ALL
    select jepumname, panmaesu
    from tbl_panmae;          -- 이번달 데이터 
    /*
    UNION ALL 을 사용하면 정렬 없이 그냥 순서대로 행을 붙여서 보여줄 뿐이다.
    또한 UNION 과 달리 UNION ALL 을 사용하면 중복된 행이 있더라도 제거하지 않고 그대로 보여준다.
    그러므로 올바른 데이터 집계를 하려면 UNION ALL 을 사용해야 한다.!!!!
    */
    select V.jepumname as 제품명
        , sum(V.panmaesu) as 판매량
    from
    (
        select jepumname, panmaesu
        from tbl_panmae_202312   -- 2달 전 데이터
        UNION ALL
        select jepumname, panmaesu
        from tbl_panmae_202401   -- 1달 전 데이터
        UNION ALL
        select jepumname, panmaesu
        from tbl_panmae          -- 이번달 데이터 
    ) V
    group by V.jepumname
    order by 제품명;
     
     
     -- 또는
     WITH
     V AS
     (
        select jepumname, panmaesu
        from tbl_panmae_202312   -- 2달 전 데이터
        UNION ALL
        select jepumname, panmaesu
        from tbl_panmae_202401   -- 1달 전 데이터
        UNION ALL
        select jepumname, panmaesu
        from tbl_panmae          -- 이번달 데이터 
     )
     SELECT V.jepumname as 제품명, sum(panmaesu) as 판매량
     FROM V
     GROUP BY V.jepumname
     ORDER BY 1;
     
    --- *** [퀴즈] 최근 3개월간 판매되어진 정보를 가지고
    ---         아래와 같이 제품명, 판매년월, 판매량의합계, 백분율(%)을 추출하세요 ***
    -------------------------------------
    제품명   판매년월  판매량의합계  백분율(%)
    -------------------------------------
    감자깡   2023-12      20      8.2
    감자깡   2024-01      15      6.2
    감자깡   2024-02      15      6.2
    감자깡                50      20.6
    새우깡   2023-12      38      15.6
    새우깡   2024-01      8       3.3
    새우깡   2024-02     30       12.3
    새우깡               76       31.3
    고구마깡  2024-01     7        2.9
    고구마깡  2024-02    45       18.5
    고구마깡             52       21.4
    허니버터칩 2024-02   65        26.7
    허니버터칩           65        26.7
    전체                243      100.0
    -----------------------------------
    
    WITH
    V AS
    (
        select jepumname, panmaedate, panmaesu
        from tbl_panmae_202312   -- 2달 전 데이터
        UNION ALL
        select jepumname, panmaedate, panmaesu
        from tbl_panmae_202401   -- 1달 전 데이터
        UNION ALL
        select jepumname, panmaedate, panmaesu
        from tbl_panmae          -- 이번달 데이터 
    )
    SELECT decode(grouping(jepumname),0,jepumname,'전체') as 제품명
        , decode(grouping(to_char(panmaedate,'yyyy-mm')),0,to_char(panmaedate,'yyyy-mm'),' ') as 판매년월
        , sum(panmaesu) as 판매량의합계
        , to_char(round(sum(panmaesu) / (select sum(panmaesu)from V) * 100,1),'999.0') as "백분율(%)"
    FROM V
    -- GROUP BY grouping sets((jepumname, to_char(panmaedate,'yyyy-mm')), (jepumname), () );
    -- 또는
    GROUP BY ROLLUP(jepumname, to_char(panmaedate,'yyyy-mm'));
     
     
     
     
     
     
     --- =============== *** INTERSECT (교집합) *** =============== ---
     
    insert into tbl_panmae_202312(panmaedate, jepumname, panmaesu)
    values( to_date('2024-02-01', 'yyyy-mm-dd'), '쵸코파이', 10);
      
    insert into tbl_panmae_202401(panmaedate, jepumname, panmaesu)
    values( to_date('2024-02-01', 'yyyy-mm-dd'), '쵸코파이', 10);
      
    insert into tbl_panmae(panmaedate, jepumname, panmaesu)
    values( to_date('2024-02-01', 'yyyy-mm-dd'), '쵸코파이', 10);
      
    commit;
    
    select jepumname, panmaedate, panmaesu
    from tbl_panmae_202312   -- 2달 전 데이터
    INTERSECT
    select jepumname, panmaedate, panmaesu
    from tbl_panmae_202401   -- 1달 전 데이터
    INTERSECT
    select jepumname, panmaedate, panmaesu
    from tbl_panmae;          -- 이번달 데이터 
    -- 쵸코파이	24/02/01	10
     
     
    delete tbl_panmae_202312
    where jepumname = '쵸코파이';
    delete tbl_panmae_202401
    where jepumname = '쵸코파이';
    delete tbl_panmae
    where jepumname = '쵸코파이';
    
    commit;
    
    
    
    
     --- =============== *** MINUS (차집합) *** =============== ---
     
    create table tbl_employees_backup
    as
    select *
    from employees;
    -- Table TBL_EMPLOYEES_BACKUP이(가) 생성되었습니다.
    
    
    select * 
    from tbl_employees_backup;
      
    select *
    from employees
    where employee_id in (173, 185, 195);
      
    select *
    from tbl_employees_backup
    where employee_id in (173, 185, 195);
    
    -- *** 개발자가 실수로 employees 테이블에 있던 사원들을 삭제(delete)했다. 그런데 누구를 삭제했는지 모른다.!!!!
    --     백업받은 tbl_employees_backup 테이블을 이용하여 삭제된 사원들을 다시 복구하도록 하겠다. *** ---
    delete from employees
    where employee_id in (173, 185, 195);
    -- 3개 행 이(가) 삭제되었습니다.
  
    commit;
    -- 커밋 완료.
    
    select *
    from tbl_employees_backup
    MINUS
    select *
    from employees;
    -- tbl_employees_backup 테이블에는 존재하지만 employees 테이블에는 존재하지 않는 행을 찾는 것이다.
    /*
        173
        185
        195
    */
    
    select *
    from employees
    where employee_id in (173, 185, 195);
    -- 아무것도 안나온다.
    
    -- 이제 employees 테이블을 복원하도록 한다.
    insert into employees
    select *
    from tbl_employees_backup
    MINUS
    select *
    from employees;
    -- 3개 행 이(가) 삽입되었습니다.
    commit;
    -- 커밋 완료.
    
    select *
    from employees
    where employee_id in (173, 185, 195);
    -- 복구 되어 나온다.

    
    
    
    
    
    
    ----------- ====== **** Pseudo(의사, 유사, 모조) Column **** ====== -----------
  
    ------ Pseudo(의사) Column 은 rowid 와 rownum 이 있다.
  
  /*
    1. rowid
       rowid 는 오라클이 내부적으로 사용하기 위해 만든 id 값으로써 행에 대한 id값 인데
       오라클 전체내에서 고유한 값을 가진다.
  */
    
    
    create table tbl_heowon
    (userid     varchar2(20),
     name       varchar2(20),
     address    varchar2(100)
    );
    -- Table TBL_HEOWON이(가) 생성되었습니다.
    
    insert into tbl_heowon(userid, name, address) values('leess','이순신','서울');
    insert into tbl_heowon(userid, name, address) values('eomjh','엄정화','인천');
    insert into tbl_heowon(userid, name, address) values('kangkc','강감찬','수원');
    
    insert into tbl_heowon(userid, name, address) values('leess','이순신','서울');
    insert into tbl_heowon(userid, name, address) values('eomjh','엄정화','인천');
    insert into tbl_heowon(userid, name, address) values('kangkc','강감찬','수원');
        
    insert into tbl_heowon(userid, name, address) values('leess','이순신','서울');
    insert into tbl_heowon(userid, name, address) values('eomjh','엄정화','인천');
    insert into tbl_heowon(userid, name, address) values('kangkc','강감찬','수원');
        
    commit;
    -- 커밋 완료.
    
    select *
    from tbl_heowon;
    
    delete from tbl_heowon
    where userid = 'leess';
    -- 3개 행 이(가) 삭제되었습니다.
    
    rollback;
    -- 롤백 완료.
    
    select rowid, userid, name, address
    from tbl_heowon;
    
    select rowid, userid, name, address
    from tbl_heowon
    where rowid between 'AAASTlAAHAAAAGtAAD' and 'AAASTlAAHAAAAGtAAI';  -- 컴퓨터마다 상이하다.
    
    delete from tbl_heowon
    where rowid between 'AAASTlAAHAAAAGtAAD' and 'AAASTlAAHAAAAGtAAI';
    -- 6개 행 이(가) 삭제되었습니다.
    
    commit;
    -- 커밋 완료.
    
    
    
    
    /*
       2. rownum (!!! 게시판 등 웹에서 아주아주아주 많이많이많이 사용됩니다. !!!)
    */
  
    select boardno AS 글번호
         , subject AS 글제목
         , to_char(registerday, 'yyyy-mm-dd hh24:mi:ss') AS 작성일자 
    from tbl_board;
    
    
    insert into tbl_board(boardno, subject, content, userid, registerday, readcount)
    values(6,'2월27일의 첫번째 글','안녕하세요 1','leess',default,0);
    
    insert into tbl_board(boardno, subject, content, userid, registerday, readcount)
    values(7,'2월27일의 두번째 글','안녕하세요 2','leess',default,0);
    
    insert into tbl_board(boardno, subject, content, userid, registerday, readcount)
    values(8,'2월27일의 세번째 글','안녕하세요 3','leess',default,0);
    
    insert into tbl_board(boardno, subject, content, userid, registerday, readcount)
    values(9,'2월27일의 네번째 글','안녕하세요 4','leess',default,0);
    
    insert into tbl_board(boardno, subject, content, userid, registerday, readcount)
    values(10,'2월27일의 다섯번째 글','안녕하세요 5','leess',default,0);
    
    insert into tbl_board(boardno, subject, content, userid, registerday, readcount)
    values(11,'2월27일의 여섯번째 글','안녕하세요 6','leess',default,0);
    
    insert into tbl_board(boardno, subject, content, userid, registerday, readcount)
    values(12,'2월27일의 일곱번째 글','안녕하세요 7','leess',default,0);
    
    insert into tbl_board(boardno, subject, content, userid, registerday, readcount)
    values(13,'2월27일의 여덟번째 글','안녕하세요 8','leess',default,0);
    
    insert into tbl_board(boardno, subject, content, userid, registerday, readcount)
    values(14,'2월27일의 아홉번째 글','안녕하세요 9','leess',default,0);
    
    commit;
    -- 커밋 완료.
    
    select boardno as 글번호
        , subject as 글제목
        , userid as 글쓴이
        , to_char(registerday,'yyyy-mm-dd hh24:mi:ss') as 작성일자
    from tbl_board
    order by 1 desc;
    /*
    ----------------------------------------------------------------------------
    번호  글번호     글제목                             글쓴이     작성일자
    ----------------------------------------------------------------------------
     1    14	2월27일의 아홉번째 글	                leess	2024-02-27 09:17:56
     2    13	2월27일의 여덟번째 글	                leess	2024-02-27 09:17:54
     3    12	2월27일의 일곱번째 글	                leess	2024-02-27 09:17:54
     4    11	2월27일의 여섯번째 글	                leess	2024-02-27 09:17:54
     5    10	2월27일의 다섯번째 글	                leess	2024-02-27 09:17:54
     6    9	    2월27일의 네번째 글	                leess	2024-02-27 09:17:54
     7    8	    2월27일의 세번째 글	                leess	2024-02-27 09:17:54
     8    7	    2월27일의 두번째 글	                leess	2024-02-27 09:17:54
     9    6	    2월27일의 첫번째 글	                leess	2024-02-27 09:17:54
     10   5	    오늘도 좋은 하루되세요	                hongkd	2024-02-20 17:33:28
     11   4	    기쁘고 감사함이 넘치는 좋은 하루되세요	leess	2024-02-20 17:33:26
     12   3	    건강하세요	                        youks	2024-02-20 17:30:41
     13   2	    반갑습니다	                        eomjh	2024-02-20 17:30:39
     14   1	    안녕하세요	                        leess	2024-02-20 17:20:04
    ---------------------------------------------------------------------
                    1  2  3  4  5  6  7  8  9  10    ==> 페이지바
    << 1 페이지 >>
    ----------------------------------------------------------------------------
    번호  글번호     글제목                             글쓴이     작성일자
    ----------------------------------------------------------------------------
     1    14	2월27일의 아홉번째 글	                leess	2024-02-27 09:17:56
     2    13	2월27일의 여덟번째 글	                leess	2024-02-27 09:17:54
     3    12	2월27일의 일곱번째 글	                leess	2024-02-27 09:17:54
    
    << 2 페이지 >>
     ----------------------------------------------------------------------------
    번호  글번호     글제목                             글쓴이     작성일자
    ----------------------------------------------------------------------------
     4    11	2월27일의 여섯번째 글	                leess	2024-02-27 09:17:54
     5    10	2월27일의 다섯번째 글	                leess	2024-02-27 09:17:54
     6    9	    2월27일의 네번째 글	                leess	2024-02-27 09:17:54
    
    << 3 페이지 >>
     ----------------------------------------------------------------------------
    번호  글번호     글제목                             글쓴이     작성일자
    ----------------------------------------------------------------------------
     7    8	    2월27일의 세번째 글	                leess	2024-02-27 09:17:54
     8    7	    2월27일의 두번째 글	                leess	2024-02-27 09:17:54
     9    6	    2월27일의 첫번째 글	                leess	2024-02-27 09:17:54
    
    << 4 페이지 >>
    ----------------------------------------------------------------------------
    번호  글번호     글제목                             글쓴이     작성일자
    ----------------------------------------------------------------------------
     10   5	    오늘도 좋은 하루되세요	                hongkd	2024-02-20 17:33:28
     11   4	    기쁘고 감사함이 넘치는 좋은 하루되세요	leess	2024-02-20 17:33:26
     12   3	    건강하세요	                        youks	2024-02-20 17:30:41
    
    << 5 페이지 >>
     ----------------------------------------------------------------------------
    번호  글번호     글제목                             글쓴이     작성일자
    ----------------------------------------------------------------------------
     13   2	    반갑습니다	                        eomjh	2024-02-20 17:30:39
     14   1	    안녕하세요	                        leess	2024-02-20 17:20:04
    */
    -- 그냥 rownum 할 경우
    select rownum as 번호 -- rownum(행번호)은 기본적으로 insert 되어진 순서대로 나온다.
        , boardno as 글번호
        , subject as 글제목
        , userid as 글쓴이
        , to_char(registerday,'yyyy-mm-dd hh24:mi:ss') as 작성일자
    from tbl_board;
    
    -- 마지막번호가 1번이 되게 하기
    SELECT rownum as 번호
        , boardno as 글번호
        , subject as 글제목
        , userid as 글쓴이
        , registerday as 작성일자
    FROM
    (
    select boardno, subject, userid 
        , to_char(registerday,'yyyy-mm-dd hh24:mi:ss') as registerday
    from tbl_board
    order by 1 desc
    ) V;
    
    -- 또는 WITH 절을 사용해서
    WITH
    V AS
    (
        select boardno, subject, userid 
        , to_char(registerday,'yyyy-mm-dd hh24:mi:ss') as registerday
        from tbl_board
        order by 1 desc
    )
    SELECT rownum as 번호
        , boardno as 글번호
        , subject as 글제목
        , userid as 글쓴이
        , registerday as 작성일자
    FROM V;
    
    
    
    /*
   한 페이지당 3개씩 보여주고자 한다.
   
   1 페이지 ==> rownum : 1 ~ 3    boardno : 14 ~ 12
   2 페이지 ==> rownum : 4 ~ 6    boardno : 11 ~ 9
   3 페이지 ==> rownum : 7 ~ 9    boardno :  8 ~ 6
   4 페이지 ==> rownum : 10 ~ 12  boardno :  5 ~ 3
   5 페이지 ==> rownum : 13 ~ 15  boardno :  2 ~ 1
    */

    --  1 페이지 ==> rownum : 1 ~ 3    boardno : 14 ~ 12
    -- [잘못된 select문]
    SELECT rownum as 번호
        , boardno as 글번호
        , subject as 글제목
        , userid as 글쓴이
        , registerday as 작성일자
    FROM
    (
    select boardno, subject, userid 
        , to_char(registerday,'yyyy-mm-dd hh24:mi:ss') as registerday
    from tbl_board
    order by 1 desc
    ) V
    WHERE rownum BETWEEN 1 AND 3;   -- 1페이지
    
    SELECT rownum as 번호
        , boardno as 글번호
        , subject as 글제목
        , userid as 글쓴이
        , registerday as 작성일자
    FROM
    (
    select boardno, subject, userid 
        , to_char(registerday,'yyyy-mm-dd hh24:mi:ss') as registerday
    from tbl_board
    order by 1 desc
    ) V
    WHERE rownum BETWEEN 4 AND 6;   -- 2페이지가 안나온다.
    -- 왜냐하면, rownum 을 where 절에 사용할 수 없다.
    
    -- [올바른 select문]
    SELECT rno as 번호
        , boardno as 글번호
        , subject as 글제목
        , userid as 글쓴이
        , registerday as 작성일자
    FROM
    (
        select rownum as rno
            , boardno, subject, userid, registerday 
        from
        (
            select boardno, subject, userid 
                , to_char(registerday,'yyyy-mm-dd hh24:mi:ss') as registerday
            from tbl_board
            order by 1 desc
        ) V
    ) T
    WHERE rno between 1 and 3;  -- 1페이지
    /*
    === 페이징처리의 공식 ===
    where RNO between (조회하고자하는페이지번호 * 한페이지당보여줄행의개수) - (한페이지당보여줄행의개수 - 1) and (조회하고자하는페이지번호 * 한페이지당보여줄행의개수);
    where RNO between ( 1 * 3 ) - ( 3 - 1 ) and ( 1 * 3 )
    where RNO between 1 and 3
    */
    
    SELECT rno as 번호
        , boardno as 글번호
        , subject as 글제목
        , userid as 글쓴이
        , registerday as 작성일자
    FROM
    (
        select rownum as rno
            , boardno, subject, userid, registerday 
        from
        (
            select boardno, subject, userid 
                , to_char(registerday,'yyyy-mm-dd hh24:mi:ss') as registerday
            from tbl_board
            order by 1 desc
        ) V
    ) T
    WHERE rno between 4 and 6;  -- 2페이지
    /*
    === 페이징처리의 공식 ===
    where RNO between (조회하고자하는페이지번호 * 한페이지당보여줄행의개수) - (한페이지당보여줄행의개수 - 1) and (조회하고자하는페이지번호 * 한페이지당보여줄행의개수);
    where RNO between ( 2 * 3 ) - ( 3 - 1 ) and ( 2 * 3 )
    where RNO between 4 and 6
    */
    
    SELECT rno as 번호
        , boardno as 글번호
        , subject as 글제목
        , userid as 글쓴이
        , registerday as 작성일자
    FROM
    (
        select rownum as rno
            , boardno, subject, userid, registerday 
        from
        (
            select boardno, subject, userid 
                , to_char(registerday,'yyyy-mm-dd hh24:mi:ss') as registerday
            from tbl_board
            order by 1 desc
        ) V
    ) T
    WHERE rno between 7 and 9;  -- 3페이지
    /*
    === 페이징처리의 공식 ===
    where RNO between (조회하고자하는페이지번호 * 한페이지당보여줄행의개수) - (한페이지당보여줄행의개수 - 1) and (조회하고자하는페이지번호 * 한페이지당보여줄행의개수);
    where RNO between ( 3 * 3 ) - ( 3 - 1 ) and ( 3 * 3 )
    where RNO between 7 and 9
    */
    
    SELECT rno as 번호
        , boardno as 글번호
        , subject as 글제목
        , userid as 글쓴이
        , registerday as 작성일자
    FROM
    (
        select rownum as rno
            , boardno, subject, userid, registerday 
        from
        (
            select boardno, subject, userid 
                , to_char(registerday,'yyyy-mm-dd hh24:mi:ss') as registerday
            from tbl_board
            order by 1 desc
        ) V
    ) T
    WHERE rno between 10 and 12;    -- 4페이지
    /*
    === 페이징처리의 공식 ===
    where RNO between (조회하고자하는페이지번호 * 한페이지당보여줄행의개수) - (한페이지당보여줄행의개수 - 1) and (조회하고자하는페이지번호 * 한페이지당보여줄행의개수);
    where RNO between ( 4 * 3 ) - ( 3 - 1 ) and ( 4 * 3 )
    where RNO between 10 and 12
    */
    
    SELECT rno as 번호
        , boardno as 글번호
        , subject as 글제목
        , userid as 글쓴이
        , registerday as 작성일자
    FROM
    (
        select rownum as rno
            , boardno, subject, userid, registerday 
        from
        (
            select boardno, subject, userid 
                , to_char(registerday,'yyyy-mm-dd hh24:mi:ss') as registerday
            from tbl_board
            order by 1 desc
        ) V
    ) T
    WHERE rno between 13 and 15;    -- 5페이지
    /*
    === 페이징처리의 공식 ===
    where RNO between (조회하고자하는페이지번호 * 한페이지당보여줄행의개수) - (한페이지당보여줄행의개수 - 1) and (조회하고자하는페이지번호 * 한페이지당보여줄행의개수);
    where RNO between ( 5 * 3 ) - ( 3 - 1 ) and ( 5 * 3 )
    where RNO between 13 and 15
    */
    
    
    -- 또는 rownum 을 사용하지 않고 row_number() 함수를 사용해서 나타낼 수 있다.
    select row_number() over(order by boardno desc) as 번호
        , boardno as 글번호
        , subject as 글제목
        , userid as 글쓴이
        , to_char(registerday,'yyyy-mm-dd hh24:mi:ss') as 작성일자
    from tbl_board;
    
    /* 아래는 오류가 발생한다. 왜냐하면 row_number() 은 where 절에 사용할 수 없기 때문이다.
    select row_number() over(order by boardno desc) as 번호
        , boardno as 글번호
        , subject as 글제목
        , userid as 글쓴이
        , to_char(registerday,'yyyy-mm-dd hh24:mi:ss') as 작성일자
    from tbl_board
    where row_number() over(order by boardno desc) between 1 and 3; -- 오류!!
    */
    
    -- [row_number() 함수를 사용한 올바른 select문]
    SELECT rno as 번호
        , boardno as 글번호
        , subject as 글제목
        , userid as 글쓴이
        , registerday as 작성일자
    FROM
    (
        select row_number() over(order by boardno desc) as rno 
            , boardno, subject, userid 
            , to_char(registerday,'yyyy-mm-dd hh24:mi:ss') as registerday
        from tbl_board
        order by 2 desc
    ) V
    WHERE rno between 1 and 3;  -- 1페이지
    /*
    === 페이징처리의 공식 ===
    where RNO between (조회하고자하는페이지번호 * 한페이지당보여줄행의개수) - (한페이지당보여줄행의개수 - 1) and (조회하고자하는페이지번호 * 한페이지당보여줄행의개수);
    where RNO between ( 1 * 3 ) - ( 3 - 1 ) and ( 1 * 3 )
    where RNO between 1 and 3
    */
    
    SELECT rno as 번호
        , boardno as 글번호
        , subject as 글제목
        , userid as 글쓴이
        , registerday as 작성일자
    FROM
    (
        select row_number() over(order by boardno desc) as rno 
            , boardno, subject, userid 
            , to_char(registerday,'yyyy-mm-dd hh24:mi:ss') as registerday
        from tbl_board
        order by 2 desc
    ) V
    WHERE rno between 4 and 6;  -- 2페이지
    /*
    === 페이징처리의 공식 ===
    where RNO between (조회하고자하는페이지번호 * 한페이지당보여줄행의개수) - (한페이지당보여줄행의개수 - 1) and (조회하고자하는페이지번호 * 한페이지당보여줄행의개수);
    where RNO between ( 2 * 3 ) - ( 3 - 1 ) and ( 2 * 3 )
    where RNO between 4 and 6
    */
    
    SELECT rno as 번호
        , boardno as 글번호
        , subject as 글제목
        , userid as 글쓴이
        , registerday as 작성일자
    FROM
    (
        select row_number() over(order by boardno desc) as rno 
            , boardno, subject, userid 
            , to_char(registerday,'yyyy-mm-dd hh24:mi:ss') as registerday
        from tbl_board
        order by 2 desc
    ) V
    WHERE rno between 7 and 9;  -- 3페이지
    /*
    === 페이징처리의 공식 ===
    where RNO between (조회하고자하는페이지번호 * 한페이지당보여줄행의개수) - (한페이지당보여줄행의개수 - 1) and (조회하고자하는페이지번호 * 한페이지당보여줄행의개수);
    where RNO between ( 3 * 3 ) - ( 3 - 1 ) and ( 3 * 3 )
    where RNO between 7 and 9
    */
    
    SELECT rno as 번호
        , boardno as 글번호
        , subject as 글제목
        , userid as 글쓴이
        , registerday as 작성일자
    FROM
    (
        select row_number() over(order by boardno desc) as rno 
            , boardno, subject, userid 
            , to_char(registerday,'yyyy-mm-dd hh24:mi:ss') as registerday
        from tbl_board
        order by 2 desc
    ) V
    WHERE rno between 10 and 12;  -- 4페이지
    /*
    === 페이징처리의 공식 ===
    where RNO between (조회하고자하는페이지번호 * 한페이지당보여줄행의개수) - (한페이지당보여줄행의개수 - 1) and (조회하고자하는페이지번호 * 한페이지당보여줄행의개수);
    where RNO between ( 4 * 3 ) - ( 3 - 1 ) and ( 4 * 3 )
    where RNO between 10 and 12
    */
    
    SELECT rno as 번호
        , boardno as 글번호
        , subject as 글제목
        , userid as 글쓴이
        , registerday as 작성일자
    FROM
    (
        select row_number() over(order by boardno desc) as rno 
            , boardno, subject, userid 
            , to_char(registerday,'yyyy-mm-dd hh24:mi:ss') as registerday
        from tbl_board
        order by 2 desc
    ) V
    WHERE rno between 13 and 15;  -- 5페이지
    /*
    === 페이징처리의 공식 ===
    where RNO between (조회하고자하는페이지번호 * 한페이지당보여줄행의개수) - (한페이지당보여줄행의개수 - 1) and (조회하고자하는페이지번호 * 한페이지당보여줄행의개수);
    where RNO between ( 5 * 3 ) - ( 3 - 1 ) and ( 5 * 3 )
    where RNO between 13 and 15
    */
    
    
    
    
    
    -------------- =========== **** 계층형 쿼리 **** =========== --------------
    /*
       계층형 쿼리는 Spring 프레임워크 (Spring boot) 시간에 답변형 게시판에서 사용한다.
       또한 전자결재 에서도 사용된다.
    */
    
    /*
    1.            양혜정
                    |
    2.            김승혜
                    |
            |-------|-------|
    3.   허성심   정우석    김도현
        |----|              |
    4.서영학 정예린         김승진
    */
    
    select *
    from employees
    order by employee_id asc;
             
    -- 결제라인을 만들어 보겠습니다.
    --          employee_id
    -- 출발       104 ==> 103 ==> 102 ==> 100 ==> null
    -- level      1       2       3       4
    
    select level
      , employee_id AS 사원번호
      , first_name || ' ' || last_name AS 사원명
      , manager_id AS 직속결재권자
    from employees
    start with employee_id = 104
    connect by prior manager_id = employee_id;
    -- **** !!!! prior 다음에 나오는 manager_id 컬럼은 start with 되어지는 행의 manager_id 컬럼의 값이다. !!!! *** -- 
    /*
        start with employee_id = 104
        connect by prior 103 = employee_id
        start with employee_id = 103
        connect by prior 102 = employee_id
        start with employee_id = 102
        connect by prior 100 = employee_id
        start with employee_id = 100
        connect by prior null = employee_id -- null 값이면 종결!!
    */
    
    /*
    -------------------------------------------------------------------------
     단계   사원번호       사원명         직속결재권자사원번호      직속결재권자사원명
    -------------------------------------------------------------------------
      1        104    Bruce Ernst           103              Alexander Hunold
      2        103    Alexander Hunold      102              Lex De Haan
      3        102    Lex De Haan           100              Steven King
      4        100    Steven King   
    */
    
    SELECT LVL
        , A.employee_id as 사원번호
        , fullname as 사원명
        , A.manager_id as 직속결재권자
        , E.first_name || ' ' || E.last_name as 직속결재권자사원명
    FROM
    (
    select level AS LVL
      , employee_id
      , first_name || ' ' || last_name AS fullname
      , manager_id 
    from employees E
    start with employee_id = 104
    connect by prior manager_id = employee_id
    ) A LEFT JOIN employees E   -- NULL 을 보여주기 위해
    ON A.manager_id = E.employee_id
    ORDER BY 1;
    
    ---------------------------------------------------------
    select *
    from employees
    order by employee_id asc;
    
    select level
      , employee_id AS 사원번호
      , first_name || ' ' || last_name AS 사원명
      , manager_id AS 직속결재권자
    from employees
    start with employee_id = 100
    connect by prior employee_id = manager_id;
    /*
        start with employee_id = 100
        connect by prior 100 = manager_id;
        manager_id 가 100인 employee_id : 101, 102, 114, 120, 121, 122, 123, 124, 145, 146, 147, 148, 149, 201
        EX) 101
        start with employee_id = 101
        connect by prior 101 = manager_id;
        ...
        start with employee_id = 110    -- 최말단        
        connect by prior 110 = manager_id;      -- null 값이면 종결!!
    */
    
    
    
    
    
    
    -------------------------------------------------------------------------------------- 
   /*
      DML(Data Manuplation Language) : 데이터 조작어 ==> insert, update, delete, merge
                                     : 수동 commit 이므로 rollback 이 가능하다.
                                     
      DDL(Data Definition Language) : 데이터 정의어 ==> create, drop, alter, truncate
                                    : 자동 commit( Auto commit ) 이므로 rollback 이 불가하다.
                                    
      DCL(Data Control Language) : 데이터 제어어 ==> grant, revoke     
                                 : 자동 commit( Auto commit ) 이므로 rollback 이 불가하다.
                                 
      TCL(Transaction Control Language) : 트랜잭션 제어어 ==> commit, rollback
      
      DQL(Data Query Language) : 데이터 질의어 ==> select 
   */
    
    
    -------- **** 데이터 조작어(DML == Data Manuplation Language) **** ---------
   --- DML 문은 기본적으로 수동 commit 이다.
   --- 즉, DML 문을 수행한 다음에는 바로 디스크(파일)에 적용되지 않고 commit 해야만 적용된다.
   --- 그래서 DML 문을 수행한 다음에 디스크(파일)에 적용치 않고자 한다라면 rollback 하면 된다.
   
   1. insert  --> 데이터 입력
   2. update  --> 데이터 수정
   3. delete  --> 데이터 삭제
   4. merge   --> 데이터 병합 
    
   insert 는 문법이
   insert into 테이블명(컬럼명1,컬럼명2,...) values(값1,값2,...); 
   이다.
   
   ※ Unconditional insert all  -- ==> 조건이 없는 insert 
    [문법] insert all 
           into 테이블명1(컬럼명1, 컬럼명2, ....)
           values(값1, 값2, .....)
           into 테이블명2(컬럼명3, 컬럼명4, ....)
           values(값3, 값4, .....)
           SUB Query문;
           
           
   create table tbl_emp1
   (empno            number(6)
   ,ename            varchar2(50)
   ,monthsal         number(7)
   ,gender           varchar2(6)
   ,manager_id       number(6)
   ,department_id    number(4)
   ,department_name  varchar2(30)
   );       
   -- Table TBL_EMP1이(가) 생성되었습니다.
   
   
   create table tbl_emp1_backup
   (empno            number(6)
   ,ename            varchar2(50)
   ,monthsal         number(7)
   ,gender           varchar2(6)
   ,manager_id       number(6)
   ,department_id    number(4)
   ,department_name  varchar2(30)
   );  
   -- Table TBL_EMP1_BACKUP이(가) 생성되었습니다.
    
    
    
    select employee_id
        , first_name || ' ' || last_name AS fullname 
        , nvl(salary + (salary * commission_pct), salary) AS month_sal
        , case when substr(jubun,7,1) in('1','3') then '남' else '여' end AS gender
        , E.manager_id
        , E.department_id
        , department_name
    from employees E LEFT JOIN departments D 
    on E.department_id = D.department_id
    order by E.department_id asc, employee_id asc; 
    
    -- tbl_emp1 과 tbl_emp1_backup 에 조건없이 무조건 넣기
    insert all 
    into tbl_emp1(empno, ename, monthsal, gender, manager_id, department_id, department_name)
    values(employee_id, fullname, month_sal, gender, manager_id, department_id, department_name)    -- 컬럼명으로 E. 사용하면 안된다.
    into tbl_emp1_backup(empno, ename, monthsal, gender, manager_id, department_id, department_name)
    values(employee_id, fullname, month_sal, gender, manager_id, department_id, department_name)
    select employee_id
        , first_name || ' ' || last_name AS fullname 
        , nvl(salary + (salary * commission_pct), salary) AS month_sal
        , case when substr(jubun,7,1) in('1','3') then '남' else '여' end AS gender
        , E.manager_id
        , E.department_id
        , department_name
    from employees E LEFT JOIN departments D 
    on E.department_id = D.department_id
    order by E.department_id asc, employee_id asc;
    -- 214개 행 이(가) 삽입되었습니다. (107*2)
    
    -- rollback;   -- 다시 돌이키고 싶은 경우
    -- 롤백 완료.
    commit;
    -- 커밋 완료.
    
    
    ※ Conditional insert all -- ==> 조건이 있는 insert 
    조건(where절)에 일치하는 행들만 특정 테이블로 찾아가서 insert 하도록 하는 것이다.
      
   create table tbl_emp_dept30
   (empno            number(6)
   ,ename            varchar2(50)
   ,monthsal         number(7)
   ,gender           varchar2(4)
   ,manager_id       number(6)
   ,department_id    number(4)
   ,department_name  varchar2(30)
   );
   -- Table TBL_EMP_DEPT30이(가) 생성되었습니다.


   create table tbl_emp_dept50
   (empno            number(6)
   ,ename            varchar2(50)
   ,monthsal         number(7)
   ,gender           varchar2(4)
   ,manager_id       number(6)
   ,department_id    number(4)
   ,department_name  varchar2(30)
   );
   -- Table TBL_EMP_DEPT50이(가) 생성되었습니다.
   

   create table tbl_emp_dept80
   (empno            number(6)
   ,ename            varchar2(50)
   ,monthsal         number(7)
   ,gender           varchar2(4)
   ,manager_id       number(6)
   ,department_id    number(4)
   ,department_name  varchar2(30)
   );
   -- Table TBL_EMP_DEPT80이(가) 생성되었습니다.
    
    insert all 
    when department_id = 30 then
    into tbl_emp_dept30(empno, ename, monthsal, gender, manager_id, department_id, department_name)
    values(employee_id, fullname, month_sal, gender, manager_id, department_id, department_name)    -- 컬럼명으로 E. 사용하면 안된다.
    when department_id = 50 then
    into tbl_emp_dept50(empno, ename, monthsal, gender, manager_id, department_id, department_name)
    values(employee_id, fullname, month_sal, gender, manager_id, department_id, department_name)
    when department_id = 80 then
    into tbl_emp_dept80(empno, ename, monthsal, gender, manager_id, department_id, department_name)
    values(employee_id, fullname, month_sal, gender, manager_id, department_id, department_name)
    select employee_id
        , first_name || ' ' || last_name AS fullname 
        , nvl(salary + (salary * commission_pct), salary) AS month_sal
        , case when substr(jubun,7,1) in('1','3') then '남' else '여' end AS gender
        , E.manager_id
        , E.department_id
        , department_name
    from employees E JOIN departments D 
    on E.department_id = D.department_id
    where E.department_id in(30,50,80)
    order by E.department_id asc, employee_id asc;
    -- 85개 행 이(가) 삽입되었습니다.
    
    commit;
    -- 커밋 완료.
    
    
    
    
    
    -------- ====== ****   merge(병합)   **** ====== --------
    -- 어떤 2개 이상의 테이블에 존재하는 데이터를 다른 테이블 한곳으로 모으는것(병합)이다. 
   
    ------- *** 데이터베이스 링크(database link) 만들기(위에서 이미 만들었음) *** -------
   
    -- 생성되어진 데이터베이스 링크(database link)확인하기 --
    select *
    from user_db_links;
    /*
    ----------------------------------------------------------------
       DB_LINK               USERNAME   PASSWORD    HOST    CREATED
    ----------------------------------------------------------------
    TEACHER_ORACLE_SERVER       HR      (null)     TEACHER  24/02/22
                                                -- TEACHER 는 Net Service Name 네트서비스네임(넷서비스명)이다.
                                                -- 네트서비스네임 확인은 
                                                -- DB 클라이언트 컴퓨터의 탐색기의 C:\OracleXE18C\product\18.0.0\dbhomeXE\network\admin\tnsnames.ora 
                                                -- 파일을 메모장으로 열어서 확인한다.                                 
    */
    
    -- ** 데이터베이스 링크(database link) 삭제하기
    drop database link TEACHER_ORACLE_SERVER;
    -- Database link TEACHER_ORACLE_SERVER이(가) 삭제되었습니다.
    
    -- ** 데이터베이스 링크(database link) 생성하기
    create database link bonjum_server
    connect to hr identified by gclass  -- hr 은 본점서버에 연결할 사용자계정명 이고, gclass 는 본점서버에 연결할 사용자계정명인 hr의 암호이다.
    using 'TEACHER';
    -- Database link BONJUM_SERVER이(가) 생성되었습니다.
    select *
    from user_db_links;
    /*
    ----------------------------------------------------------------
       DB_LINK        USERNAME   PASSWORD    HOST    CREATED
    ----------------------------------------------------------------
    BONJUM_SERVER        HR      (null)     TEACHER  24/02/22
                                            -- TEACHER 는 Net Service Name 네트서비스네임(넷서비스명)이다.
                                            -- 네트서비스네임 확인은 
                                            -- DB 클라이언트 컴퓨터의 탐색기의 C:\OracleXE18C\product\18.0.0\dbhomeXE\network\admin\tnsnames.ora 
                                            -- 파일을 메모장으로 열어서 확인한다.                                 
    */
    
    -- 각 지점은 tbl_reservation_yanghyejoung 이라는 테이블을 생성한다.
   create table tbl_reservation_yanghyejoung
   (rsvno       varchar2(20)    -- 예약고유번호
   ,memberid    varchar2(20)    -- 회원ID
   ,ticketcnt   number          -- 티켓개수
   ,constraint PK_tbl_reservation_yanghyejoung primary key(rsvno)
   );
    -- Table TBL_RESERVATION_HYEJOUNG이(가) 생성되었습니다.
    
    insert into tbl_reservation_yanghyejoung(rsvno, memberid, ticketcnt)
    values('yanghyejoung001', '양혜정', 3);
   
    insert into tbl_reservation_yanghyejoung(rsvno, memberid, ticketcnt)
    values('yanghyejoung002', '김환진', 7);
   
    commit;
    
    
    
    /* 강사님만 하는 것! (본점)
    -- 아래는 본점DB서버(강사님 PC)에서만 하는 것이다.
   create table tbl_reservation_merge
   (rsvno       varchar2(20)    -- 예약고유번호
   ,memberid    varchar2(20)    -- 회원ID
   ,ticketcnt   number          -- 티켓개수
   ,constraint PK_tbl_reservation_merge primary key(rsvno)
   );
    */
    
    select *
    from tbl_reservation_merge@BONJUM_SERVER;
    
    select *
    from tbl_reservation_yanghyejoung; 
    
    -- 아래는 지점DB서버(각자 수강생들)에서 하는 것입니다.
    merge into tbl_reservation_merge@BONJUM_SERVER R
    using tbl_reservation_hyejoung L    -- L : local
    on (L.rsvno = R.rsvno)
    when matched then   -- 똑같은 것이 있을 경우
        update set R.memberid = L.memberid -- 바꾼다.
                , R.ticketcnt = L.ticketcnt
    when not matched then   -- 똑같은 것이 없을 경우
    insert (rsvno, memberid, ticketcnt) values(L.rsvno, L.memberid, L.ticketcnt);    -- insert(컬럼명) values(값이 위치해있는 컬럼명)
    commit;
    
    update tbl_reservation_hyejoung set memberid = 'KimHwanJin', ticketcnt = 10
    where rsvno = 'hyejoung002';
    -- 1 행 이(가) 업데이트되었습니다.
    commit;
    
    -- 우석오빠에게 보내기
    merge into tbl_reservation_jeongwooseok@WS_ORACLE_SERVER R
    using tbl_reservation_hyejoung L    -- L : local
    on (L.rsvno = R.rsvno)
    when matched then   -- 똑같은 것이 있을 경우
        update set R.memberid = L.memberid -- 바꾼다.
                , R.ticketcnt = L.ticketcnt
    when not matched then   -- 똑같은 것이 없을 경우
    insert (rsvno, memberid, ticketcnt) values(L.rsvno, L.memberid, L.ticketcnt);    -- insert(컬럼명) values(값이 위치해있는 컬럼명)
    commit;
    
    -- 도현씨에게 보내기
    merge into tbl_reservation_KIMDOHYEON@DH_ORACLE_SERVER R
    using tbl_reservation_hyejoung L    -- L : local
    on (L.rsvno = R.rsvno)
    when matched then   -- 똑같은 것이 있을 경우
        update set R.memberid = L.memberid -- 바꾼다.
                , R.ticketcnt = L.ticketcnt
    when not matched then   -- 똑같은 것이 없을 경우
    insert (rsvno, memberid, ticketcnt) values(L.rsvno, L.memberid, L.ticketcnt);    -- insert(컬럼명) values(값이 위치해있는 컬럼명)
    commit;
    
    
    
    
    
    -------- **** 데이터 질의어(DQL == Data Query Language) **** ---------
    -->  DQL 은 select 를 말한다.
    
    
    
    
    
    -------- **** 트랜잭션 제어어(TCL == Transaction Control Language) **** ---------
    -->  TCL 은 commit, rollback 을 말한다.
   
    -- *** Transaction(트랜잭션) 처리 *** --
    --> Transaction(트랜잭션)이라 함은 관련된 일련의 DML로 이루어진 한꾸러미(한세트)를 말한다.
    --> Transaction(트랜잭션)이라 함은 데이터베이스의 상태를 변환시키기 위하여 논리적 기능을 수행하는 하나의 작업단위를 말한다. 
    /*
      예>   네이버카페(다음카페)에서 활동
            글쓰기(insert)를 1번하면 내 포인트 점수가 10점이 올라가고(update),
            댓글쓰기(insert)를 1번하면 내 포인트 점수가 5점이 올라가도록 한다(update)
           
           위와같이 정의된 네이버카페(다음카페)에서 활동은 insert 와 update 가 한꾸러미(한세트)로 이루어져 있는 것이다.
           이와 같이 서로 다른 DML문이 1개의 작업을 이룰때 Transaction(트랜잭션) 처리라고 부른다.
           
           Transaction(트랜잭션) 처리에서 가장 중요한 것은 
           모든 DML문이 성공해야만 최종적으로 모두 commit 을 해주고,
           DML문중에 1개라도 실패하면 모두 rollback 을 해주어야 한다는 것이다. 
           
           예를 들면 네이버카페(다음카페)에서 글쓰기(insert)가 성공 했다라면
           그 이후에 내포인트 점수가 10점이 올라가는(update) 작업을 해주고, update 작업이 성공했다라면
           commit 을 해준다. 
           만약에 글쓰기(insert) 또는 10점이 올라가는(update) 작업이 실패했다라면
           rolllback 을 해준다.
           이러한 실습은 자바에서 하겠습니다.
    */
    
    
    
    
    
    
    ----- **** ==== ROLLBACK TO SAVEPOINT  ==== **** -----
    ----- **** 특정 시점까지 rollback 을 할 수 있습니다. **** -----
    
    select *
    from employees
    where department_id = 50;
    
    update employees set first_name = '몰라'
    where department_id = 50;
    -- 45개 행 이(가) 업데이트되었습니다.
    
    savepoint point_1;
    -- Savepoint이(가) 생성되었습니다.
    
    delete from employees
    where department_id is null;
    -- 1 행 이(가) 삭제되었습니다.
        
    select first_name
    from employees
    where department_id = 50;
    -- 전부다 '몰라' 로 나온다.
    
    select *
    from employees
    where department_id is null;
    -- 행이 없다.
    
    rollback to savepoint point_1;
    -- 롤백 완료.
    -- savepoint point_1; 이 선언되어진 이후로 실행된 DML문을 rollback 시킨다.
    /*
       그러므로
       delete from employees
       where department_id is null; 만 롤백시킨다.
    */
    
    select *
    from employees
    where department_id is null;
    -- 행이 나온다.
    
    select first_name
    from employees
    where department_id = 50;
    -- 아직까지 전부다 '몰라' 로 나온다.
    
    rollback;  --> commit; 한 이후로 수행되어진 모든 DML문을 롤백시킨다.
    -- 롤백 완료.
   
    select first_name
    from employees
    where department_id = 50;
    -- first_name 컬럼의 값이 원상복구됨.
    
    
    
    
    
    
    
    ---- *** >>> 데이터 백업 없이 delete, update 한 후 commit 되어진 데이터 복구하기 <<< *** ----
   /*
        타임머신 기능을 이용하여 delete, update 한 후 commit 되어진 데이터를 복구할 수 있다. (oracle 11g 이후 부터 가능)
   */
   
   --  flashback query : 어떤 테이블의 데이터값을 과거의 데이터값으로 돌아가는 기능이다.
   create table tbl_exam
   (no      number(4)
   ,name    Nvarchar2(20)
   ,address Nvarchar2(20)
   );
   -- Table TBL_EXAM이(가) 생성되었습니다.
   
   insert into tbl_exam(no, name, address) values(101, '이순신', '서울시 강동구');
   insert into tbl_exam(no, name, address) values(201, '엄정화', '서울시 강서구');
   insert into tbl_exam(no, name, address) values(301, '유관순', '서울시 강남구');
   insert into tbl_exam(no, name, address) values(401, '서강준', '서울시 강북구');
   
   commit;
   -- 커밋 완료.
   
    select systimestamp
    from dual;
    --  24/02/27 16:35:13.270000000 +09:00  -- 시각에 insert 함
   
    select *
    from tbl_exam;
    /*
        101	이순신	서울시 강동구
        201	엄정화	서울시 강서구
        301	유관순	서울시 강남구
        401	서강준	서울시 강북구
    */
    
    -- *** 2분 정도 아무것도 하지 말고 기다린다.
    select systimestamp
    from dual;
    -- 24/02/27 16:37:20.537000000 +09:00
    
    delete from tbl_exam;
    -- 4개 행 이(가) 삭제되었습니다.
    commit;
    -- 커밋 완료.
    
    -- *** 2분 정도 아무것도 하지 말고 기다린다.
    select systimestamp
    from dual;
    -- 24/02/27 16:39:27.946000000 +09:00
    select *
    from tbl_exam;
    -- 아무것도 나오지 않는다.
    
    
    select *
    from tbl_exam as of timestamp(systimestamp - interval '4' minute);
    /*
        101	이순신	서울시 강동구
        201	엄정화	서울시 강서구
        301	유관순	서울시 강남구
        401	서강준	서울시 강북구
    */
    create table tbl_exam_backup
    as
    select *
    from tbl_exam as of timestamp(systimestamp - interval '5' minute);  -- 시간은 계속 흐름으로 나오는 것 확인하고 백업 테이블 생성하기
    -- Table TBL_EXAM_BACKUP이(가) 생성되었습니다.
    
    insert into tbl_exam
    select *
    from tbl_exam_backup;
    -- 4개 행 이(가) 삽입되었습니다.
    commit;
    -- 커밋 완료.
    
    select *
    from tbl_exam;  -- 원래대로 잘 나온다.
    
    drop table tbl_exam_backup purge;
    -- Table TBL_EXAM_BACKUP이(가) 삭제되었습니다.
    
    update tbl_exam set name = '몰라', address = '없음'
    where no in(101,401);
    -- 2개 행 이(가) 업데이트되었습니다.
    commit;
    -- 커밋 완료.
    

    select *
    from tbl_exam as of timestamp(systimestamp - interval '14' minute)
    MINUS
    select *
    from tbl_exam;
    
    create table tbl_exam_origin
    as
    select *
    from tbl_exam as of timestamp(systimestamp - interval '14' minute)
    MINUS   -- 101, 104 원래모습
    select *
    from tbl_exam;

    select *
    from tbl_exam_origin;    
    /*
        101	이순신	서울시 강동구
        401	서강준	서울시 강북구 
    */
    
    select *
    from tbl_exam;
    
    merge into tbl_exam E
    using tbl_exam_origin O
    on (E.no = O.no)
    when matched then   -- 똑같은 것이 있을 경우
        update set E.name = O.name
                , E.address = O.address
    when not matched then   -- 똑같은 것이 없을 경우
    insert (no, name, address) values(O.no, O.name, O.address);    
    -- 2개 행 이(가) 병합되었습니다.
    
    -- 강사님 방법 --
    update tbl_exam set name = (select name from tbl_exam_origin where no = tbl_exam.no)
                        , address = (select address from tbl_exam_origin where no = tbl_exam.no)
    where no in( select no from tbl_exam_origin );
    -- 2개 행 이(가) 업데이트되었습니다.
    
    commit;
    -- 커밋 완료.
    
    
    
    
    
    
    
    -------- **** 데이터 정의어(DDL == Data Defination Language) **** ---------
    ==> DDL : create, drop, alter, truncate 
    --> 여기서 중요한 것은 DDL 문을 실행을 하면 자동적으로 commit; 이 되어진다.
    --  즉, auto commit 되어진다.
    
    select *
    from employees
    where employee_id = 100;
    -- salary ==> 24000
    -- email  ==> SKING 
    
    update employees set salary = 11111, email = 'sdfsdf'
    where employee_id = 100;
    -- 1 행 이(가) 업데이트되었습니다.
    
    create table tbl_imsi
    (no    number
    ,name  varchar2(20)
    );
    -- Table TBL_IMSI이(가) 생성되었습니다.
    -- DDL 문을 실행했으므로 자동적으로 commit; 이 되어진다.
    
    select *
    from employees
    where employee_id = 100;
    
    rollback;
    -- 롤백 완료.
    
    select *
    from employees
    where employee_id = 100;
    -- 위에서 DDL문(create)을 실행했으므로 자동적으로 commit; 이 되어지기 때문에 rollback 안 됨.
    
    -- 원상복구
    update employees set salary = 24000, email = 'SKING'
    where employee_id = 100;
    -- 1 행 이(가) 업데이트되었습니다.
    commit;    
    -- 커밋 완료.
    
    
    
    
    
    
    ------ ====== **** TRUNCATE table 테이블명; **** ====== ------  
    --> TRUNCATE table 테이블명; 을 실행하면 테이블명 에 존재하던 모든 행(row)들을 삭제해주고,
    --  테이블명에 해당하는 테이블은 완전초기화 가 되어진다.
    --  중요한 사실은 TRUNCATE table 테이블명; 은 DDL 문이기에 auto commit; 되어지므로 rollback 이 불가하다.
   
    --  delete from 테이블명; 을 실행하면 이것도 테이블명 에 존재하던 모든 행(row)들을 삭제해준다.
    --  이것은 DML문 이므로 rollback 이 가능하다.
    
    create table tbl_emp_copy1
    as
    select * from employees;
    -- Table TBL_EMP_COPY1이(가) 생성되었습니다.
    
    select *
    from tbl_emp_copy1;
    -- [DML 문(delete)]
    delete from tbl_emp_copy1;
    -- 107개 행 이(가) 삭제되었습니다.
    
    select count(*)
    from tbl_emp_copy1;  -- 0
    
    rollback;
    -- 롤백 완료.
    
    select count(*)
    from tbl_emp_copy1;  -- 107
    
    
    truncate table tbl_emp_copy1;
    -- Table TBL_EMP_COPY1이(가) 잘렸습니다.
    
    select *
    from tbl_emp_copy1;
    
    select count(*)
    from tbl_emp_copy1; -- 0 
    
    rollback;  -- auto commit 이 되어졌으므로 rollback 해봐야 소용없다. 
    -- 롤백 완료.
    
    select *
    from tbl_emp_copy1;
    
    select count(*)
    from tbl_emp_copy1; -- 0    
    
    select * from tab;
    
    
    
    
    
    
    ---------- **** 데이터 제어어(DCL == Data Control Language) **** -------------
    ==> DCL : grant(권한 부여하기) , revoke(권한 회수하기)
    --> 여기서 중요한 것은 DCL 문을 실행을 하면 자동적으로 commit; 이 되어진다.
    --  즉, auto commit 되어진다.
    
    
    --- **** SYS 또는 SYSTEM 에서 아래와 같은 작업을 한다. 시작 **** ---
    show user;
    -- USER이(가) "SYS"입니다.
    
    --  orauser1 이라는 오라클 일반사용자 계정을 생성합니다. 암호는 gclass 라고 하겠습니다.
    alter session set "_ORACLE_SCRIPT"=true;
    -- Session이(가) 변경되었습니다.
    
    create user orauser1 identified by gclass default tablespace users; -- DBA 가 하는 것 developer 
    -- User ORAUSER1이(가) 생성되었습니다.
    
    -- orauser1 계정의 암호를 abcd 로 변경한 것임.
    alter user orauser1 identified by abcd;
    -- User ORAUSER1이(가) 생성되었습니다.
    
    alter user orauser1 identified by gclass;
    -- User ORAUSER1이(가) 변경되었습니다.
    
    -- 생성되어진 오라클 일반사용자 계정인 orauser1 에게 오라클서버에 접속이 되어지고, 
    -- 접속이 되어진 후 테이블 등을 생성할 수 있도록 권한을 부여해주겠다.
    grant connect, resource, unlimited tablespace to orauser1;
    -- Grant을(를) 성공했습니다.
    
    --- **** SYS 또는 SYSTEM 에서 아래와 같은 작업을 한다. 끝 **** ---
    
    
    --- **** HR에서 아래와 같은 작업을 한다. **** ---
    show user;
    -- USER이(가) "HR"입니다.
    
    select *
    from HR.employees;
    
    -- 현재 오라클 서버에 접속된 사용자가 HR 이므로 HR.employees 대신에 employees 을 쓰면 HR.employees 으로 인식해준다.
    select *
    from employees; 
    
    -- orauser1 에게 HR이 자신의 소유인 employees 테이블에 대해 select(읽기) 할 수 있도록 권한을 부여하겠습니다.
    grant select on employees to orauser1;
    -- Grant을(를) 성공했습니다.
    
    -- orauser1 에게 HR이 자신의 소유인 departments 테이블에 대해 select(읽기) 할 수 있도록 권한을 부여하겠습니다.
    grant select on departments to orauser1;
    -- Grant을(를) 성공했습니다.
    
    -- orauser1 에게 HR이 자신의 소유인 employees 테이블에 대해 update 할 수 있도록 권한을 부여하겠습니다.
    grant update on employees to orauser1;
    -- Grant을(를) 성공했습니다.
    
    -- orauser1 에게 HR이 자신의 소유인 employees 테이블에 대해 delete 할 수 있도록 권한을 부여하겠습니다.
    grant delete on employees to orauser1;
    -- Grant을(를) 성공했습니다.
    
    
    select *
    from employees
    where employee_id = 100;
    
    select *
    from employees
    where department_id is null;
    
    -- ★ [local_orauser1 에서 commit 이나 rollback 을 안한 경우 읽기는 가능하지만 다른 DML 은 LOCK 이 걸린다!! ] ★
    update employees set salary = 22222
    where employee_id = 100;
    
    update employees set salary = 7777
    where department_id is null;
    -- [local_orauser1에서 commit 이나 rollback 하면 자동적으로 실행된다.]
    rollback;
    
    -- orauser1 에게 HR이 자신의 소유인 employees 테이블에 대해 select(읽기) 할 수 있도록 권한을 부여한 것을 회수하겠습니다.
    revoke select on employees from orauser1;
    -- Revoke을(를) 성공했습니다.
    
    -- orauser1 에게 HR이 자신의 소유인 departments 테이블에 대해 select(읽기) 할 수 있도록 권한을 부여한 것을 회수하겠습니다.
    revoke select on departments from orauser1;
    -- Revoke을(를) 성공했습니다.
    
    -- orauser1 에게 HR이 자신의 소유인 employees 테이블에 대해 delete 권한을 부여한 것을 회수하겠습니다.
    revoke delete on employees from orauser1;
    -- Revoke을(를) 성공했습니다.
    
    -- orauser1 에게 HR이 자신의 소유인 employees 테이블에 대해 update 권한을 부여한 것을 회수하겠습니다.
    revoke update on employees from orauser1;
    -- Revoke을(를) 성공했습니다.
    
    
    -- orauser1 에게 HR이 자신의 소유인 employees 테이블에 대해 select, update, delete 할 수 있도록 권한을 부여하겠습니다.
    grant select, update, delete on employees to orauser1;
    -- Grant을(를) 성공했습니다.
    -- orauser1 에게 HR이 자신의 소유인 employees 테이블에 대해 select, update, delete 권한을 부여한 것을 회수하겠습니다.
    revoke select, update, delete on employees from orauser1;
    -- Revoke을(를) 성공했습니다.
    
    
    
    
    
    ------------------------------------------------------------------
    
    -- 오라클을 설치한지 6개월이 지나면 자동적으로 HR의 암호가 만료가 되어진다.
    -- 그래서 아래와 같이 암호를 갱신해주면 됩니다.
    show user;
    -- USER이(가) "HR"입니다.
    alter user hr identified by gclass;
    -- User HR이(가) 변경되었습니다.
    
    -- 또는
    show user;
    -- USER이(가) "SYS"입니다.
    alter user hr identified by gclass;
    -- User HR이(가) 변경되었습니다.
    
    show user;
    -- USER이(가) "HR"입니다.
    
    
    
    
    
    
    
    
    
      -------- **** ==== 시퀀스(sequence) ===== **** ----------
           
   -- 시퀀스(sequence)란? 쉽게 생각하면 은행에서 발급해주는 대기번호표 와 비슷한 것이다.
   -- 시퀀스(sequence)는 숫자로 이루어져 있으며 매번 정해진 증가치 만큼 숫자가 증가되어지는 것이다.    
   
   /*
     create sequence seq_yeyakno   -- seq_yeyakno 은 시퀀스(sequence) 이름이다.
     start with 1    -- 첫번째 출발은 1 부터 한다.
     increment by 1  -- 증가치 값    2 3 4 5 ......
     maxvalue 5      -- 최대값이 5 이다.
  -- nomaxvalue      -- 최대값이 없는 무제한. 계속 증가시키겠다는 말이다.
     minvalue 2      -- 최소값이 2 이다. cycle 이 있을때만 minvalue 에 주어진 값이 사용된다. 
                     --                nocycle 일 경우에는 minvalue 에 주어진 값이 사용되지 않는다.
                     -- minvalue 숫자 에 해당하는 숫자 값은 start with 숫자 에 해당하는 숫자 값과 같든지 
                     -- 아니면 start with 숫자 에 해당하는 숫자보다 작아야 한다.
                     
  -- nominvalue      -- 최소값이 없다.   
     cycle           -- 반복을 한다.
  -- nocycle         -- 반복이 없는 직진.
     nocache;
  */
  
    create sequence seq_yeyakno_1   -- seq_yeyakno_1 은 시퀀스(sequence) 이름이다.
    start with 1    -- 첫번째 출발은 1 부터 한다.
    increment by 1  -- 증가치는 1이다. 즉 1씩 증가한다.     2 3 4 5 ......
    maxvalue 5      -- 최대값이 5 이다.
    minvalue 2      -- 최소값이 2 이다.   ==> start with 숫자보다 크기 때문에 오류!!
    -- nomaxvalue      -- 최대값이 없는 무제한. 계속 증가시키겠다는 말이다.      // 대부분 이것 사용
    -- nominvalue      -- 최소값이 없다.                                    // nomaxvalue 사용 시 최솟값은 nominvalue
    cycle           -- 반복을 한다.
    -- nocycle         -- 반복이 없는 직진.                                // 대부분 이것 사용(nomaxvalue, nominvalue 이기에 cycle이 없다.)
    nocache;
/*
    오류 보고 -
    ORA-04006: START WITH 에 MINVALUE 보다 작은 값은 지정할 수 없습니다
    
    -- minvalue 숫자 에 해당하는 숫자 값은 start with 숫자 에 해당하는 숫자 값과 같든지 
    -- 아니면 start with 숫자 에 해당하는 숫자보다 작아야 한다.
*/
    
    create sequence seq_yeyakno_1   -- seq_yeyakno_1 은 시퀀스(sequence) 이름이다.
    start with 2    -- 첫번째 출발은 2 부터 한다.
    increment by 1  -- 증가치는 1이다. 즉 1씩 증가한다.     2 3 4 5 ......
    maxvalue 5      -- 최대값이 5 이다.
    minvalue 1      -- 최소값이 1 이다.   
    cycle           -- 반복을 한다.
    nocache;
    -- Sequence SEQ_YEYAKNO_1이(가) 생성되었습니다.
    
    
    ---- **** 생성되어진 시퀀스(sequence)를 조회해 봅니다. **** ----
    select *
    from user_sequences;
      
    select *
    from user_sequences
    where sequence_name = 'SEQ_YEYAKNO_1';
      
    select last_number  -- 다음번에 들어올 시퀀스 값을 미리 알려주는 것이다. 
    from user_sequences
    where sequence_name = 'SEQ_YEYAKNO_1';
    
    
    create table tbl_board_test_1
    (boardno        number
    ,subject        varchar2(100)
    ,registerdate   date default sysdate
    );
    -- Table TBL_BOARD_TEST_1이(가) 생성되었습니다.
    
    select *
    from tbl_board_test_1;
    
    insert into tbl_board_test_1(boardno, subject) values(seq_yeyakno_1.nextval, '첫번째 글입니다.');  
    -- 1 행 이(가) 삽입되었습니다.
    -- seq_yeyakno_1 시퀀스의 start 값이 2 이었다.
    
    insert into tbl_board_test_1(boardno, subject) values(seq_yeyakno_1.nextval, '두번째 글입니다.');
    -- 1 행 이(가) 삽입되었습니다.
    -- seq_yeyakno_1 시퀀스의 increment 값이 1 이었다.
    
    insert into tbl_board_test_1(boardno, subject) values(seq_yeyakno_1.nextval, '세번째 글입니다.');
    -- 1 행 이(가) 삽입되었습니다.
    -- seq_yeyakno_1 시퀀스의 increment 값이 1 이었다.
    
    insert into tbl_board_test_1(boardno, subject) values(seq_yeyakno_1.nextval, '네번째 글입니다.');
    -- 1 행 이(가) 삽입되었습니다.
    -- seq_yeyakno_1 시퀀스의 increment 값이 1 이었다.
    -- seq_yeyakno_1 시퀀스의 maxvalue 값이 5 이었고, cycle 이었다. 즉, 반복을 한다. 
    
    insert into tbl_board_test_1(boardno, subject) values(seq_yeyakno_1.nextval, '다섯번째 글입니다.');
    -- 1 행 이(가) 삽입되었습니다.
    -- seq_yeyakno_1 시퀀스의 minvalue 값이 1 이었고, cycle(반복) 이었으므로
    -- maxvalue 값이 사용되어진 다음에 들어오는 시퀀스 값은 minvalue 값인 1 이 들어온다.
    
    insert into tbl_board_test_1(boardno, subject) values(seq_yeyakno_1.nextval, '여섯번째 글입니다.');
    -- 1 행 이(가) 삽입되었습니다.
    -- seq_yeyakno_1 시퀀스의 increment 값이 1 이었다.
    
    insert into tbl_board_test_1(boardno, subject) values(seq_yeyakno_1.nextval, '일곱번째 글입니다.');
    -- 1 행 이(가) 삽입되었습니다.
    -- seq_yeyakno_1 시퀀스의 increment 값이 1 이었다.
    
    /*
      seq_yeyakno_1 시퀀스값의 사용은 
      2(start)  3  4  5(maxvalue) 1(minvalue) 2 3 4 5(maxvalue) 1(minvalue) 2 3 4 5 1 2 3 ...... 
      와 같이 사용된다.
    */
    
    commit;
    -- 커밋 완료.
    
    
    
    create sequence seq_yeyakno_2
    start with 1    -- 첫번째 출발은 1 부터 한다. 
    increment by 1  -- 증가치는 1 이다. 즉, 1씩 증가한다. 
    nomaxvalue      -- 최대값은 없는 무제한. 계속 증가시키겠다는 말이다. 
    nominvalue      -- 최소값이 없다.
    nocycle         -- 반복을 안한다.
    nocache; 
    -- Sequence SEQ_YEYAKNO_2이(가) 생성되었습니다.
    
    create sequence seq_yeyakno_3;  -- cache 메모리 상주한다.
    -- Sequence SEQ_YEYAKNO_3이(가) 생성되었습니다.
    
    ---- **** 생성되어진 시퀀스(sequence)를 조회해 봅니다. **** ----
    select *
    from user_sequences
    where sequence_name in('SEQ_YEYAKNO_1', 'SEQ_YEYAKNO_2', 'SEQ_YEYAKNO_3');
    
    
    
    create table tbl_board_test_2
    (boardno        number
    ,subject        varchar2(100)
    ,registerdate   date default sysdate
    );
    -- Table TBL_BOARD_TEST_2이(가) 생성되었습니다.
                  
    insert into tbl_board_test_2(boardno, subject) values(seq_yeyakno_2.nextval, '첫번째 글입니다.');
    insert into tbl_board_test_2(boardno, subject) values(seq_yeyakno_2.nextval, '두번째 글입니다.');
    insert into tbl_board_test_2(boardno, subject) values(seq_yeyakno_2.nextval, '세번째 글입니다.');
    insert into tbl_board_test_2(boardno, subject) values(seq_yeyakno_2.nextval, '네번째 글입니다.');
    insert into tbl_board_test_2(boardno, subject) values(seq_yeyakno_2.nextval, '다섯번째 글입니다.');
    insert into tbl_board_test_2(boardno, subject) values(seq_yeyakno_2.nextval, '여섯번째 글입니다.');
    insert into tbl_board_test_2(boardno, subject) values(seq_yeyakno_2.nextval, '일곱번째 글입니다.');
    insert into tbl_board_test_2(boardno, subject) values(seq_yeyakno_2.nextval, '여덟번째 글입니다.');
    insert into tbl_board_test_2(boardno, subject) values(seq_yeyakno_2.nextval, '아홉번째 글입니다.');
    insert into tbl_board_test_2(boardno, subject) values(seq_yeyakno_2.nextval, '열번째 글입니다.');
    insert into tbl_board_test_2(boardno, subject) values(seq_yeyakno_2.nextval, '열한번째 글입니다.');
    
    commit;        
    
    select *
    from tbl_board_test_2;
    
    -- *** 시퀀스 SEQ_YEYAKNO_2 이 마지막으로 사용되어진 값(= 현재 시퀀스값) 을 알아보려고 한다. *** -- 
    select seq_yeyakno_2.currval
    from dual;
    -- 11
    
    select last_number  -- 다음번에 들어올 시퀀스 값을 미리 알려주는 것이다.
    from user_sequences
    where sequence_name = 'SEQ_YEYAKNO_2';
    
    ---- *** 시퀀스(sequence) 삭제하기 *** ----
    drop sequence seq_yeyakno_2;
    -- Sequence SEQ_YEYAKNO_2이(가) 삭제되었습니다.
    
    ---- **** 생성되어진 시퀀스(sequence)를 조회해 봅니다. **** ----
    select *
    from user_sequences
    where sequence_name in('SEQ_YEYAKNO_1', 'SEQ_YEYAKNO_2', 'SEQ_YEYAKNO_3');
    
    
    
    
    
    
    
    
    
    ------- ==== *** 시노님(Synonym, 동의어) *** ==== --------
    select *        
    from orauser1.tbl_sawon; 
    -- ORA-00942: 테이블 또는 뷰가 존재하지 않습니다
    -- orauser1.tbl_sawon 테이블에 select 할 수 있는 권한이 없다라는 것이다. 
    
    
    select *        
    from orauser1.tbl_sawon;
    
    --- orauser1.tbl_sawon 이름을 sawon 이라는 이름으로 사용하도록 한다.
    --- 이러한 경우 시노님(Synonym, 동의어)을 사용하여 해결한다.
    
    create or replace synonym sawon for orauser1.tbl_sawon;
    -- Synonym SAWON이(가) 생성되었습니다.
    -- sawon 이 시노님(Synonym, 동의어)이고, for 다음에 나오는 orauser1.tbl_sawon 이 원래 이름이다. 
          
    select *
    from sawon; 
    
    
    --- *** 생성되어진 시노님(Synonym, 동의어)을 조회해 본다. *** ---
    select *
    from user_synonyms;
    /*
      ------------------------------------------------------
        SYNONYM_NAME   TABLE_OWNER   TABLE_NAME   DB_LINK
      ------------------------------------------------------
        SAWON          ORAUSER1      TBL_SAWON    (null)        -- DB_LINK가 NULL 이면 자기꺼
      ------------------------------------------------------  
    */
    
    
    select *
    from tbl_reservation_merge@BONJUM_SERVER;
    
    create or replace synonym reservation for tbl_reservation_merge@BONJUM_SERVER;  
    -- Synonym RESERVATION이(가) 생성되었습니다.
    
    select *
    from reservation;
      
    select *
    from user_synonyms;
    /*
      ------------------------------------------------------------------------
        SYNONYM_NAME   TABLE_OWNER   TABLE_NAME               DB_LINK
      ------------------------------------------------------------------------
        RESERVATION       (null)        TBL_RESERVATION_MERGE     BONJUM_SERVER
        SAWON           ORAUSER1    TBL_SAWON                 (null)
    */
    
    
    --- *** 시노님(Synonym, 동의어) 삭제하기 *** ---  
    drop synonym RESERVATION;
    -- Synonym RESERVATION이(가) 삭제되었습니다.
    
    select *
    from user_synonyms;
    
    
    
    
    
    -- !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! --
   --------------------------------------------------------------------------
   ---- ==== Constraint(제약조건)을 사용하여 테이블을 생성해 보겠습니다. ==== -----
     
  /*
     >>>> 제약조건(Constraint)의 종류 <<<<
     
     --   제약조건의 이름은 오라클 전체에서 고유해야 한다.
     
     1. Primary Key(기본키, 대표식별자) 제약 [P]  -- 하나의 테이블당 오로지 1개만 생성할 수 있다.
                                               -- 어떤 컬럼에 Primary Key(기본키) 제약을 주면 그 컬럼에는 자동적으로 NOT NULL 이 주어지면서 동시에 그 컬럼에는 중복된 값은 들어올 수 없고 오로지 고유한 값만 들어오게 되어진다.
                                               -- 컬럼 1개를 가지고 생성된 Primary Key 를 Single Primary Key 라고 부르고,
                                               -- 컬럼 2개 이상을 가지고 생성된 Primary Key 를 Composite(복합) Primary Key 라고 부른다.
     
     2. Unique 제약 [U]              -- 하나의 테이블당 여러개를 생성할 수 있다.                                 
                                    -- 어떤 컬럼에 Unique 제약을 주면 그 컬럼에는 NULL 을 허용할 수 있으며, 그 컬럼에는 중복된 값은 들어올 수 없고 오로지 고유한 값만 들어오게 되어진다.             
                                    -- 여러개의 Unique Key 중에 후보키, 후보식별자가 되려면 해당 컬럼은 NOT NULL 이어야 한다. 
  
     3. Foreign Key(외래키) 제약 [R]  -- 하나의 테이블당 여러개를 생성할 수 있다. 
                                     -- Foreign Key(외래키) 제약에 의해 참조(Reference)받는 컬럼은 반드시 NOT NULL 이어야 하고, 중복된 값을 허락하지 않는 고유한 값만 가지는 컬럼이어야 한다. 
                                     
     4. Check 제약 [C]               -- 하나의 테이블당 여러개를 생성할 수 있다.
                                    -- insert(입력) 또는 update(수정) 시 어떤 컬럼에 입력되거나 수정되는 데이터값을 아무거나 허락하는 것이 아니라 조건에 맞는 데이터값만 넣고자 할 경우에 사용되는 것이다.
  
     5. NOT NULL 제약 [C]            -- 하나의 테이블당 여러개를 생성할 수 있다.
                                    -- 특정 컬럼에 NOT NULL 제약을 주면 그 컬럼에는 반드시 데이터값을 주어야 한다는 말이다. 
     NOT NULL - oracle / Default - ms   
  */
    
    
    ---- >>> Primary Key(기본키, 대표식별자) 제약에 대해서 알아봅니다. <<<< -----
  
    ---- ***   "고객" 이라는 테이블을 생성해 보겠습니다. *** ----
    create table tbl_gogek
    (gogekId     varchar2(30)
    ,gogekName   varchar2(30) not null
    ,gogekPhone  varchar2(30)
    );
    -- Table TBL_GOGEK이(가) 생성되었습니다.
    
    insert into tbl_gogek(gogekId, gogekName, gogekPhone) values('leess', '이순신', '010-2345-6789');
    -- 1 행 이(가) 삽입되었습니다.
    
    insert into tbl_gogek(gogekId, gogekName, gogekPhone) values('leess', '이삼순', '010-6789-1234');
    -- 1 행 이(가) 삽입되었습니다.
    
    insert into tbl_gogek(gogekId, gogekName, gogekPhone) values('eomjh', '엄정화', null);
    -- 1 행 이(가) 삽입되었습니다.
    
    insert into tbl_gogek(gogekId, gogekName, gogekPhone) values(null, '엄주희', '010-4567-0090');
    -- 1 행 이(가) 삽입되었습니다.
    
    commit;
    
    select * 
    from tbl_gogek;
    -- 엄주희의 아이디 미입력으로 잘못된 테이블이다. -> 삭제
    drop table tbl_gogek purge;
    -- Table TBL_GOGEK이(가) 삭제되었습니다.
    
    create table tbl_gogek
    (gogekId     varchar2(30) primary key   -- column level 제약조건
    ,gogekName   varchar2(30) not null
    ,gogekPhone  varchar2(30)
    );
    -- Table TBL_GOGEK이(가) 생성되었습니다.
    
    insert into tbl_gogek(gogekId, gogekName, gogekPhone) values('leess', '이순신', '010-2345-6789');
    -- 1 행 이(가) 삽입되었습니다.
    
    insert into tbl_gogek(gogekId, gogekName, gogekPhone) values('leess', '이삼순', '010-6789-1234');
    -- 오류 보고 -
    -- ORA-00001: 무결성 제약 조건(HR.SYS_C007352)에 위배됩니다
    
    insert into tbl_gogek(gogekId, gogekName, gogekPhone) values('eomjh', '엄정화', null);
    -- 1 행 이(가) 삽입되었습니다.
    
    insert into tbl_gogek(gogekId, gogekName, gogekPhone) values(null, '엄주희', '010-4567-0090');
    -- 오류 보고 -
    -- SQL 오류: ORA-01400: NULL을 ("HR"."TBL_GOGEK"."GOGEKID") 안에 삽입할 수 없습니다
    commit;
    -- 커밋 완료.
    
    select * 
    from tbl_gogek;
    
    drop table tbl_gogek purge;
    -- Table TBL_GOGEK이(가) 삭제되었습니다.
    
    create table tbl_gogek
    (gogekId     varchar2(30) 
    ,gogekName   varchar2(30) not null
    ,gogekPhone  varchar2(30)
    ,constraint  PK_tbl_gogek_gogekId primary key(gogekId)  -- row level 제약조건
    -- gogekId 컬럼에 primary key(==기본키) 제약을 준것이다.
    );
    -- Table TBL_GOGEK이(가) 생성되었습니다.
    
    insert into tbl_gogek(gogekId, gogekName, gogekPhone) values('leess', '이순신', '010-2345-6789');
    -- 1 행 이(가) 삽입되었습니다.
    
    insert into tbl_gogek(gogekId, gogekName, gogekPhone) values('leess', '이삼순', '010-6789-1234');
    -- 오류 보고 -
    -- ORA-00001: 무결성 제약 조건(HR.PK_TBL_GOGEK_GOGEKID)에 위배됩니다
    
    insert into tbl_gogek(gogekId, gogekName, gogekPhone) values('eomjh', '엄정화', null);
    -- 1 행 이(가) 삽입되었습니다.
    
    insert into tbl_gogek(gogekId, gogekName, gogekPhone) values(null, '엄주희', '010-4567-0090');
    -- 오류 보고 -
    -- SQL 오류: ORA-01400: NULL을 ("HR"."TBL_GOGEK"."GOGEKID") 안에 삽입할 수 없습니다
    commit;
    -- 커밋 완료.
    
    select * 
    from tbl_gogek;
    
    drop table tbl_gogek purge;
    -- Table TBL_GOGEK이(가) 삭제되었습니다.
    
    create table tbl_gogek
    (gogekId     varchar2(30)
    ,email       varchar2(50)
    ,gogekName   varchar2(30) not null
    ,gogekPhone  varchar2(30)
    ,constraint  PK_tbl_gogek_gogekId primary key(gogekId)  -- row level 제약조건
    -- gogekId 컬럼에 primary key(==기본키) 제약을 준것이다.
    , constraint PK_tbl_gogek_email primary key(email)      -- row level 제약조건
    -- email 컬럼에 primary key(==기본키) 제약을 준것이다.
    );
    -- 오류 보고 -
    -- ORA-02260: 테이블에는 하나의 기본 키만 가질 수 있습니다.
    
    create table tbl_gogek
    (gogekId     varchar2(30) primary key   -- column level 제약조건
    ,email       varchar2(50) primary key   -- column level 제약조건
    ,gogekName   varchar2(30) not null
    ,gogekPhone  varchar2(30)
    );
    -- 오류 보고 -
    -- ORA-02260: 테이블에는 하나의 기본 키만 가질 수 있습니다.
    
    
    -- 원상복구
    create table tbl_gogek
    (gogekId     varchar2(30)
    ,gogekName   varchar2(30) not null
    ,gogekPhone  varchar2(30)
    ,constraint  PK_tbl_gogek_gogekId primary key(gogekId)  -- row level 제약조건
    -- gogekId 컬럼에 primary key(==기본키) 제약을 준것이다.
    );
    -- Table TBL_GOGEK이(가) 생성되었습니다.
    
    desc tbl_gogek;
/*
       이름        널?       유형           
    ---------- -------- ------------ 
    GOGEKID    NOT NULL VARCHAR2(30)    -- primary key 를 통해 자동적으로 NOT NULL 이 나온다.
    GOGEKNAME  NOT NULL VARCHAR2(30) 
    GOGEKPHONE          VARCHAR2(30)
*/





    ---- **** Composite(복합) Primary Key 예제 **** ----
    create table tbl_jumun
    (gogekId    varchar2(20) primary key    -- 한번 온 손님 재방문 불가   => 잘못된 코드!!
    ,jepumCode  varchar2(30)
    ,jumunDay   date default sysdate
    ,jumunSu    number(10)
    );
    -- Table TBL_JUMUN이(가) 생성되었습니다.
    
    insert into tbl_jumun(gogekId, jepumCode, jumunDay, jumunSu)
    values('leess', '새우깡', default, 20);
    -- 1 행 이(가) 삽입되었습니다.
    insert into tbl_jumun(gogekId, jepumCode, jumunDay, jumunSu)
    values('eomjh', '감자깡', default, 10);
    -- 1 행 이(가) 삽입되었습니다.
    insert into tbl_jumun(gogekId, jepumCode, jumunDay, jumunSu)
    values('leess', '감자깡', default, 30);
    -- 오류 보고 -
    -- ORA-00001: 무결성 제약 조건(HR.SYS_C007357)에 위배됩니다
    
    select *
    from tbl_jumun;
    
    drop table tbl_jumun purge;
    -- Table TBL_JUMUN이(가) 삭제되었습니다.
    
    create table tbl_jumun
    (gogekId    varchar2(20)    
    ,jepumCode  varchar2(30) primary key    -- 다른 사람이 구매하지 못함
    ,jumunDay   date default sysdate
    ,jumunSu    number(10)
    );
    -- Table TBL_JUMUN이(가) 생성되었습니다.
    
    insert into tbl_jumun(gogekId, jepumCode, jumunDay, jumunSu)
    values('leess', '새우깡', default, 20);
    -- 1 행 이(가) 삽입되었습니다.
    insert into tbl_jumun(gogekId, jepumCode, jumunDay, jumunSu)
    values('eomjh', '새우깡', default, 10);
    -- 오류 보고 -
    -- ORA-00001: 무결성 제약 조건(HR.SYS_C007358)에 위배됩니다
    
    drop table tbl_jumun purge;
    -- Table TBL_JUMUN이(가) 삭제되었습니다.
    
    --   gogekId + jepumCode + jumunDay 3개 컬럼을 묶어서 하나의 primary key 제약을 생성하고자 한다.
    --   이럴때 아래와 같이 column level primary key 는 안된다.!!!
    --   왜냐하면 column level primary key 는 각각의 컬럼마다 각각의 primary key 제약을 생성해주기 때문에 
    --   아래와 같은 오류가 발생하기 때문이다.
    create table tbl_jumun
    (gogekId    varchar2(20) primary key
    ,jepumCode  varchar2(30) primary key    
    ,jumunDay   date default sysdate primary key
    ,jumunSu    number(10)
    );
    -- 오류 보고 -
    -- ORA-02260: 테이블에는 하나의 기본 키만 가질 수 있습니다.
    
    ---- **** Composite(복합) Primary Key 를 생성하려면 row level primary key 로 해야 한다. **** ----
    create table tbl_jumun
    (gogekId    varchar2(20)
    ,jepumCode  varchar2(30)   
    ,jumunDay   date default sysdate 
    ,jumunSu    number(10)
    ,constraint  PK_tbl_jumun primary key(gogekId, jepumCode, jumunDay)
    );
    -- Table TBL_JUMUN이(가) 생성되었습니다.
    
    desc tbl_jumun;
/*
      이름        널?       유형           
    --------- -------- ------------ 
    GOGEKID   NOT NULL VARCHAR2(20) 
    JEPUMCODE NOT NULL VARCHAR2(30) 
    JUMUNDAY  NOT NULL DATE         
    JUMUNSU            NUMBER(10) 
*/
    
    insert into tbl_jumun(gogekId, jepumCode, jumunDay, jumunSu)
    values('leess', '새우깡', default, 20);
    -- 1 행 이(가) 삽입되었습니다.
    insert into tbl_jumun(gogekId, jepumCode, jumunDay, jumunSu)
    values('eomjh', '새우깡', default, 10);
    -- 1 행 이(가) 삽입되었습니다.
    insert into tbl_jumun(gogekId, jepumCode, jumunDay, jumunSu)
    values('leess', '감자깡', default, 15);
    -- 1 행 이(가) 삽입되었습니다.
    insert into tbl_jumun(gogekId, jepumCode, jumunDay, jumunSu)
    values('leess', '새우깡', default, 20);    -- jumunDay 시간이 다르기 때문에 삽입 가능
    -- 1 행 이(가) 삽입되었습니다.
    commit;
    -- 커밋 완료.
    
    select gogekid as 고객명
       , jepumcode as 제품명
       , to_char(jumunday, 'yyyy-mm-dd hh24:mi:ss') AS 주문일자 
       , jumunsu as 주문수
    from tbl_jumun;
    
    
    ---- **** tbl_gogek 테이블과 tbl_jumun 테이블에 생성되어진 제약조건을 조회해봅니다. **** ----
    select *
    from user_constraints
    where table_name in('TBL_GOGEK', 'TBL_JUMUN');      -- 'tbl_gogek', 'tbl_jumun' 하면 내용이 안나온다.
    -- constraint_type : c => check or not null 제약 // p => primary key
    
    select *
    from user_cons_columns
    where table_name in('TBL_GOGEK', 'TBL_JUMUN');      -- table 명을 반드시 대문자로 입력해야 한다!!
    -- position 은 ',constraint  PK_tbl_jumun primary key(gogekId, jepumCode, jumunDay)' 안에 있는 () 에 있는 순서이다.
    
    
    select A.table_name
        , A.constraint_name
        , A.constraint_type
        , A.search_condition
        , B.column_name
        , B.position 
    from user_constraints A JOIN user_cons_columns B
    ON A.constraint_name = B.constraint_name
    WHERE A.table_name in('TBL_GOGEK', 'TBL_JUMUN');        -- table 명을 반드시 대문자로 입력해야 한다!!
    
    
    ---- **** tbl_gogek 테이블과 tbl_jumun 테이블에 생성되어진 primary key 제약조건을 조회해봅니다. **** ----
    select A.table_name
        , A.constraint_name
        , A.constraint_type
        , A.search_condition
        , B.column_name
        , B.position 
    from user_constraints A JOIN user_cons_columns B
    ON A.constraint_name = B.constraint_name
    WHERE A.table_name in('TBL_GOGEK', 'TBL_JUMUN') and     -- table 명을 반드시 대문자로 입력해야 한다!!
        A.constraint_type = 'P';
        
    ---- **** tbl_gogek 테이블에 생성되어진 primary key 제약조건을 조회해봅니다. **** ----
    select A.table_name
        , A.constraint_name
        , A.constraint_type
        , A.search_condition
        , B.column_name
        , B.position 
    from user_constraints A JOIN user_cons_columns B
    ON A.constraint_name = B.constraint_name
    WHERE A.table_name = 'TBL_GOGEK' and    -- table 명을 반드시 대문자로 입력해야 한다!!
        A.constraint_type = 'P';
    -- A -> PK_tbl_gogek_gogekId
    
    -- *** 제약조건의 이름은 오라클 전체에서 고유해야 한다. *** --
    create table tbl_gogek_2
    (gogekId     varchar2(30)
    ,gogekName   varchar2(30) not null
    ,gogekPhone  varchar2(30)
    ,constraint PK_tbl_gogek_gogekId primary key(gogekId)
    );
    -- 오류 보고 -
    -- ORA-02264: 기존의 제약에 사용된 이름입니다
    
    create table tbl_gogek_3
    (gogekId     varchar2(30) primary key
    ,gogekName   varchar2(30) not null
    ,gogekPhone  varchar2(30)
    );
    -- Table TBL_GOGEK_3이(가) 생성되었습니다.
    
    create table tbl_gogek_4
    (gogekId     varchar2(30) primary key
    ,gogekName   varchar2(30) not null
    ,gogekPhone  varchar2(30)
    );
    -- Table TBL_GOGEK_4이(가) 생성되었습니다.
    
    
    -- column level 제약조건으로 생성하면 제약조건명은 자동적으로 항상 SYS_C뭐뭐뭐~ 로 되어진 고유한 제약조건명이 되어진다.
    select A.table_name
        , A.constraint_name
        , A.constraint_type
        , A.search_condition
        , B.column_name
        , B.position 
    from user_constraints A JOIN user_cons_columns B
    ON A.constraint_name = B.constraint_name
    WHERE A.table_name in('TBL_GOGEK_3', 'Tbl_Gogek_4');    -- table 명을 반드시 대문자로 입력해야 한다!!
    
    
    
    
    
    
    
    
    
    ---- >>> Unique Key(후보키, 후보식별자) 제약에 대해서 알아봅니다. <<< ----
    --   Unique Key 로 되어지는 컬럼은 NULL 은 허용한다.
    --   그런데 어떤 테이블에서 후보키(==후보식별자)로 사용되어질 컬럼이라면 
    --   반드시 Unique 제약이면서 NOT NULL 이어야 한다.
    
    drop table tbl_gogek purge;
    
    create table tbl_gogek
    (gogekId     varchar2(30) 
    ,gogekName   varchar2(30) not null
    ,gogekPhone  varchar2(30)
    ,gogekEmail  varchar2(50) unique  -- column level 제약조건
    ,constraint PK_tbl_gogek_gogekId primary key(gogekId)
    );  
    -- Table TBL_GOGEK이(가) 생성되었습니다.
    
    select A.table_name, A.constraint_name, A.constraint_type, A.search_condition
       , B.column_name, B.position 
    from user_constraints A JOIN user_cons_columns B
    ON A.constraint_name = B.constraint_name
    where A.table_name = 'TBL_GOGEK'; 
    
    insert into tbl_gogek(gogekId, gogekName, gogekPhone, gogekEmail)
    values('leess', '이순신', '010-5678-0987', 'leess@naver.com');
    -- 1 행 이(가) 삽입되었습니다.
    
    insert into tbl_gogek(gogekId, gogekName, gogekPhone, gogekEmail)
    values('eomjh', '엄정화', null, 'eomjh@naver.com');
    -- 1 행 이(가) 삽입되었습니다.
    
    insert into tbl_gogek(gogekId, gogekName, gogekPhone, gogekEmail)
    values('kangkc', '강감찬', null, null);
    -- 1 행 이(가) 삽입되었습니다.
    
    insert into tbl_gogek(gogekId, gogekName, gogekPhone, gogekEmail)
    values('hongkd', '홍길동', '010-2345-6356', 'eomjh@naver.com'); --> 위에서 사용한 email이라 오류가 발생한다.
    /*
    오류 보고 -
    ORA-00001: 무결성 제약 조건(HR.SYS_C007406)에 위배됩니다
    */
    
    insert into tbl_gogek(gogekId, gogekName, gogekPhone, gogekEmail)
    values('hongkd', '홍길동', '010-2345-6356', null);
    -- 1 행 이(가) 삽입되었습니다.
    
    commit;
    
    select *
    from tbl_gogek;
    
    /*
     오라클은 어떤 컬럼(지금은 gogekEmail 컬럼)에 unique 제약을 주면서
     그 컬럼이 null 을 허락한다라면 이 컬럼에 null 이 여러번 들어와도 괜찮다.
     그러나 unique 제약을 준 컬럼에 중복된 값을 넣었을때는 오류가 발생한다.
     
     참고로 microsoft 사의 MS-SQL 서버는
     어떤 컬럼(지금은 gogekEmail 컬럼)에 unique 제약을 주면서
     그 컬럼이 null 을 허락한다라면 이 컬럼에 null 은 딱 1번만 들어올수 있다.
     그래서 unique 제약을 준 컬럼에 NULL 을 포함한 중복된 값을 넣었을때는 오류가 발생한다.
    */
    
    drop table tbl_gogek purge;
    
    --- *** unique 제약은 하나의 테이블당 여러개를 생성할 수 있다. *** ---
    create table tbl_gogek
    (gogekId     varchar2(30) --> 아래에서 primary key로 지정해주었기 때문에 자동적으로 not null이 되어진다.
    ,gogekName   varchar2(30) not null
    ,gogekPhone  varchar2(30) --> 아래에서 unique로 지정해두었기 때문에 null값을 허용하며 중복을 허용하지 않는다.
    ,gogekEmail  varchar2(50) not null 
    ,constraint PK_tbl_gogek_gogekId primary key(gogekId)
    ,constraint UQ_tbl_gogek_gogekPhone unique(gogekPhone)
    ,constraint UQ_tbl_gogek_gogekEmail unique(gogekEmail)
    ); 
    -- Table TBL_GOGEK이(가) 생성되었습니다.
    
    insert into tbl_gogek(gogekId, gogekName, gogekPhone, gogekEmail)
    values('leess', '이순신', '010-5678-0987', 'leess@naver.com');
    -- 1 행 이(가) 삽입되었습니다.
    
    insert into tbl_gogek(gogekId, gogekName, gogekPhone, gogekEmail)
    values('eomjh', '엄정화', null, 'eomjh@naver.com');
    -- 1 행 이(가) 삽입되었습니다.
    
    insert into tbl_gogek(gogekId, gogekName, gogekPhone, gogekEmail) --> gogekemail이 unique지만 not null 해주었기 때문에 null값이 들어올 수 없다.
    values('kangkc', '강감찬', null, null);
    /*
    오류 보고 -
    ORA-01400: NULL을 ("HR"."TBL_GOGEK"."GOGEKEMAIL") 안에 삽입할 수 없습니다
    */
    
    insert into tbl_gogek(gogekId, gogekName, gogekPhone, gogekEmail)
    values('hongkd', '홍길동', '010-2345-6356', 'eomjh@naver.com'); --> 이미 저장되어있는 email이기 때문에 오류가 발생한다.
    /*
    오류 보고 -
    ORA-00001: 무결성 제약 조건(HR.UQ_TBL_GOGEK_GOGEKEMAIL)에 위배됩니다
    */
    
    insert into tbl_gogek(gogekId, gogekName, gogekPhone, gogekEmail)
    values('hongkd', '홍길동', '010-5678-0987', 'hongkd@gmail.com'); --> 이미 저장되어있는 gogekPhone이기 때문에 오류가 발생한다.
    /*
     오류 보고 -
     ORA-00001: 무결성 제약 조건(HR.UQ_TBL_GOGEK_GOGEKPHONE)에 위배됩니다
    */
    
    insert into tbl_gogek(gogekId, gogekName, gogekPhone, gogekEmail)
    values('hongkd', '홍길동', '010-9999-5555', 'hongkd@gmail.com');
    -- 1 행 이(가) 삽입되었습니다.
    
    commit;
    
    select *
    from tbl_gogek;
    
    
    
    ---- **** Composite(복합) Unique Key 를 생성하려면 row level unique key 로 해야 한다. **** ----
    create table tbl_jumun_2
    (jumunNo     varchar2(20)
    ,gogekId     varchar2(20) not null
    ,jepumCode   varchar2(30) not null
    ,jumunDay    date default sysdate not null
    ,jumunSu     number(10)
    ,constraint  PK_tbl_jumun_2_jumunNo primary key(jumunNo)
    ,constraint  UQ_tbl_jumun_2  unique(gogekId, jepumCode, jumunDay)
    );
    -- Table TBL_JUMUN_2이(가) 생성되었습니다.
    
    select *
    from user_constraints               -- 사용되고 있는 제약조건 모두, 제약조건 타입 확인 가능
    where table_name = 'TBL_JUMUN_2';   -- 5개 행
    
    select *
    from user_cons_columns              -- 사용되고 있는 제약조건에 대한 내용(EX. 테이블명,컬럼명)
    where table_name = 'TBL_JUMUN_2';   -- 7개 행 복합 제약조건이 하나하나 나온다.
    
    -- drop sequence seq_tbl_jumun_2;
    create sequence seq_tbl_jumun_2;
    -- Sequence SEQ_TBL_JUMUN_2이(가) 생성되었습니다.
    
    delete from tbl_jumun_2;  
    
    insert into tbl_jumun_2(jumunNo, gogekId, jepumCode, jumunDay, jumunSu)
    values( to_char(sysdate, 'yyyymmdd')||'-'||seq_tbl_jumun_2.nextval
         ,'leess', '새우깡', default, 20);
    -- 1 행 이(가) 삽입되었습니다.
    
    insert into tbl_jumun_2(jumunNo, gogekId, jepumCode, jumunDay, jumunSu)
    values( to_char(sysdate, 'yyyymmdd')||'-'||seq_tbl_jumun_2.nextval
         ,'leess', '감자깡', default, 30);
    -- 1 행 이(가) 삽입되었습니다.
    
    insert into tbl_jumun_2(jumunNo, gogekId, jepumCode, jumunDay, jumunSu)
    values( to_char(sysdate, 'yyyymmdd')||'-'||seq_tbl_jumun_2.nextval
         ,'eomjh', '새우깡', default, 50);
    -- 1 행 이(가) 삽입되었습니다.
    
    insert into tbl_jumun_2(jumunNo, gogekId, jepumCode, jumunDay, jumunSu)
    values( to_char(sysdate, 'yyyymmdd')||'-'||seq_tbl_jumun_2.nextval
         ,'leess', '새우깡', default, 20);
    -- 1 행 이(가) 삽입되었습니다.
    
    commit;
    
    select jumunNo
       , gogekid
       , jepumcode
       , to_char(jumunday, 'yyyy-mm-dd hh24:mi:ss') AS jumunday  
       , jumunsu
    from tbl_jumun_2;
    
    
    insert into tbl_jumun_2(jumunNo, gogekId, jepumCode, jumunDay, jumunSu)
    values( to_char(sysdate, 'yyyymmdd')||'-'||seq_tbl_jumun_2.nextval
         ,'leess', '고구마깡', default, 20);
         
    insert into tbl_jumun_2(jumunNo, gogekId, jepumCode, jumunDay, jumunSu)
    values( to_char(sysdate, 'yyyymmdd')||'-'||seq_tbl_jumun_2.nextval
         ,'leess', '고구마깡', default, 30); 
    /*
        오류 보고 -
        ORA-00001: 무결성 제약 조건(HR.UQ_TBL_JUMUN_2)에 위배됩니다
        이것은 위의 insert 문 2개 문장을 동시에 블럭을 잡고서 실행할 때 발생하는 오류이다.
    */     
         
    commit;
    
    
    ---- **** tbl_jumun_2 테이블에 생성되어진 primary key 제약조건 및 unique 제약조건을 조회해봅니다. **** ----
    select A.table_name, A.constraint_name, A.constraint_type, A.search_condition
       , B.column_name, B.position 
    from user_constraints A JOIN user_cons_columns B
    ON A.constraint_name = B.constraint_name
    where A.table_name = 'TBL_JUMUN_2' and
        A.constraint_type in('P','U');
        
        
        
        
        
        
        
        
        
        ----- **** >>> Check 제약에 대해서 알아봅니다. <<< **** -----
  
    create table tbl_sawon
    (sano         number 
    ,saname       varchar2(20) not null 
    ,salary       number(5) not null          -- 급여는 커미션 보다 커야 한다.
    ,commission   number(5)                   -- 커미션은 0 이상이어야 한다. 
    ,jik          varchar2(20) default '사원'  -- 직급의 종류는 '사장','부장','과장','대리','사원' 만 가능하다.
    ,email        varchar2(50) not null 
    ,hire_date    date default sysdate 
    ,constraint  PK_tbl_sawon_sano  primary key(sano)
    ,constraint  UQ_tbl_sawon_email unique(email)
    ,constraint  CK_tbl_sawon_jik check( jik in('사장','부장','과장','대리','사원') )
    ,constraint  CK_tbl_sawon_salary_commission check(salary > commission and commission >= 0)
    );
    -- Table TBL_SAWON이(가) 생성되었습니다. 
  
    insert into tbl_sawon(sano, saname, salary, commission, jik, email)
    values(1001, '홍길동', 500, 1000, '과장', 'hongkd@gmail.com'); --> salary 가 commission 보다 큰 값이어야하는데 salary가 더 작아서 오류가 발생한다.
    /*
    오류 보고 -
    ORA-02290: 체크 제약조건(HR.CK_TBL_SAWON_SALARY_COMMISSION)이 위배되었습니다
    */
    
    insert into tbl_sawon(sano, saname, salary, commission, jik, email)
    values(1001, '홍길동', 500, -100, '과장', 'hongkd@gmail.com'); --> commission은 반드시 0보다 커야하는데 음수가 들어와서 오류가 발생한다.
    /*
    오류 보고 -
    ORA-02290: 체크 제약조건(HR.CK_TBL_SAWON_SALARY_COMMISSION)이 위배되었습니다
    */
    
    insert into tbl_sawon(sano, saname, salary, commission, jik, email)
    values(1001, '홍길동', 500, 100, '병장', 'hongkd@gmail.com'); --> jik에는 반드시 '사장','부장','과장','대리','사원' 만 가능한데 '병장'이 들어와서 오류가 발생한다.
    /*
     오류 보고 -
     ORA-02290: 체크 제약조건(HR.CK_TBL_SAWON_JIK)이 위배되었습니다
    */
    
    insert into tbl_sawon(sano, saname, salary, commission, jik, email)
    values(1001, '홍길동', 500, 100, '과장', 'hongkd@gmail.com');
    -- 1 행 이(가) 삽입되었습니다.
    
    commit;
    
    select * 
    from tbl_sawon;
    
    update tbl_sawon set commission = 500 --> commission을 salary와 같은 값으로 update하려고 하지만 salary는 반드시 commission보다 커야하기 때문에 오류가 발생한다.
    where sano = 1001;
    /*
    오류 보고 -
    ORA-02290: 체크 제약조건(HR.CK_TBL_SAWON_SALARY_COMMISSION)이 위배되었습니다
    */
    
    update tbl_sawon set commission = 499
    where sano = 1001;
    -- 1 행 이(가) 업데이트되었습니다.
    
    commit;
    
    
    --- *** tbl_sawon 테이블에 존재하는 제약조건 알아보기 *** ---
    select A.table_name, A.constraint_name, A.constraint_type, A.search_condition
       , B.column_name, B.position 
    from user_constraints A JOIN user_cons_columns B
    ON A.constraint_name = B.constraint_name
    where A.table_name = 'TBL_SAWON';
  
  

  
  
  
  
  
  
    ----- **** >>> Foreign Key(외래키, 참조키) 제약에 대해서 알아봅니다. <<< **** -----
    
    ---- *** 고객들의 예약을 받아주는 "예약" 테이블을 생성해보겠습니다. *** ---- 
    select *
    from tbl_gogek;
    
    insert into tbl_gogek(gogekid, gogekname, gogekphone, gogekemail)
    values('sunsin', '이순신', '010-3333-7777', 'sunsin@daum.net'); -- 동명이인을 넣는다.
    -- 1 행 이(가) 삽입되었습니다.
    
    commit;
    -- 커밋 완료.
    
    select A.table_name, A.constraint_name, A.constraint_type, A.search_condition
       , B.column_name, B.position 
    from user_constraints A JOIN user_cons_columns B
    ON A.constraint_name = B.constraint_name
    where A.table_name = 'TBL_GOGEK';
    
    select *
    from tbl_gogek;
    
    desc tbl_gogek;
    /*
            이름         널?       유형           
        ---------- -------- ------------ 
        GOGEKID    NOT NULL VARCHAR2(30) 
        GOGEKNAME  NOT NULL VARCHAR2(30) 
        GOGEKPHONE          VARCHAR2(30) 
        GOGEKEMAIL NOT NULL VARCHAR2(50) 
    */
    
    -- 어떤 한명의 고객은(예: leess   이순신) 예약을 1번도 안 할수도 있고,
    -- 예약을 딱 1번만 할 수 있고, 예약을 여러번 할 수도 있다.
    
    
    
    drop table tbl_yeyak purge;
    
    create table tbl_yeyak
    (yeyakno     number   --> 예약번호.  예약번호의 값은 NOT NULL 이면서 고유한 값만 가져야 한다. 
                          --  그러므로 yeyakno 컬럼에는 Primary Key 제약을 주어야 한다.
                        /*
                            예약번호는 사용자가 수동적으로 입력치 않고 자동적으로 들어와야 한다.
                            그리고 예약번호는 매번 그 숫자가 증가되면서 고유해야 한다.
                            이렇게 되려면 sequence 를 사용하면 된다.
                        */
    ,fk_gogekID  varchar2(30) not null  -- 고객아이디
                                        -- gogekid도 가능(하지만 나중에 헷갈리니 새로 재정의 fk_ => foreign key 참조키)
                                        -- fk_gogekID 컬럼에 들어올 수 있는 값은 tbl_gogek 테이블의 gogekId 컬럼의 값만 들어와야 한다. 
                                        -- 참조를 당하는 컬럼은 (여기서는 tbl_gogek 테이블의 gogekid 임) 반드시 고유한 값을 가지는 컬럼이어야 한다.
                                        -- 즉, 참조를 당하는 컬럼은 (여기서는 tbl_gogek 테이블의 gogekid 임) Primary Key 또는 Unique 제약을 가져야 한다. 
                        
    ,ticketCnt      number(2) not null   -- 예약티켓개수   
                                         -- 데이터 타입이 number(2) 이므로 -99 ~ 99 값들이 들어온다.
                                         -- 그런데 예약티켓개수는 1번 예약에 최대 10개 까지만 허락하고자 한다.
                                         -- 즉, ticketCnt 컬럼에 들어오는 값은 1 ~ 10 까지만 가능하도록 해야 한다.
                                         -- 이러한 경우 값을 검사해야 하므로 Check 제약을 사용하면 된다.
                                         
    ,registerDay    date default sysdate                                        
                        
    ,constraint PK_tbl_yeyak_yeyakno primary key(yeyakno)
    ,constraint FK_tbl_yeyak_fk_gogekID foreign key(fk_gogekID) references tbl_gogek(gogekId) 
    /*
      tbl_yeyak 테이블의 fk_gogekID 컬럼에는 foreign key 제약을 만들었는데
      그 뜻은 tbl_yeyak 테이블의 fk_gogekID 컬럼에 입력(insert)되거나 수정(update)되어지는 값은 
      반드시 tbl_gogek 테이블의 gogekid 컬럼에 존재하는 값들만 가능하다는 말이다.
      즉, tbl_gogek 테이블의 gogekid 컬럼에 존재하지 않는 값은 tbl_yeyak 테이블의 fk_gogekID 컬럼에 들어올 수 없다는 말이다.
      그리고 중요한 것은 tbl_gogek 의 gogekid 컬럼은 식별자 컬럼(Primary Key, Unique Key)이어야 한다. 
    */
    ,constraint CK_tbl_yeyak_ticketCnt check( 1 <= ticketCnt and ticketCnt <= 10 )
    );
    -- Table TBL_YEYAK이(가) 생성되었습니다.
    
    
    create sequence seq_tbl_yeyak   -- 예약번호
    start with 1 
    increment by 1 
    nomaxvalue
    nominvalue
    nocycle
    nocache;
    -- Sequence SEQ_TBL_YEYAK이(가) 생성되었습니다.
    
    insert into tbl_yeyak(yeyakno, fk_gogekID, ticketCnt) values(seq_tbl_yeyak.nextval, 'leess', 5); 
    -- 1 행 이(가) 삽입되었습니다.
    
    insert into tbl_yeyak(yeyakno, fk_gogekID, ticketCnt) values(seq_tbl_yeyak.nextval, 'superman', 3);     -- 고객 중 superman 없다.
    /*
     오류 보고 -
     ORA-02291: 무결성 제약조건(HR.FK_TBL_YEYAK_FK_GOGEKID)이 위배되었습니다- 부모 키가 없습니다
    */
    
    insert into tbl_yeyak(yeyakno, fk_gogekID, ticketCnt) values(seq_tbl_yeyak.nextval, 'eomjh', 3);   -- seq_tbl_yeyak.nextval = 3 superman 이 2
    -- 1 행 이(가) 삽입되었습니다.                                                                        -- 고유한 값이면 상관없음. 굳이 2를 안해도된다.
    
    insert into tbl_yeyak(yeyakno, fk_gogekID, ticketCnt) values(seq_tbl_yeyak.nextval, 'eomjh', 8); 
    -- 1 행 이(가) 삽입되었습니다.
    
    insert into tbl_yeyak(yeyakno, fk_gogekID, ticketCnt) values(seq_tbl_yeyak.nextval, 'eomjh', 20);   -- 동시에 20개는 안됨. check 제약
    /*
     오류 보고 -
     ORA-02290: 체크 제약조건(HR.CK_TBL_YEYAK_TICKETCNT)이 위배되었습니다
    */
    
    insert into tbl_yeyak(yeyakno, fk_gogekID, ticketCnt) values(seq_tbl_yeyak.nextval, 'sunsin', 5); 
    -- 1 행 이(가) 삽입되었습니다.
    
    select *
    from tbl_yeyak;
    
    commit;
    -- 커밋 완료.
    select *
    from tbl_gogek;
    -- tbl_yeyak 의 fk_gogekid 와 tbl_gogek 의 gogekid JOIN
    
    select Y.yeyakno as 예약번호
        , Y.fk_gogekid as 고객아이디
        , G.gogekname as 고객명
        , G.gogekemail as 이메일
        , Y.registerday as 등록일자
        , Y.ticketcnt as 티켓수
    from tbl_yeyak Y JOIN tbl_gogek G
    ON Y.fk_gogekid = G.gogekid;
    
    
    ---- **** foreign key 제약이 있는 테이블을 "자식" 테이블 이라고 부르고,
    ----      foreign key 에 의해 참조를 당하는 테이블을 "부모" 테이블 이라고 부른다. **** ---
    select *
    from tbl_gogek;  -- "부모" 테이블 
    
    select *
    from tbl_yeyak;  -- "자식" 테이블
    
    
    select *
    from departments;   -- department_id 컬럼이 P.K
    select *
    from employees;     -- department_id 컬럼이 F.K
    
    update employees set department_id = 110
    where employee_id = 100;
    -- 1 행 이(가) 업데이트되었습니다.
    
    update employees set department_id = 500    -- 500 번이 없어서 오류!
    where employee_id = 100;
    -- 오류 보고 -
    -- SQL 오류: ORA-00001: 무결성 제약 조건(HR.JHIST_EMP_ID_ST_DATE_PK)에 위배됩니다
    
    rollback;
    -- 롤백 완료.
    
    update tbl_yeyak set fk_gogekid = 'eomjh'   -- 회원을 넣을 경우
    where yeyakno = 6;
    -- 1 행 이(가) 업데이트되었습니다.
    
    update tbl_yeyak set fk_gogekid = 'batman'   -- 회원이 아닌 사람을 넣을 경우
    where yeyakno = 6;
    -- 오류 보고 -
    -- ORA-02291: 무결성 제약조건(HR.FK_TBL_YEYAK_FK_GOGEKID)이 위배되었습니다- 부모 키가 없습니다
    
    rollback;
    -- 롤백 완료.
    
    

    ---- **** tbl_yeyak 테이블에 생성되어진 foreign key 제약조건을 조회해봅니다. **** ----
    select A.table_name, A.constraint_name, A.constraint_type, A.search_condition
       , B.column_name, B.position , A.r_constraint_name as 참조받는부모테이블의식별자제약조건명
    from user_constraints A JOIN user_cons_columns B
    ON A.constraint_name = B.constraint_name
    where A.table_name = 'TBL_YEYAK' and A.constraint_type = 'R';
    
    --- !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! ---   
    --- tbl_yeyak 테이블에 존재하는 foreign key 컬럼명과 부모테이블명과 참조를 당하는 primary key(unique key)에 해당하는 컬럼명을 조회해보세요. ---
    SELECT C.column_name as "외래키 컬럼명"
        , D.table_name as "부모테이블명"
        , D.column_name as "참조를 당하는 컬럼명"
    FROM
    (
        select B.column_name, A.r_constraint_name
        from user_constraints A JOIN user_cons_columns B
        ON A.constraint_name = B.constraint_name
        where A.table_name = 'TBL_YEYAK' and A.constraint_type = 'R'    -- 제약조건 이름 R => FK
    ) C JOIN user_cons_columns D
    ON C.r_constraint_name = D.constraint_name;     -- PK_TBL_GOGEK_GOGEKID
    /*
    -------------------------------------------------
    외래키 컬럼명     부모테이블명      참조를 당하는 컬럼명
    ------------------------------------------------
    FK_GOGEKID	    TBL_GOGEK	    GOGEKID
    */
    
    -- table_yeyak
    select *
    from user_constraints A JOIN user_cons_columns B
    ON A.constraint_name = B.constraint_name
    where A.table_name = 'TBL_YEYAK';
    
    select *
    from user_cons_columns  -- 'PK_TBL_GOGEK_GOGEKID'   부모테이블의 제약조건 => R_CONSTRAINT_NAME
    where constraint_name = 'PK_TBL_GOGEK_GOGEKID';
    
    select *
    from user_cons_columns; --> constraint_name
    
    
    
    
/*    
    ◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆ 
    select *
    from user_constraints;  -- 사용되고 있는 제약조건 모두, 제약조건 타입 확인 가능
                            -- 복합제약조건이 있을 경우 하나의 constraint_name 으로 나온다.
    
    select *
    from user_cons_columns; -- 사용되고 있는 제약조건에 대한 내용(EX. 테이블명,컬럼명)
                            -- 복합 제약조건이 있을 경우 하나하나 컬럼별로 나온다.
    
    -> user_constraints 와 user_cons_columns JOIN ==> JOIN 조건절 constraint_name 이 같은 경우 ==> 컬럼명, 제약조건명
    -> user_constraints 의 table_name => 원하는 테이블명과 같은 경우 (where 절)
    -> user_constraints 의 constraint_type => 원하는 제약조건 타입 (where 절 -> R : F.K // C:check, not null // P : P.K // U : Unique )
    -> where 절 후 원하는 테이블명에 있는 선택한 제약조건 타입만 보인다. 
        ==> column_name, r_constraint_name => 부모테이블에 있는 컬럼명, 부모테이블에 있는 제약조건명 => 외래키 컬럼명, 부모테이블에 있는 제약조건명
    -> ' r_ ' 이 붙으면 부모테이블의 있는 제약조건명이다. 
    
    -> 외래키 컬럼명, 부모테이블에 있는 제약조건명 과 user_cons_columns 의 JOIN ==> JOIN 조건절 부모테이블에 있는 제약조건명과 constraint_name 이 같은 경우
        ==> 테이블명, 컬럼명 ==> 부모테이블명, 참조를 당하는 컬럼명
    ◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆ 
*/




    --- !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! ---   
    --- employees 테이블에 존재하는 foreign key 컬럼명과 부모테이블명과 참조를 당하는 primary key(unique key)에 해당하는 컬럼명을 조회해보세요. ---
    SELECT C.column_name as "외래키 컬럼명"
        , D.table_name as "부모테이블명"
        , D.column_name as "참조를 당하는 컬럼명"
    FROM
    (
        select B.column_name, A.r_constraint_name
        from user_constraints A JOIN user_cons_columns B
        ON A.constraint_name = B.constraint_name
        where A.table_name = 'EMPLOYEES' and A.constraint_type = 'R'    -- 제약조건 이름 R => FK
    ) C JOIN user_cons_columns D
    ON C.r_constraint_name = D.constraint_name;   

/*
    -------------------------------------------------
    외래키 컬럼명     부모테이블명      참조를 당하는 컬럼명
    ------------------------------------------------
    DEPARTMENT_ID	DEPARTMENTS	    DEPARTMENT_ID
    JOB_ID	            JOBS	    JOB_ID
    MANAGER_ID	    EMPLOYEES	    EMPLOYEE_ID
*/
    select *
    from employees;
    
    select *
    from jobs;
    
    
    
    
    
    
    -- !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! --
    -- "자식" 테이블(여기서는 tbl_yeyak 테이블)에 입력되어진 데이터가
    -- "부모" 테이블(여기서는 tbl_gogek 테이블)에 존재하는 경우에
    -- "부모" 테이블의 행을 삭제할 때 어떻게 되어지는지 알아봅니다.
    
       
    select *
    from tbl_gogek;  -- "부모" 테이블 
    
    select *
    from tbl_yeyak;  -- "자식" 테이블
    
    -- tbl_yeyak 테이블의 fk_gogekid 컬럼에 'hongkd' 는 존재하지 않는다.
    delete from tbl_gogek
    where gogekid= 'hongkd';
    -- 1 행 이(가) 삭제되었습니다.    ==> 예약테이블에 없으므로 바로 회원탈퇴 가능
    
    
    -- tbl_yeyak 테이블의 fk_gogekid 컬럼에 'eomjh' 는 존재한다.
    delete from tbl_gogek
    where gogekid= 'eomjh';
    -- 오류 보고 -
    -- ORA-02292: 무결성 제약조건(HR.FK_TBL_YEYAK_FK_GOGEKID)이 위배되었습니다- 자식 레코드(record)가 발견되었습니다
    -- 레코드란? row(행)을 말하는 것이다.
    
    rollback;
    -- 롤백 완료.
    
    
    
    
    -- !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    -- "부모" 테이블에 존재하는 행을 삭제하고자 할때 
    -- "자식" 테이블에 foreign key 컬럼에 삭제하려는 행의 값이 존재한다라면
    -- 위와 같이 무결성 제약조건(foreign key 제약)에 의해 삭제가 안된다.!!!!
    
    -- ★★★ "회원탈퇴" 처리 ★★★ => update
    -- "회원탈퇴" 처리는 update 로 할 수 있다.
    -- 로그인 처리를 하기위해서 tbl_gogek 테이블에 passwd 라는 컬럼을 추가하겠습니다.
    alter table tbl_gogek
    add passwd varchar2(20);
    -- Table TBL_GOGEK이(가) 변경되었습니다.
    
    -- 또한 "회원탈퇴" 처리를 위해서 status 라는 컬럼을 추가하겠다.
    alter table tbl_gogek
    add status number(1) default 1;
    -- Table TBL_GOGEK이(가) 변경되었습니다.
    
    -- tbl_gogek 테이블에 status 라는 컬럼에는 오로지 0 또는 1 값만 들어오게끔 체크제약을 만들겠다.
    -- status 라는 컬럼의 값이 1 이면 정상활동중으로 보고, status 라는 컬럼의 값이 0 이면 탈퇴한것으로 본다. 
    alter table tbl_gogek
    add constraint CK_tbl_gogek_status check(status in(0,1));
    -- Table TBL_GOGEK이(가) 변경되었습니다.
    
    update tbl_gogek set passwd = 'qwer1234';
    -- 4개 행 이(가) 업데이트되었습니다.
    commit;
    -- 커밋 완료.
    
    select *
    from tbl_gogek;
    
    
    select count(*) -- 1 은 정상로그인
    from tbl_gogek
    where status = 1 and gogekid = 'eomjh' and passwd = 'qwer1234';
    
    select count(*) -- 0 은 로그인불가
    from tbl_gogek
    where status = 1 and gogekid = 'abcd' and passwd = 'qwer1234';
    
    select count(*) -- 0 은 로그인불가
    from tbl_gogek
    where status = 1 and gogekid = 'eomjh' and passwd = 'abcd';
    
    -- "회원탈퇴" 처리
    delete from tbl_gogek
    where gogekid= 'eomjh';
    -- 오류 보고 -
    -- ORA-02292: 무결성 제약조건(HR.FK_TBL_YEYAK_FK_GOGEKID)이 위배되었습니다- 자식 레코드(record)가 발견되었습니다
    -- 레코드란? row(행)을 말하는 것이다.
    
    update tbl_gogek set status = 0 -- "회원탈퇴" 로 본다!!
    where status = 1 and gogekid = 'eomjh' and passwd = 'qwer1234';
    -- 1 행 이(가) 업데이트되었습니다.
    
    commit;
    -- 커밋 완료.
    
    select *
    from tbl_gogek;
    -- eomjh 엄정화 status = 0 ==> 로그인 불가
    
    
    
    -----------------------------------------------------------------------------------------------------------
    
    
    
    -- ★★★ "회원탈퇴" 처리 ★★★ => delete
    delete from tbl_gogek
    where gogekid = 'leess';
    -- 오류 보고 -
    -- ORA-02292: 무결성 제약조건(HR.FK_TBL_YEYAK_FK_GOGEKID)이 위배되었습니다- 자식 레코드가 발견되었습니다
    
    -- tbl_yeyak 테이블에 존재하는 foreign key 제약조건인 FK_TBL_YEYAK_FK_GOGEKID 을 삭제한다. --
    select *
    from user_constraints
    where table_name = 'TBL_YEYAK' and constraint_type = 'R';
    -- FK_TBL_YEYAK_FK_GOGEKID
    
    alter table tbl_yeyak
    drop constraint FK_TBL_YEYAK_FK_GOGEKID;
    -- Table TBL_YEYAK이(가) 변경되었습니다.
    
    -- 이제부터는 tbl_gogek 테이블과 tbl_yeyak 테이블 사이에는 부모,자식 관계가 끊어진 상태이다.
    delete from tbl_gogek
    where gogekid = 'leess';
    -- 1 행 이(가) 삭제되었습니다.
    
    insert into tbl_yeyak(yeyakno, fk_gogekID, ticketCnt) values(seq_tbl_yeyak.nextval, 'batman', 5); 
    -- 1 행 이(가) 삽입되었습니다.
    
    commit;
    -- 커밋 완료.
    
    -- delete 를 사용할 경우 고객테이블과 예약테이블의 연결이 아에 되지 않는다!!
    -- 고객이 아니여도 예약 가능한 현상이 발생
    select *
    from tbl_gogek;
    
    select *
    from tbl_yeyak;
    
    
    
    
    
    
    
    /*
     게시판에서 원글이 있고, 원글에 딸린 댓글이 있다.
     댓글은 원글이 존재할때만 댓글이 있는 것이다.
     그러면 "원글" 테이블과 "댓글" 테이블은 부모-자식 관계를 이룰 것이다.
     이러한 경우 "원글" 테이블에 어떤 한행이 삭제가 되어지면 그 원글행에 딸린 모든 댓글 또한 삭제가 되어져야 할 것이다.
     이럴때 자식테이블에 해당하는 "댓글" 테이블에는 "on delete cascade" 가 있는 foreign key 로 생성해야 한다. 
    */
    
    
    create table tbl_original_board     -- "원글" 테이블, 부모 테이블 
    (boardno     number                 -- 원글번호
    ,subject     Nvarchar2(50) not null -- 글제목 
    ,constraint  PK_tbl_original_board_boardno primary key(boardno)
    );
    -- Table TBL_ORIGINAL_BOARD이(가) 생성되었습니다.
    
    create table tbl_comment     -- "댓글" 테이블, 자식 테이블 
    (commentno   number          -- 댓글번호
    ,contents    Nvarchar2(100)  -- 댓글내용
    ,fk_boardno  number          -- 원글번호    -- 참조이기때문에 동일한 데이터 타입
    ,constraint  PK_tbl_comment_commentno  primary key(commentno)
    ,constraint  FK_tbl_comment_fk_boardno foreign key(fk_boardno) references tbl_original_board(boardno) on delete cascade 
    );
    -- Table TBL_COMMENT이(가) 생성되었습니다.
    
    insert into tbl_original_board(boardno, subject) values(1, '첫번째 원글입니다.');
    insert into tbl_original_board(boardno, subject) values(2, '두번째 원글입니다.');
    insert into tbl_original_board(boardno, subject) values(3, '세번째 원글입니다.');
    
    commit;
    
    select *
    from tbl_original_board;  -- 원글 테이블 
    
    -- 1번글 댓글 --
    insert into tbl_comment(commentno, contents, fk_boardno)
    values(101, '좋은 글 이네요', 1);
    insert into tbl_comment(commentno, contents, fk_boardno)
    values(102, '공감입니다.', 1);
    insert into tbl_comment(commentno, contents, fk_boardno)
    values(103, '감동입니다', 1);
    commit;
    -- 커밋 완료.
    
    -- 2번글 댓글 --
    insert into tbl_comment(commentno, contents, fk_boardno)
    values(104, '좋은 하루되세요~', 2);
    commit;
    -- 커밋 완료.
    
    select *
    from tbl_comment; -- 댓글 테이블 (자식 테이블)
    
    select *
    from tbl_original_board;  -- 원글 테이블 (부모 테이블)
    
    
    -- "부모" 테이블인 tbl_original_board 테이블에서 자식레코드가 존재하는 행을 삭제하겠습니다.
    delete from tbl_original_board
    where boardno = 1;
    -- 1 행 이(가) 삭제되었습니다.
    -- 자식 테이블에 "on delete cascade"이 붙어있기 때문에 참조하고 있는 자식 테이블을 모두 지우고 부모 테이블에 있는 행을 삭제한다.
    
    rollback;
    -- 롤백 완료.
    
    
    /*
     == foreign key 생성시 on delete cascade 를 안주어야 할 경우 ==

     "부서" 테이블 ==> 부서번호(P.K)  부서명   부서장사원번호
                        10         마케팅    1001
                        20         영업부    2001  --> "사원" 테이블에서 부서번호 20 인 사원들을 모두 10 으로 변경(update)한 후 delete 하면 된다.
                        
     "사원" 테이블 ==> 사원번호(P.K)  사원명   직급명  부서번호(F.K) 
                       1001        나기획   부장      10
                       1002        김길동   과장      10
                       2001        나영업   부장      20 --> 10
                       2002        나세일   과장      20 --> 10
                       2003        너판매   사원      20 --> 10 

     update "사원" set 부서번호 = 10 
     where 부서번호 = 20;

     delete from "부서" 
     where 부서번호 = 20;
  */
  
  
  
  
  
    ------------------------------------------------------------------------------------------------------------------------------------

    -- ★ on delete set null ★

    /*
     게시판에서 원글이 있고, 원글에 딸린 댓글이 있다.
     댓글은 원글이 존재할때만 댓글이 있는 것이다.
     그러면 "원글" 테이블과 "댓글" 테이블은 부모-자식 관계를 이룰 것이다.
     이러한 경우 "원글" 테이블에 어떤 한행이 삭제가 되어지기 위해서 그 원글행에 딸린 모든 댓글은 부모-자식 관계를 끊기 위해서 먼저 foreign key 컬럼에 해당하는 값을 null 변경시킨다.
     그런 다음에 "원글" 테이블에 어떤 한행을 삭제한다.
     이럴때 자식테이블에 해당하는 "댓글" 테이블에는 on delete set null 이 있는 foreign key 로 생성해야 한다. 
     주의해야할 사항은 자식테이블에 foreign key 에 해당하는 컬럼은 반드시 null 을 허락해주어야 한다.!!!
    */
    create table tbl_original_board_2   -- "원글" 테이블, 부모 테이블 
    (boardno     number                 -- 원글번호
    ,subject     Nvarchar2(50) not null -- 글제목 
    ,constraint  PK_tbl_original_board_2_boardno primary key(boardno)
    );
    -- Table TBL_ORIGINAL_BOARD_2이(가) 생성되었습니다.
    
    create table tbl_comment_2   -- "댓글" 테이블, 자식 테이블 
    (commentno   number          -- 댓글번호
    ,contents    Nvarchar2(100)  -- 댓글내용
    ,fk_boardno  number          -- 원글번호
    ,constraint  PK_tbl_comment_2_commentno  primary key(commentno)
    ,constraint  FK_tbl_comment_2_fk_boardno foreign key(fk_boardno) references tbl_original_board_2(boardno) on delete set null 
    );
    -- Table TBL_COMMENT_2이(가) 생성되었습니다.
    
    -- 원글 테이블 --
    insert into tbl_original_board_2(boardno, subject) values(1, '첫번째 원글입니다.');
    insert into tbl_original_board_2(boardno, subject) values(2, '두번째 원글입니다.');
    insert into tbl_original_board_2(boardno, subject) values(3, '세번째 원글입니다.');
    commit;
    -- 커밋 완료.
    
    -- 1번 글 댓글 테이블 --
    insert into tbl_comment_2(commentno, contents, fk_boardno)
    values(101, '좋은 글 이네요', 1);
    insert into tbl_comment_2(commentno, contents, fk_boardno)
    values(102, '공감입니다.', 1);
    insert into tbl_comment_2(commentno, contents, fk_boardno)
    values(103, '감동입니다', 1);
    commit;
    -- 커밋 완료.
    
    -- 2번 글 댓글 테이블 --
    insert into tbl_comment_2(commentno, contents, fk_boardno)
    values(104, '좋은 하루되세요~', 2);
    commit;
    -- 커밋 완료.
    
    
    select *
    from tbl_comment_2; -- 댓글 테이블
    
    select *
    from tbl_original_board_2;  -- 원글 테이블
    
    
    delete from tbl_original_board_2
    where boardno = 1;
    -- 1 행 이(가) 삭제되었습니다.
    
    select *
    from tbl_original_board_2;  -- 원글 테이블
    
    select *
    from tbl_comment_2; -- 댓글 테이블
    
    rollback;
    -- 롤백 완료.
    
    
    
    
    
    
     create table tbl_emp
    (empno    number(4)     
    ,ename    nvarchar2(10) not null
    ,jik      nvarchar2(10) not null 
    ,mgr_no   number(4)     -- 직속상관번호 => 사장이 있으므로 null 값 허용
    ,constraint  PK_tbl_emp_empno primary key(empno)    -- 식별자!!
    ,constraint  FK_tbl_emp_mgr_no foreign key(mgr_no) references tbl_emp(empno)    -- 직속상관번호가 우리회사 내 여야 한다!! 
    );                                                                              -- 자신의 테이블에 있는 컬럼을 참조할 수 있다.
    -- Table TBL_EMP이(가) 생성되었습니다.
    
    insert into tbl_emp(empno, ename, jik, mgr_no)
    values(1001, '나사장', '사장', null);
    -- 1 행 이(가) 삽입되었습니다.
    
    insert into tbl_emp(empno, ename, jik, mgr_no)
    values(1002, '나부장', '부장', 1001);
    -- 1 행 이(가) 삽입되었습니다.
    
    insert into tbl_emp(empno, ename, jik, mgr_no)
    values(1003, '나과장', '과장', 2001);
    /*
    오류 보고 -
    ORA-02291: 무결성 제약조건(HR.FK_TBL_EMP_MGR_NO)이 위배되었습니다- 부모 키가 없습니다
    */
    
    insert into tbl_emp(empno, ename, jik, mgr_no)
    values(1003, '나과장', '과장', 1002);
    -- 1 행 이(가) 삽입되었습니다.
    
    commit;
  
    select * 
    from tbl_emp;
    
    
    
    
    
    
    
    
    ---- *** >>> NOT NULL 제약에 대해서 알아봅니다. <<< *** ----
    -- 하나의 테이블당 여러개를 생성할 수 있다.
    -- 특정 컬럼에 NOT NULL 제약을 주면 그 컬럼에는 반드시 데이터값을 주어야 한다는 말이다. 
    
    --- !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! ---   
    --- employees 테이블에 존재하는 제약조건이 무엇이 있는지 조회해보세요. ---
    select *
    from user_constraints
    where table_name = 'EMPLOYEES';
    
    select *
    from user_cons_columns
    where table_name = 'EMPLOYEES';
    
    select B.column_name, B.position,
         A.constraint_name, A.constraint_type, A.search_condition, A.r_constraint_name 
    from user_constraints A JOIN user_cons_columns B
    ON A.constraint_name = B.constraint_name
    where A.table_name = 'EMPLOYEES';
    
    
    --- !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! ---   
    --- tbl_yeyak 테이블에 존재하는 foreign key 컬럼명과 부모테이블명과 참조를 당하는 primary key(unique key)에 해당하는 컬럼명을 조회해보세요. ---
    SELECT C.column_name as "외래키 컬럼명"
        , D.table_name as "부모테이블명"
        , D.column_name as "참조를 당하는 컬럼명"
        , C.delete_rule as "CASCADE 옵션"
    FROM
    (
        select B.column_name, A.r_constraint_name, A.delete_rule
        from user_constraints A JOIN user_cons_columns B
        ON A.constraint_name = B.constraint_name
        where A.table_name = 'EMPLOYEES' and A.constraint_type = 'R'    -- 제약조건 이름 R => FK
    ) C JOIN user_cons_columns D
    ON C.r_constraint_name = D.constraint_name;     
    /*
    -------------------------------------------------------------------
    외래키 컬럼명     부모테이블명      참조를 당하는 컬럼명     CASCADE 옵션
    -------------------------------------------------------------------
    DEPARTMENT_ID	DEPARTMENTS	      DEPARTMENT_ID	       NO ACTION
    JOB_ID	           JOBS	            JOB_ID	           NO ACTION
    MANAGER_ID	    EMPLOYEES	       EMPLOYEE_ID	       NO ACTION
    */
    
    
    SELECT C.column_name as "외래키 컬럼명"
        , D.table_name as "부모테이블명"
        , D.column_name as "참조를 당하는 컬럼명"
        , C.delete_rule as "CASCADE 옵션"
    FROM
    (
        select B.column_name, A.r_constraint_name, A.delete_rule
        from user_constraints A JOIN user_cons_columns B
        ON A.constraint_name = B.constraint_name
        where A.table_name = 'TBL_COMMENT' and A.constraint_type = 'R'    -- 제약조건 이름 R => FK
    ) C JOIN user_cons_columns D
    ON C.r_constraint_name = D.constraint_name;     -- PK_TBL_GOGEK_GOGEKID
    /*
    -------------------------------------------------------------------
    외래키 컬럼명     부모테이블명      참조를 당하는 컬럼명     CASCADE 옵션
    -------------------------------------------------------------------
    FK_BOARDNO	TBL_ORIGINAL_BOARD	    BOARDNO	            CASCADE
    */
    
    
    
    SELECT C.column_name as "외래키 컬럼명"
        , D.table_name as "부모테이블명"
        , D.column_name as "참조를 당하는 컬럼명"
        , C.delete_rule as "CASCADE 옵션"
    FROM
    (
        select B.column_name, A.r_constraint_name, A.delete_rule
        from user_constraints A JOIN user_cons_columns B
        ON A.constraint_name = B.constraint_name
        where A.table_name = 'TBL_COMMENT_2' and A.constraint_type = 'R'    -- 제약조건 이름 R => FK
    ) C JOIN user_cons_columns D
    ON C.r_constraint_name = D.constraint_name;     -- PK_TBL_GOGEK_GOGEKID
    /*
    -------------------------------------------------------------------
    외래키 컬럼명     부모테이블명      참조를 당하는 컬럼명     CASCADE 옵션
    -------------------------------------------------------------------
    FK_BOARDNO	TBL_ORIGINAL_BOARD_2	BOARDNO	           SET NULL
    */
    
    
    
    
    
     --------- **** 어떤 테이블에 제약조건을 추가하기 **** -----------
  /*
       제약조건 추가시 NOT NULL 제약을 제외한 나머지 4개는 아래와 같이한다.
       
       alter table 테이블명 add constraint 제약조건명 primary key(컬럼명);
       alter table 테이블명 add constraint 제약조건명 unique(컬럼명);
       alter table 테이블명 add constraint 제약조건명 check( ... );
       
       alter table 테이블명 add constraint 제약조건명 foreign key(컬럼명) references 부모테이블명(식별자컬럼명);
       alter table 테이블명 add constraint 제약조건명 foreign key(컬럼명) references 부모테이블명(식별자컬럼명) on delete casecade;
       alter table 테이블명 add constraint 제약조건명 foreign key(컬럼명) references 부모테이블명(식별자컬럼명) on delete set null;
 */
 
 /*
       NOT NULL 제약을 추가할 때는 아래와 같이 한다.
       
       alter table 테이블명 modify 컬럼명 [constraint 제약조건명] not null;
 */
 
    create table tbl_employees_backup_20240229
    as
    select *
    from employees;
    -- Table TBL_EMPLYEES_BACKUP_20240229이(가) 생성되었습니다.
    
    
    -- !!!! 서브쿼리를 사용한 테이블 생성은 원래 테이블에 있던 NOT NULL 제약만 
    --      새로운 이름(SYS_C뭐뭐뭐~~)으로 생성되어지고, 나머지 제약은 생성되어지지 않는다. !!!!
    
    select *
    from tbl_employees_backup_20240229;
    
    select B.column_name, B.position,
         A.constraint_name, A.constraint_type, A.search_condition, A.r_constraint_name 
    from user_constraints A JOIN user_cons_columns B
    ON A.constraint_name = B.constraint_name
    where A.table_name = 'EMPLOYEES';
    
    select B.column_name, B.position,
         A.constraint_name, A.constraint_type, A.search_condition, A.r_constraint_name 
    from user_constraints A JOIN user_cons_columns B
    ON A.constraint_name = B.constraint_name
    where A.table_name = 'TBL_EMPLOYEES_BACKUP_20240229';
    
    
    
    
    -- 1. primary key 추가하기 EMP_EMP_ID_PK
    alter table TBL_EMPLOYEES_BACKUP_20240229 add constraint EMP_EMP_ID_PK primary key(employee_id);
    -- 오류 보고 -
    -- ORA-02264: 기존의 제약에 사용된 이름입니다
    
    alter table TBL_EMPLOYEES_BACKUP_20240229 add constraint TBL_EMPLYEES_BACKUP_20240229_EMP_EMP_ID_PK primary key(employee_id);
    -- Table TBL_EMPLYEES_BACKUP_20240229이(가) 변경되었습니다.
    
    /*
        !!! 주의사항 !!!
        만약에 사용하고자 하는 오라클 DB 서버의 버전이 11g 이라면 (현재는 18g 사용중)
        테이블명 또는 컬럼명 또는 제약조건명 등등 최대길이가 30글자 이므로 30글자가 넘으면 오류이다.!!!
    */  
    
    
    -- 2. unique 제약 추가하기 EMP_EMAIL_UK
    alter table TBL_EMPLOYEES_BACKUP_20240229 add constraint TBL_EMPLYEES_BACKUP_20240229_EMP_EMAIL_UK unique(email);
    -- Table TBL_EMPLOYEES_BACKUP_20240229이(가) 변경되었습니다.
    
    -- 3. check 제약 추가하기 EMP_SALARY_MIN
    alter table TBL_EMPLOYEES_BACKUP_20240229 add constraint TBL_EMPLYEES_BACKUP_20240229_EMP_SALARY_MIN check(salary > 0);
    -- Table TBL_EMPLOYEES_BACKUP_20240229이(가) 변경되었습니다.
    
    -- 4. foreign key 제약 추가하기 EMP_DEPT_FK, EMP_JOB_FK, EMP_MANAGER_FK
    /*
    [참조]
    SELECT C.column_name as "외래키 컬럼명"
        , D.table_name as "부모테이블명"
        , D.column_name as "참조를 당하는 컬럼명"
        , C.delete_rule as "CASCADE 옵션"
    FROM
    (
        select B.column_name, A.r_constraint_name, A.delete_rule
        from user_constraints A JOIN user_cons_columns B
        ON A.constraint_name = B.constraint_name
        where A.table_name = 'EMPLOYEES' and A.constraint_type = 'R'    -- 제약조건 이름 R => FK
    ) C JOIN user_cons_columns D
    ON C.r_constraint_name = D.constraint_name;
    
    -- delete_rule => no action => 없다 / set null / cascade
    */
    
    -- alter table 테이블명 add constraint 제약조건명 foreign key(컬럼명) references 부모테이블명(식별자컬럼명);
    
    alter table TBL_EMPLOYEES_BACKUP_20240229 
    add constraint TBL_EMPLYEES_BACKUP_20240229_EMP_DEPT_FK foreign key(DEPARTMENT_ID) references DEPARTMENTS(DEPARTMENT_ID);
    -- Table TBL_EMPLOYEES_BACKUP_20240229이(가) 변경되었습니다.
    
    alter table TBL_EMPLOYEES_BACKUP_20240229 
    add constraint TBL_EMPLYEES_BACKUP_20240229_EMP_JOB_FK foreign key(JOB_ID) references JOBS(JOB_ID);
    -- Table TBL_EMPLOYEES_BACKUP_20240229이(가) 변경되었습니다.
    
    alter table TBL_EMPLOYEES_BACKUP_20240229 
    add constraint TBL_EMPLYEES_BACKUP_20240229_EMP_MANAGER_FK foreign key(MANAGER_ID) references EMPLOYEES(EMPLOYEE_ID);
    -- Table TBL_EMPLOYEES_BACKUP_20240229이(가) 변경되었습니다.
    
    
    -- >> NOT NULL 제약 이름 변경
    ---- **** >>>> SYS ~~ 제약조건명 이름변경하기 <<<< **** -----
     /*
       alter table 테이블명
       rename constraint 현재제약조건이름 to 새로운제약조건이름;
     */
     
    alter table TBL_EMPLOYEES_BACKUP_20240229
    rename constraint SYS_C007400 to TBL_EMPLOYEES_BACKUP_20240229_EMP_EMAIL_NN;
    
    alter table TBL_EMPLOYEES_BACKUP_20240229
    rename constraint SYS_C007401 to TBL_EMPLOYEES_BACKUP_20240229_EMP_HIRE_DATE_NN;
    
    alter table TBL_EMPLOYEES_BACKUP_20240229
    rename constraint SYS_C007402 to TBL_EMPLOYEES_BACKUP_20240229_EMP_JOB_NN;
    
    alter table TBL_EMPLOYEES_BACKUP_20240229
    rename constraint SYS_C007399 to TBL_EMPLOYEES_BACKUP_20240229_EMP_LAST_NAME_NN;
    
    
    -- 만든 후 확인하기
    select B.column_name, B.position,
         A.constraint_name, A.constraint_type, A.search_condition, A.r_constraint_name 
    from user_constraints A JOIN user_cons_columns B
    ON A.constraint_name = B.constraint_name
    where A.table_name = 'TBL_EMPLOYEES_BACKUP_20240229';
    
    
    -- 5. not null 제약 추가하기
    --- **** >>> salary 컬럼에 NOT NULL 제약을 추가하겠다. <<< **** ---
    desc TBL_EMPLOYEES_BACKUP_20240229;
    -- alter table 테이블명 modify 컬럼명 [constraint 제약조건명] not null;

    alter table TBL_EMPLOYEES_BACKUP_20240229
    add constraint TBL_EMPLOYEES_BACKUP_20240229_SALARY_NN salary not null;
    -- 문법오류!!!
    
    alter table TBL_EMPLOYEES_BACKUP_20240229
    modify salary constraint TBL_EMPLOYEES_BACKUP_20240229_SALARY_NN not null;
    -- Table TBL_EMPLOYEES_BACKUP_20240229이(가) 변경되었습니다.
    
    
    
    
    
    ---- *** >>>> 어떤 테이블에 제약조건을 삭제하기 <<<< *** ----
  /*
      alter table 테이블명 drop constraint 제약조건명;
        
      그런데 NOT NULL 제약은 위의 것처럼 해도 되고, 또는 아래처럼 해도 된다.
      alter table 테이블명 modify 컬럼명 null;
        
      어떤 테이블에 primary key 제약조건을 삭제할 경우에는 위의 것처럼 해도 되고, 또는 아래처럼 해도 된다.
      alter table 테이블명 drop primary key;    -- primary key 는 하나밖에 없으므로!!
  */  
  
    -- TBL_EMPLOYEES_BACKUP_20240229 테이블 check
    select B.column_name, B.position,
         A.constraint_name, A.constraint_type, A.search_condition, A.r_constraint_name 
    from user_constraints A JOIN user_cons_columns B
    ON A.constraint_name = B.constraint_name
    where A.table_name = 'TBL_EMPLOYEES_BACKUP_20240229';
    
    alter table TBL_EMPLOYEES_BACKUP_20240229
    drop constraint TBL_EMPLYEES_BACKUP_20240229_EMP_SALARY_MIN;
    -- Table TBL_EMPLOYEES_BACKUP_20240229이(가) 변경되었습니다.
    
    alter table TBL_EMPLOYEES_BACKUP_20240229
    drop constraint TBL_EMPLYEES_BACKUP_20240229_EMP_JOB_FK;    -- , 으로 한번에 불가!
    alter table TBL_EMPLOYEES_BACKUP_20240229
    drop constraint TBL_EMPLYEES_BACKUP_20240229_EMP_MANAGER_FK;
    alter table TBL_EMPLOYEES_BACKUP_20240229
    drop constraint TBL_EMPLYEES_BACKUP_20240229_EMP_DEPT_FK;
    
    alter table TBL_EMPLOYEES_BACKUP_20240229
    drop primary key;   -- primary key
    
    alter table TBL_EMPLOYEES_BACKUP_20240229
    drop constraint TBL_EMPLYEES_BACKUP_20240229_EMP_EMAIL_UK;
    
    -- null 제약
    alter table TBL_EMPLOYEES_BACKUP_20240229
    modify HIRE_DATE null;
    alter table TBL_EMPLOYEES_BACKUP_20240229
    modify JOB_ID null;
    alter table TBL_EMPLOYEES_BACKUP_20240229
    modify LAST_NAME null;
    alter table TBL_EMPLOYEES_BACKUP_20240229
    modify EMAIL null;
    alter table TBL_EMPLOYEES_BACKUP_20240229
    modify SALARY null;
    
    desc TBL_EMPLOYEES_BACKUP_20240229;
    -- NOT NULL 이 없고 모두 NULL 이다!
    
    
    ---- *** 어떤 테이블에 생성되어진 제약조건의 내용을 변경하기 *** ----
    --->     기존 제약조건을 삭제하고서 내용이 변경되어진 제약조건을 추가하는 것이다. 
    
    -- 잘못 주는 경우 => salary 를 0원가능하게 해버렸다.
    alter table TBL_EMPLOYEES_BACKUP_20240229 add constraint TBL_EMPLYEES_BACKUP_20240229_EMP_SALARY_MIN check(salary >= 0);
    -- Table TBL_EMPLOYEES_BACKUP_20240229이(가) 변경되었습니다.
    
    -- 기존 제약조건 삭제
    alter table TBL_EMPLOYEES_BACKUP_20240229
    drop constraint TBL_EMPLYEES_BACKUP_20240229_EMP_SALARY_MIN;
    -- Table TBL_EMPLOYEES_BACKUP_20240229이(가) 변경되었습니다.
    
    -- 제약조건 추가
    alter table TBL_EMPLOYEES_BACKUP_20240229 add constraint TBL_EMPLYEES_BACKUP_20240229_EMP_SALARY_MIN check(salary > 0);
    -- Table TBL_EMPLOYEES_BACKUP_20240229이(가) 변경되었습니다.
    
    
    
    
    -- << 확인 >> --
    select B.column_name, B.position,
         A.constraint_name, A.constraint_type, A.search_condition, A.r_constraint_name 
         , A.status
    from user_constraints A JOIN user_cons_columns B
    ON A.constraint_name = B.constraint_name
    where A.table_name = 'TBL_EMPLOYEES_BACKUP_20240229';
    
    ---- *** >>> 어떤 테이블에 존재하는 제약조건을 비활성화 시키기 <<< *** ----
    -- alter table 테이블명 disable constraint 제약조건명;
    
    alter table TBL_EMPLOYEES_BACKUP_20240229
    disable constraint TBL_EMPLYEES_BACKUP_20240229_EMP_SALARY_MIN;
    -- Table TBL_EMPLOYEES_BACKUP_20240229이(가) 변경되었습니다.
    
   ---- *** >>> 어떤 테이블에 존재하는 제약조건을 활성화 시키기 <<< *** ----
    -- alter table 테이블명 enable constraint 제약조건명;

    alter table TBL_EMPLOYEES_BACKUP_20240229
    enable constraint TBL_EMPLYEES_BACKUP_20240229_EMP_SALARY_MIN;
    -- Table TBL_EMPLOYEES_BACKUP_20240229이(가) 변경되었습니다.
    
    
    
    
    
    -- << 확인 >> --
    desc TBL_EMPLOYEES_BACKUP_20240229;
    select *
    from TBL_EMPLOYEES_BACKUP_20240229;
    
    ---- *** 어떤 테이블에 새로운 컬럼 추가하기 *** ----
    -- alter table 테이블명 add 추가할컬럼명 데이터타입;
    alter table TBL_EMPLOYEES_BACKUP_20240229
    add school Nvarchar2(10);
    -- Table TBL_EMPLOYEES_BACKUP_20240229이(가) 변경되었습니다.
    
    ---- *** 어떤 테이블에 존재하는 컬럼을 삭제하기 *** ----
    -- alter table 테이블명 drop column 삭제할컬럼명;
    alter table TBL_EMPLOYEES_BACKUP_20240229
    drop column school;
    -- Table TBL_EMPLOYEES_BACKUP_20240229이(가) 변경되었습니다.
    
    ---- *** 어떤 테이블에 새로운 컬럼 추가하는데 NOT NULL 이어야 한다. *** ----
    -- alter table 테이블명 add 추가할컬럼명 데이터타입 not null;      <-- 테이블명에 insert 되어진 행이 없을 경우에만 가능함.!!
    -- => 테이블에 데이터가 없으면 가능 // 테이블에 이미 데이터가 존재하면 오류!!
    alter table TBL_EMPLOYEES_BACKUP_20240229
    add school Nvarchar2(10) not null;
    -- 오류 보고 -
    -- ORA-01758: 테이블은 필수 열을 추가하기 위해 (NOT NULL) 비어 있어야 합니다.
    
    -- 테이블에 데이터가 존재할 경우 => default 를 넣어준다.
    alter table TBL_EMPLOYEES_BACKUP_20240229
    add school Nvarchar2(10) default ' ' not null;
    -- Table TBL_EMPLOYEES_BACKUP_20240229이(가) 변경되었습니다.
    
    
    
    ----- **** 어떤 테이블에 존재하는 default 값 알아보기 **** -----
    select column_name, data_type, data_length, nullable, data_default
    from user_tab_columns
    where table_name = 'TBL_EMPLOYEES_BACKUP_20240229';
    
    ----- **** 어떤 테이블의 어떤 컬럼에 default 값 넣어주기 **** -----
    -- alter table 테이블명 modify 컬럼명 default 디폴트값;
    
    alter table TBL_EMPLOYEES_BACKUP_20240229
    modify HIRE_DATE default sysdate;
    -- Table TBL_EMPLOYEES_BACKUP_20240229이(가) 변경되었습니다.
    
    ----- **** 어떤 테이블의 어떤 컬럼에 default 값 삭제하기 **** -----
    -- alter table 테이블명 modify 컬럼명 default null;
    alter table TBL_EMPLOYEES_BACKUP_20240229
    modify HIRE_DATE default null;
    -- Table TBL_EMPLOYEES_BACKUP_20240229이(가) 변경되었습니다.
    
    
    ---- *** 어떤 테이블에 존재하는 컬럼명을 변경하기 *** ----
   /*
       alter table 테이블명
       rename column 현재컬럼명 to 새로이변경할컬럼명;
   */
    
    alter table TBL_EMPLOYEES_BACKUP_20240229
    rename column salary to pay;
    -- Table TBL_EMPLOYEES_BACKUP_20240229이(가) 변경되었습니다.
    -- << 확인 >>
    desc TBL_EMPLOYEES_BACKUP_20240229;
    -- 원상복구
    alter table TBL_EMPLOYEES_BACKUP_20240229
    rename column pay to salary;
    
    
    
    -- << 확인 >>
    desc TBL_EMPLOYEES_BACKUP_20240229;
    
    ---- *** 어떤 테이블에 존재하는 컬럼의 데이터타입 변경하기 *** ----
   /*
        alter table 테이블명 
        modify 컬럼명 새로운데이터타입;
   */
    alter table TBL_EMPLOYEES_BACKUP_20240229 
    modify salary NUMBER(10,2);
    -- Table TBL_EMPLOYEES_BACKUP_20240229이(가) 변경되었습니다.
    
    
    
    ---- *** 어떤 테이블의 테이블명 변경하기 *** ----
    -- rename 현재테이블명 to 새로운테이블명;
    rename TBL_EMPLOYEES_BACKUP_20240229 to TBL_EMPLOYEES_COPY_20240229;
    -- 테이블 이름이 변경되었습니다.
    
    -- << 확인 >>
    select *
    from TBL_EMPLOYEES_BACKUP_20240229;
    -- ORA-00942: 테이블 또는 뷰가 존재하지 않습니다
    select *
    from TBL_EMPLOYEES_COPY_20240229;
    -- 결과가 나온다.
    
    
    
    -- !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    ---- !!!! 테이블을 생성한 이후에 웬만하면 테이블명에 대한 주석문을 달아주도록 합시다.!!!! ----
    
    --- *** 테이블명에 달려진 주석문 조회하기 *** --
    select *
    from user_tab_comments; 
    
    
    create table tbl_jikwon
    (sano    number
    ,saname  Nvarchar2(10) not null
    ,salary  number(6) default 100 not null
    ,comm    number(5)
    ,constraint PK_tbl_jikwon_sano primary key(sano)
    );
    -- Table TBL_JIKWON이(가) 생성되었습니다.
    
    COMMENT ON TABLE tbl_jikwon
    IS '우리회사 사원들의 정보가 들어있는 테이블';
    -- Comment이(가) 생성되었습니다.
    
    
    
    
    ---- !!!! 테이블을 생성한 이후에 웬만하면 컬럼명에 대한 주석문을 달아주도록 합시다.!!!! ----
    select *
    from user_col_comments
    where table_name = 'EMPLOYEES';
    
    select *
    from user_col_comments
    where table_name = 'TBL_JIKWON';    -- 대문자로 적기
    
    COMMENT ON COLUMN tbl_jikwon.SANO
    IS '사원번호 primary key';
    -- Comment이(가) 생성되었습니다.
    
    comment on column tbl_jikwon.saname is '사원명'; -- Comment이(가) 생성되었습니다.
    comment on column tbl_jikwon.salary is '기본급여 기본값은 100'; -- Comment이(가) 생성되었습니다.
    comment on column tbl_jikwon.comm is '수당 null 허락함'; -- Comment이(가) 생성되었습니다.
    
    select column_name, comments
    from user_col_comments
    where table_name = 'TBL_JIKWON';
    
    
    
    ----- **** 자식테이블이 있는 부모테이블을 drop 하기 **** -----
    create table tbl_buseo_parent
    (buno     number(2)
    ,buname   varchar2(20)
    ,constraint PK_tbl_buseo_parent primary key(buno)
    );
    -- Table TBL_BUSEO_PARENT이(가) 생성되었습니다.
    
    create table tbl_sawon_child
    (sano    number(4)
    ,saname  varchar2(20)
    ,fk_buno number(2)
    ,constraint PK_tbl_sawon_child_sano primary key(sano)
    ,constraint FK_tbl_sawon_child_fk_buno foreign key(fk_buno) references tbl_buseo_parent(buno)
    );
    -- Table TBL_SAWON_CHILD이(가) 생성되었습니다.
    
    select *
    from user_constraints
    where table_name = 'TBL_SAWON_CHILD';
    
    drop table tbl_buseo_parent purge;
    -- 오류 보고 -
    -- ORA-02449: 외래 키에 의해 참조되는 고유/기본 키가 테이블에 있습니다
    
    drop table tbl_buseo_parent cascade constraint purge;
    -- Table TBL_BUSEO_PARENT이(가) 삭제되었습니다.
    
    -- tbl_buseo_parent 테이블을 참조하고 있는 모든 자식테이블(지금은 tbl_sawon_child)에 존재하는
    -- foreign key 중에서 tbl_buseo_parent 테이블을 참조하고 있는 foreign key 만 먼저 삭제한다.
    -- 그런 다음에는 부모자식 관계가 없으므로 tbl_buseo 테이블을 drop purge 한다.
    
    -- [확인]
    select *
    from user_constraints
    where table_name = 'TBL_SAWON_CHILD';
    -- PK_TBL_SAWON_CHILD_SANO	P
    
    
    
    
    ------------------------------------------------------------------------------
    ---- *** >>> 데이터 백업 없이 drop 되어진 테이블 복구하기 <<< *** ----
   
    --  flashback drop ==> drop 되어진 테이블을 복구가 가능하도록 만들어 주는 것이다.
    
    ---- !!!! 테이블을 삭제시 휴지통에 버리기 !!!! ----
    
    create table tbl_exam_01(name  varchar2(20));
    insert into tbl_exam_01(name) values('연습1');
    commit;
    
    create table tbl_exam_02(name  varchar2(20));
    insert into tbl_exam_02(name) values('연습2');
    commit;
    
    create table tbl_exam_03(name  varchar2(20));
    insert into tbl_exam_03(name) values('연습3');
    commit;
    
    create table tbl_exam_04(name  varchar2(20));
    insert into tbl_exam_04(name) values('연습4');
    commit;
    
    create table tbl_exam_05(name  varchar2(20));
    insert into tbl_exam_05(name) values('연습5');
    commit;
      
    create table tbl_exam_06(name  varchar2(20));
    insert into tbl_exam_06(name) values('연습6');
    commit;
    
    drop table tbl_exam_01;  --> tbl_exam_01 테이블을 영구히 삭제하는 것이 아니라 휴지통에 버리는 것이다. 
    -- Table TBL_EXAM_01이(가) 삭제되었습니다.
    
    select * from tab; 
    -- 결과물에서 tname 컬럼에 BIN$로 시작하는 것은 휴지통에 버려진 테이블이다.    --> BIN$pZH2GUUwRCSRUIuF8Mqe6w==$0
    
    drop table tbl_exam_02;  --> tbl_exam_02 테이블을 영구히 삭제하는 것이 아니라 휴지통에 버리는 것이다. 
    -- Table TBL_EXAM_02이(가) 삭제되었습니다.
    
    select * from tab; 
    -- 결과물에서 tname 컬럼에 BIN$로 시작하는 것은 휴지통에 버려진 테이블이다.    --> BIN$46ahQxDnQVKAnX8vXuBv8A==$0
    
    select * 
    from tbl_exam_01;
    -- ORA-00942: 테이블 또는 뷰가 존재하지 않습니다
    
    select * 
    from tbl_exam_02;
    -- ORA-00942: 테이블 또는 뷰가 존재하지 않습니다
   
    select *
    from "BIN$pZH2GUUwRCSRUIuF8Mqe6w==$0";  -- 반드시 "" 붙이기
    select *
    from "BIN$46ahQxDnQVKAnX8vXuBv8A==$0";  -- 반드시 "" 붙이기
    
    ------ ===== **** 휴지통 조회하기 **** ===== ------
    select *
    from user_recyclebin;
    
    ------ ===== **** 휴지통에 있던 테이블을 복원하기 **** ===== ------
    flashback table TBL_EXAM_01 to before drop;
    -- Flashback을(를) 성공했습니다.
    -- TBL_EXAM_01 은 user_recyclebin 에서 보여지는 original_name 컬럼에 나오는 것이다.
    
    select *
    from tbl_exam_01;
    -- 복원됨.
    
    ------ ===== **** 휴지통에 있던 테이블을 영구히 삭제하기 **** ===== ------
    purge table TBL_EXAM_02;
    -- Table이(가) 비워졌습니다.
    -- TBL_EXAM_02 은 user_recyclebin 에서 보여지는 original_name 컬럼에 나오는 것이다.
    
    ------ ===== **** 휴지통에 있던 모든 테이블을 영구히 삭제하기 **** ===== ------
    
    -- 휴지통에 넣기
    drop table tbl_exam_03;  --> tbl_exam_03 테이블을 영구히 삭제하는 것이 아니라 휴지통에 버리는 것이다. 
    -- Table TBL_EXAM_03이(가) 삭제되었습니다.
    drop table tbl_exam_04;  --> tbl_exam_04 테이블을 영구히 삭제하는 것이 아니라 휴지통에 버리는 것이다. 
    -- Table TBL_EXAM_04이(가) 삭제되었습니다.
    
    -- 휴지통 조회
    select *
    from user_recyclebin;
    
    -- 휴지통 비우기
    purge recyclebin;   -- 휴지통에 있던 모든 테이블을 영구히 삭제하기
    -- Recyclebin이(가) 비워졌습니다.
    -- << 확인 >> => bin$~~ 없다.
    select * from tab;  -- BIN$로 시작하는 것이 아무것도 없다.
    
    
    
    --- *** 테이블을 영구히 삭제하기 ==> drop 되어진 테이블은 복원이 불가하다. *** ---
    select *
    from tbl_exam_05;
    
    -- drop table tbl_exam_05;      -- 휴지통
    drop table tbl_exam_05 purge;   -- 영구히 삭제
    -- Table TBL_EXAM_05이(가) 삭제되었습니다.
    
    
    
    
    
    --★-------------- ============== ★★★★★★ INDEX(인덱스, 색인) ★★★★★★ ============== --------------★--
    
    /* 
       index(==색인)는 예를 들어 설명하면 아주 두꺼운 책 뒤에 나오는 "찾아보기" 와 같은 기능을 하는 것이다.
       "찾아보기" 의 특징은 정렬되어 있는 것인데 index(==색인) 에 저장된 데이터도 정렬되어 저장되어 있다는 것이 특징이다.
    */
    -- index(==색인)를 생성해서 사용하는 이유는 where 절이 있는 select 명령문의 속도를 향상 시키기 위함이다.
    -- index(==색인)은 어떤 컬럼에 만들어 할까요?
    
    /*
       1. where 절에서 자주 사용되어진 컬럼에 만들어야 한다.
       
       2. 선택도(selectivity)가 높은 컬럼에 만들어야 한다.
       ※ 선택도(selectivity)가 높다라는 것은 고유한 데이터일수록 선택도(selectivity)가 높아진다.
       예: 성별컬럼 --> 선택도(selectivity)가 아주 낮다. 왜냐하면 수많은 사람중 남자 아니면 여자중 하나만 골라야 하므로 선택의 여지가 아주 낮다.
           학번    --> 선택도(selectivity)가 아주 좋다. 왜냐하면 학번은 다양하고 고유하므로 골라야할 대상이 아주 많으므로 선택도가 높은 것이다.
    
       3. 카디널리티(cardinality)가 높은 컬럼에 만들어야 한다.
       ※ 카디널리티(cardinality)의 사전적인 뜻은 집합원의 갯수를 뜻하는 것으로서,
          카디널리티(cardinality)가 높다라는 것은 중복도가 낮아 고유한 데이터일수록 카디널리티(cardinality)가 상대적으로 높다 라는 것이다.
          카디널리티(cardinality)가 낮다라는 것은 중복도가 높아 중복된 데이터가 많을수록 카디널리티(cardinality)가 상대적으로 낮다 라는 것이다.
          
          카디널리티(cardinality)는 "상대적인 개념" 이다.
          예를들어, 주민등록번호 같은 경우는 중복되는 값이 없으므로 카디널리티(cardinality)가 높다고 할 수 있다.
          이에 비해 성명같은 경우는 "주민등록번호에 비해" 중복되는 값이 많으므로, 성명은 "주민등록번호에 비해" 카디널리티가 낮다고 할 수 있다.
          이와같이 카디널리티(cardinality)는 상대적인 개념으로 이해해야 한다.
    */ 
    
    
    create table tbl_student_1
    (hakbun      varchar2(20) not null
    ,name        varchar2(20)
    ,email       varchar2(30)
    ,address     varchar2(200)
    );
   -- Table TBL_STUDENT_1이(가) 생성되었습니다.
   
    --- *** unique 한 index 생성하기 *** ---
    /* 
        어떤 컬럼에 unique 한 index 를 생성하면 그 컬럼에 들어오는 값은 중복된 값은 들어올 수 없으며 오로지 고유한 값만 들어오게 된다.
        unique 한 index 가 뒤에 나오는 non-unique 한 index 보다 검색속도가 조금 더 빠르다.

        [문법]
        create unique index 인덱스명
        on 해당테이블명(컬럼명 asc|desc);
    */
    
    create unique index idx_tbl_student_1_hakbun
        on tbl_student_1(hakbun);   -- on tbl_student_1(hakbun asc); 와 동일하다
        -- on tbl_student_1(hakbun asc);
        -- on tbl_student_1(hakbun desc);
    -- Index IDX_TBL_STUDENT_1_HAKBUN이(가) 생성되었습니다.
    
    insert into tbl_student_1(hakbun, name, email, address) values('1', '일미자', 'ilmj@naver.com', '서울시 강동구');
    -- 1 행 이(가) 삽입되었습니다.
    
    insert into tbl_student_1(hakbun, name, email, address) values('1', '이미자', 'twomj@naver.com', '서울시 강서구');
    -- 오류 보고 -
    -- ORA-00001: 무결성 제약 조건(HR.IDX_TBL_STUDENT_1_HAKBUN)에 위배됩니다
    
    insert into tbl_student_1(hakbun, name, email, address) values('2', '이미자', 'twomj@naver.com', '서울시 강서구');
    -- 1 행 이(가) 삽입되었습니다.
    
    commit;
    -- 커밋 완료.
    
    
    --- *** tbl_student_1 테이블에 생성 되어진 index 조회하기 *** ---
    select *
    from user_indexes       -- columns 명이 나오지 않는다.
    where table_name = 'TBL_STUDENT_1'; -- 대문자로 쓰기!
    
    select *
    from user_ind_columns   -- columns 명이 나온다.
    where table_name = 'TBL_STUDENT_1'; -- 대문자로 쓰기!
    
    select A.index_name, A.uniqueness, B.column_name, B.descend
    from user_indexes A JOIN user_ind_columns B
    ON A.index_name = B.index_name
    where A.table_name = 'TBL_STUDENT_1';
    
    --- *** non-unique 한 index 생성하기 *** ---
    /* 
     어떤 컬럼에 non-unique 한 index 생성하면 그 컬럼에 들어오는 값은 중복된 값이 들어올 수 있다는 것이다.
     non-unique 한 index 는 unique 한 index 보다 검색속도가 다소 늦은 편이다.
    
    [문법]
    create index 인덱스명
    on 해당테이블명(컬럼명 asc|desc);
    */
    
    create index idx_tbl_student_1_name
    on tbl_student_1(name);
    -- Index IDX_TBL_STUDENT_1_NAME이(가) 생성되었습니다.
    
    insert into tbl_student_1(hakbun, name, email, address) values('3', '삼미자', 'three@naver.com', '서울시 강서구');
    -- 1 행 이(가) 삽입되었습니다.
    
    insert into tbl_student_1(hakbun, name, email, address) values('4', '삼미자', 'sam@naver.com', '서울시 강남구');
    -- 1 행 이(가) 삽입되었습니다.
    
    commit;
    -- 커밋 완료.
    
    select *
    from tbl_student_1;
    
    select A.index_name, A.uniqueness, B.column_name, B.descend
    from user_indexes A JOIN user_ind_columns B
    ON A.index_name = B.index_name
    where A.table_name = 'TBL_STUDENT_1';
    /*
    -----------------------------------------------------------------------
    INDEX_NAME                  UNIQUENESS      COLUMN_NAME     DESCEND
    ------------------------------------------------------------------------
    IDX_TBL_STUDENT_1_HAKBUN	UNIQUE	        HAKBUN	          ASC
    IDX_TBL_STUDENT_1_NAME	    NONUNIQUE	    NAME	          ASC
    */
    
    
    select *
    from tbl_student_1
    where hakbun = '2';  -->  unique한 인덱스 IDX_TBL_STUDENT_1_HAKBUN 를 사용하여 빠르게 조회해옴.
    
    
    select *
    from tbl_student_1
    where name = '이미자';  --> non-unique한 인덱스 IDX_TBL_STUDENT_1_NAME 를 사용하여 빠르게 조회해옴.
    
    
    select *
    from tbl_student_1
    where address = '서울시 강동구';  --> address 컬럼에는 인덱스가 없으므로 tbl_student_1 테이블에 있는 모든 데이터를 조회해서 
                                    --  address 컬럼의 값이  '서울시 강동구' 인 데이터를 가져온다.
                                    --  이와 같이 인덱스를 사용하지 않고 데이터를 조회해올 때를 Table Full-scan(인덱스를 사용하지 않고 테이블 전체 조회) 이라고 부른다.
                                    --  Table Full-scan(인덱스를 사용하지 않고 테이블 전체 조회)이 속도가 가장 느린 것이다.
                                    
    
    delete from tbl_student_1;  
    -- 4개 행 이(가) 삭제되었습니다.
    
    commit;
    -- 커밋 완료.
    
    
    create sequence seq_tbl_student_1
    start with 1
    increment by 1
    nomaxvalue
    nominvalue
    nocycle
    nocache;
    -- Sequence SEQ_TBL_STUDENT_1이(가) 생성되었습니다.
    
    declare
        v_today     varchar2(8);
        v_seq       number;
        v_cnt       number := 0;
    begin
        select to_char(sysdate,'yyyymmdd') into v_today
        from dual;
        
        LOOP
            v_cnt := v_cnt + 1;
            
            EXIT WHEN v_cnt > 10000;
            
            -- 채번
            select seq_tbl_student_1.nextval into v_seq
            from dual;
            
            insert into tbl_student_1(hakbun, name, email, address)
            values(v_today || '-' || v_seq, '이순신' || v_seq, 'leess' || v_seq || '@gmail.com', '서울시 마포구 월드컵로 ' || v_seq);
        END LOOP;
    end;
    -- PL/SQL 프로시저가 성공적으로 완료되었습니다.
    
    commit;
    -- 커밋 완료.
    
    select *
    from tbl_student_1
    order by hakbun asc;
    
    select count(*)
    from tbl_student_1
    order by hakbun asc;
    -- 10000
    
    select seq_tbl_student_1.currval AS 최근에사용한시퀀스값
    from dual;
    -- 10000
    
    
    insert into tbl_student_1(hakbun, name, email, address)
    values(to_char(sysdate, 'yyyymmdd')||'-'||(seq_tbl_student_1.currval + 1), '배수지'||(seq_tbl_student_1.currval + 1), 'baesuji'||(seq_tbl_student_1.currval + 1)||'@gmail.com', '서울시 마포구 월드컵로 '||(seq_tbl_student_1.currval + 1));
    --     '20240305-10001'
    
    insert into tbl_student_1(hakbun, name, email, address)
    values(to_char(sysdate, 'yyyymmdd')||'-'||(seq_tbl_student_1.currval + 2), '배수지'||(seq_tbl_student_1.currval + 2), 'baesuji'||(seq_tbl_student_1.currval + 2)||'@gmail.com', '서울시 마포구 월드컵로 '||(seq_tbl_student_1.currval + 2));
    --     '20240305-10002'
    
    insert into tbl_student_1(hakbun, name, email, address)
    values(to_char(sysdate, 'yyyymmdd')||'-'||(seq_tbl_student_1.currval + 3), '배수지'||(seq_tbl_student_1.currval + 3), 'baesuji'||(seq_tbl_student_1.currval + 3)||'@gmail.com', '서울시 마포구 월드컵로 '||(seq_tbl_student_1.currval + 3));
    --     '20240305-10003'
    
    commit;
    -- 커밋 완료.
    
    select count(*)
    from tbl_student_1
    order by hakbun asc;
    -- 10003
    
    select A.index_name, A.uniqueness, B.column_name, B.descend
    from user_indexes A JOIN user_ind_columns B
    ON A.index_name = B.index_name
    where A.table_name = 'TBL_STUDENT_1';
    /*
    -----------------------------------------------------------------------
    INDEX_NAME                  UNIQUENESS      COLUMN_NAME     DESCEND
    ------------------------------------------------------------------------
    IDX_TBL_STUDENT_1_HAKBUN	UNIQUE	        HAKBUN	          ASC
    IDX_TBL_STUDENT_1_NAME	    NONUNIQUE	    NAME	          ASC
    */
    
    
    
    -- ==== *** SQL*Developer 에서 Plan(실행계획) 확인하는 방법 *** ==== --
    /*
      select 문이 실행될 때 인덱스를 사용하여 데이터를 얻어오는지 인덱스를 사용하지 않고 
      Table Full Scan 하여 얻어오는지 알아봐야 한다.
      이럴때 사용하는 것이 SQL Plan(실행계획)이다. 
      
      SQL*Developer 에서는 "SQL편집창(SQL 워크시트)"에 Plan(실행계획) 과 Trace(자동추적) 메뉴가 상단에 있다.
      
      Plan(실행계획) 과 Trace(자동추적) 의 차이는,
      Plan(실행계획) 은 SQL을 실행하기 전에 Oracle Optimizer(옵티마이저, 최적화기)가 SQL을 어떻게 실행할지를 미리 알려주는 것이고,
      Trace(자동추적) 는 SQL을 실행해보고, Oracle Optimizer(옵티마이저, 최적화기)가 SQL을 어떻게 실행했는지 그 결과를 알려주는 것이다.

      그러므로, 정확도로 말하자면, Trace(자동추적)가 Plan(실행계획) 보다 훨씬 정확한 것이다.
      Plan(실행계획) 은 말그대로 계획이라서 Oracle Optimizer가 계획은 그렇게 세우긴 했으나 
      실제 실행할때는 여러가지 이유로 다르게 실행할 수도 있기 때문이다.
      그래서 Trace(자동추적)가 정확하기는 하나 Trace(자동추적)는 한번 실행해봐야 하는것이라서 
      시간이 오래 걸리는 SQL인 경우에는 한참 기다려야 하는 단점이 있기는 하다.
   */       
    
    
   /* 
      실행해야할 SQL문을 블럭으로 잡은 후에
      "SQL 워크시트" 의 상단 아이콘들중에 3번째 아이콘( 계획 설명... (F10) )을 클릭하면 현재 SQL의 Plan(실행계획)을 아래에 보여준다.
      COST(비용)의 값이 적을 수록 속도가 빠른 것이다.
   */
    
    select *
    from tbl_student_1
    where hakbun = '20240305-6789';     -- hakbun 에는 unnique index 가 있다.    --> unique 한 인덱스 IDX_TBL_STUDENT_1_HAKBUN 을 사용하여 빠르게 조회
    
    select *
    from tbl_student_1
    where name = '이순신5783';     --> non - unique 한 인덱스 IDX_TBL_STUDENT_1_NAME 을 사용하여 빠르게 조회
    
    select *
    from tbl_student_1
    where address = '서울시 마포구 월드컵로 3987';     
    --> address 컬럼에는 인덱스가 없으므로 tbl_student_1 테이블에 있는 모든 데이터를 조회해서 
    --  address 컬럼의 값이  '서울시 마포구 월드컵로 3987' 인 데이터를 가져온다.
    --  이와 같이 인덱스를 사용하지 않고 데이터를 조회해올 때를 Table Full-scan(인덱스를 사용하지 않고 테이블 전체 조회) 이라고 부른다.
    --  Table Full-scan(인덱스를 사용하지 않고 테이블 전체 조회)이 속도가 가장 느린 것이다.
    
    select *
    from tbl_student_1
    where email = 'leess2654@gmail.com'; 
    --> email 컬럼에는 인덱스가 없으므로 Table Full-scan(인덱스를 사용하지 않고 테이블 전체 조회)하여 조회
    
    
    
    
    -----------------------------------------------------------------------------------------------------------
    -- *** Trace(자동추적)을 하기 위해서는 SYS 또는 SYSTEM 으로 부터 권한을 부여 받은 후 HR은 재접속을 해야 한다. *** --
    show user;
    -- USER이(가) "SYS"입니다.
    
    grant select_catalog_role to hr;
    -- Grant을(를) 성공했습니다.
    
    grant select any dictionary to hr;
    -- Grant을(를) 성공했습니다.
 ----------------------------------------------------------------------------   
 
    -- 접속에 가서 local_hr 에서 재접속을 클릭한다.
    
    show user;
    -- USER이(가) "HR"입니다.
    
    /* 
      실행해야할 SQL문을 블럭으로 잡은 후에
      "SQL 워크시트" 의 상단 아이콘들중에 4번째 아이콘( 자동 추적... (F6) )을 클릭하면 현재 SQL의 Trace(자동추적)을 아래에 보여준다.
      
      Trace(자동추적)을 하면 Plan(실행계획) 도 나오고, 동시에 아래쪽에 통계정보도 같이 나온다.

      오른쪽에 Plan(실행계획)에서는 보이지 않던 LAST_CR_BUFFER_GETS 와 LAST_ELAPSED_TIME 컬럼이 나온다.
      LAST_CR_BUFFER_GETS 는 SQL을 실행하면서 각 단계에서 읽어온 블록(Block) 갯수를 말하는 것이고,
      LAST_ELAPSED_TIME 은 경과시간 정보이다.
      즉, 이 정보를 통해서 어느 구간에서 시간이 많이 걸렸는지를 확인할 수 있으므로, 이 부분의 값이 적게 나오도록 SQL 튜닝을 하게 된다.
    */  
    
    -- [ last_elapsed_time 경과시간 확인하기 ]
    select *
    from tbl_student_1
    where hakbun = '20240305-6789';
    
    select *
    from tbl_student_1
    where name = '이순신5783';
    
    select *
    from tbl_student_1
    where address = '서울시 마포구 월드컵로 3987'; 
    
    select *
    from tbl_student_1
    where email = 'leess2654@gmail.com'; 
    
    
    
    ---- *** DML(insert, update, delete)이 빈번하게 발생하는 테이블에 index가 생성되어 있으면
    ---      DML(insert, update, delete) 작업으로 인해 Index 에 나쁜 결과를 초래하므로  
    ---      index 가 많다고 해서 결코 좋은 것이 아니기에 테이블당 index 의 개수는 최소한의 개수로 만드는 것이 좋다.
    
    ---- *** index 가 생성되어진 테이블에 insert 를 하면 Index Split(인덱스 쪼개짐) 가 발생하므로
    ----     index 가 없을시 보다 insert 의 속도가 떨어지게 된다.
    ----     그러므로 index 가 많다고 결코 좋은 것이 아니므로 최소한의 개수로 index 를 만드는 것이 좋다.
    ----     Index Split(인덱스 쪼개짐)란 Index 의 block(블럭)들이 1개에서 2개로 나뉘어지는 현상을 말한다.
    ----     Index Split(인덱스 쪼개짐)이 발생하는 이유는 Index 는 정렬이 되어 저장되기 때문에 
    ---      Index 의 마지막 부분에 추가되는 것이 아니라 정렬로 인해 중간 자리에 끼워들어가는 현상이
    ----     발생할 수 있기 때문이다. 
    
    
    ---- *** index 가 생성되어진 테이블에 delete 를 하면 테이블의 데이터는 삭제가 되어지지만 
    ----     Index 자리에는 데이터는 삭제되지 않고서 사용을 안한다는 표시만 하게 된다.
    ----     그래서 10만 건이 들어있던 테이블에 9만건의 데이터를 delete 를 하면 테이블에는 데이터가 삭제되어 지지만
    ----     Index 자리에는 10만 건의 정보가 그대로 있고 1만건만 사용하고 9만건은 사용되지 않은채로 되어있기에
    ----     사용하지 않는 9만건의 Index 정보로 인해서 index를 사용해서 select를 해올 때 index 검색속도가 떨어지게 된다.   
    ----     이러한 경우 Index Rebuild 작업을 해주어 사용하지 않는 9만건의 index 정보를 삭제해주어야만 
    ----     select를 해올 때 index 검색속도가 빨라지게 된다. 
    
    
    ---- *** index 가 생성되어진 테이블에 update 를 하면 테이블의 데이터는 "수정" 되어지지만 
    ----     Index 는 "수정" 이라는 작업은 없고 index 를 delete 를 하고 새로이 insert 를 해준다.
    ----     그러므로 index 를 delete 할 때 발생하는 단점 및 index 를 insert 를 할 때 발생하는 Index Split(인덱스 쪼개짐) 가 발생하므로
    ----     Index 에는 최악의 상황을 맞게 된다. 
    ----     이로 인해 테이블의 데이터를 update를 빈번하게 발생시켜 버리면 select를 해올 때 index 검색속도가 현저히 느려지게 된다. 
    ----     이러한 경우도 select를 해올 때 index 검색속도가 빨라지게끔 Index Rebuild 작업을 해주어야 한다. 
    
    ---- **** Index(인덱스)의 상태 확인하기 **** ----
    analyze index IDX_TBL_STUDENT_1_NAME validate structure;
    -- Index IDX_TBL_STUDENT_1_NAME이(가) 분석되었습니다.
    
    select (del_lf_rows_len / lf_rows_len) * 100 "인덱스상태(Balance)"
    from index_stats
    where name = 'IDX_TBL_STUDENT_1_NAME';
    /*
       인덱스상태(Balance)
       ------------------
              0          <== 0 에 가까울 수록 인덱스 상태가 좋은 것이다.     // delete 하기 전의 index 를 분석한 것이므로 0 이라고 나올 뿐이다.
    */
    
    select count(*)
    from tbl_student_1;
    -- 10003
    
    delete from tbl_student_1
    where hakbun between '20240305-400' and '20240305-9400';
    -- 6,001개 행 이(가) 삭제되었습니다.
    
    commit;
    -- 커밋 완료.
    
    select count(*)
    from tbl_student_1;
    -- 4002
    
    ---- **** Index(인덱스)의 상태 확인하기 **** ----
    analyze index IDX_TBL_STUDENT_1_NAME validate structure;
    -- Index IDX_TBL_STUDENT_1_NAME이(가) 분석되었습니다.
    
    select (del_lf_rows_len / lf_rows_len) * 100 "인덱스상태(Balance)"
    from index_stats
    where name = 'IDX_TBL_STUDENT_1_NAME';
    /*
                    인덱스상태(Balance)
       ------------------------------------------
        59.99108333467217197114534967787542374243   <== 인덱스 밸런스가 대략 60%정도가 깨진 것이다.
    */
    
    update tbl_student_1 set name = '홍길동'
    where hakbun between '20240305-9401' and '20240305-9901';
    -- 556개 행 이(가) 업데이트되었습니다.
    
    commit;
    -- 커밋 완료.
    
    
    ---- **** Index(인덱스)의 상태 확인하기 **** ----
    analyze index IDX_TBL_STUDENT_1_NAME validate structure;    -- set 이 name 컬럼이기때문에 name 이다.
    -- Index IDX_TBL_STUDENT_1_NAME이(가) 분석되었습니다.
    
    select (del_lf_rows_len / lf_rows_len) * 100 "인덱스상태(Balance)"
    from index_stats
    where name = 'IDX_TBL_STUDENT_1_NAME';
    /*
                    인덱스상태(Balance)
       ------------------------------------------
        60.02157957571107984032755006174384305166   <== 인덱스 밸런스가 대략 60%정도가 깨진 것이다.
    */
    
    
    
    ----- *** ==== Index Rebuild(인덱스 재건축) 하기 ==== *** -----
    -- 인덱스 밸런스가 대략 61% 정도 깨진 IDX_TBL_STUDENT_1_NAME 을 Index Rebuild(인덱스 재건축) 하겠습니다. --
    alter index IDX_TBL_STUDENT_1_NAME rebuild;
    -- Index IDX_TBL_STUDENT_1_NAME이(가) 변경되었습니다.
    
    ---- **** Index(인덱스)의 상태 확인하기 **** ----
    analyze index IDX_TBL_STUDENT_1_NAME validate structure;   
    -- Index IDX_TBL_STUDENT_1_NAME이(가) 분석되었습니다.
    
    select (del_lf_rows_len / lf_rows_len) * 100 "인덱스상태(Balance)"
    from index_stats
    where name = 'IDX_TBL_STUDENT_1_NAME';
    /*
       인덱스상태(Balance)
       ------------------
              0          <== 0 에 가까울 수록 인덱스 상태가 좋은 것이다.
    */
    
    
    ---- *** index 삭제학시 *** ----
    -- drop index 삭제할인덱스명;
    
    select A.index_name, A.uniqueness, B.column_name, B.descend
    from user_indexes A JOIN user_ind_columns B
    ON A.index_name = B.index_name
    where A.table_name = 'TBL_STUDENT_1';
    /*
    -----------------------------------------------------------------------
    INDEX_NAME                  UNIQUENESS      COLUMN_NAME     DESCEND
    ------------------------------------------------------------------------
    IDX_TBL_STUDENT_1_HAKBUN	UNIQUE	        HAKBUN	          ASC
    IDX_TBL_STUDENT_1_NAME	    NONUNIQUE	    NAME	          ASC
    */
    
    drop index IDX_TBL_STUDENT_1_HAKBUN;
    -- Index IDX_TBL_STUDENT_1_HAKBUN이(가) 삭제되었습니다.
    
    drop index IDX_TBL_STUDENT_1_NAME;
    -- Index IDX_TBL_STUDENT_1_NAME이(가) 삭제되었습니다.






    ------ **** !!!!! 복합인덱스(Composite index) 생성하기 !!!!! **** -------
    -- 복합인덱스(composite index)란? 
    -- 2개 이상의 컬럼으로 묶어진 인덱스를 말하는 것으로서
    -- where 절에 2개의 컬럼이 사용될 경우 각각 1개 컬럼마다 각각의 인덱스를 만들어서 사용하는 것보다
    -- 2개의 컬럼을 묶어서 하나의 인덱스로 만들어 사용하는 것이 속도가 좀 더 빠르다.
    select *
    from tbl_student_1
    where name = '배수지10001' and address = '서울시 마포구 월드컵로 10001';
    
    
    -- !!!!  중요  !!!! --
    -- 복합인덱스(composite index) 생성시 중요한 것은 선행컬럼을 정하는 것이다.
    -- 선행컬럼은 맨처음에 나오는 것으로 아래에서는 name 이 선행컬럼이 된다.
    -- 복합인덱스(composite index)로 사용되는 컬럼중 선행컬럼으로 선정되는 기준은 where 절에 가장 많이 사용되는 것이며 
    -- 선택도(selectivity)가 높은 컬럼이 선행컬럼으로 선정되어야 한다.
    
    create index idx_tbl_student_1_name_addr
    on tbl_student_1(name, address);  -- name 컬럼이 선행컬럼이 된다.
    -- Index IDX_TBL_STUDENT_1_NAME_ADDR이(가) 생성되었습니다.
    
  /*
    create index idx_tbl_student_1_name_addr
    on tbl_student_1(address, name);  -- address 컬럼이 선행컬럼이 된다. 
  */
    
    select A.index_name, A.uniqueness, B.column_name, B.descend
        , B.column_position
    from user_indexes A JOIN user_ind_columns B
    ON A.index_name = B.index_name
    where A.table_name = 'TBL_STUDENT_1';
    /*
    ------------------------------------------------------------------------------------------------------
    INDEX_NAME                  UNIQUENESS      COLUMN_NAME     DESCEND     Column_Position
    ------------------------------------------------------------------------------------------------------
    IDX_TBL_STUDENT_1_NAME_ADDR	NONUNIQUE	      NAME	          ASC               1 (숫자 1이 선행컬럼이다)
    IDX_TBL_STUDENT_1_NAME_ADDR	NONUNIQUE	     ADDRESS	      ASC               2
    */
    
    
    select *
    from tbl_student_1
    where name = '배수지10001' and address = '서울시 마포구 월드컵로 10001'; 
    -- where 절에 선행컬럼인 name 이 사용되어지면 복합인덱스(composite index)인 IDX_TBL_STUDENT_1_NAME_ADDR 을 사용하여 빨리 조회해온다.
    
    select *
    from tbl_student_1
    where address = '서울시 마포구 월드컵로 10001' and name = '배수지10001'; 
    -- where 절에 선행컬럼인 name 이 사용되어지면 복합인덱스(composite index)인 IDX_TBL_STUDENT_1_NAME_ADDR 을 사용하여 빨리 조회해온다.
    
    select *
    from tbl_student_1
    where name = '배수지10001'; 
    -- where 절에 선행컬럼인 name 이 사용되어지면 복합인덱스(composite index)인 IDX_TBL_STUDENT_1_NAME_ADDR 을 사용하여 빨리 조회해온다.
    
    select *
    from tbl_student_1
    where address = '서울시 마포구 월드컵로 10001'; 
    -- where 절에 선행컬럼이 없으므로 복합인덱스(composite index)인 IDX_TBL_STUDENT_1_NAME_ADDR 을 사용하지 못하고 Table Full Scan 하여 조회해오므로 속도가 떨어진다. 



    

    create table tbl_member
   (userid      varchar2(20)
   ,passwd      varchar2(30) not null
   ,name        varchar2(20) not null 
   ,address     varchar2(100)
   ,email       varchar2(50) not null 
   ,constraint  PK_tbl_member_userid primary key(userid)
   ,constraint  UQ_tbl_member_email unique(email)
   );
    -- Table TBL_MEMBER이(가) 생성되었습니다.
    
    declare 
         v_cnt  number := 1;  
    begin
         loop
             exit when v_cnt > 10000;
             
             insert into tbl_member(userid, passwd, name, address, email)
             values('hongkd'||v_cnt, 'qwer1234$', '홍길동'||v_cnt, '서울시 마포구 '||v_cnt, 'hongkd'||v_cnt||'@gmail.com');
             
             v_cnt := v_cnt + 1;
         end loop;
    end;
    -- PL/SQL 프로시저가 성공적으로 완료되었습니다.
    
    commit;
    -- 커밋 완료.
    
    select *
    from tbl_member;
    
    -- [테이블 인덱스 보기]
    select A.index_name, A.uniqueness, B.column_name, B.descend, B.column_position   
    from user_indexes A JOIN user_ind_columns B
    ON A.index_name = B.index_name
    where A.table_name = 'TBL_MEMBER';
    /*
     ---------------------------------------------------------------------------------------------
      index_name                   uniqueness    column_name   descend      column_position
     --------------------------------------------------------------------------------------------- 
      PK_TBL_MEMBER_USERID          UNIQUE        USERID          ASC            1
      UQ_TBL_MEMBER_EMAIL          UNIQUE        EMAIL          ASC            1
     --------------------------------------------------------------------------------------------- 
    */

    --- 로그인을 하는데 로그인이 성공되어지면 그 회원의 성명만을 보여주도록 한다.
    select name 
    from tbl_member
    where userid = 'hongkd201' and passwd = 'qwer1234$';


    --- **** userid, passwd, name 컬럼을 가지고 복합인덱스(composite index)를 생성해 봅니다. **** ---
    create index idx_tbl_member_id_pwd_name
    on tbl_member(userid, passwd, name);
    -- Index IDX_TBL_MEMBER_ID_PWD_NAME이(가) 생성되었습니다.

     -- [테이블 인덱스 보기]
    select A.index_name, A.uniqueness, B.column_name, B.descend, B.column_position   
    from user_indexes A JOIN user_ind_columns B
    ON A.index_name = B.index_name
    where A.table_name = 'TBL_MEMBER';
    /*
     ---------------------------------------------------------------------------------------------
      index_name                   uniqueness    column_name   descend      column_position
     --------------------------------------------------------------------------------------------- 
    PK_TBL_MEMBER_USERID            UNIQUE          USERID       ASC                1
    UQ_TBL_MEMBER_EMAIL             UNIQUE          EMAIL        ASC                1
    IDX_TBL_MEMBER_ID_PWD_NAME	  NONUNIQUE	        USERID	     ASC	            1
    IDX_TBL_MEMBER_ID_PWD_NAME	  NONUNIQUE	        PASSWD	     ASC	            2
    IDX_TBL_MEMBER_ID_PWD_NAME	  NONUNIQUE	        NAME	     ASC	            3
     --------------------------------------------------------------------------------------------- 
    */

    -- 로그인을 하는데 로그인이 성공되어지면 그 회원의 성명만을 보여주도록 한다.
    select name 
    from tbl_member
    where userid = 'hongkd201' and passwd = 'qwer1234$';
    -- where 절 및 select 에 복합인덱스(composite index)인 IDX_TBL_MEMBER_ID_PWD_NAME 에 사용되어진 컬럼만 있으므로
    -- 테이블 tbl_member 에는 접근하지 않고 인덱스 IDX_TBL_MEMBER_ID_PWD_NAME 에만 접근해서 조회하므로 속도가 빨라진다. 
    
    select name, address
    from tbl_member
    where userid = 'hongkd201' and passwd = 'qwer1234$';
    -- where 절에 userid 및 passwd 가 사용되었으므로 복합인덱스(composite index)인 IDX_TBL_MEMBER_ID_PWD_NAME 을 사용하는데 
    -- select 절에 IDX_TBL_MEMBER_ID_PWD_NAME 에 없는 address 컬럼이 있으므로 테이블 tbl_member 에 접근해야 한다.
    -- 그러므로 인덱스 IDX_TBL_MEMBER_ID_PWD_NAME 만 접근하는 것 보다는 조회 속도가 쬐금 느려진다. 
    
    drop index idx_tbl_member_id_pwd_name;
    -- Index IDX_TBL_MEMBER_ID_PWD_NAME이(가) 삭제되었습니다.
    
    
    
    
    ------ **** 함수기반 인덱스(function based index) 생성하기 **** -------
    select A.index_name, A.uniqueness, B.column_name, B.descend, B.column_position   
    from user_indexes A JOIN user_ind_columns B
    ON A.index_name = B.index_name
    where A.table_name = 'TBL_STUDENT_1';
    
    drop index IDX_TBL_STUDENT_1_NAME_ADDR;     -- 현재 남은 인덱스 지우기
    -- Index IDX_TBL_STUDENT_1_NAME_ADDR이(가) 삭제되었습니다.
    
    
    create index idx_tbl_student_1_name
    on tbl_student_1(name);
    -- Index IDX_TBL_STUDENT_1_NAME이(가) 생성되었습니다.
    
    select * 
    from tbl_student_1
    where name = '배수지10002';
    -- name 컬럼에 생성해둔 인덱스 IDX_TBL_STUDENT_1_NAME 인덱스를 사용하여 조회해온다.
    
    select * 
    from tbl_student_1
    where substr(name,2,2) = '수지';
    -- name 컬럼에 생성해둔 인덱스 IDX_TBL_STUDENT_1_NAME 인덱스를 사용하지 않고 Table Full Scan 하여 조회해온다.
    
    create index idx_func_tbl_student_1_name
    on tbl_student_1(substr(name,2,2));     -- 함수기반 인덱스(function based index) 생성
    -- Index IDX_FUNC_TBL_STUDENT_1_NAME이(가) 생성되었습니다.
    
    select * 
    from tbl_student_1
    where substr(name,2,2) = '수지';  -- => 실행계획-> cost 가 줄어든 모습을 볼 수 있다.
    -- 함수 기반 인덱스인 Index IDX_FUNC_TBL_STUDENT_1_NAME 을 사용하여 조회해온다.
    
    drop index IDX_FUNC_TBL_STUDENT_1_NAME; -- 대소문자 구분 X
    -- Index IDX_FUNC_TBL_STUDENT_1_NAME이(가) 삭제되었습니다.
    
    -- 남아있는 INDEX 컬럼
    select A.index_name, A.uniqueness, B.column_name, B.descend, B.column_position   
    from user_indexes A JOIN user_ind_columns B
    ON A.index_name = B.index_name
    where A.table_name = 'TBL_STUDENT_1';
    /*
     ---------------------------------------------------------------------------------
            index_name         uniqueness    column_name   descend   column_position
     ---------------------------------------------------------------------------------
    IDX_TBL_STUDENT_1_NAME	   NONUNIQUE	   NAME	        ASC	           1
    */
    
    
    select * 
    from tbl_student_1
    where name = '배수지10002';
    -- 인덱스 IDX_TBL_STUDENT_1_NAME 을 사용하여 조회해온다.
    
    select * 
    from tbl_student_1
    where name like '배수지10002';
    -- 인덱스 IDX_TBL_STUDENT_1_NAME 을 사용하여 조회해온다.
    
    select * 
    from tbl_student_1
    where name like '배수지%';
    -- 인덱스 IDX_TBL_STUDENT_1_NAME 을 사용하여 조회해온다.
    
    select * 
    from tbl_student_1
    where name like '%배수지%';
    -- 맨앞에 % 또는 _ 가 나오면 인덱스 IDX_TBL_STUDENT_1_NAME 을 사용하지 않고 Table Full Scan 하여 조회해온다. 
    
    
    
    
    
    
    --- **** 어떤 테이블의 어떤 컬럼에 Primary Key 제약 또는 Unique 제약을 주면
    --       자동적으로 그 컬럼에는 unique 한 index가 생성되어진다.
    --       인덱스명은 제약조건명이 된다. **** 
    
    create table tbl_student_2
    (hakbun      varchar2(10) 
    ,name        varchar2(20)
    ,email       varchar2(20) not null
    ,address     varchar2(20)
    ,constraint PK_tbl_student_2_hakbun primary key(hakbun)
    ,constraint UQ_tbl_student_2_email unique(email)
    );
    -- Table TBL_STUDENT_2이(가) 생성되었습니다.
    
    select A.index_name, uniqueness, column_name, descend 
    from user_indexes A JOIN user_ind_columns B
    ON A.index_name = B.index_name
    where A.table_name = 'TBL_STUDENT_2';
    
    
    -- Primary Key 제약 또는 Unique 제약으로 생성되어진 index 의 제거는 
    -- drop index index명; 이 아니라
    -- alter table 테이블명 drop constraint 제약조건명; 이다.
    -- 제약조건을 삭제하면 자동적으로 index 도 삭제가 된다.
    
    drop index PK_TBL_STUDENT_2_HAKBUN;
    /*
       오류 보고 -
       ORA-02429: 고유/기본 키 적용을 위한 인덱스를 삭제할 수 없습니다.
    */
    
    drop index UQ_TBL_STUDENT_2_EMAIL;
    /*
       오류 보고 -
       ORA-02429: 고유/기본 키 적용을 위한 인덱스를 삭제할 수 없습니다.
    */
   
    alter table tbl_student_2
    drop primary key;       -- 제약조건을 없애는 것
    -- Table TBL_STUDENT_2이(가) 변경되었습니다.
    
    alter table tbl_student_2
    drop constraint UQ_tbl_student_2_email;
    -- Table TBL_STUDENT_2이(가) 변경되었습니다.
    
    
    select A.constraint_name, A.constraint_type, A.search_condition, 
           B.column_name, B.position 
    from user_constraints A join user_cons_columns B 
    on A.constraint_name = B.constraint_name
    where A.table_name = 'TBL_STUDENT_2';
    
    
    select A.index_name, uniqueness, column_name, descend 
    from user_indexes A JOIN user_ind_columns B
    ON A.index_name = B.index_name
    where A.table_name = 'TBL_STUDENT_2';
    
    
    
    
    
    ------ ====== **** 데이터사전(Data Dictionary) **** ====== -------
    
    ---- **** ORACLE DATA DICTIONARY VIEW(오라클 데이터 사전 뷰) **** ---- 
    show user;
    -- USER이(가) "SYS"입니다.
    
    -- 먼저 index 공부를 할때 trace(자동추적) 때문에 아래와 같이 HR에게 부여했던 SELECT ANY DICTIONARY 권한을 회수하겠습니다. 
    revoke SELECT ANY DICTIONARY from HR;
    -- Revoke을(를) 성공했습니다.
    
    revoke SELECT_CATALOG_ROLE from HR;
    -- Revoke을(를) 성공했습니다.
    
    
    show user;
    -- USER이(가) "HR"입니다.
    
    select * 
    from dictionary;
    -- 또는
    select * 
    from dict;
    /*
        USER_CONS_COLUMNS
        ALL_CONS_COLUMNS
    */
    
    --- ===== SYS 로 접속한 것 시작 ===== ---
    show user;
    -- USER이(가) "SYS"입니다.
    
    select * 
    from dictionary;
    -- 또는
    select * 
    from dict;
    /*
        USER_CONS_COLUMNS
        ALL_CONS_COLUMNS
        DBA_CONS_COLUMNS
    */
    
    /*
     DBA_로 시작하는 것 
     ==> 관리자만 조회가능한 것으로 모든오라클사용자정보, 모든테이블, 모든인덱스, 모든데이터베이스링크 등등등 의 정보가 다 들어있는 것.
     
     USER_로 시작하는 것 
     ==> 오라클서버에 접속한 사용자 소유의 자신의오라클사용자정보, 자신이만든테이블, 자신이만든인덱스, 자신이만든데이터베이스링크 등등등 의 정보가 다 들어있는 것.
     
     ALL_로 시작하는 것 
     ==> 오라클서버에 접속한 사용자 소유의 즉, 자신의오라클사용자정보, 자신이만든테이블, 자신이만든인덱스, 자신이만든데이터베이스링크 등등등 의 정보가 다 들어있는 것
         과(와)
         자신의 것은 아니지만 조회가 가능한 다른사용자의오라클사용자정보, 다른사용자소유의테이블, 다른사용자소유의인덱스, 다른사용자소유의데이터베이스링크 등등등 의 정보가 다 들어있는 것. 
    */
    
    select *
    from dba_tables
    where owner in('HR', 'ORAUSER1');
    --- ===== SYS 로 접속한 것 끝 ===== ---
    
    
    --- ===== HR 로 접속한 것 시작 ===== ---
    show user;
    -- USER이(가) "HR"입니다.
    
    select *
    from dba_tables;
    -- ORA-00942: 테이블 또는 뷰가 존재하지 않습니다   => 사실상 권한이 없어서 조회불가이다.
    
    select *
    from user_tables;
    
    select *
    from all_tables;
    
    select *
    from all_tables
    where owner = 'ORAUSER1';   -- 권한을 받았기때문에 접근이 가능하다.
    
    select *
    from ORAUSER1.TBL_SAWON;
    
    -- *** 자신이 만든 테이블에 대한 모든 정보를 조회하고 싶다. 어디서 보면 될까요? *** --
    select *
    from dict
    where table_name like 'USER_%' and lower(comments) like '%table%';
    
    select *
    from USER_TABLES;
    
    -- *** USER_TABLES 에서 보여지는 컬럼에 대한 설명을 보고 싶으면 아래와 같이 하면 됩니다. *** -- 
    select *
    from dict_columns
    where table_name = 'USER_TABLES';
    
    -- *** 자신이 만든 테이블의 컬럼에 대한 모든 정보를 조회하고 싶다. 어디서 보면 될까요? *** --
    select *
    from dict_columns
    where table_name like 'USER_%' and lower(comments) like '%column%';
    
    select *
    from USER_TAB_COLUMNS
    where table_name = 'EMPLOYEES';
    
    -- *** USER_TAB_COLUMNS 에서 보여지는 컬럼에 대한 설명을 보고 싶으면 아래와 같이 하면 됩니다. *** --
    select *
    from dict_columns
    where table_name = 'USER_TAB_COLUMNS';
    
    -- *** 자신이 만든 테이블의 제약조건에 대한 모든 정보를 조회하고 싶다. 어디서 보면 될까요? *** --
    select *
    from dict
    where table_name like 'USER_%' and lower(comments) like '%constraint%';
    
    select *
    from USER_CONSTRAINTS
    where table_name = 'EMPLOYEES';
    
    select *
    from USER_CONS_COLUMNS
    where table_name = 'EMPLOYEES';
    
    -- *** 자신이 만든 데이터베이스 링크에 대한 모든 정보를 조회하고 싶다. 어디서 보면 될까요? *** --
    select *
    from dict
    where table_name like 'USER_%' and lower(comments) like '%database link%';
    
    select *
    from USER_DB_LINKS;
    
    -- *** 자신이 만든 시퀀스에 대한 모든 정보를 조회하고 싶다. 어디서 보면 될까요? *** --
    select *
    from dict
    where table_name like 'USER_%' and lower(comments) like '%sequence%';
    
    select *
    from USER_SEQUENCES;
    
    -- *** 자신이 만든 인덱스에 대한 모든 정보를 조회하고 싶다. 어디서 보면 될까요? *** --
    select *
    from dict
    where table_name like 'USER_%' and lower(comments) like '%index%';
    
    select *
    from USER_INDEXES
    where table_name = 'EMPLOYEES';
    
    select *
    from USER_IND_COLUMNS
    where table_name = 'EMPLOYEES';
    
    --- ===== HR 로 접속한 것 끝 ===== ---
    
    
    
    
    
    
    -------------------------------------------------------------------------------------------------------------
        --- **** PL/SQL(Procedure Language / Structured Query Language) **** ---
    
    -- *** PL/SQL 구문에서 변수의 사용법 첫번째 *** --
    exec pcd_empInfo(101);    -- pcd : procedure 약어
    /*
        <결과물>
        ------------------------------------
        사원번호    사원명     성별      월급
        ------------------------------------
          101       ..       ..        ..
    */
    exec pcd_empInfo(102);    -- pcd : procedure 약어
    /*
        <결과물>
        ------------------------------------
        사원번호    사원명     성별      월급
        ------------------------------------
          102       ..       ..        ..
    */
    
    create or replace procedure pcd_empInfo
    (p_employee_id in number)               -- p_ 파라미터 라는 뜻 컬럼명 X, 매개변수명 // in 은 입력모드를 말한다. number(5)와 같이 자리수를 넣어주면 오류이다.
    is
        -- 변수의 선언부
        v_employee_id number(5);    -- 자리수를 사용한다.
        v_ename       varchar2(50); -- 자리수를 사용한다.
        v_gender      varchar2(10); -- 자리수를 사용한다.
        v_monthsal    varchar2(15); -- 자리수를 사용한다.
    begin
        -- 명령어를 실행해주는 실행부
        select employee_id, first_name || ' ' || last_name,
            case when substr(jubun, 7, 1) in('1','3') then '남' else '여' end,
            to_char( nvl(salary + (salary * commission_pct), salary), '9,999,999')
            INTO 
            v_employee_id, v_ename, v_gender, v_monthsal 
         from employees
         where employee_id = p_employee_id;
    
        dbms_output.put_line( lpad('-',40,'-') );
        dbms_output.put_line( '사원번호    사원명   성별   월급' );
        dbms_output.put_line( lpad('-',40,'-') );
        dbms_output.put_line(v_employee_id || ' '
                            || v_ename || ' '
                            || v_gender || ' '
                            || v_monthsal);
    end pcd_empInfo;
    -- Procedure PCD_EMPINFO이(가) 컴파일되었습니다.
    
    /* === SQL Developer 의 메뉴의 보기를 클릭하여 DBMS 출력을 클릭해주어야 한다. ===
      === 이어서 하단부에 나오는 DBMS 출력 부분의 녹색 + 기호를 클릭하여 local_hr 로 연결을 해준다. === 
    */
    exec pcd_empInfo(101);  -- 블록잡고 실행하기!
    -- PL/SQL 프로시저가 성공적으로 완료되었습니다.
    /*
        ----------------------------------------
        사원번호    사원명   성별   월급
        ----------------------------------------
        101 Neena Kochhar 남     17,000
    */
    exec pcd_empInfo(102);
    -- PL/SQL 프로시저가 성공적으로 완료되었습니다.
    /*
        ----------------------------------------
        사원번호    사원명   성별   월급
        ----------------------------------------
        102 Lex De Haan 여     17,000
    */
    
    
    
    --- *** 생성되어진 Procedure 인 pcd_empInfo 의 소스 알아보기 *** ---
    select *
    from user_source
    where type = 'PROCEDURE' and name = 'PCD_EMPINFO';    -- 대문자로 쓰기!!
    
    
    select employee_id, first_name || ' ' || last_name,
            case when substr(jubun, 7, 1) in('1','3') then '남' else '여' end,
            to_char( nvl(salary + (salary * commission_pct), salary), '9,999,999')
    from employees
    where employee_id = 101;    -- 이렇게 보는것보다 프로시저로 보는것이 실행속도가 더 빠르다.
    
    
    
    
    
    
    
    
    -- *** PL/SQL 구문에서 변수의 사용법 두번째 *** --
    desc employees;
    -- EMPLOYEE_ID    NOT NULL NUMBER(6)
    
    create or replace procedure pcd_empInfo
    (p_employee_id in employees.employee_id%type)   -- p_employee_id 매개변수의 데이터타입은 employees.employee_id%type 이다.
    -- employees.employee_id%type 는 employees 테이블의 employee_id 컬럼의 데이터타입을 그대로 사용하겠다는 말이다.
    is
        v_employee_id employees.employee_id%type;    
        v_ename       varchar2(50); 
        v_gender      varchar2(10); 
        v_monthsal    varchar2(15);
    begin
        select employee_id, first_name || ' ' || last_name,
            case when substr(jubun, 7, 1) in('1','3') then '남' else '여' end,
            to_char( nvl(salary + (salary * commission_pct), salary), '9,999,999')
            INTO 
            v_employee_id, v_ename, v_gender, v_monthsal 
         from employees
         where employee_id = p_employee_id;
    
        dbms_output.put_line( lpad('-',40,'-') );
        dbms_output.put_line( '사원번호    사원명   성별   월급' );
        dbms_output.put_line( lpad('-',40,'-') );
        dbms_output.put_line(v_employee_id || ' '
                            || v_ename || ' '
                            || v_gender || ' '
                            || v_monthsal);
    end pcd_empInfo;
    -- Procedure PCD_EMPINFO이(가) 컴파일되었습니다.
    
    exec pcd_empInfo(101);  -- 블록잡고 실행하기!
    -- PL/SQL 프로시저가 성공적으로 완료되었습니다.  ==> 결과는 동일
    
    
    
    
    
    
    
    -- *** PL/SQL 구문에서 변수의 사용법 세번째 *** --
    create or replace procedure pcd_empInfo
    (p_employee_id in employees.employee_id%type)   
    is
        --- record 타입 생성 ---
        type myEmpType is record
        (emp_id     employees.employee_id%type
        ,ename      varchar2(50)
        ,gender     varchar2(10)
        ,monthsal   varchar2(15)
        ,age        number(3)
        );
        
        -- 변수 생성 --
        v_rcd myEmpType;
           
    begin
        select employee_id, first_name || ' ' || last_name
            , case when substr(jubun, 7, 1) in('1','3') then '남' else '여' end
            , to_char( nvl(salary + (salary * commission_pct), salary), '9,999,999')
            , case when to_date(to_char(sysdate, 'yyyy') || substr(jubun, 3, 4), 'yyyymmdd') - to_date(to_char(sysdate,'yyyymmdd'), 'yyyymmdd') > 0 
                  then extract(year from sysdate) - ( to_number(substr(jubun,1,2)) + case when substr(jubun,7,1) in('1','2') then 1900 else 2000 end ) - 1
                  else extract(year from sysdate) - ( to_number(substr(jubun,1,2)) + case when substr(jubun,7,1) in('1','2') then 1900 else 2000 end )
             end
            INTO 
            v_rcd
         from employees
         where employee_id = p_employee_id;
    
        dbms_output.put_line( lpad('-',40,'-') );
        dbms_output.put_line( '사원번호    사원명   성별   월급    나이' );
        dbms_output.put_line( lpad('-',40,'-') );
        dbms_output.put_line(v_rcd.emp_id || ' '
                            || v_rcd.ename || ' '
                            || v_rcd.gender || ' '
                            || v_rcd.monthsal || ' '
                            || v_rcd.age);
    end pcd_empInfo;
    -- Procedure PCD_EMPINFO이(가) 컴파일되었습니다.
    
    exec pcd_empInfo(101);  -- 블록잡고 실행하기!
    -- PL/SQL 프로시저가 성공적으로 완료되었습니다.
    /*
        ----------------------------------------
        사원번호    사원명   성별   월급    나이
        ----------------------------------------
        101 Neena Kochhar 남     17,000 38
    */
    
    exec pcd_empInfo(102);  -- 블록잡고 실행하기!
    -- PL/SQL 프로시저가 성공적으로 완료되었습니다.
    /*
        ----------------------------------------
        사원번호    사원명   성별   월급    나이
        ----------------------------------------
        102 Lex De Haan 여     17,000 58
    */
    
    
    
    
    
    
    -- *** PL/SQL 구문에서 변수의 사용법 네번째 *** --
    create or replace procedure pcd_empInfo
    (p_employee_id in employees.employee_id%type)   
    is
        v_all   employees%rowtype;
        -- v_all 변수의 타입은 employees 테이블의 모든 컬럼을 받아주는 행타입이다.           
        
        -- 변수 생성
        v_result    varchar2(1000);
    begin
        select * INTO v_all
         from employees
         where employee_id = p_employee_id;
    
        v_result := v_all.employee_id || ' '
                || v_all.first_name || ' ' || v_all.last_name || ' '
                || case when substr(v_all.jubun, 7, 1) in('1','3') then '남' else '여' end || ' '
                || to_char( nvl(v_all.salary + (v_all.salary * v_all.commission_pct), v_all.salary), '9,999,999') || ' '
                || case when to_date(to_char(sysdate, 'yyyy') || substr(v_all.jubun, 3, 4), 'yyyymmdd') - to_date(to_char(sysdate,'yyyymmdd'), 'yyyymmdd') > 0 
                        then extract(year from sysdate) - ( to_number(substr(v_all.jubun,1,2)) + case when substr(v_all.jubun,7,1) in('1','2') then 1900 else 2000 end ) - 1 
                        else extract(year from sysdate) - ( to_number(substr(v_all.jubun,1,2)) + case when substr(v_all.jubun,7,1) in('1','2') then 1900 else 2000 end ) 
                        end || ' '
                || nvl(to_char(v_all.department_id), '부서없음');
    
        dbms_output.put_line( lpad('-',50,'-') );
        dbms_output.put_line( '사원번호    사원명   성별   월급    나이  부서번호' );
        dbms_output.put_line( lpad('-',50,'-') );
        dbms_output.put_line(v_result);
    end pcd_empInfo;
    -- Procedure PCD_EMPINFO이(가) 컴파일되었습니다.
    
    exec pcd_empInfo(101);  -- 블록잡고 실행하기!
    -- PL/SQL 프로시저가 성공적으로 완료되었습니다.
    /*
        --------------------------------------------------
        사원번호    사원명   성별   월급    나이  부서번호
        --------------------------------------------------
        101 Neena Kochhar 남     17,000 38 90
    */
    
    exec pcd_empInfo(178);  -- 블록잡고 실행하기!   => 부서없는 Kimberely Grant
    -- PL/SQL 프로시저가 성공적으로 완료되었습니다.
    /*
        --------------------------------------------------
        사원번호    사원명   성별   월급    나이  부서번호
        --------------------------------------------------
        178 Kimberely Grant 여      8,050 25 부서없음
    */
    
    
    -- 프로시저 소스 보기
    select *
    from user_source
    where type = 'PROCEDURE' and name = 'PCD_EMPINFO';    -- 대문자로 쓰기!!
    
    
    
    
    
    
    ----------------------------------------------------------------------------------------------------
                            ----- ***** 사용자 정의 함수 (Function) **** -----
    ----------------------------------------------------------------------------------------------------
    
    ----  주민번호를 입력받아서 성별을 알려주는 함수 func_gender(주민번호)을 생성해보겠습니다. ----
   /*
      [문법]
      create or replace function 함수명 
      (파라미터변수명  IN  파라미터변수의타입)
      return 리턴되어질타입
      is
         변수선언;
      begin
         실행문;
         return 리턴되어질값;
      end 함수명;
   */ 
   
    create or replace function func_gender
    (p_jubun in varchar2)   -- varchar2(13) 와 같이 자리수를 쓰면 오류이다.!!!
    return varchar2         -- varchar2(6) 와 같이 자리수를 쓰면 오류이다.!!!
    is
        v_result    varchar2(6);
    begin
        select case when substr(p_jubun,7,1) in('1','3') then '남' else '여' end
            INTO
            v_result
        from dual;
        return v_result;
    end func_gender;
    
    select func_gender('9010201234567')
        , func_gender('9010202234567')
        , func_gender('0110203234567')
        , func_gender('0110204234567')
    from dual;
    
    select employee_id as 사원번호
        , first_name || ' ' || last_name as 사원명
        , jubun as 주민번호
        , func_gender(jubun) as 성별
    from employees
    order by 1;
    
    select *
    from employees
    where func_gender(jubun) = '여';
    
    
    
    create or replace function func_gender_2
    (p_jubun in varchar2)   -- varchar2(13) 와 같이 자리수를 쓰면 오류이다.!!!
    return varchar2         -- varchar2(6) 와 같이 자리수를 쓰면 오류이다.!!!
    is
        v_result    varchar2(6);
    begin
        v_result := case when substr(p_jubun,7,1) in('1','3') then '남' else '여' end;
        return v_result;
    end func_gender_2;
    
    select func_gender('9010201234567')
        , func_gender('9010202234567')
        , func_gender('0110203234567')
        , func_gender('0110204234567')
    from dual;
    
    select employee_id as 사원번호
        , first_name || ' ' || last_name as 사원명
        , jubun as 주민번호
        , func_gender(jubun) as 성별1
        , func_gender_2(jubun) as 성별2
    from employees
    order by 1;
    
    select *
    from employees
    where func_gender_2(jubun) = '남';
    
    
    
    
    ----  주민번호를 입력받아서 나이를 알려주는 함수 func_age(주민번호)을 생성해보세요. ----
    create or replace function func_age
    (p_jubun in varchar2)   -- varchar2(13) 와 같이 자리수를 쓰면 오류이다.!!!
    return number         -- 타입이 달라도 가능하다. number(6) 와 같이 자리수를 쓰면 오류이다.!!!
    is
        v_age    varchar2(6);
    begin
        select case when to_date(to_char(sysdate, 'yyyy') || substr(p_jubun, 3, 4), 'yyyymmdd') - to_date(to_char(sysdate,'yyyymmdd'), 'yyyymmdd') > 0 
                        then extract(year from sysdate) - ( to_number(substr(p_jubun,1,2)) + case when substr(p_jubun,7,1) in('1','2') then 1900 else 2000 end ) - 1 
                        else extract(year from sysdate) - ( to_number(substr(p_jubun,1,2)) + case when substr(p_jubun,7,1) in('1','2') then 1900 else 2000 end ) 
                        end
        INTO
            v_age
        from dual;
        return v_age;
    end func_age;
    -- Function FUNC_AGE이(가) 컴파일되었습니다.
    
    create or replace function func_age_2
    (p_jubun in varchar2)   -- varchar2(13) 와 같이 자리수를 쓰면 오류이다.!!!
    return varchar2         -- varchar2(6) 와 같이 자리수를 쓰면 오류이다.!!!
    is
        v_age    varchar2(6);
    begin
        v_age :=  case when to_date(to_char(sysdate, 'yyyy') || substr(p_jubun, 3, 4), 'yyyymmdd') - to_date(to_char(sysdate,'yyyymmdd'), 'yyyymmdd') > 0 
                        then extract(year from sysdate) - ( to_number(substr(p_jubun,1,2)) + case when substr(p_jubun,7,1) in('1','2') then 1900 else 2000 end ) - 1 
                        else extract(year from sysdate) - ( to_number(substr(p_jubun,1,2)) + case when substr(p_jubun,7,1) in('1','2') then 1900 else 2000 end ) 
                        end;
        return v_age;
    end func_age_2;
    -- Function FUNC_AGE_2이(가) 컴파일되었습니다.
    
    select employee_id as 사원번호
        , first_name || ' ' || last_name as 사원명
        , jubun as 주민번호
        , func_gender(jubun) as 성별1
        , func_gender_2(jubun) as 성별2
        , func_age(jubun) as 나이1
        , func_age_2(jubun) as 나이2
    from employees
    order by 1;
    
    
    -- employees 테이블에서 나이가 20대 여자와 40대인 남자 사원들만 
    -- 사원번호, 사원명, 주민번호, 성별, 나이를 나타내세요.
    select employee_id as 사원번호
        , first_name || ' ' || last_name as 사원명
        , jubun as 주민번호
        , func_gender(jubun) as 성별1
        , func_gender_2(jubun) as 성별2
        , func_age(jubun) as 나이1
        , func_age_2(jubun) as 나이2
    from employees
    where (trunc(func_age(jubun),-1) = 20 and func_gender(jubun) = '여')
        or  (trunc(func_age_2(jubun),-1) = 40 and func_gender_2(jubun) = '남')   -- and 가 먼저 처리되기 때문에 () 해주기!!
    order by 성별1,나이1;






 ----- *** 정년퇴직일을 구해주는 함수 만들기 *** -----
    /*
    여기서 정년퇴직일이라 함은
        해당 사원의 생월이 3월에서 8월에 태어난 사람은
        해당사원의 나이가 63세가 되는 년도의 8월말일(8월 31일)로 하고,
        해당사원의 생월이 9월에서 2월에 태어난 사람은
        해당사원의 나이가 63세가 되는 년도의 2월말일(2월 28일 또는 2월 29일)로 한다.
    */

    create or replace function func_retirement_day
    (p_jubun  IN  varchar2)
    return date
      is
         v_retirement_day date; -- 변수명
      begin
        select last_day(to_date(to_char(add_months(sysdate,(63-func_age(p_jubun))*12),'yyyy')
            -- 만 63세가 되어지는 오늘날 : add_months(sysdate,(63-현재나이)*12)
            || case when substr(p_jubun,3,2) between '03' and '08' then '0801' else '0201' end,'yyyy-mm-dd'))
            into v_retirement_day
        from dual;
         return v_retirement_day;
      end func_retirement_day;
    -- Function FUNC_RETIREMENT_DAY이(가) 컴파일되었습니다.

    SELECT employee_id as 사원번호
        , first_name || '' || last_name as 사원명
        , jubun as 주민번호
        , func_gender(jubun) as 성별
        , func_age(jubun) as 만나이
        ,  to_char(nvl(salary + (salary*commission_pct),salary), '99,999') AS 월급
        , to_char(hire_date,'yyyy-mm-dd') as 입사일자
        , to_char(func_retirement_day(jubun),'yyyy-mm-dd') as 정년퇴직일
        , trunc(months_between(func_retirement_day(jubun), hire_date),0) || '개월' as 정년까지근무개월수  -- 정년까지근무개월수
        , to_char(trunc(nvl(salary + (salary*commission_pct),salary)
                    * months_between(func_retirement_day(jubun), hire_date)/ 12, 0),'9,999,999')  as 퇴직금           -- 퇴직금
    FROM employees;



    ---- *** 생성되어진 함수의 소스를 조회해봅니다. *** ----
    select *
    from user_source
    where type = 'FUNCTION' and name = 'FUNC_AGE';
    /*
    "function func_age
"
"    (p_jubun in varchar2)   -- varchar2(13) 와 같이 자리수를 쓰면 오류이다.!!!
"
"    return number         -- 타입이 달라도 가능하다. number(6) 와 같이 자리수를 쓰면 오류이다.!!!
"
"    is
"
"        v_age    varchar2(6);
"
"    begin
"
"        select case when to_date(to_char(sysdate, 'yyyy') || substr(p_jubun, 3, 4), 'yyyymmdd') - to_date(to_char(sysdate,'yyyymmdd'), 'yyyymmdd') > 0
"
"                        then extract(year from sysdate) - ( to_number(substr(p_jubun,1,2)) + case when substr(p_jubun,7,1) in('1','2') then 1900 else 2000 end ) - 1
"
"                        else extract(year from sysdate) - ( to_number(substr(p_jubun,1,2)) + case when substr(p_jubun,7,1) in('1','2') then 1900 else 2000 end )
"
"                        end
"
"        INTO
"
"            v_age
"
"        from dual;
"
    */






    ---- [퀴즈] 아래와 같은 결과물이 나오도록 프로시저( pcd_employees_info )를 생성하세요...
    ----       성별과 나이는 위에서 만든 함수를 사용하세요..

    execute pcd_employees_info(101);  -- 여기서 숫자 101은 사원번호이다.
    exec    pcd_employees_info(101);  -- 여기서 숫자 101은 사원번호이다.
    /*
      ------------------------------------------------------------
       사원번호    부서명    부서장명   사원명    입사일자   성별   나이
      ------------------------------------------------------------
        101       .....    ......   .......   ....     ...   ...
   */

    -- 내방법 --
    create or replace procedure pcd_employees_info
      (p_employee_id  IN  number)
      is
        -- v_result varchar2(1000);
        v_employee_id   employees.employee_id%type;
        v_deptname      departments.department_name%type;
        v_mgrname       varchar2(30);
        v_empname       varchar2(30);
        v_hire_date     varchar2(10);
        v_gender        varchar2(6);
        v_age           number(3);
      begin
        WITH
        M AS
        (
            select employee_id
                , first_name || ' ' || last_name as manager_name
            from employees
        )
        ,
        E AS
        (
             select employee_id, department_id
            , first_name || '' || last_name as fullname
            , hire_date
            , func_gender(jubun) as gender
            , func_age(jubun) as age
            , manager_id
            from employees
        )
        SELECT E.employee_id
            , department_id
            , M.manager_name
            , fullname
            , hire_date
            , gender
            , age
            INTO
            v_employee_id, v_deptname, v_mgrname, v_empname, v_hire_date, v_gender, v_age
        FROM E LEFT JOIN M
        ON E.manager_id = M.employee_id
        WHERE E.employee_id = p_employee_id;

        dbms_output.put_line( lpad('-',60,'-') );
        dbms_output.put_line( '사원번호    부서명    부서장명   사원명    입사일자   성별   나이' );
        dbms_output.put_line( lpad('-',60,'-') );

        dbms_output.put_line( v_employee_id || ' ' ||
                            v_deptname || ' ' ||
                            v_mgrname || ' ' ||
                            v_empname || ' ' ||
                            v_hire_date || ' ' ||
                            v_gender || ' ' ||
                            v_age );
      end pcd_employees_info;
    -- Procedure PCD_EMPLOYEES_INFO이(가) 컴파일되었습니다.

    exec pcd_employees_info(101);


    -- 강사님
    /*
       사원번호       부서명                         부서장명                     사원명    입사일자   성별   나이       부서번호
      --------     -------                      ---------                -----------------------------  -------
       employees   departments                  employees                          employees            employees
                   department_id(P.K)           employee_id(사원번호 P.K)                                  department_id(F.K)
                   manager_id(부서장사원번호 F.K)
   */

   WITH V as
   (
     select D.department_name
          , E.first_name || ' ' || E.last_name AS MGR_NAME
          , D.department_id
     from departments D JOIN employees E
     ON D.manager_id = E.employee_id
   )
   select EMP.employee_id AS 사원번호
        , nvl(V.department_name, ' ') AS 부서명
        , nvl(V.mgr_name, ' ') AS 부서장명
        , EMP.first_name || ' ' || EMP.last_name AS 사원명
        , EMP.hire_date AS 입사일자
        , func_gender(EMP.jubun) AS 성별
        , func_age(EMP.jubun) AS 나이
   from V RIGHT JOIN employees EMP
   ON V.department_id = EMP.department_id
   WHERE EMP.employee_id = 178;


   create or replace procedure pcd_employees_info
   (p_employee_id  in  employees.employee_id%type)
   is
      v_employee_id   employees.employee_id%type;
      v_deptname      departments.department_name%type;
      v_mgrname       varchar2(30);
      v_empname       varchar2(30);
      v_hire_date     varchar2(10);
      v_gender        varchar2(6);
      v_age           number(3);
   begin
       WITH V as
       (
         select D.department_name
            , E.first_name || ' ' || E.last_name AS MGR_NAME
            , D.department_id
         from departments D JOIN employees E
         ON D.manager_id = E.employee_id
       )
       select EMP.employee_id
            , nvl(V.department_name, ' ')
            , nvl(V.mgr_name, ' ')
            , EMP.first_name || ' ' || EMP.last_name
            , to_char(EMP.hire_date, 'yyyy-mm-dd')
            , func_gender(EMP.jubun)
            , func_age(EMP.jubun)
        INTO
            v_employee_id, v_deptname, v_mgrname, v_empname, v_hire_date, v_gender, v_age
       from V RIGHT JOIN employees EMP
       ON V.department_id = EMP.department_id
       WHERE EMP.employee_id = p_employee_id;

       dbms_output.put_line( lpad('-',60,'-') );
       dbms_output.put_line( '사원번호    부서명    부서장명   사원명    입사일자   성별   나이' );
       dbms_output.put_line( lpad('-',60,'-') );

       dbms_output.put_line( v_employee_id || ' ' ||
                             v_deptname || ' ' ||
                             v_mgrname || ' ' ||
                             v_empname || ' ' ||
                             v_hire_date || ' ' ||
                             v_gender || ' ' ||
                             v_age );
   end pcd_employees_info;
 -- Procedure PCD_EMPLOYEES_INFO이(가) 컴파일되었습니다.




   exec pcd_employees_info(101);
   -- PL/SQL 프로시저가 성공적으로 완료되었습니다.
/*
    ------------------------------------------------------------
    사원번호    부서명    부서장명   사원명    입사일자   성별   나이
    ------------------------------------------------------------
    101 Executive Steven King Neena Kochhar 2005-09-21 남 37
*/

   exec pcd_employees_info(178);
   -- PL/SQL 프로시저가 성공적으로 완료되었습니다.
/*
    ------------------------------------------------------------
    사원번호    부서명    부서장명   사원명    입사일자   성별   나이
    ------------------------------------------------------------
    178                          Kimberely Grant 2007-05-24 여 24
*/

    exec pcd_employees_info(337);
    /*
    오류 보고 -
    ORA-01403: 데이터를 찾을 수 없습니다.  ===> 프로시저에서 데이터(행)가 없으면 no data found 라는 오류가 발생한다.!!!!!!
    */




    ---- *** [데이터(행)가 없을 경우 해결책] *** ----
    --> 예외절(Exception) 처리
    create or replace procedure pcd_employees_info
   (p_employee_id  in  employees.employee_id%type)
   is
      v_employee_id   employees.employee_id%type;
      v_deptname      departments.department_name%type;
      v_mgrname       varchar2(30);
      v_empname       varchar2(30);
      v_hire_date     varchar2(10);
      v_gender        varchar2(6);
      v_age           number(3);
   begin
       WITH V as
       (
         select D.department_name
            , E.first_name || ' ' || E.last_name AS MGR_NAME
            , D.department_id
         from departments D JOIN employees E
         ON D.manager_id = E.employee_id
       )
       select EMP.employee_id
            , nvl(V.department_name, ' ')
            , nvl(V.mgr_name, ' ')
            , EMP.first_name || ' ' || EMP.last_name
            , to_char(EMP.hire_date, 'yyyy-mm-dd')
            , func_gender(EMP.jubun)
            , func_age(EMP.jubun)
        INTO
            v_employee_id, v_deptname, v_mgrname, v_empname, v_hire_date, v_gender, v_age
       from V RIGHT JOIN employees EMP
       ON V.department_id = EMP.department_id
       WHERE EMP.employee_id = p_employee_id;

       dbms_output.put_line( lpad('-',60,'-') );
       dbms_output.put_line( '사원번호    부서명    부서장명   사원명    입사일자   성별   나이' );
       dbms_output.put_line( lpad('-',60,'-') );

       dbms_output.put_line( v_employee_id || ' ' ||
                             v_deptname || ' ' ||
                             v_mgrname || ' ' ||
                             v_empname || ' ' ||
                             v_hire_date || ' ' ||
                             v_gender || ' ' ||
                             v_age );
        Exception
            WHEN no_data_found THEN -- no_data_found 은 오라클에서 데이터가 존재하지 않을 경우 발생하는 오류이다.
                dbms_output.put_line('>>> 사원번호 ' || p_employee_id || '은 존재하지 않습니다. <<<');
   end pcd_employees_info;
 -- Procedure PCD_EMPLOYEES_INFO이(가) 컴파일되었습니다.

    exec pcd_employees_info(101);
    -- 101 Executive Steven King Neena Kochhar 2005-09-21 남 38

    exec pcd_employees_info(337);
    -- >>> 사원번호 337은 존재하지 않습니다. <<<










       ---------- ====== *** 제어문(IF 문) *** ======= -----------
/*
   ※ 형식

   if     조건1  then  실행문장1;
   elsif  조건2  then  실행문장2;
   elsif  조건3  then  실행문장3;
   else               실행문장4;
   end if;

*/

    --- 오류를 발생시켜 보겠습니다.
    delete from departments;
    /*
    오류 보고 -
    ORA-02292: 무결성 제약조건(HR.EMP_DEPT_FK)이 위배되었습니다- 자식 레코드가 발견되었습니다
    */
    update employees set employee_id = 101
    where employee_id = 102;
    /*
    오류 보고 -
    ORA-00001: 무결성 제약 조건(HR.EMP_EMP_ID_PK)에 위배됩니다
    */

    ----- 주민번호를 입력받아서 만나이를 알려주는 함수 func_age_3(주민번호)을 생성하세요. ----
    create or replace function func_age_3
    (p_jubun IN varchar2)
    return number
    IS
        error_jubun  exception; -- error_jubun은 개발자가 정의하는 exception(예외절)임을 선언한다는 뜻이다.
        v_gender_num varchar2(1) := substr(p_jubun,7,1); -- := 초기값을 넣어주는 것
                                                         -- v_gender_num 에는 입력받은 p_jubun 에서 7번째 부터 1개 글자만 넣어준다.
                                                         -- 즉, v_gender_num 에는 '1' 또는 '2' 또는 '3' 또는 '4' 가 들어올 것이다.
        v_year       number(4);
        v_age        number(3);
    BEGIN
        if length(p_jubun) != 13 then raise error_jubun;
        end if;

        if    v_gender_num in ('1','2') then v_year := 1900;
        elsif v_gender_num in ('3','4') then v_year := 2000;
        else raise error_jubun;
        end if;

        if to_date(to_char(sysdate,'yyyy')||substr(p_jubun,3,4),'yyyymmdd') - to_date(to_char(sysdate,'yyyymmdd'),'yyyymmdd') > 0
             then v_age := extract(year from sysdate) - (v_year + to_number(substr(p_jubun,1,2))) - 1;
        else v_age := extract(year from sysdate) - (v_year + to_number(substr(p_jubun,1,2)));
        end if;

        return v_age;

        EXCEPTION
        WHEN error_jubun
        then raise_application_error(-20001, '잘못된 주민등록 번호입니다.'); -- raise_application_error() 는 dbms가 아닌 스크립트 출력창에 오류를 띄워준다.
                              --     -20001 은 오류번호로써, 사용자가 정의해주는 EXCEPTION 에 대해서는 오류번호를 -20001 부터 -20999 까지만 가능하다. 그 이외의 오류번호는 사용할 수 없다.
    END func_age_3;
    -- Function FUNC_AGE_3이(가) 컴파일되었습니다.


    select func_age_3('901020123')
    from dual;
    /*
    ORA-20001: >> 올바르지 않은 주민번호 입니다. <<
    ORA-06512: "HR.FUNC_AGE_3",  29행
    */
    select func_age_3('12345678901234')
    from dual;
    /*
    ORA-20001: >> 올바르지 않은 주민번호 입니다. <<
    ORA-06512: "HR.FUNC_AGE_3",  29행
    */
    select func_age_3('901207234567')
    from dual;
    /*
    ORA-20001: >> 올바르지 않은 주민번호 입니다. <<
    ORA-06512: "HR.FUNC_AGE_3",  29행
    */
    select func_age_3('9023201234567')
    from dual;
    /*
    ORA-01843: 지정한 월이 부적합합니다.
    ORA-06512: "HR.FUNC_AGE_3",  20행
    01843. 00000 -  "not a valid month"
    */
    select func_age_3('9001011234567'), func_age_3('9010201234567')
        , func_age_3('0001014234567'), func_age_3('0010204234567')
    from dual;

    select employee_id AS 사원번호
      , first_name || ' ' || last_name AS 사원명
      , jubun AS 주민번호
      , func_gender(jubun) AS 성별
      , func_age(jubun) AS 나이1
      , func_age_2(jubun) AS 나이2
      , func_age_3(jubun) AS 나이3
 from employees;






    ---------- ===== **** 반복문 **** ===== ----------
  /*
     반복문에는 종류가 3가지가 있다.

     1. 기본 LOOP 문
     2. FOR LOOP 문
     3. WHILE LOOP 문
  */

    ----- ====== ****  1. 기본 LOOP 문 **** ====== -----
  /*
      [문법]
      LOOP
          반복해야할 실행문장;
      EXIT WHEN 탈출조건;   -- 탈출조건이 참 이라면 LOOP 를 탈출한다.
      END LOOP;
  */
  create table tbl_looptest_1
  (bunho   number
  ,name    varchar2(50)
  );
  -- Table TBL_LOOPTEST_1이(가) 생성되었습니다.

  --- *** tbl_looptest_1 테이블에 행을 20000 개를 insert 해보겠습니다. *** ---
    create or replace procedure pcd_tbl_looptest_1_insert
    (p_name IN  tbl_looptest_1.name%type
    ,p_count IN number  -- p_count 에 20000 을 넣을 것이다.
    )
    is
        v_bunho tbl_looptest_1.bunho%type := 0;     -- 변수의 초기화!!(변수에 값을 처음부터 넣어주기)
    begin
        LOOP
            v_bunho := v_bunho + 1;
        EXIT WHEN v_bunho > p_count;   -- 20001 > 20000     탈출조건이 참 이라면 LOOP 를 탈출한다.
            insert into tbl_looptest_1(bunho, name) values(v_bunho, p_name || v_bunho);
        END LOOP;
    end pcd_tbl_looptest_1_insert;
    -- Procedure PCD_TBL_LOOPTEST_1_INSERT이(가) 컴파일되었습니다.

    exec pcd_tbl_looptest_1_insert('이순신',20000);
    -- PL/SQL 프로시저가 성공적으로 완료되었습니다.

    select *
    from tbl_looptest_1
    order by bunho asc;

    select count(*)
    from tbl_looptest_1;    -- 20000

    rollback;   -- commit/rollback 을 꼭 해야한다!!
    -- 롤백 완료.

    select *
    from tbl_looptest_1
    order by bunho asc;

    select count(*)
    from tbl_looptest_1;    -- 0

    exec pcd_tbl_looptest_1_insert('유관순',50000);
    -- PL/SQL 프로시저가 성공적으로 완료되었습니다.

    select *
    from tbl_looptest_1
    order by bunho asc;

    select count(*)
    from tbl_looptest_1;    -- 50000

    rollback;
    -- 롤백 완료.







    ---- **** 이름이 없는 프로시저(Anonymous Procedure)로 tbl_looptest_1 테이블에 행을 30000 개를 insert 해보겠습니다. **** ---
    declare
        v_bunho tbl_looptest_1.bunho%type := 0; -- 변수의 선언 및 초기화
        v_name  Nvarchar2(10) := '차은우';
    begin
        LOOP
            v_bunho := v_bunho + 1;
        EXIT WHEN v_bunho > 30000;   -- 탈출조건이 참 이라면 LOOP 를 탈출한다.
            insert into tbl_looptest_1(bunho, name) values(v_bunho, v_name || v_bunho);
        END LOOP;
    end;
    -- PL/SQL 프로시저가 성공적으로 완료되었습니다.

    select *
    from tbl_looptest_1
    order by bunho asc;

    select count(*)         -- 30000
    from tbl_looptest_1;

    rollback;
    -- 롤백 완료.








    ----- ====== ****  2. FOR LOOP 문 **** ====== -----
  /*
      [문법]

      for 변수  in  [reverse]  시작값..마지막값  loop
          반복해야할 실행문장;
      end loop;
  */

    ---- **** 이름이 없는 프로시저(Anonymous Procedure)로 tbl_looptest_1 테이블에 행을 40000 개를 insert 해보겠습니다. **** ---
    declare
        v_name  Nvarchar2(10) := '이혜리';  -- 변수의 선언 및 초기화
    begin
        for i  in  1..40000  loop   -- 변수 i에 맨처음에는 1 이 들어가고 매번 1씩 증가된 값이 i 에 들어가는데 40000 까지 i 에 들어간다.
          insert into tbl_looptest_1(bunho, name) values(i, v_name || i);
      end loop;
    end;
    -- PL/SQL 프로시저가 성공적으로 완료되었습니다.

    select *
    from tbl_looptest_1
    order by bunho asc;

    select count(*)         -- 40000
    from tbl_looptest_1;

    rollback;
    -- 롤백 완료.



    declare
        v_name  Nvarchar2(10) := '유나';  -- 변수의 선언 및 초기화
    begin
        for i  in  reverse 1..100  loop   -- 변수 i에 맨처음에는 100 이 들어가고 매번 1씩 감소된 값이 i 에 들어가는데 1 까지 i 에 들어간다.
          insert into tbl_looptest_1(bunho, name) values(i, v_name || i);
      end loop;
    end;
    -- PL/SQL 프로시저가 성공적으로 완료되었습니다.

    select *
    from tbl_looptest_1;

    select count(*)         -- 100
    from tbl_looptest_1;

    rollback;
    -- 롤백 완료.







    ----- ====== ****  3. WHILE LOOP 문 **** ====== -----
  /*
     [문법]
     WHILE  조건  LOOP
         반복해야할 실행문장;   -- 조건이 참이라면 실행함. 조건이 거짓이 되어지면 반복문을 빠져나간다.
     END LOOP;

     WHILE NOT 조건  LOOP
         반복해야할 실행문장;   -- 조건이 참이라면 반복문을 빠져나간다.
     END LOOP;
  */

  ---- **** 이름이 없는 프로시저(Anonymous Procedure)로 tbl_looptest_1 테이블에 행을 20000 개를 insert 해보겠습니다. **** ---
    declare
        v_cnt    number(5)   := 1;   -- 변수의 선언 및 초기화
        v_name  Nvarchar2(10) := '안중근';
    begin
    WHILE NOT (v_cnt > 20000) LOOP      -- not(탈출조건)  탈출조건이 참이라면 전체가 거짓이 되어지므로 반복문을 빠져나간다.
        insert into tbl_looptest_1(bunho,name) values(v_cnt, v_name || v_cnt);
        v_cnt := v_cnt + 1;
    END LOOP;
    end;
    -- PL/SQL 프로시저가 성공적으로 완료되었습니다.

    select *
    from tbl_looptest_1;

    select count(*)         -- 2000
    from tbl_looptest_1;

    rollback;
    -- 롤백 완료.






    -- 주민번호가 올바르지 못해도 나이가 나온다.
    select func_age_3('900101123456a'), func_age_3('90102012345b7')
        , func_age_3('0001014234c67'), func_age_3('001020423d567')
    from dual;
    -- 34	33	24	23

    ----- [LOOP] 주민번호를 입력받아서 만나이를 알려주는 함수 func_age_3(주민번호)을 생성하세요. ----
    create or replace function func_age_3
    (p_jubun IN varchar2)
    return number
    IS
        error_jubun  exception; -- error_jubun은 개발자가 정의하는 exception(예외절)임을 선언한다는 뜻이다.
        v_gender_num varchar2(1) := substr(p_jubun,7,1); -- := 초기값을 넣어주는 것
                                                         -- v_gender_num 에는 입력받은 p_jubun 에서 7번째 부터 1개 글자만 넣어준다.
                                                         -- 즉, v_gender_num 에는 '1' 또는 '2' 또는 '3' 또는 '4' 가 들어올 것이다.
        v_year      number(4);
        v_age       number(3);
        i           number(2) := 0;
    BEGIN
        if length(p_jubun) != 13 then raise error_jubun;
        end if;

        LOOP
            i := i+1;
            EXIT WHEN i > 13;
            if not(substr(p_jubun,i,1) between '0' and '9') then raise error_jubun; -- jubun 이 문자열 타입이므로 '' 타입!
            end if; -- end if 꼭 쓰기!!
        END LOOP;

        if    v_gender_num in ('1','2') then v_year := 1900;
        elsif v_gender_num in ('3','4') then v_year := 2000;
        else raise error_jubun;
        end if;

        if to_date(to_char(sysdate,'yyyy')||substr(p_jubun,3,4),'yyyymmdd') - to_date(to_char(sysdate,'yyyymmdd'),'yyyymmdd') > 0
             then v_age := extract(year from sysdate) - (v_year + to_number(substr(p_jubun,1,2))) - 1;
        else v_age := extract(year from sysdate) - (v_year + to_number(substr(p_jubun,1,2)));
        end if;

        return v_age;

        EXCEPTION
        WHEN error_jubun
        then raise_application_error(-20001, '잘못된 주민등록번호입니다.'); -- raise_application_error() 는 dbms가 아닌 스크립트 출력창에 오류를 띄워준다.
                              --     -20001 은 오류번호로써, 사용자가 정의해주는 EXCEPTION 에 대해서는 오류번호를 -20001 부터 -20999 까지만 가능하다. 그 이외의 오류번호는 사용할 수 없다.
    END func_age_3;
    -- Function FUNC_AGE_3이(가) 컴파일되었습니다.



     ----- [FOR LOOP] 주민번호를 입력받아서 만나이를 알려주는 함수 func_age_4(주민번호)을 생성하세요. ----
     create or replace function func_age_4
    (p_jubun IN varchar2)
    return number
    IS
        error_jubun  exception; -- error_jubun은 개발자가 정의하는 exception(예외절)임을 선언한다는 뜻이다.
        v_gender_num varchar2(1) := substr(p_jubun,7,1); -- := 초기값을 넣어주는 것
                                                         -- v_gender_num 에는 입력받은 p_jubun 에서 7번째 부터 1개 글자만 넣어준다.
                                                         -- 즉, v_gender_num 에는 '1' 또는 '2' 또는 '3' 또는 '4' 가 들어올 것이다.
        v_year      number(4);
        v_age       number(3);
    BEGIN
        if length(p_jubun) != 13 then raise error_jubun;
        end if;

        for i  in  1..13  loop
            if not(substr(p_jubun,i,1) between '0' and '9') then raise error_jubun;
            end if;
        end loop;

        if    v_gender_num in ('1','2') then v_year := 1900;
        elsif v_gender_num in ('3','4') then v_year := 2000;
        else raise error_jubun;
        end if;

        if to_date(to_char(sysdate,'yyyy')||substr(p_jubun,3,4),'yyyymmdd') - to_date(to_char(sysdate,'yyyymmdd'),'yyyymmdd') > 0
             then v_age := extract(year from sysdate) - (v_year + to_number(substr(p_jubun,1,2))) - 1;
        else v_age := extract(year from sysdate) - (v_year + to_number(substr(p_jubun,1,2)));
        end if;

        return v_age;

        EXCEPTION
        WHEN error_jubun
        then raise_application_error(-20001, '잘못된 주민등록번호입니다.'); -- raise_application_error() 는 dbms가 아닌 스크립트 출력창에 오류를 띄워준다.
                              --     -20001 은 오류번호로써, 사용자가 정의해주는 EXCEPTION 에 대해서는 오류번호를 -20001 부터 -20999 까지만 가능하다. 그 이외의 오류번호는 사용할 수 없다.
    END func_age_4;
    -- Function FUNC_AGE_4이(가) 컴파일되었습니다.



    ----- [WHILE LOOP] 주민번호를 입력받아서 만나이를 알려주는 함수 func_age_5(주민번호)을 생성하세요. ----
    create or replace function func_age_5
    (p_jubun IN varchar2)
    return number
    IS
        error_jubun  exception; -- error_jubun은 개발자가 정의하는 exception(예외절)임을 선언한다는 뜻이다.
        v_gender_num varchar2(1) := substr(p_jubun,7,1); -- := 초기값을 넣어주는 것
                                                         -- v_gender_num 에는 입력받은 p_jubun 에서 7번째 부터 1개 글자만 넣어준다.
                                                         -- 즉, v_gender_num 에는 '1' 또는 '2' 또는 '3' 또는 '4' 가 들어올 것이다.
        v_year      number(4);
        v_age       number(3);
        i           number(2) := 0;
    BEGIN
        if length(p_jubun) != 13 then raise error_jubun;
        end if;

        WHILE NOT( i > 13 ) LOOP
            i := i+1;
            if not(substr(p_jubun,i,1) between '0' and '9') then raise error_jubun; -- jubun 이 문자열 타입이므로 '' 타입!
            end if;
        END LOOP;

        if    v_gender_num in ('1','2') then v_year := 1900;
        elsif v_gender_num in ('3','4') then v_year := 2000;
        else raise error_jubun;
        end if;

        if to_date(to_char(sysdate,'yyyy')||substr(p_jubun,3,4),'yyyymmdd') - to_date(to_char(sysdate,'yyyymmdd'),'yyyymmdd') > 0
             then v_age := extract(year from sysdate) - (v_year + to_number(substr(p_jubun,1,2))) - 1;
        else v_age := extract(year from sysdate) - (v_year + to_number(substr(p_jubun,1,2)));
        end if;

        return v_age;

        EXCEPTION
        WHEN error_jubun
        then raise_application_error(-20001, '잘못된 주민등록번호입니다.'); -- raise_application_error() 는 dbms가 아닌 스크립트 출력창에 오류를 띄워준다.
                              --     -20001 은 오류번호로써, 사용자가 정의해주는 EXCEPTION 에 대해서는 오류번호를 -20001 부터 -20999 까지만 가능하다. 그 이외의 오류번호는 사용할 수 없다.
    END func_age_5;
    -- Function FUNC_AGE_5이(가) 컴파일되었습니다.

    -- 강사님
    create or replace function func_age_5
    (p_jubun IN varchar2)
    return number
    IS
        error_jubun  exception; -- error_jubun은 개발자가 정의하는 exception(예외절)임을 선언한다는 뜻이다.
        v_gender_num varchar2(1) := substr(p_jubun,7,1); -- := 초기값을 넣어주는 것
                                                         -- v_gender_num 에는 입력받은 p_jubun 에서 7번째 부터 1개 글자만 넣어준다.
                                                         -- 즉, v_gender_num 에는 '1' 또는 '2' 또는 '3' 또는 '4' 가 들어올 것이다.
        v_year      number(4);
        v_age       number(3);
        i           number(2) := 1;
    BEGIN
        if length(p_jubun) != 13 then raise error_jubun;
        end if;

        WHILE NOT(not(substr(p_jubun,i,1) between '0' and '9') or i = 14) LOOP  -- 13까지 검사해야되니까 14이면 빠져나와야한다.
            i := i+1;
        END LOOP;

        IF i != 14 THEN raise error_jubun;
        END IF;

        if    v_gender_num in ('1','2') then v_year := 1900;
        elsif v_gender_num in ('3','4') then v_year := 2000;
        else raise error_jubun;
        end if;

        if to_date(to_char(sysdate,'yyyy')||substr(p_jubun,3,4),'yyyymmdd') - to_date(to_char(sysdate,'yyyymmdd'),'yyyymmdd') > 0
             then v_age := extract(year from sysdate) - (v_year + to_number(substr(p_jubun,1,2))) - 1;
        else v_age := extract(year from sysdate) - (v_year + to_number(substr(p_jubun,1,2)));
        end if;

        return v_age;

        EXCEPTION
        WHEN error_jubun
        then raise_application_error(-20001, '잘못된 주민등록번호입니다.'); -- raise_application_error() 는 dbms가 아닌 스크립트 출력창에 오류를 띄워준다.
                              --     -20001 은 오류번호로써, 사용자가 정의해주는 EXCEPTION 에 대해서는 오류번호를 -20001 부터 -20999 까지만 가능하다. 그 이외의 오류번호는 사용할 수 없다.
    END func_age_5;
    -- Function FUNC_AGE_5이(가) 컴파일되었습니다.

    -- 결과확인
    select func_age_3('9001011234567'), func_age_4('9001011234567'), func_age_5('9001011234567')
    from dual;
    -- 34	34	34
    select func_age_3('900101123456a')
    from dual;
    -- ORA-20001: 잘못된 주민등록 번호입니다.
    -- ORA-06512: "HR.FUNC_AGE_3",  38행
    select func_age_4('90102012345b7')
    from dual;
    -- ORA-20001: 잘못된 주민등록번호입니다.
    -- ORA-06512: "HR.FUNC_AGE_4",  34행
    select func_age_5('000101423467C')
    from dual;
    -- ORA-20001: 잘못된 주민등록번호입니다.
    -- ORA-06512: "HR.FUNC_AGE_5",  36행







    create table tbl_member_test1
    (userid      varchar2(20)
    ,passwd      varchar2(20) not null
    ,name        varchar2(30) not null
    ,constraint  PK_tbl_member_test1_userid primary key(userid)
    );
    -- Table TBL_MEMBER_TEST1이(가) 생성되었습니다.


    -- [퀴즈] tbl_member_test1 테이블에 insert 해주는 pcd_tbl_member_test1_insert 라는 프로시저를 작성하세요.
    exec pcd_tbl_member_test1_insert('hongkd','qwer1234$','홍길동'); --> 정상적으로 insert 되어진다.

    exec pcd_tbl_member_test1_insert('eomjh','a3$','유관순');       --> 오류메시지 -20002  '암호는 최소 5글자 이상이면서 영문자 및 숫자 및 특수기호가 혼합되어져야 합니다.' 이 뜬다. 그러므로 insert 가 안되어진다.
    exec pcd_tbl_member_test1_insert('eomjh','abc1234','유관순');   --> 오류메시지 -20002  '암호는 최소 5글자 이상이면서 영문자 및 숫자 및 특수기호가 혼합되어져야 합니다.' 이 뜬다. 그러므로 insert 가 안되어진다.


    create or replace procedure pcd_tbl_member_test1_insert
    (p_userid IN tbl_member_test1.userid%type
    ,p_passwd IN tbl_member_test1.passwd%type
    ,p_name IN tbl_member_test1.name%type
    )
    is
        v_passwd_length number(2);
        error_insert    exception;      -- error 변수 선언
        v_ch            varchar2(1);    -- passwd 글자 한개
        v_flag_alphabet number(1) := 0; -- 영문자 확인 용도
        v_flag_number   number(1) := 0; -- 숫자 확인 용도
        v_flag_special  number(1) := 0; -- 특수문자 확인 용도
    begin
        v_passwd_length := length(p_passwd);
        if(v_passwd_length < 5 or v_passwd_length > 20) then raise error_insert;    -- 사용자가 정의하는 예외절(Exception)을 구동시켜라.
        else
            For i in 1..v_passwd_length LOOP
                v_ch := substr(p_passwd,i,1);

                if(v_ch between 'A' and 'Z') or (v_ch between 'a' and 'z') then     -- 영문자 이라면
                    v_flag_alphabet := 1;
                elsif(v_ch between '0' and '9') then    -- 숫자 이라면
                    v_flag_number := 1;
                else    -- 특수문자 이라면
                    v_flag_special := 1;
                end if;
            END LOOP;   -- end of for loop-------------------------------------------------------------

            if(v_flag_alphabet * v_flag_number * v_flag_special = 1) then
                insert into tbl_member_test1(userid,passwd,name) values(p_userid,p_passwd,p_name);
            else raise error_insert;     -- 사용자가 정의하는 예외절(Exception)을 구동시켜라.
            end if;
        end if;

        Exception   -- 정의내리기
            WHEN error_insert THEN raise_application_error(-20002,'>> 암호는 최소 5글자 이상이면서 영문자 및 숫자 및 특수기호가 혼합되어져야 합니다. <<');
    end pcd_tbl_member_test1_insert;
    -- Procedure PCD_TBL_MEMBER_TEST1_INSERT이(가) 컴파일되었습니다.

    exec pcd_tbl_member_test1_insert('hongkd','qwer1234$','홍길동');
    -- PL/SQL 프로시저가 성공적으로 완료되었습니다.

    select *
    from tbl_member_test1;
    -- hongkd	qwer1234$	홍길동

    commit;
    -- 커밋 완료.

    exec pcd_tbl_member_test1_insert('eomjh','a3$','유관순');
    /*
    오류 보고 -
    ORA-20002: >> 암호는 최소 5글자 이상이면서 영문자 및 숫자 및 특수기호가 혼합되어져야 합니다. <<
    ORA-06512: "HR.PCD_TBL_MEMBER_TEST1_INSERT",  36행
    */
    exec pcd_tbl_member_test1_insert('eomjh','abc1234','유관순');
    /*
    오류 보고 -
    ORA-20002: >> 암호는 최소 5글자 이상이면서 영문자 및 숫자 및 특수기호가 혼합되어져야 합니다. <<
    ORA-06512: "HR.PCD_TBL_MEMBER_TEST1_INSERT",  36행
    */




    ------------ ***** 사용자 정의 예외절(EXCEPTION) ***** ----------------
     예외절 = 오류절

     ※ 형식

     exception
          when  익셉션이름1  [or 익셉션이름2]  then
                실행문장1;
                실행문장2;
                실행문장3;

          when  익셉션이름3  [or 익셉션이름4]  then
                실행문장4;
                실행문장5;
                실행문장6;

          when  others  then
                실행문장7;
                실행문장8;
                실행문장9;
   ------------------------------------------------------------------


   /*
      === tbl_member_test1 테이블에 insert 할 수 있는 요일명과 시간을 제한해 두겠습니다. ===

          tbl_member_test1 테이블에 insert 할 수 있는 요일명은 월,화,수,목,금 만 가능하며
          또한 월,화,수,목,금 중에 오후 2시 부터 오후 5시 이전까지만(오후 5시 정각은 안돼요) insert 가 가능하도록 하고자 한다.
          만약에 insert 가 불가한 요일명(토,일)이거나 불가한 시간대에 insert 를 시도하면
          '영업시간(월~금 14:00 ~ 16:59:59 까지) 아니므로 입력불가함!!' 이라는 오류메시지가 뜨도록 한다.
   */

    select to_char(sysdate,'d') -- sysdate의 주의 일요일 부터(지금은 2024년 3월 4일) sysdate(지금은 2024년 3월 4일) 까지 며칠째 인지를 알려주는 것이다.
                                -- '1'(일요일) '2'(월요일) '3'(화요일) '4'(수요일) '5'(목요일) '6'(금요일) '7'(토요일)
    from dual;



   create or replace procedure pcd_tbl_member_test1_insert
    (p_userid IN tbl_member_test1.userid%type
    ,p_passwd IN tbl_member_test1.passwd%type
    ,p_name IN tbl_member_test1.name%type
    )
    is
        error_dayTime   exception;      -- error 변수 선언
        v_passwd_length number(2);
        error_insert    exception;      -- error 변수 선언
        v_ch            varchar2(1);    -- passwd 글자 한개
        v_flag_alphabet number(1) := 0; -- 영문자 확인 용도
        v_flag_number   number(1) := 0; -- 숫자 확인 용도
        v_flag_special  number(1) := 0; -- 특수문자 확인 용도
    begin
        -- 입력(insert)이 불가한 요일명과 시간대를 알아봅니다. --
        if(to_char(sysdate,'d') in ('1','7') or to_number(to_char(sysdate,'hh24')) < 14 or to_number(to_char(sysdate,'hh24')) > 16)
            then raise error_dayTime;
        else    -- 입력(insert)이 가능한 요일명과 시간대 이라면 암호를 검사하겠다.

            v_passwd_length := length(p_passwd);
            if(v_passwd_length < 5 or v_passwd_length > 20) then raise error_insert;    -- 사용자가 정의하는 예외절(Exception)을 구동시켜라.
            else
                For i in 1..v_passwd_length LOOP
                    v_ch := substr(p_passwd,i,1);

                    if(v_ch between 'A' and 'Z') or (v_ch between 'a' and 'z') then     -- 영문자 이라면
                        v_flag_alphabet := 1;
                    elsif(v_ch between '0' and '9') then    -- 숫자 이라면
                        v_flag_number := 1;
                    else    -- 특수문자 이라면
                        v_flag_special := 1;
                    end if;
                END LOOP;   -- end of for loop-------------------------------------------------------------

                if(v_flag_alphabet * v_flag_number * v_flag_special = 1) then
                    insert into tbl_member_test1(userid,passwd,name) values(p_userid,p_passwd,p_name);
                else raise error_insert;     -- 사용자가 정의하는 예외절(Exception)을 구동시켜라.
                end if;
            end if;
        end if;
        Exception   -- 정의내리기
            WHEN error_dayTime THEN raise_application_error(-20003,'>> 영업시간(월~금 14:00 ~ 16:59:59 까지)이 아니므로 입력불가함 <<');
            WHEN error_insert THEN raise_application_error(-20002,'>> 암호는 최소 5글자 이상이면서 영문자 및 숫자 및 특수기호가 혼합되어져야 합니다. <<');
    end pcd_tbl_member_test1_insert;
    -- Procedure PCD_TBL_MEMBER_TEST1_INSERT이(가) 컴파일되었습니다.

    commit;
    -- 커밋 완료.

    -- [영업시간 평일 14:00:00 ~ 16:59:59 가 아닌 경우]
    exec pcd_tbl_member_test1_insert('eomjh','qwer1234$','엄정화');
    /*
    오류 보고 -
    ORA-20003: >> 영업시간(월~금 14:00 ~ 16:59:59 까지)이 아니므로 입력불가함 <<
    ORA-06512: "HR.PCD_TBL_MEMBER_TEST1_INSERT",  42행
    */

    -- [영업시간에 등록할 경우]
    exec pcd_tbl_member_test1_insert('eomjh','qwer1234$','엄정화');
    -- PL/SQL 프로시저가 성공적으로 완료되었습니다.

    select *
    from tbl_member_test1;
    /*
    hongkd	qwer1234$	홍길동
    eomjh	qwer1234$	엄정화
    */








    --- ** 오라클에서는 배열이 없습니다만 배열처럼 사용되어지는 table 타입 변수가 있습니다. ** ---
    --     그래서 table 타입 변수를 사용하여 자바의 배열처럼 사용합니다. --

    with E as
    (
    select department_id
       , employee_id
       , first_name || ' ' || last_name AS ENAME
       , to_char(hire_date, 'yyyy-mm-dd') AS HIREDATE
       , func_gender(jubun) AS GENDER
       , func_age(jubun) AS AGE
    from employees
    where department_id = 30
    )
    select E.department_id, D.department_name, E.employee_id, E.ename, E.hiredate, E.gender, E.age
    from departments D right join E
    on D.department_id = E.department_id;




    -- 아래의 소스는 잘못된 것 입니다. --
    create or replace procedure pcd_employees_info_deptid
    (p_department_id  IN  employees.department_id%type)
    is
        v_department_id      employees.department_id%type;
        v_department_name    departments.department_name%type;
        v_employee_id        employees.employee_id%type;
        v_ename              varchar2(30);
        v_hiredate           varchar2(10);
        v_gender             varchar2(6);
        v_age                number(3);

    begin

        with E as
        (
          select department_id
               , employee_id
               , first_name || ' ' || last_name AS ENAME
               , to_char(hire_date, 'yyyy-mm-dd') AS HIREDATE
               , func_gender(jubun) AS GENDER
               , func_age(jubun) AS AGE
          from employees
          where department_id = p_department_id
        )
        select E.department_id, D.department_name, E.employee_id, E.ename, E.hiredate, E.gender, E.age
               into
               v_department_id, v_department_name, v_employee_id, v_ename, v_hiredate, v_gender, v_age
        from departments D right join E
        on D.department_id = E.department_id;

        dbms_output.put_line( lpad('-',60,'-') );
        dbms_output.put_line( '부서번호    부서명     사원번호     사원명    입사일자   성별   나이' );
        dbms_output.put_line( lpad('-',60,'-') );

        dbms_output.put_line( v_department_id || ' ' || v_department_name || ' ' ||
                              v_employee_id || ' ' || v_ename || ' ' || v_hiredate || ' ' || v_gender || ' ' || v_age );

        EXCEPTION
           WHEN no_data_found THEN   -- no_data_found 은 오라클에서 데이터가 존재하지 않을 경우 발생하는 오류임.
                dbms_output.put_line('>> 부서번호 ' || p_department_id || '은 존재하지 않습니다. <<');

    end pcd_employees_info_deptid;
    -- Procedure PCD_EMPLOYEES_INFO_DEPTID이(가) 컴파일되었습니다.

    exec pcd_employees_info_deptid(10);
    -- PL/SQL 프로시저가 성공적으로 완료되었습니다.
    /*
    ------------------------------------------------------------
    부서번호    부서명     사원번호     사원명    입사일자   성별   나이
    ------------------------------------------------------------
    10 Administration 200 Jennifer Whalen 2003-09-17 여 45
    */

    exec pcd_employees_info_deptid(8888);
    -- PL/SQL 프로시저가 성공적으로 완료되었습니다.
    -- >> 부서번호 8888은 존재하지 않습니다. <<

    exec pcd_employees_info_deptid(30);
    /*
    오류 보고 -
    ORA-01422: 실제 인출은 요구된 것보다 많은 수의 행을 추출합니다
    ORA-06512: "HR.PCD_EMPLOYEES_INFO_DEPTID",  14행
    */



    /*
    6개 행이 나와야 하는데 프로시저에서 select 되어진 컬럼의 값을 담을 변수
    into ~~~ 에 있는 (v_department_id, v_department_name, v_employee_id, v_ename, v_hiredate, v_gender, v_age )는
    데이터 값을 1개 밖에 담지 못하므로 위와 같은 오류가 발생한다.
    */

 /*
     자바를 예를 들면
     int jumsu = 0;

     변수 jumsu 에 90, 95, 88, 75, 91, 80 이라는 6개의 점수를 입력하고자 한다.
     돼요? 안돼요?  안됩니다.

     jumsu = 90;
     jumsu = 85;
     jumsu = 88;
     jumsu = 75;
     jumsu = 91;
     jumsu = 80;

     최종적으로 변수 jumsu 에 담긴 값은 80 이 된다.

     그래서 자바에서는 아래와 같이 배열로 만들어서 한다.
     int[] jumsuArr = new int[6];

     jumsuArr[0] = 90;
     jumsuArr[1] = 85;
     jumsuArr[2] = 88;
     jumsuArr[3] = 75;
     jumsuArr[4] = 91;
     jumsuArr[5] = 80;

     -------------------------------
     | 90 | 85 | 88 | 75 | 91 | 80 |
     -------------------------------

 */

    select employee_id
    from employees
    where department_id = 30;

 /*
    아래의 모양은 자바에서 사용되던 1차원 배열의 모양을 90도 회전한 것과 같다.
    그래서 오라클에서는 자바의 1차원 배열처럼 컬럼을 1개만 가지는 table 타입 변수를 사용하여 쓴다.

    EMPLOYEE_ID
     -------
     | 114 |
     -------
     | 115 |
     -------
     | 116 |
     -------
     | 117 |
     -------
     | 118 |
     -------
     | 119 |
     -------

 */
    ---- **** [ 위에서 만든 pcd_employees_info_deptid 을 올바르게 작동하도록 해결하기 ] **** ----
    create or replace procedure pcd_employees_info_deptid
    (p_department_id  IN  employees.department_id%type)
    is
        type department_id_type
        is table of employees.department_id%type index by binary_integer;       -- v_department_id      employees.department_id%type;
        type department_name_type
        is table of departments.department_name%type index by binary_integer;   -- v_department_name    departments.department_name%type;
        type employee_id_type
        is table of employees.employee_id%type index by binary_integer;         -- v_employee_id        employees.employee_id%type;
        type ename_type
        is table of varchar2(30) index by binary_integer;                       -- v_ename              varchar2(30);
        type hiredate_type
        is table of varchar2(10) index by binary_integer;                       -- v_hiredate           varchar2(10);
        type gender_type
        is table of varchar2(6) index by binary_integer;                        -- v_gender             varchar2(6);
        type age_type
        is table of number(3) index by binary_integer;                          -- v_age                number(3);

        i binary_integer := 0;    -- i 가 마치 배열의 방번호 용도 처럼 쓰인다.
                                -- 그런데 자바에서 배열의 시작은 0 부터 시작하지만
                                -- 오라클에서는 1 부터 시작한다.

        v_department_id     department_id_type;
        v_department_name   department_name_type;
        v_employee_id       employee_id_type;
        v_ename             ename_type;
        v_hiredate          hiredate_type;
        v_gender            gender_type;
        v_age               age_type;

    begin

        FOR v_rcd IN (  -- FOR v_rcd IN(select 문) LOOP => select 문을 통해 나온 행의 개수만큼 출력
                        WITH E as
                        (
                              select department_id
                                   , employee_id
                                   , first_name || ' ' || last_name AS ENAME
                                   , to_char(hire_date, 'yyyy-mm-dd') AS HIREDATE
                                   , func_gender(jubun) AS GENDER
                                   , func_age(jubun) AS AGE
                              from employees
                              where department_id = p_department_id
                        )
                        select E.department_id, D.department_name, E.employee_id, E.ename, E.hiredate, E.gender, E.age
                        from departments D right join E
                        on D.department_id = E.department_id
                    ) LOOP

                    i := i+1;
                    v_department_id(i) := v_rcd.department_id;
                    v_department_name(i) := v_rcd.department_name;
                    v_employee_id(i) := v_rcd.employee_id;
                    v_ename(i) := v_rcd.ename;
                    v_hiredate(i) := v_rcd.hiredate;
                    v_gender(i) := v_rcd.gender;
                    v_age(i) := v_rcd.age;

        END LOOP;

        if(i = 0) then raise no_data_found;
        else dbms_output.put_line( lpad('-',60,'-') );
             dbms_output.put_line( '부서번호    부서명     사원번호     사원명    입사일자   성별   나이' );
             dbms_output.put_line( lpad('-',60,'-') );

            FOR K IN 1..i LOOP
                dbms_output.put_line( v_department_id(k) || ' ' || v_department_name(k) || ' ' ||
                              v_employee_id(k) || ' ' || v_ename(k) || ' ' || v_hiredate(k) || ' ' || v_gender(k) || ' ' || v_age(k) );
            END LOOP;
        end if;

        EXCEPTION
           WHEN no_data_found THEN   -- no_data_found 은 오라클에서 데이터가 존재하지 않을 경우 발생하는 오류임.
                dbms_output.put_line('>> 부서번호 ' || p_department_id || '은 존재하지 않습니다. <<');

    end pcd_employees_info_deptid;
    -- Procedure PCD_EMPLOYEES_INFO_DEPTID이(가) 컴파일되었습니다.

    exec pcd_employees_info_deptid(30);
    -- PL/SQL 프로시저가 성공적으로 완료되었습니다.
    /*
        ------------------------------------------------------------
        부서번호    부서명     사원번호     사원명    입사일자   성별   나이
        ------------------------------------------------------------
        30 Purchasing 114 Den Raphaely 2002-12-07 여 56
        30 Purchasing 115 Alexander Khoo 2003-05-18 남 62
        30 Purchasing 116 Shelli Baida 2005-12-24 남 61
        30 Purchasing 117 Sigal Tobias 2005-07-24 여 62
        30 Purchasing 118 Guy Himuro 2006-11-15 남 45
        30 Purchasing 119 Karen Colmenares 2007-08-10 남 44
    */


    -----------------------------------------------------------------------------

            ---- ===== **** CURSOR **** ===== -----

    --  PL/SQL 에서 SELECT 되어져 나오는 행의 개수가 2개 이상인 경우에는 위에서 한 것처럼
    --  table 타입의 변수를 사용하여 나타낼 수 있고, 또는 CURSOR 를 사용하여 나타낼 수도 있다.
    --  table 타입의 변수를 사용하는 것 보다 CURSOR 를 사용하는 것이 더 편하므로
    --  대부분 CURSOR 를 많이 사용한다.


    ----- *** 명시적 CURSOR 만들기 *** -----
    ※ 형식

    1단계 -- CURSOR 의 선언(정의)

    CURSOR 커서명
    IS
    SELECT 문;

    2단계 -- CURSOR 의 OPEN

    OPEN 커서명;

    3단계 -- CURSOR 의 FETCH
           (FETCH 란? SELECT 되어진 결과물을 끄집어 내는 작업을 말한다)

    FETCH  커서명 INTO 변수;

    4단계 -- CURSOR 의 CLOSE

    CLOSE 커서명;



    ※ ==== 커서의 속성변수 ==== ※

    1. 커서명%ISOPEN   ==> 커서가 OPEN 되어진 상태인가를 체크하는 것.
                       만약에 커서가 OPEN 되어진 상태이라면 TRUE.

    2. 커서명%FOUND    ==> FETCH 된 레코드(행)이 있는지 체크하는 것.
                       만약에 FETCH 된 레코드(행)이 있으면 TRUE.

    3. 커서명%NOTFOUND ==> FETCH 된 레코드(행)이 없는지 체크하는 것.
                       만약에 FETCH 된 레코드(행)이 없으면 TRUE.

    4. 커서명%ROWCOUNT ==> 현재까지 FETCH 된 레코드(행)의 갯수를 반환해줌.

    create or replace procedure pcd_employees_deptid_cursor
    (p_department_id  IN  employees.department_id%type)
    is
        -- 1단계. CURSOR 의 선언(정의)
        cursor cur_empinfo
        is
        WITH E as
        (
            select department_id
               , employee_id
               , first_name || ' ' || last_name AS ENAME
               , to_char(hire_date, 'yyyy-mm-dd') AS HIREDATE
               , func_gender(jubun) AS GENDER
               , func_age(jubun) AS AGE
            from employees
            where department_id = p_department_id
        )
        select E.department_id, D.department_name, E.employee_id, E.ename, E.hiredate, E.gender, E.age
        from departments D right join E
        on D.department_id = E.department_id;

        v_department_id     employees.department_id%type;
        v_department_name   departments.department_name%type;
        v_employee_id       employees.employee_id%type;
        v_ename             varchar2(30);
        v_hiredate          varchar2(10);
        v_gender            varchar2(6);
        v_age               number(3);

        v_fetch_count       number := 0;

    begin
        -- 2단계. CURSOR 의 OPEN
        OPEN cur_empinfo;
        -- 3단계. CURSOR 의 FETCH
        LOOP
            FETCH cur_empinfo INTO v_department_id, v_department_name, v_employee_id, v_ename, v_hiredate, v_gender, v_age;
            EXIT WHEN cur_empinfo%NOTFOUND;      -- 더 이상 FETCH 되어진 행이 없다라면 반복문을 빠져나간다면
            v_fetch_count := cur_empinfo%ROWCOUNT;   -- 현재까지 FETCH 된 레코드(행)의 갯수
            if(v_fetch_count = 1) then   -- 현재까지 FETCH 된 레코드(행)의 갯수
                dbms_output.put_line( lpad('-',60,'-') );
                dbms_output.put_line( '부서번호    부서명     사원번호     사원명    입사일자   성별   나이' );
                dbms_output.put_line( lpad('-',60,'-') );
            end if;
            dbms_output.put_line( v_department_id || ' ' || v_department_name || ' ' ||
                              v_employee_id || ' ' || v_ename || ' ' || v_hiredate || ' ' || v_gender || ' ' || v_age);
        END LOOP;
        -- 4단계. CURSOR 의 CLOSE
        CLOSE cur_empinfo;

        if(v_fetch_count = 0) then
            dbms_output.put_line('>> 부서번호 ' || p_department_id || '은 존재하지 않습니다. <<');
        else
            dbms_output.put_line(' ');
            dbms_output.put_line('>> 조회된 행의 개수 : ' || v_fetch_count || '개 <<');
        end if;
    end pcd_employees_deptid_cursor;
    -- Procedure PCD_EMPLOYEES_DEPTID_CURSOR이(가) 컴파일되었습니다.

    exec pcd_employees_deptid_cursor(10);
    -- PL/SQL 프로시저가 성공적으로 완료되었습니다.
    /*
        ------------------------------------------------------------
        부서번호    부서명     사원번호     사원명    입사일자   성별   나이
        ------------------------------------------------------------
        10 Administration 200 Jennifer Whalen 2003-09-17 여 45

        >> 조회된 행의 개수 : 1개 <<
    */
    exec pcd_employees_deptid_cursor(30);
    -- PL/SQL 프로시저가 성공적으로 완료되었습니다.
    /*
        ------------------------------------------------------------
        부서번호    부서명     사원번호     사원명    입사일자   성별   나이
        ------------------------------------------------------------
        30 Purchasing 114 Den Raphaely 2002-12-07 여 56
        30 Purchasing 115 Alexander Khoo 2003-05-18 남 62
        30 Purchasing 116 Shelli Baida 2005-12-24 남 61
        30 Purchasing 117 Sigal Tobias 2005-07-24 여 62
        30 Purchasing 118 Guy Himuro 2006-11-15 남 45
        30 Purchasing 119 Karen Colmenares 2007-08-10 남 44

        >> 조회된 행의 개수 : 6개 <<
    */
    exec pcd_employees_deptid_cursor(8888);
    -- PL/SQL 프로시저가 성공적으로 완료되었습니다.
    -- >> 부서번호 8888은 존재하지 않습니다. <<



    -------------- *****  FOR LOOP CURSOR 만들기 ***** -----------------
    /*
         FOR LOOP CURSOR 문을 사용하면
         커서의 OPEN, 커서의 FETCH, 커서의 CLOSE 가 자동적으로 발생되어지기 때문에
         우리는 커서의 OPEN, 커서의 FETCH, 커서의 CLOSE 문장을 기술할 필요가 없다.
    */

    ※ 형식
    FOR 변수명(select 되어진 행의 정보가 담기는 변수) IN 커서명 LOOP   -- 2단계
      실행문장;
    END LOOP;


    create or replace procedure pcd_employees_deptid_forcursor
    (p_department_id  IN  employees.department_id%type)
    is
        -- 1단계. CURSOR 의 선언(정의)
        cursor cur_empinfo
        is
        WITH E as
        (
            select department_id
               , employee_id
               , first_name || ' ' || last_name AS ENAME
               , to_char(hire_date, 'yyyy-mm-dd') AS HIREDATE
               , func_gender(jubun) AS GENDER
               , func_age(jubun) AS AGE
            from employees
            where department_id = p_department_id
        )
        select E.department_id, D.department_name, E.employee_id, E.ename, E.hiredate, E.gender, E.age
        from departments D right join E
        on D.department_id = E.department_id;

        v_fetch_count       number := 0;

    begin
        -- 2단계. 
        /*
            FOR 변수명(select 되어진 행의 정보가 담기는 변수) IN 커서명 LOOP
            실행문장;
            END LOOP;
        */
        FOR v_rcd IN cur_empinfo LOOP   -- 이때 변수는 자동적으로 선언되어진다.
            v_fetch_count := cur_empinfo%ROWCOUNT;   -- 현재까지 FETCH 된 레코드(행)의 갯수
            
            if(v_fetch_count = 1) then   -- 현재까지 FETCH 된 레코드(행)의 갯수
                dbms_output.put_line( lpad('-',60,'-') );
                dbms_output.put_line( '부서번호    부서명     사원번호     사원명    입사일자   성별   나이' );
                dbms_output.put_line( lpad('-',60,'-') );
            end if;
            
            dbms_output.put_line( v_rcd.department_id || ' ' || v_rcd.department_name || ' ' ||
                              v_rcd.employee_id || ' ' || v_rcd.ename || ' ' || v_rcd.hiredate || ' ' || v_rcd.gender || ' ' || v_rcd.age);
        END LOOP;
        
        if(v_fetch_count = 0) then
            dbms_output.put_line('>> 부서번호 ' || p_department_id || '은 존재하지 않습니다. <<');
        else
            dbms_output.put_line(' ');
            dbms_output.put_line('>> 조회된 행의 개수 : ' || v_fetch_count || '개 <<');
        end if;
    end pcd_employees_deptid_forcursor;
    -- Procedure PCD_EMPLOYEES_DEPTID_FORCURSOR이(가) 컴파일되었습니다.
    
    
    exec pcd_employees_deptid_forcursor(10);
    -- PL/SQL 프로시저가 성공적으로 완료되었습니다.
    /*
        ------------------------------------------------------------
        부서번호    부서명     사원번호     사원명    입사일자   성별   나이
        ------------------------------------------------------------
        10 Administration 200 Jennifer Whalen 2003-09-17 여 45

        >> 조회된 행의 개수 : 1개 <<
    */
    exec pcd_employees_deptid_forcursor(30);
    -- PL/SQL 프로시저가 성공적으로 완료되었습니다.
    /*
        ------------------------------------------------------------
        부서번호    부서명     사원번호     사원명    입사일자   성별   나이
        ------------------------------------------------------------
        30 Purchasing 114 Den Raphaely 2002-12-07 여 56
        30 Purchasing 115 Alexander Khoo 2003-05-18 남 62
        30 Purchasing 116 Shelli Baida 2005-12-24 남 61
        30 Purchasing 117 Sigal Tobias 2005-07-24 여 62
        30 Purchasing 118 Guy Himuro 2006-11-15 남 45
        30 Purchasing 119 Karen Colmenares 2007-08-10 남 44

        >> 조회된 행의 개수 : 6개 <<
    */
    exec pcd_employees_deptid_forcursor(8888);
    -- PL/SQL 프로시저가 성공적으로 완료되었습니다.
    -- >> 부서번호 8888은 존재하지 않습니다. <<
    
    
    
    
    
    
    
    
    ------------------- ****** PACKAGE(패키지) ****** -------------------
   
    --->   PACKAGE(패키지)란?  여러개의 Procedure 와 여러개의 Function 들의 묶음
    
    -- 1. PACKAGE(패키지)의 선언하기
    create or replace package employee_pack
    is
        -- employee_pack 패키지에 들어올 프로시저 또는 함수를 선언해준다.
        procedure  pcd_emp_info(p_deptno in employees.department_id%type); 
        procedure  pcd_dept_info(p_deptno in departments.department_id%type); 
        function   func_gender(p_jubun in employees.jubun%type) return Nvarchar2;   -- 함수는 return 이 반드시 필요!! 유형타입에 자리수 X(넣지 말아야한다!!)
    end employee_pack;
    -- Package EMPLOYEE_PACK이(가) 컴파일되었습니다.
    
    -- 2. PACKAGE(패키지)의 BODY(본문) 생성하기
    create or replace package body employee_pack
    is
        procedure  pcd_emp_info(p_deptno in employees.department_id%type)
        is
            cursor  cur_empinfo
            is
            SELECT E.department_id, D.department_name, E.employee_id, E.ename
            FROM
            (
            select department_id, employee_id, first_name || ' ' || last_name AS ename
            from employees
            where department_id = p_deptno
            ) E JOIN departments D
            ON E.department_id = D.department_id;
            
          v_fetch_count  number := 0;
          
        begin
            for v_rcd in cur_empinfo loop
              
              v_fetch_count := cur_empinfo%rowcount;
              
              if(v_fetch_count = 1) then
                 dbms_output.put_line( lpad('-',60,'-') );
                 dbms_output.put_line('부서번호  부서명       사원번호  사원명 ');
                 dbms_output.put_line( lpad('-',60,'-') );
              end if;
              
              dbms_output.put_line(v_rcd.department_id || ' ' ||
                                   v_rcd.department_name || ' ' ||
                                   v_rcd.employee_id || ' ' ||
                                   v_rcd.ename);
            end loop; 
            
            if(v_fetch_count = 0) then
               dbms_output.put_line('>> 부서번호 ' || p_deptno || '은 없습니다.<<'); 
            else
               dbms_output.put_line(' ');
               dbms_output.put_line('>> 조회건수 ' || v_fetch_count || '개');
            end if;
            
        end pcd_emp_info;   -- 이때 end 는 프로시저에 end 이다!
        
        procedure  pcd_dept_info(p_deptno in departments.department_id%type)
        is
            v_department_id    departments.department_id%type;
            v_department_name  departments.department_name%type;
        begin
            select department_id, department_name
                   into
                   v_department_id, v_department_name
            from departments
            where department_id = p_deptno;
            
            dbms_output.put_line( lpad('-',40,'-') );
            dbms_output.put_line( '부서번호  부서명' );
            dbms_output.put_line( lpad('-',40,'-') );
            
            dbms_output.put_line( v_department_id || ' ' || v_department_name ); 
            
            exception
               when no_data_found then
                    dbms_output.put_line('>> 부서번호 ' || p_deptno || '은 없습니다.<<');
                    
        end pcd_dept_info;  -- 이때 end 는 프로시저에 end 이다!
        
        function   func_gender(p_jubun in employees.jubun%type) return Nvarchar2
        is
            v_jubun_length  number;
            v_cnt           number(2) := 0;
            v_gender        Nvarchar2(1);    -- '' : NULL, ' ': 공백
            
            error_jubun     exception;
            
        begin
            v_jubun_length := length(p_jubun);
            
            if(v_jubun_length != 13) then
                raise  error_jubun;
            else
                for i in 1..v_jubun_length loop
                    v_cnt := v_cnt + 1;
            
                    if not (substr(p_jubun, i, 1) between '0' and '9') then 
                        raise  error_jubun;
                    end if;   
                 end loop;
            
                if(v_cnt = v_jubun_length) then
                    if( substr(p_jubun, 7, 1) in('1','3') ) then 
                        v_gender := '남';
                    elsif( substr(p_jubun, 7, 1) in('2','4') ) then 
                        v_gender := '여';
                    else     
                        raise  error_jubun;
                    end if;    
                end if;
            
            end if;
            
            return v_gender;
            
            exception 
            when error_jubun then
                raise_application_error(-20001, '>> 주민번호가 올바르지 않습니다. <<'); 
        end func_gender;    -- 이때 end 는 function에 end 이다!
        
    end employee_pack;
    -- Package Body EMPLOYEE_PACK이(가) 컴파일되었습니다.
    
    
    -- *** 패키지 실행하기 *** --
    begin
        employee_pack.pcd_emp_info(30);
    end;
    -- PL/SQL 프로시저가 성공적으로 완료되었습니다.
    /*
        ------------------------------------------------------------
        부서번호  부서명       사원번호  사원명 
        ------------------------------------------------------------
        30 Purchasing 114 Den Raphaely
        30 Purchasing 115 Alexander Khoo
        30 Purchasing 116 Shelli Baida
        30 Purchasing 117 Sigal Tobias
        30 Purchasing 118 Guy Himuro
        30 Purchasing 119 Karen Colmenares
        
        >> 조회건수 6개
    */
    
    begin
        employee_pack.pcd_emp_info(2345);
    end;
    -- PL/SQL 프로시저가 성공적으로 완료되었습니다.
    -- >> 부서번호 2345은 없습니다.<<
    
    begin
        employee_pack.pcd_dept_info(30);
    end;
    -- PL/SQL 프로시저가 성공적으로 완료되었습니다.
    /*
        ----------------------------------------
        부서번호  부서명
        ----------------------------------------
        30 Purchasing
    */
    
    begin
        employee_pack.pcd_dept_info(2345);
    end;
    -- PL/SQL 프로시저가 성공적으로 완료되었습니다.
    -- >> 부서번호 2345은 없습니다.<<
    
    select employee_pack.func_gender('9010201234567')
    from dual;
    
    select employee_pack.func_gender('9010201234567')
        , employee_pack.func_gender('9010202234567')
        , employee_pack.func_gender('0010203234567')
        , employee_pack.func_gender('0010204234567')
    from dual;
    -- 남	여	남	여
    
    select employee_pack.func_gender('901020123456b')
    from dual;
    -- ORA-20001: >> 주민번호가 올바르지 않습니다. <<
    
    select employee_pack.func_gender('901020123456')
    from dual;
    -- ORA-20001: >> 주민번호가 올바르지 않습니다. <<
    
    select employee_id, first_name, jubun, employee_pack.func_gender(jubun)
    from employees
    order by 1 asc;
    
    
    ----- *** 패키지 소스 보기 *** -----
    select text
    from user_source
    where type = 'PACKAGE' and name = 'EMPLOYEE_PACK';  -- 패키지명 대문자로 입력하기!
    /*
    "package employee_pack
"
"    is
"
"        -- employee_pack 패키지에 들어올 프로시저 또는 함수를 선언해준다.
"
"        procedure  pcd_emp_info(p_deptno in employees.department_id%type); 
"
"        procedure  pcd_dept_info(p_deptno in departments.department_id%type); 
"
"        function   func_gender(p_jubun in employees.jubun%type) return Nvarchar2;   -- 함수는 return 이 반드시 필요!! 유형타입에 자리수 X(넣지 말아야한다!!)
"
    end employee_pack;
    */
    
    
    ----- *** 패키지 BODY(본문) 소스 보기 *** -----
    select line, text
    from user_source
    where type = 'PACKAGE BODY' and name = 'EMPLOYEE_PACK';
    /*
    1	"package body employee_pack
"
2	"    is
"
3	"        procedure  pcd_emp_info(p_deptno in employees.department_id%type)
"
4	"        is
"
5	"            cursor  cur_empinfo
"
6	"            is
"
7	"            SELECT E.department_id, D.department_name, E.employee_id, E.ename
"
8	"            FROM
"
9	"            (
"
10	"            select department_id, employee_id, first_name || ' ' || last_name AS ename
"
11	"            from employees
"
12	"            where department_id = p_deptno
"
13	"            ) E JOIN departments D
"
14	"            ON E.department_id = D.department_id;
"
15	"
"
16	"          v_fetch_count  number := 0;
"
17	"
"
18	"        begin
"
19	"            for v_rcd in cur_empinfo loop
"
20	"
"
21	"              v_fetch_count := cur_empinfo%rowcount;
"
22	"
"
23	"              if(v_fetch_count = 1) then
"
24	"                 dbms_output.put_line( lpad('-',60,'-') );
"
25	"                 dbms_output.put_line('부서번호  부서명       사원번호  사원명 ');
"
26	"                 dbms_output.put_line( lpad('-',60,'-') );
"
27	"              end if;
"
28	"
"
29	"              dbms_output.put_line(v_rcd.department_id || ' ' ||
"
30	"                                   v_rcd.department_name || ' ' ||
"
31	"                                   v_rcd.employee_id || ' ' ||
"
32	"                                   v_rcd.ename);
"
33	"            end loop; 
"
34	"
"
35	"            if(v_fetch_count = 0) then
"
36	"               dbms_output.put_line('>> 부서번호 ' || p_deptno || '은 없습니다.<<'); 
"
37	"            else
"
38	"               dbms_output.put_line(' ');
"
39	"               dbms_output.put_line('>> 조회건수 ' || v_fetch_count || '개');
"
40	"            end if;
"
41	"
"
42	"        end pcd_emp_info;   -- 이때 end 는 프로시저에 end 이다!
"
43	"
"
44	"        procedure  pcd_dept_info(p_deptno in departments.department_id%type)
"
45	"        is
"
46	"            v_department_id    departments.department_id%type;
"
47	"            v_department_name  departments.department_name%type;
"
48	"        begin
"
49	"            select department_id, department_name
"
50	"                   into
"
51	"                   v_department_id, v_department_name
"
52	"            from departments
"
53	"            where department_id = p_deptno;
"
54	"
"
55	"            dbms_output.put_line( lpad('-',40,'-') );
"
56	"            dbms_output.put_line( '부서번호  부서명' );
"
57	"            dbms_output.put_line( lpad('-',40,'-') );
"
58	"
"
59	"            dbms_output.put_line( v_department_id || ' ' || v_department_name ); 
"
60	"
"
61	"            exception
"
62	"               when no_data_found then
"
63	"                    dbms_output.put_line('>> 부서번호 ' || p_deptno || '은 없습니다.<<');
"
64	"
"
65	"        end pcd_dept_info;  -- 이때 end 는 프로시저에 end 이다!
"
66	"
"
67	"        function   func_gender(p_jubun in employees.jubun%type) return Nvarchar2
"
68	"        is
"
69	"            v_jubun_length  number;
"
70	"            v_cnt           number(2) := 0;
"
71	"            v_gender        Nvarchar2(1) := ' ';    -- '' : NULL, ' ': 공백
"
72	"
"
73	"            error_jubun     exception;
"
74	"
"
75	"        begin
"
76	"            v_jubun_length := length(p_jubun);
"
77	"
"
78	"            if(v_jubun_length != 13) then
"
79	"                raise  error_jubun;
"
80	"            else
"
81	"                for i in 1..v_jubun_length loop
"
82	"                    v_cnt := v_cnt + 1;
"
83	"
"
84	"                    if not (substr(p_jubun, i, 1) between '0' and '9') then 
"
85	"                        raise  error_jubun;
"
86	"                    end if;   
"
87	"                 end loop;
"
88	"
"
89	"                if(v_cnt = v_jubun_length) then
"
90	"                    if( substr(p_jubun, 7, 1) in('1','3') ) then 
"
91	"                        v_gender := '남';
"
92	"                    elsif( substr(p_jubun, 7, 1) in('2','4') ) then 
"
93	"                        v_gender := '여';
"
94	"                    else     
"
95	"                        raise  error_jubun;
"
96	"                    end if;    
"
97	"                end if;
"
98	"
"
99	"            end if;
"
100	"
"
101	"            return v_gender;
"
102	"
"
103	"            exception 
"
104	"            when error_jubun then
"
105	"                raise_application_error(-20001, '>> 주민번호가 올바르지 않습니다. <<'); 
"
    */