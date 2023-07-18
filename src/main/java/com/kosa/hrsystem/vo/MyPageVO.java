package com.kosa.hrsystem.vo;

import java.util.Date;
import java.util.List;

import com.kosa.hrsystem.dto.CareerDTO;
import com.kosa.hrsystem.dto.CertificateDTO;
import com.kosa.hrsystem.dto.IfileDTO;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
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
	private List<CertificateDTO> cert; // 자격증
	private List<CareerDTO> career; // 경력
	private IfileDTO idto; 			// 이미지
}
