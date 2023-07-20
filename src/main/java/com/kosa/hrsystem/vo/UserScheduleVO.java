package com.kosa.hrsystem.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
@NoArgsConstructor
@AllArgsConstructor

public class UserScheduleVO {
	// 출퇴근 기록 조회
	private Date go_work;
	private Date leave_work;

	// 휴가 조회
	private Date vctn_start_date;
	private Date vctn_end_date;
	private String vctn_name;
	private int vctn_type_num;
	
	
	// 근무일정 조회
	private Date wsgowork;
	private Date wsleavework;
	private String work_name;
	private int work_sch_type_num;
	private char workstate;
}
