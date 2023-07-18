package com.kosa.hrsystem.vo;

import java.util.Date;
import java.util.List;

import com.kosa.hrsystem.dto.AttendanceDTO;

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
	
	// 근무일정 조회
	private Date schedule;
	private String work_name;
}
