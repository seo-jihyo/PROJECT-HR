package com.kosa.hrsystem.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.util.Date;

@Getter @Setter
@ToString
public class RequestHistoryDTO {
	private int rqst_hstry_num; // 요청 내역 번호
	private int emp_num; // 사원번호
	private int request_num; // 요청번호
	private char request_type; // 요청종류
	private char state; // 상태
	private String approver_note; // 승인권자 노트
	private Date application_date; // 신청일자
}
