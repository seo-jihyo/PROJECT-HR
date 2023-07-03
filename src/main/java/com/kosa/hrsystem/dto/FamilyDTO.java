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

public class FamilyDTO {

	private int emp_num;
	private int bsns_num;
	private String name;
	private String relation;
	private Date birthday;
	private String remarks;
	
}

