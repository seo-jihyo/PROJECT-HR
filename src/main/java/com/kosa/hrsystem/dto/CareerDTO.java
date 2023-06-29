package com.kosa.hrsystem.dto;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter @Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor

public class CareerDTO {
	
	private int emp_num;
	private int bsns_num;
	private String company_name;
	private String dept;
	private int rank;
	private String main_tesk;
	private Date join_date;
	private Date leave_date;
	private String remarks;
}
