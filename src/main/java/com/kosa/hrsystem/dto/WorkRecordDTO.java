package com.kosa.hrsystem.dto;

import java.util.Date;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter @Setter
@NoArgsConstructor
@AllArgsConstructor
//내 출퇴근정보 
public class WorkRecordDTO {
	private int att_num;	  	// 일렬번호 - ATTENDANCE
	private int emp_num; 		// 사번 - EMP
	private String emp_name; 	// 사원 - EMP
	private Date go_work; 		// 출근시간 - ATTENDANCE
	private Date leave_work;	// 퇴근시간 - ATTENDANCE
	private int break_time;		// 휴게시간 - ATTENDANCE
	private int work_time;  	// 근무시간 - ATTENDANCE
	private String work_name; 	// 근무유형 - WORK_SCHEDULE_TYPE 
	private String att_status; 	// 근무상태 - ATTENDANCE 
		
}
