package com.kosa.hrsystem.dto;

import java.util.Date;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Data
@ToString
public class CertificateDTO {
	private int rnum;
	private int cert_num; // 자격증번호
	private int emp_num; // 사원번호
	private String crtfc_name; // 자격증 이름
	private String issuer; // 발행처
	private String remarks; // 비고
	private Date acquisition_date; // 취득년월
}
