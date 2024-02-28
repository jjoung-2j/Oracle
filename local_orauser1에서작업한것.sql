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
    
    
    
    
    
    -- << orauser1 연결 >>
    ---------------------------------------------------------------------------
    create table tbl_sawon
    (sano     number(4)
    ,saname   Nvarchar2(20)
    );
    -- Table TBL_SAWON이(가) 생성되었습니다.
    
    insert into tbl_sawon(sano, saname) values(1001, '홍길동');
    -- 1 행 이(가) 삽입되었습니다.
    
    commit;
    
    select *
    from orauser1.tbl_sawon;
    -- 원래는 소유주명.테이블명 인데 소유주명을 생략하면 현재 오라클서버에 접속한 사용자 자기자신의 것으로 본다.
    
    show user;
    -- USER이(가) "ORAUSER1"입니다.
    
    select *
    from tbl_sawon; -- 소유주가 orauser1이기 때문에 생략 가능
    
    grant select on tbl_sawon to hr;
    -- Grant을(를) 성공했습니다.
    
    create table tbl_buseo
    (buno    number(2)
    ,buname  varchar2(20)
    );
    -- Table TBL_BUSEO이(가) 생성되었습니다.
    
    insert into tbl_buseo(buno, buname) values(10, '관리부');
    insert into tbl_buseo(buno, buname) values(20, '영업부');
    commit;
    
    select *
    from tbl_buseo;
    
    grant select on tbl_buseo to hr;
    -- Grant을(를) 성공했습니다.
    
    