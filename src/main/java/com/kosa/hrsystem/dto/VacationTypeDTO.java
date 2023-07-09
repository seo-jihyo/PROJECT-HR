package com.kosa.hrsystem.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class VacationTypeDTO {
    private String vctn_type_num;
    private String vctn_name;
    private String dept;
    private String rank;
    private int vctn_time;
    private int deduction_day;
}
