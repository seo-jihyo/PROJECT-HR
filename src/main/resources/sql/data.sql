-- 직원
insert into emp(emp_num,emp_name,pwd,email,address,permission_type) values(1000,'아무개','qwer','q1@qwe.qwe','증산','1');
insert into emp(emp_num,emp_name,pwd,email,address,permission_type) values(1001,'아무개','qwer','q2@qwe.qwe','증산','0');
insert into emp values(1002,'김철수','qwer','q3@qwe.qwe',sysdate,'','','02-123-1234','010-1212-3232','900000-1000000','3','03012','서울시','종로구 121-121','1','개발부','대리');
-- 직급 기본 데이터
select * from code_table order by code_name;
insert into code_table(parent_code,code_name,code_value,remarks) VALUES ('','A001','직급','직급관련테이블');
insert into code_table(parent_code,code_name,code_value,remarks) VALUES ('A001','A00101','대표','');
insert into code_table(parent_code,code_name,code_value,remarks) VALUES ('A001','A00102','대표이사','');
insert into code_table(parent_code,code_name,code_value,remarks) VALUES ('A001','A00103','부장','');
insert into code_table(parent_code,code_name,code_value,remarks) VALUES ('A001','A00104','차장','');
insert into code_table(parent_code,code_name,code_value,remarks) VALUES ('A001','A00105','과장','');
insert into code_table(parent_code,code_name,code_value,remarks) VALUES ('A001','A00106','대리','');
insert into code_table(parent_code,code_name,code_value,remarks) VALUES ('A001','A00107','사원','');

-- 부서관련 테이블
insert into code_table(parent_code,code_name,code_value,remarks) VALUES ('','B001','부서','부서관련테이블');
insert into code_table(parent_code,code_name,code_value,remarks) VALUES ('B001','B00101','인사팀','');
insert into code_table(parent_code,code_name,code_value,remarks) VALUES ('B001','B00102','프론트팀','');
insert into code_table(parent_code,code_name,code_value,remarks) VALUES ('B001','B00103','백엔드팀','');

-- 휴가 유형 테이블
insert into vacation_type values(1,'연차','개발팀','대리',8,1);
insert into vacation_type values(2,'반차','개발팀','대리',4,0.5);
insert into vacation_type values(3,'병가','개발팀','대리',8,0);

commit;