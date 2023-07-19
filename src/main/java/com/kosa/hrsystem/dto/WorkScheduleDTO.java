package com.kosa.hrsystem.dto;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class WorkScheduleDTO {
	private int work_sch_num;
	private int work_sch_type_num;
	private int emp_num;
	private Date go_work;
	private Date leave_work;
	private String remarks;
}
