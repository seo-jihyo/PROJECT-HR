package com.kosa.hrsystem.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter @Setter
@ToString

public class RequestHistoryDTO {
	private int rqst_hstry_num; // 요청 내역 번호
	private int emp_num; // 사원번호
	private String request_type; // 요청종류
	private String request_sender; // 요청보낸사람
	private String dept; // 부서
	private String request_term; // 요청사항
	private String request_reasons; // 요청사유
	private String state; // 상태
	private String approver_note; // 승인권자 노트
	private String application_date; // 신청일자	 
}
