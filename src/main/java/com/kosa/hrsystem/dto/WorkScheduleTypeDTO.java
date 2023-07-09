package com.kosa.hrsystem.dto;

import lombok.*;

import java.util.Date;

@Getter
@Setter
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class WorkScheduleTypeDTO {
	private int work_sch_type_num;
	private Date work_name;
	private String dept;
	private String rank;
}
