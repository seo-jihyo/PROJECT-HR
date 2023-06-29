package com.kosa.hrsystem.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class CodeTableDTO {
	private int code_name; // 코드명
	private int code_value; // 값
	private int code_order; // 순서
}
