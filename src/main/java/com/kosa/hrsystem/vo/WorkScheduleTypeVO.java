package com.kosa.hrsystem.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor

public class WorkScheduleTypeVO {
	private int work_sch_type_num;
	private String work_name;
	private String deptValue;
	private String rankValue;
}
