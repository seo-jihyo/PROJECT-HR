package com.kosa.hrsystem.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class CodeTableDTO { // 부서(dept), 직급(rank)
	private String parent_code;
	private String code_name; // 코드명
	private String code_value; // 값
	private int code_order; // 순서
	private String remarks;
}
