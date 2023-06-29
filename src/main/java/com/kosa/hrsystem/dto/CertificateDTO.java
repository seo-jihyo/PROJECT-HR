package com.kosa.hrsystem.dto;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class CertificateDTO {
	private int emp_num; // 사원번호
	private int bsns_num; // 사업자번호
	private String crtfc_name; // 자격증 이름
	private String issuer; // 발행처
	private String remarks; // 비고
	private Date acquisition_date; // 취득년월
}
