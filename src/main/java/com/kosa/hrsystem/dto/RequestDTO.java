package com.kosa.hrsystem.dto;

import java.util.Date;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class RequestDTO {
	    private int emp_num;
	    private char request_type;
	    private Date go_work;
	    private Date leave_work;
			
}
