package com.kosa.hrsystem.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Getter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class MyPageVO {
	private String emp_name; 		// 이름
	private int emp_num; 			// 사원번호
	private String direct_num; 		// 직통번호 
	private String dept;			// 부서
	private String rank;			// 직급
	private String permission_type; // 권한타입
	private String annual_num;		// 연차수
	private Date hire_date;			// 입사일
	private Date departure_date;	// 퇴사일
	private String email;			// 이메일
	private String phone;			// 연락처
	private String post_code;		// 우편번호
	private String address;			// 주소
	private String detail_address;  // 상세주소
	private int cert_num;			// 자격증 번호
	private String crtfc_name;		// 자격증명
	private String issuer;			// 발행처
	private Date acquisition_date;  // 취득년월
	private String remarks;			// 비고
	
}
