package com.kosa.hrsystem.dto;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class EducationDTO {
	private int emp_num; // 사원번호
	private int bsns_num; // 사업자번호
	private String school_name; // 학교명
	private String school_dept; // 학과명
	private String remarks; // 비고
	private char graduation_status; // 졸업상태 
	private Date addmissions_day; // 입학일
	private Date graduation_day; // 졸업일
}
