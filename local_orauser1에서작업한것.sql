    show user;
    -- USER이(가) "ORAUSER1"입니다.

    select * from tab;
    
    -- [HR 이 grant(권한주기) 전] ==> 오류!!    // [HR 이 revoke(권한박탈) 후]
    select *
    from HR.employees;
    -- ORA-00942: 테이블 또는 뷰가 존재하지 않습니다
    -- HR.employees 테이블에 select 할 수 있는 권한이 없다라는 것이다.
    
    -- [HR 이 grant(권한주기) 후]
    select *
    from HR.employees;
    
    -- [HR 이 grant(권한주기) 전] ==> 오류!!    // [HR 이 revoke(권한박탈) 후]
    select *
    from HR.departments;
    -- ORA-00942: 테이블 또는 뷰가 존재하지 않습니다
    -- HR.departments 테이블에 select 할 수 있는 권한이 없다라는 것이다. 
    
    -- [HR 이 grant(권한주기) 후]
    select *
    from HR.departments;
    
    -- [HR 이 grant(권한주기) 전] ==> 오류!!    // [HR 이 revoke(권한박탈) 후]
    update HR.employees set first_name = '스티븐'
    where employee_id = 100; -- Steven
    -- 오류 보고 -
    -- SQL 오류: ORA-01031: 권한이 불충분합니다
    
    -- [HR 이 grant(권한주기) 후]
    update HR.employees set first_name = '스티븐'
    where employee_id = 100; -- Steven
    -- 1 행 이(가) 업데이트되었습니다.
    
    -- [HR 이 grant(권한주기) 전] ==> 오류!!    // [HR 이 revoke(권한박탈) 후]
    delete from HR.employees
    where department_id is null;
    -- 오류 보고 -
    -- SQL 오류: ORA-01031: 권한이 불충분합니다
    
    -- [HR 이 grant(권한주기) 후]
    delete from HR.employees
    where department_id is null;
    -- 1 행 이(가) 삭제되었습니다.
    
    select *
    from HR.employees;
    
    rollback;
    -- 롤백 완료.
    
    