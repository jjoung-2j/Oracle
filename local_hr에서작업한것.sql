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
       --  , substr(jubun, 1,7) || lpad('*',to_number(substr(jubun,8))) as  "주민번호" --> 실행 안해봄
        
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
--- ♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥
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
                /*
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
 -- ♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥   
    
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
          -- boardno(글번호) 컬럼의 값을 내림차순으로 정렬했을때 위쪽으로 1칸 올라간 행에서 boardno 컬럼의 값을 가져온다.
        , lead(subject,1) over(order by boardno desc) as 다음글제목
          -- boardno(글번호) 컬럼의 값을 내림차순으로 정렬했을때 위쪽으로 1칸 올라간 행에서 subject 컬럼의 값을 가져온다.
    from tbl_board;
    
    
    select lag(boardno,2) over(order by boardno desc) as 이전글번호
        -- boardno(글번호) 컬럼의 값을 내림차순으로 정렬했을때 위쪽으로 2칸 올라간 행에서 boardno 컬럼의 값을 가져온다.
        , lag(subject,2) over(order by boardno desc) as 이전글제목
        -- boardno(글번호) 컬럼의 값을 내림차순으로 정렬했을때 위쪽으로 2칸 올라간 행에서 subject 컬럼의 값을 가져온다.
        , boardno as 글번호
        , subject as 글제목
        , content as 글내용
        , lead(boardno,2) over(order by boardno desc) as 다음글번호
          -- boardno(글번호) 컬럼의 값을 내림차순으로 정렬했을때 위쪽으로 2칸 올라간 행에서 boardno 컬럼의 값을 가져온다.
        , lead(subject,2) over(order by boardno desc) as 다음글제목
          -- boardno(글번호) 컬럼의 값을 내림차순으로 정렬했을때 위쪽으로 2칸 올라간 행에서 subject 컬럼의 값을 가져온다.
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
          -- boardno(글번호) 컬럼의 값을 내림차순으로 정렬했을때 위쪽으로 1칸 올라간 행에서 boardno 컬럼의 값을 가져온다.
        , lead(subject) over(order by boardno desc) as 다음글제목
          -- boardno(글번호) 컬럼의 값을 내림차순으로 정렬했을때 위쪽으로 1칸 올라간 행에서 subject 컬럼의 값을 가져온다.
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
        3. max       -- 최대값
        4. min       -- 최소값
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
---- ====>>> with 절을 사용한 inline view 만ㄷ르기 <<<==== ----

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
GROUP BY cube(department_id, gender)
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

    select decode(grouping(department_id), 0,to_char(nvl(department_id,9999)), '전체') as 부서번호
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
      부서번호, 사원번호, 사원명, 기본급여를 나타내세요.. 
  */
  
    select department_id as 부서번호
        , employee_id as 사원번호
        , first_name || ' ' || last_name as 사원명
        , salary as 기본급여
    from employees
    where department_id = 30    -- 이것을 빼면 오류! 30번의 최대치가 다른곳의 부서인사람과 같을 수 있기 때문 
        and salary = (select max(salary) from employees where department_id = 30);
  
    ---------------
    select department_id as 부서번호
        , employee_id as 사원번호
        , first_name || ' ' || last_name as 사원명
        , salary as 기본급여
    from employees
    where department_id = (select department_id 30 
        and salary = (select max(salary) from employees where department_id = 30);
  
    select department_id as 부서번호
        , employee_id as 사원번호
        , first_name || ' ' || last_name as 사원명
        , salary as 기본급여
    from employees
    where department_id = 30    
        and salary = (select min(salary) from employees where department_id = 30);
    
    
    
    