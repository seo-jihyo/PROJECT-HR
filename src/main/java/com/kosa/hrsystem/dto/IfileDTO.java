package com.kosa.hrsystem.dto;

import java.io.File;

import lombok.Data;

@Data
public class IfileDTO {
	
	private int emp_num;
	private String ofile; // 원본파일명
	private String sfile; // 저장된 파일명
	
}
