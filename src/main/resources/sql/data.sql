-- 직원
insert into emp(emp_num,emp_name,pwd,email,address,permission_type) values(1000,'아무개','qwer','q1@qwe.qwe','증산','1');
insert into emp(emp_num,emp_name,pwd,email,address,permission_type) values(1001,'아무개','qwer','q2@qwe.qwe','증산','0');
insert into emp values(1002,'김철수','qwer','q3@qwe.qwe',sysdate,'','','02-123-1234','010-1212-3232','900000-1000000','3','03012','서울시','종로구 121-121','1','개발부','대리');
-- 부서관련 테이블
insert into code_table(parent_code,code_name,code_value,remarks) VALUES ('','D001','부서','부서관련테이블');
insert into code_table(parent_code,code_name,code_value,remarks) VALUES ('D001','D001'||lpad(rank_seq.nextval,2,0),'인사팀','');
insert into code_table(parent_code,code_name,code_value,remarks) VALUES ('D001','D001'||lpad(rank_seq.nextval,2,0),'프론트팀','');
insert into code_table(parent_code,code_name,code_value,remarks) VALUES ('D001','D001'||lpad(rank_seq.nextval,2,0),'백엔드팀','');
-- 직급 기본 데이터
select * from code_table order by code_name;
insert into code_table(parent_code,code_name,code_value,remarks) VALUES ('','R001','직급','직급관련테이블');
insert into code_table(parent_code,code_name,code_value,remarks) VALUES ('R001','R001'||lpad(dept_seq.nextval,2,0),'대표','');
insert into code_table(parent_code,code_name,code_value,remarks) VALUES ('R001','R001'||lpad(dept_seq.nextval,2,0),'대표이사','');
insert into code_table(parent_code,code_name,code_value,remarks) VALUES ('R001','R001'||lpad(dept_seq.nextval,2,0),'부장','');
insert into code_table(parent_code,code_name,code_value,remarks) VALUES ('R001','R001'||lpad(dept_seq.nextval,2,0),'차장','');
insert into code_table(parent_code,code_name,code_value,remarks) VALUES ('R001','R001'||lpad(dept_seq.nextval,2,0),'과장','');
insert into code_table(parent_code,code_name,code_value,remarks) VALUES ('R001','R001'||lpad(dept_seq.nextval,2,0),'대리','');
insert into code_table(parent_code,code_name,code_value,remarks) VALUES ('R001','R001'||lpad(dept_seq.nextval,2,0),'사원','');



-- 휴가 유형 테이블
insert into vacation_type values(1,'연차','개발팀','대리',8,1);
insert into vacation_type values(2,'반차','개발팀','대리',4,0.5);
insert into vacation_type values(3,'병가','개발팀','대리',8,0);

-- 근로정보 테이블
create sequence work_seq increment by 1 minvalue 1;
work_seq.currval

insert into work values(1,'일반근무',12000,'1','1','1','1','1','0','0','1','일요일은 쉬는날 입니다.');
insert into work values(2,'아르바이트',10000,'1','1','1','1','1','0','0','1','일요일은 쉬는날 입니다.');
commit;

