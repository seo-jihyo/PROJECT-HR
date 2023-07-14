package com.kosa.hrsystem.dto;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class VacationDTO {
	private int vctn_num; // 휴가 시퀀스 번호
	private int emp_num; // 사원번호
	private int vctn_type_num; // 휴가구분
	private Date vctn_start_date;  // 휴가 시작일자
	private Date vctn_end_date;  // 휴가 종료일
	private Date vctn_application_date; // 휴가신청일자
	private String vctn_reason; // 휴가사유
	private char vctn_approval; // 승인여부
}
