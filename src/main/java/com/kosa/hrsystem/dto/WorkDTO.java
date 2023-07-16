package com.kosa.hrsystem.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class WorkDTO {
	private int work_num; // 근로 일련번호
	private String work_name; // 근로정보명
	private int pay; // 시급
	private String remarks; // 비고
//	private char weekly_holiday; // 주휴요일
//	private char mon;
//	private char tue;
//	private char wed;
//	private char thu;
//	private char fri;
//	private char sat;
//	private char sun;
}
