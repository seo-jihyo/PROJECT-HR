package com.kosa.hrsystem.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Getter
@NoArgsConstructor
@AllArgsConstructor
public class VacationVO {
	private int vctn_num;
	private int emp_num;
	private String emp_name;
	private String startdate;
	private String enddate;
	private int vctn_type_num;
	private String vctn_name;
	private int vctn_time;
	private double deduction_day;
	private String vctn_reason;
	private int countday;
}
