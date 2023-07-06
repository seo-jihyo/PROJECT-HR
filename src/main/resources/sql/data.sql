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

commit;