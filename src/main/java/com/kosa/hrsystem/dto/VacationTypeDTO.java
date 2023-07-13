package com.kosa.hrsystem.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class VacationTypeDTO {
    private int vctn_type_num;
    private String vctn_name;
    private int vctn_time;
    private double deduction_day;
}
