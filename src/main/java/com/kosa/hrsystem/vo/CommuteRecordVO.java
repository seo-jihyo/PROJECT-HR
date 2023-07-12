package com.kosa.hrsystem.vo;

import java.sql.Date;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Getter
@NoArgsConstructor
@AllArgsConstructor
public class CommuteRecordVO {

	private int emp_num; 		// 사번 - EMP
	private String emp_name; 	// 사원 - EMP
	private Date go_work; 		// 출근시간 - ATTENDANCE
	private Date leave_work;	// 퇴근시간 - ATTENDANCE
	private int break_time;		// 휴게시간 - ATTENDANCE
	private int work_time;  	// 근무시간
	private String work_name; 	// 근무유형 - WORK_SCHEDULE_TYPE 
//	private String att_status; 	// 근무상태 - ATTENDANCE 
	
}
