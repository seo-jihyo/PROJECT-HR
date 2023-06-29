package com.kosa.hrsystem.dto;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class VacationDTO {
	private int emp_num; // 사원번호
	private int bsns_num; // 사업자번호
	private String vctn_status; // 휴가구분
	private String vctn_reason; // 휴가사유
	private char vctn_approval; // 승인여부
	private Date vctn_start_date;  // 휴가 시작일자
	private Date vctn_end_date;  // 휴가 종료일
	private Date vctn_application_date; // 휴가신청일자
}
