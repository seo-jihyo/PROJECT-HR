package com.kosa.hrsystem.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Getter
@NoArgsConstructor
@AllArgsConstructor
public class WorkVO {
    private int work_num;
    private String work_name;
    private int pay;
    private String remarks;
    private String fixed_work_days;
    private String holidays;
}
