package com.kosa.hrsystem.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor

public class VacationTypeVO { 
	private int vctn_type_num;
	private String vctn_name;
	private String deptValue;
	private String rankValue;
    private int vctn_time;
    private double deduction_day;
}
