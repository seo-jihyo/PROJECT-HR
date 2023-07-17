DROP TABLE EMP;

CREATE TABLE EMP
(
    emp_num        number NOT NULL,
    emp_name       varchar2(50) NOT NULL,
    pwd            varchar2(300) NOT NULL,
    email          varchar2(100) NOT NULL,
    hire_date      date    DEFAULT sysdate,
    departure_date date NULL,
    reason         varchar2(4000) NULL,
    direct_num     varchar2(50) NOT NULL,
    phone          varchar2(50) NOT NULL,
    regist_num     varchar2(50) NOT NULL,
    annual_num     number NOT NULL,
    post_code      number NULL,
    address        varchar2(500) NOT NULL,
    detail_address varchar2(100) NULL,
    permisson_type char(1) DEFAULT '0',
    dept           varchar2(20) NULL,
    rank           varchar2(20) NULL
);

DROP TABLE EDUCATION;

CREATE TABLE EDUCATION
(
    edu_num           number  NOT NULL,
    emp_num           number  NOT NULL,
    school_name       varchar2(50) NOT NULL,
    school_dept       varchar2(100) NOT NULL,
    addmissions_day   date    NOT NULL,
    graduation_day    date    NOT NULL,
    graduation_status char(1) NOT NULL,
    remarks           varchar2(50) NULL
);

DROP TABLE CERTIFICATE;

CREATE TABLE CERTIFICATE
(
    cert_num         number NOT NULL,
    emp_num          number NOT NULL,
    crtfc_name       varchar2(100) NOT NULL,
    issuer           varchar2(100) NOT NULL,
    acquisition_date date   NOT NULL,
    remarks          varchar2(50) NULL
);

DROP TABLE CAREER;

CREATE TABLE CAREER
(
    career_num   number NOT NULL,
    emp_num      number NOT NULL,
    company_name varchar2(100) NOT NULL,
    dept         varchar2(50) NOT NULL,
    rank         number NULL,
    main_tesk    varchar2(100) NULL,
    join_date    date   NOT NULL,
    leave_date   date   NOT NULL,
    remarks      varchar2(50) NULL
);

DROP TABLE CODE_TABLE;

CREATE TABLE CODE_TABLE
(
    code_name   varchar2(20) NOT NULL,
    code_value  varchar2(50) NOT NULL,
    code_order  number NULL,
    parent_code varchar2(20) NULL,
    remarks     varchar2(50) NULL
);

DROP TABLE VACATION;

CREATE TABLE VACATION
(
    vctn_num              number  NOT NULL,
    emp_num               number  NOT NULL,
    vctn_status           varchar2(100) NOT NULL,
    vctn_start_date       date    NOT NULL,
    vctn_end_date         date    NOT NULL,
    vctn_application_date date    NOT NULL,
    vctn_reason           varchar2(4000) NOT NULL,
    vctn_approval         char(1) NOT NULL
);

DROP TABLE ATTENDANCE;

CREATE TABLE ATTENDANCE
(
    att_num    number NOT NULL,
    EMP_NUM    number NOT NULL,
    ATT_STATUS varchar2(50) NULL,
    APR_STATUS char(1) NULL,
    GO_WORK    date NULL,
    LEAVE_WORK date NULL
);

DROP TABLE WORK;

CREATE TABLE WORK
(
    work_num  number NOT NULL,
    work_name varchar2(50) NOT NULL,
    pay       number NOT NULL,
    remarks   varchar2(50) NULL
);

DROP TABLE WORK_SCHEDULE_TYPE;

CREATE TABLE WORK_SCHEDULE_TYPE
(
    work_sch_type_num number      NOT NULL,
    work_name         varchar(50) NOT NULL,
    dept              varchar2(20) NULL,
    rank              varchar2(20) NULL,
    Field3            VARCHAR(255) NULL
);

DROP TABLE WORK_SCHEDULE;

CREATE TABLE WORK_SCHEDULE
(
    work__sch_num     number NOT NULL,
    work_sch_type_num number NULL,
    schedule          date NULL,
    dept              varchar2(20) NULL,
    rank              varchar2(20) NULL,
    emp_num           number NULL,
    GO_WORK           date NULL,
    LEAVE_WORK        date NULL,
    remarks           varchar2(500) NULL
);

DROP TABLE VACATION_TYPE;

CREATE TABLE VACATION_TYPE
(
    vctn_status   varchar2(100) NOT NULL,
    vctn_name     varchar2(100) NOT NULL,
    dept          varchar2(20) NULL,
    rank          varchar2(20) NULL,
    vctn_time     number NULL,
    DEDUCTION_DAY number NULL
);

DROP TABLE WEEKLY_HOLIDAY;

CREATE TABLE WEEKLY_HOLIDAY
(
    day_num  number NOT NULL,
    work_num number NOT NULL,
    day      char(1) NULL
);

DROP TABLE FIXED_WORKING_DAYS;

CREATE TABLE FIXED_WORKING_DAYS
(
    fixed_work_day_num number NOT NULL,
    work_num           number NOT NULL,
    day                char(1) NULL
);

ALTER TABLE WORK
    ADD CONSTRAINT PK_WORK PRIMARY KEY (work_num);

ALTER TABLE WEEKLY_HOLIDAY
    ADD CONSTRAINT PK_WEEKLY_HOLIDAY PRIMARY KEY (day_num);

ALTER TABLE FIXED_WORKING_DAYS
    ADD CONSTRAINT PK_FIXED_WORKING_DAYS PRIMARY KEY (fixed_work_day_num);



ALTER TABLE EMP
    ADD CONSTRAINT PK_EMP PRIMARY KEY (emp_num);

ALTER TABLE EDUCATION
    ADD CONSTRAINT PK_EDUCATION PRIMARY KEY (edu_num,
                                             emp_num);

ALTER TABLE CERTIFICATE
    ADD CONSTRAINT PK_CERTIFICATE PRIMARY KEY (cert_num,
                                               emp_num);

ALTER TABLE CAREER
    ADD CONSTRAINT PK_CAREER PRIMARY KEY (career_num,
                                          emp_num);

ALTER TABLE CODE_TABLE
    ADD CONSTRAINT PK_CODE_TABLE PRIMARY KEY (code_name,
                                              code_value);

ALTER TABLE VACATION
    ADD CONSTRAINT PK_VACATION PRIMARY KEY (vctn_num);

ALTER TABLE ATTENDANCE
    ADD CONSTRAINT PK_ATTENDANCE PRIMARY KEY (att_num,
                                              EMP_NUM);

ALTER TABLE WORK
    ADD CONSTRAINT PK_WORK PRIMARY KEY (work_num);

ALTER TABLE WORK_SCHEDULE_TYPE
    ADD CONSTRAINT PK_WORK_SCHEDULE_TYPE PRIMARY KEY (work_sch_type_num);

ALTER TABLE WORK_SCHEDULE
    ADD CONSTRAINT PK_WORK_SCHEDULE PRIMARY KEY (work__sch_num);

ALTER TABLE VACATION_TYPE
    ADD CONSTRAINT PK_VACATION_TYPE PRIMARY KEY (vctn_status);

