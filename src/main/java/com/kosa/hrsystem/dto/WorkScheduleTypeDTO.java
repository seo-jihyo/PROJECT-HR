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
	   private String work_name;
	   private Date work_start;
	   private Date work_end;
}
