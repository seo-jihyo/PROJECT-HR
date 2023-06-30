package com.kosa.hrsystem.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class WorkDTO {
	private int work_num;
	private int emp_num;
	private int bsns_num;
	private String work_name;
	private int pay;
	private int weekly_holiday;
	private String remarks;
	private char mon;
	private char tue;
	private char wed;
	private char thu;
	private char fri;
	private char sat;
	private char sun;
}
