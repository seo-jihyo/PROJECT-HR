package com.kosa.hrsystem.vo;

import com.kosa.hrsystem.dto.AttendanceDTO;
import lombok.*;

import java.util.Date;

@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class RequestHistoryVO {
	// 요청내역
	private int rqst_hstry_num; // 요청 내역 번호
	private int state; // 상태
	private int emp_num; // 사원번호
	private String dept_code; // 부서 코드
	private String dept; // 부서 한글명
	private String emp_name;
	private Date start_date;
	private Date end_date;
	private String special_note; // 특이사항
	private String request_reason;
	private String request_type;
	private String approver_note;
	private Date application_date;

}
