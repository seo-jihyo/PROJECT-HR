package com.kosa.hrsystem.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Getter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class WorkScheduleVO {
	private int emp_num;
	private String emp_name;
	private Date go_work;
	private Date leave_work;
	private String work_name;
	private int work_sch_type_num;
	private int work_sch_num;
	private String remarks;

}
